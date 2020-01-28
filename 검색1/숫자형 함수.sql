-- 숫자형 함수

select abs(2), abs(-2);

select mod(234, 10), 234 % 10, mod(29, 9);

select floor(1.23), floor(-1.23);
select ceiling(1.23), ceil(-1.23);

select round(1.23), round(1.58), round(-1.23), round(-1.58);
select round(1.298, 1), round(1.298, 0);
select pow(2, 10), power(2, 20);
select sign(-34), sign(0), sign(12345);

select greatest(10, 20, 45, 30, 55, 2),
       greatest(2.3, 4.5, 1.2),
       greatest('abc', 'abd', 'BCA', 'BCD');
       
select least(10, 20, 45, 30, 55, 2),
       least(2.3, 4.5, 1.2),
       least('abc', 'abd', 'BCA', 'BCD');

