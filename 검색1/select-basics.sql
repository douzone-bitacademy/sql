-- 예제 : deaprtments 테이블의 모든 데이터를 출력.
select *
  from departments;

-- 예제 : employees 테이블에서 직원의 이름,  성별, 입사일을 출력(Projection)  
select first_name, last_name, gender, hire_date
  from employees;

-- 예제 : employees 테이블에서 직원의 전체이름,  성별, 입사일을 출력 (별칭부여)
select concat(first_name, ' ', last_name) as '전체 이름',
       gender as '성별',
       hire_date as '입사일'
  from employees;

-- 예제: titles 테이블에서 직급은 어떤 것들이 있는지 직급이름을 한 번씩만 출력
select distinct(title)
  from titles;
  
-- 예제 : employees 테이블에서 직원의 전체이름, 성별, 입사일을 입사일 순으로 출력
  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
order by hire_date asc;
-- order by '입사일' asc;  

-- 예제 : salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
  select emp_no, salary
    from salaries
   where from_date like '2001-%-%'
order by salary desc;
 
-- 예제 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
   where hire_date < '1991-01-01'
order by hire_date desc;

-- 예제 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
   where hire_date < '1989-01-01'
     and gender = 'F'
order by hire_date desc;   

-- 예제 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
select emp_no, dept_no
  from dept_emp
 where dept_no = 'd005'
    or dept_no = 'd009';

select emp_no, dept_no
  from dept_emp
 where dept_no in ('d005', 'd009');

-- 예제 : 
-- dept_emp 테이블에서 부서이름에 s가 들어간 부서에 속한 사원의 사번, 부서번호 출력
select * from departments where dept_name like '%s%';
 
select emp_no, dept_no
  from dept_emp
 where dept_no in (select dept_no from departments where dept_name like '%s%');   
 
-- 예제 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력  
  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
   where hire_date like '1989%';
   
  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
   where hire_date >= '1988-12-31'
     and hire_date <= '1990-01-01';

  select concat(first_name, ' ', last_name) as '전체 이름',
         gender as '성별',
         hire_date as '입사일'
    from employees
   where hire_date between '1988-12-31' and '1990-01-01';     