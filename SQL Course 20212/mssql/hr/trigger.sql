use hrdb;

create table employees_logs(
	activity_date DATE not null,
	username VARCHAR(50) not null,
	activity CHAR(3) not null
);

go
create trigger write_log
on employees
after update, insert, delete
as begin
	set nocount on;
	if not exists (select * from inserted) or not exists (select * from deleted)
	begin
		insert into employees_logs
			select getdate(), CURRENT_USER, 'INS'
			from inserted
			union all
			select getdate(), CURRENT_USER, 'DEL'
			from deleted;
	end
	else
	begin
		insert into employees_logs
			select getdate(), CURRENT_USER, 'UPD'
			from inserted
	end;
end;
go

create trigger salary_range_update
on employees
instead of update
as begin
	
end;
go