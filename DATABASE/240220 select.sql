-- DESC 테이블이름 : 테이블의 구성을 파악하는 SQL문
desc salgrade;
-- SELECT : 데이터베이스에 보관되어 있는 데이터를 조회할 때 사용하는 SQL문
-- * : 모든 열
SELECT * FROM emp;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- DISTINCT : 열의 중복을 제거하는 속성
SELECT DISTINCT DEPTNO FROM EMP;

-- 열을 2열 이상 지정하게 되면 A열 x B열을 기준으로 중복 제거
SELECT DISTINCT JOB, DEPTNO FROM EMP;
SELECT DISTINCT EMPNO FROM EMP;
SELECT ALL JOB, DEPTNO FROM EMP;
SELECT JOB, DEPTNO FROM EMP;

-- 열 이름에 연산자 및 별칭 정하기
-- ""를 쓰면 소문자로, 쓰지 않으면 대문자로 나옴
-- ""는 보통 다른 언어에서 문자어를 뜻함 -> 잘 안 씀
-- as는 붙이는 것이 좋다
select ename, sal, sal*12+comm year, comm from emp;
select ename, sal, sal*12+comm "year", comm from emp;
select ename, sal, sal*12+comm as year, comm from emp;
select ename, sal, sal*12+comm as "year", comm from emp;

-- ORDER BY : SELECT문으로 데이터 조회시 오름차순/내림차순 정렬을 하는 SQL문
-- acs : 오름차순 정렬(생략 가능)
SELECT * FROM EMP ORDER BY DEPTNO asc;
-- desc : 내림차순 정렬
SELECT * FROM EMP ORDER BY DEPTNO desc;
-- 정렬 여러 번 -> order by 정렬1, 정렬2, ... ;
SELECT * FROM EMP ORDER BY DEPTNO, sal desc, empno asc;

-- 연습 문제
-- 2. 오른쪽과 같은 결과가 나오도록 EMP 테이블의 JOB 열 데이터를 중복 없이 출력해 보세요.
select distinct JOB from emp;

-- 3. 다음의 모든 조건을 만족하는 SQL문을 작성해 보세요.
-- 조건 1) 조회할 테이블은 EMP 테이블이며 모든 열을 출력합니다.
-- 조건 2) 출력되는 열의 별칭은 다음과 같습니다.
-- EMPNO 열  -> EMPLOYEE_NO 
-- ENAME 열  -> EMPLOYEE_NAME 
-- MGR 열    -> MANAGER 
-- SAL 열     -> SALARY 
-- COMM 열  -> COMMISSION 
-- DEPTNO 열 -> DEPARTMENT_NO
-- 조건 3) 부서 번호를 기준으로 내림차순으로 정렬하되,
-- 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬합니다.
select empno as EMPLOYEE_NO, ENAME as EMPLOYEE_NAME, job, MGR as MANAGER,
hiredate, SAL as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO from emp
order by deptno desc, ename asc;