create table Book(
	book_id char(10) primary key,
	title char(50) not null,
	authors char(50) not null,
	publisher char(50) not null,
	published_year int,
	total_number_of_copies int,
	current_number_of_copies int,
	check (published_year > 1900),
	check (total_number_of_copies >= 0),
	check (current_number_of_copies >= 0),
	check (total_number_of_copies >= current_number_of_copies)
);

create table Borrower(
	borrower_id char(10) primary key,
	name char(50) not null,
	address varchar(100),
	telephone_number char(12)
);

-- identity (auto increment)
-- https://stackoverflow.com/questions/10991894/auto-increment-primary-key-in-sql-server-management-studio-2012

create table BorrowCard(
	card_id int identity(1,1) primary key,
	borrower_id char(10) foreign key references Borrower(borrower_id),
	borrow_date date not null,
	expected_return_date date not null,
	actual_return_date date
);

create table BorrowCardItem(
	card_id int foreign key references BorrowCard(card_id),
	book_id char(10) foreign key references Book(book_id),
	primary key (card_id, book_id)
);

------------

select title
from Book
where published_year = 2020 and publisher = 'Wiley';

--------

select top 5 b.*
from BorrowCardItem bci join Book b on bci.book_id = b.book_id
group by bci.book_id
order by count(*) desc;

--------

select distinct ber.address, ber.name, ber.telephone_number, ber.address
from BorrowCard bc join Borrower ber on bc.borrower_id = ber.borrower_id
where bc.actual_return_date is not null;

--------

select distinct ber.*
from BorrowCard bc join Borrower ber on bc.borrower_id = ber.borrower_id
where bc.actual_return_date > bc.expected_return_date
order by ber.name;

--------

-- https://stackoverflow.com/questions/3138029/is-there-a-boolean-data-type-in-microsoft-sql-server-like-there-is-in-mysql
go
create function count_borrowing(@book_id char(10))
returns int as
begin
	return (select count(*)
			from (BorrowCard bc join BorrowCardItem bci on bc.card_id = bci.card_id)
				join Book b on bci.book_id = b.book_id
			where bc.actual_return_date is not null
			group by bci.book_id
			having bci.book_id=@book_id);
end;
go

go
create function check_consistency_of_book(@book_id char(10))
returns bit as
begin
	if exists
			(select b.book_id as id, b.total_number_of_copies as tt, b.current_number_of_copies cr
			from Book b
			where b.book_id = @book_id and
			b.total_number_of_copies = b.current_number_of_copies + dbo.count_borrowing(@book_id))
	begin
		return 1
	end
	else
	begin
		return 0
	end
	return null
end;
go

---
go
create procedure borrow_a_book(@borrower_id char(10), @book_id char(10), @number_of_copies int)
as begin
	insert into BorrowCard(borrower_id, borrow_date, expected_return_date)
	values (@borrower_id, GETDATE(), DATEADD(day, GETDATE(), 10));

	insert into BorrowCardItem(book_id)
	values ((SELECT TOP 1 card_id FROM BorrowCard ORDER BY card_id DESC), @book_id);

	update Book
	set current_number_of_copies = current_number_of_copies - @number_of_copies
	where book_id=@book_id;
end;
go