-- DDL

drop table member;

create table member(
	no integer unsigned not null,
    email varchar(50) not null,
    password varchar(64) not null,
    name varchar(25) not null,
    dept_name varchar(25) not null,
    primary key(no)
);
desc member;

-- 새칼럼 추가
alter table member add juminbunho char(13) not null after no;
desc member;

alter table member add join_date datetime not null;
desc member;

-- 칼럼 삭제
alter table member drop juminbunho;
desc member;

-- 칼럼 수정
alter table member change no no int unsigned not null auto_increment;
desc member;

alter table member change dept_name department_name varchar(25) not null; 
desc member;

alter table member change name name varchar(10) not null; 
desc member;


-- 테이블 이름 변경
alter table member rename user;
desc user;


-- DML
insert into user values(
	null, 
    'kickscar@gmail.com', 
    password('1234'), 
    '안대혁', 
    '시스템 개발팀',
    no
    w());
select * from user;

insert 
  into user(name, email, password, department_name, join_date)
values ('안대혁2', 'kickscar2@gmail.com', password('1234'), '솔류션개발팀', now());
select * from user;

update user
   set join_date = (select now()),
       name = '안대혁3'
 where no = 1; 
select * from user;

delete
  from user
 where no = 2; 
select * from user;