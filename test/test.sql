use test;
show tables;

-- DDL
create table test(
	no integer primary key,
	name varchar(200)
);

-- (C)reate
insert into test values(1, '둘리');
insert into test values(2, '마이콜');

-- (R)ead
select * from test;

-- (U)pdate
update test set name='또치' where no = 2;

-- (D)elete
delete from test where no = 1;

-- 확인
select * from test;

-- DDL
drop table test;
