-- 날짜형 함수

select curdate(), current_date;
select now(), sysdate(), current_timestamp;

select now(), date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초');

-- 예제 : 각 직원들에 대해 직원이름과 근무개월수 출력 
select concat(first_name, ' ', last_name) as '전체 이름',
	   concat(cast(period_diff(date_format(now(), '%Y%m'), date_format(hire_date, '%Y%m')) as char), '개월')
  from employees;
  
-- now() vs sysdate()
select now(), sleep(2), now();
select sysdate(), sleep(2), sysdate();

-- 예제: 각 직원들은 입사 후 6개월이 지나면 근무평가를 한다. 각 직원들에 이름, 입사일, 최초 근무평가일은 언제인지 출력.
select concat(first_name, ' ', last_name) as '전체 이름',
       hire_date,
       date_add(hire_date, interval 6 month)  -- day, month, year
  from employees;
  
select now(), cast(now() as date);
select cast(1-2 as unsigned);
  
-- 예제 : salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합계를 출력
select avg(salary), sum(salary) from salaries where emp_no = 10060;


-- 예제 : 이 예제 직원의 최저임금을 받은 시기와 최대임금을 받은 시기를 각 각 출력해보세요.
select max(salary) from salaries where emp_no = 10060;
select min(salary) from salaries where emp_no = 10060;


select from_date, salary
  from salaries
 where emp_no = 10060
   and salary = (select max(salary) from salaries where emp_no = 10060);



    