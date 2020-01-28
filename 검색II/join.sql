-- join

-- 예제1: 직원의 이름과 직책을 모두 출력 하세요.
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a,
	   titles b
 where a.emp_no = b.emp_no;
 
-- 예제2: 직원의 이름과 직책을 모두 출력 하되 여성 엔지니어만 출력하세요
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a,
	   titles b
 where a.emp_no = b.emp_no
   and a.gender = 'F'
   and b.title = 'engineer';

-- natural join
-- 두 테이블에 공통 칼럼이 있으면 별다른 조인 조건없이 묵시적으로 조인됨
-- 쓸일이 없음
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a
  join titles b;
--    on a.emp_no = b.emp_no;  생략


-- join ~ using
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a
  join titles b using (emp_no); 
    

-- join ~ on
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a
  join titles b
    on a.emp_no = b.emp_no;

-- 예제3: 직원의 이름과 직책을 모두 출력 하되 여성 엔지니어만 출력하세요(join~on)
select concat(a.first_name, ' ', a.last_name) as name,
       b.title
  from employees a
  join titles b
    on a.emp_no = b.emp_no
 where a.gender = 'F'
   and b.title = 'engineer';
   
   
-- 실습문제 1: 
-- 현재 직원별 근무부서를 사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
select a.emp_no, concat(a.first_name, ' ', a.last_name), c.dept_name
  from employees a
  join dept_emp b    on a.emp_no = b.emp_no
  join departments c on b.dept_no = c.dept_no
 where b.to_date = '9999-01-01';
 
select count(*)
  from employees a
  left join dept_emp b    on a.emp_no = b.emp_no
  join departments c on b.dept_no = c.dept_no
 where b.to_date = '9999-01-01';
   
-- 실습문제 2: 
-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요. 
-- 사번,  전체이름, 연봉  이런 형태로 출력하세요.
select a.emp_no, concat(a.first_name, ' ', a.last_name), b.salary
        from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01';
   
   