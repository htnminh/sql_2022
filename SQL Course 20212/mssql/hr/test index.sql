-- create nonclustered index inx_non_clustered on employees(last_name);
-- create index inx on employees(last_name);
select * from employees with(index(inx)) where last_name='Chen';
select * from employees with(index(inx_non_clustered)) where last_name='Chen';
select * from employees where last_name='Chen';