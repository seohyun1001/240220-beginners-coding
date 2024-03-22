-- DESC ���̺��̸� : ���̺��� ������ �ľ��ϴ� SQL��
desc salgrade;
-- SELECT : �����ͺ��̽��� �����Ǿ� �ִ� �����͸� ��ȸ�� �� ����ϴ� SQL��
-- * : ��� ��
SELECT * FROM emp;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- DISTINCT : ���� �ߺ��� �����ϴ� �Ӽ�
SELECT DISTINCT DEPTNO FROM EMP;

-- ���� 2�� �̻� �����ϰ� �Ǹ� A�� x B���� �������� �ߺ� ����
SELECT DISTINCT JOB, DEPTNO FROM EMP;
SELECT DISTINCT EMPNO FROM EMP;
SELECT ALL JOB, DEPTNO FROM EMP;
SELECT JOB, DEPTNO FROM EMP;

-- �� �̸��� ������ �� ��Ī ���ϱ�
-- ""�� ���� �ҹ��ڷ�, ���� ������ �빮�ڷ� ����
-- ""�� ���� �ٸ� ���� ���ھ ���� -> �� �� ��
-- as�� ���̴� ���� ����
select ename, sal, sal*12+comm year, comm from emp;
select ename, sal, sal*12+comm "year", comm from emp;
select ename, sal, sal*12+comm as year, comm from emp;
select ename, sal, sal*12+comm as "year", comm from emp;

-- ORDER BY : SELECT������ ������ ��ȸ�� ��������/�������� ������ �ϴ� SQL��
-- acs : �������� ����(���� ����)
SELECT * FROM EMP ORDER BY DEPTNO asc;
-- desc : �������� ����
SELECT * FROM EMP ORDER BY DEPTNO desc;
-- ���� ���� �� -> order by ����1, ����2, ... ;
SELECT * FROM EMP ORDER BY DEPTNO, sal desc, empno asc;

-- ���� ����
-- 2. �����ʰ� ���� ����� �������� EMP ���̺��� JOB �� �����͸� �ߺ� ���� ����� ������.
select distinct JOB from emp;

-- 3. ������ ��� ������ �����ϴ� SQL���� �ۼ��� ������.
-- ���� 1) ��ȸ�� ���̺��� EMP ���̺��̸� ��� ���� ����մϴ�.
-- ���� 2) ��µǴ� ���� ��Ī�� ������ �����ϴ�.
-- EMPNO ��  -> EMPLOYEE_NO 
-- ENAME ��  -> EMPLOYEE_NAME 
-- MGR ��    -> MANAGER 
-- SAL ��     -> SALARY 
-- COMM ��  -> COMMISSION 
-- DEPTNO �� -> DEPARTMENT_NO
-- ���� 3) �μ� ��ȣ�� �������� ������������ �����ϵ�,
-- �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� �����մϴ�.
select empno as EMPLOYEE_NO, ENAME as EMPLOYEE_NAME, job, MGR as MANAGER,
hiredate, SAL as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO from emp
order by deptno desc, ename asc;