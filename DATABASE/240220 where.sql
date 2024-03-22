-- WHERE�� : SELECT������ ���ǿ� �´� Ư�� ���� ����ϴ� SQL��(SELECT�� �ʿ�)
-- WHERE�� X
SELECT * FROM emp;
-- WHERE�� O
SELECT * FROM emp WHERE deptno = 30;
SELECT * FROM emp WHERE deptno = 20;
SELECT * FROM emp WHERE deptno = 10;

-- AND : (�׸���) ���� ���� ����� ��� true(��)�� �� true�� ��ȯ�ϰ�,
--        �������� ��� false(����)
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
-- deptno�� 30�̰�, job�� 'SALESMAN'�� �����͸� ���

-- OR : (�Ǵ�) ���� �� �߿� �ϳ��� ����� true(��)�̸� true�� ��ȯ�ϰ�,
--       ���� ���� ��� false�̸� false�� ��ȯ
SELECT * FROM emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 AND job = 'CLERK';
SELECT * FROM emp WHERE deptno = 10 OR job = 'MANAGER';

-- ��� �� ������ : <, <=, >, >=
SELECT * FROM emp WHERE sal > 1000;
SELECT * FROM emp WHERE sal >= 2000;
SELECT * FROM emp WHERE sal < 1600;
SELECT * FROM emp WHERE sal <= 1600;
-- ���ڿ��� ��� ù ���ں��� �� ���ھ� �񱳸� ��
SELECT * FROM emp WHERE ename < 'B';
SELECT * FROM emp WHERE ename <= 'FORC';

-- � �� ������ : = / !=, <>, ^=
SELECT * FROM emp WHERE sal = 3000;
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;
-- ��� ���� ���̺��� �޿��� 2000�̻� �����鼭 ��å�� �Ŵ����� �ƴ� ���
SELECT * FROM emp
    WHERE sal >= 2000
    AND job != 'MANAGER';
    
-- NOT ������ : (�ٸ���) / !=, <>, ^=
SELECT * FROM emp
    WHERE NOT(sal = 3000 and sal = 1600);
SELECT * FROM emp
    WHERE NOT (sal = 3000 or sal = 1600);
SELECT * FROM emp
    WHERE NOT(sal = 3000 and sal = 1600);
SELECT * FROM emp
    WHERE sal != 3000;

-- IN ������ : ������ ���� ���� �� ����ϴ� ������
-- = �ʿ� ����
SELECT * FROM emp
    WHERE job IN ('MANAGER', 'PRESIDENT');
    
SELECT * FROM emp
    WHERE job IN ('MANAGER', 'PRESIDENT');
    
SELECT * FROM emp
    WHERE job != 'MANAGER'
        AND job <> 'PRESIDENT'
        AND job ^= 'CLERK';
        
-- IN �����ڸ� Ȱ���Ͽ� �μ���ȣ�� 10, 20���� ��� ���� ���
SELECT * FROM emp
    WHERE deptno
        IN(10, 20);



-- BETWEEN A AND B : A���� ũ�ų� ����, B���� �۰ų� ���� �� ����ϴ� ������
SELECT * FROM emp
    WHERE sal BETWEEN 2000 AND 3000;
-- ��� �� �����ڸ� �̿��Ͽ� �޿��� 2000���� ũ�ų� ���� 3000���� �۰ų� ���� ����� ���
SELECT * FROM emp
    WHERE sal >= 2000
    AND sal <= 3000;
    
-- NOT BETWEEN A AND B
SELECT * FROM emp
    WHERE sal
    NOT BETWEEN 2000 AND 3000;
SELECT * FROM emp
    WHERE sal < 2000 or sal > 3000;
    
    

-- LIKE ������ : ����� ���ڿ��� ã�� ������, ���ϵ� ī�� ���ڸ� ����ؾ� ��
-- ���ϵ� ī�� ���� : '_'(� ���ڵ� ������� �� ����)
--                  '%'(� ���ڵ� ������� ���� ����)
-- ù��° ���ڰ� S�� �����ϴ� ����� �̸�
SELECT * FROM emp
    WHERE ename
    LIKE 'S%';
    
-- �ι�° ���ڰ� L�� ����� �̸�
SELECT * FROM emp
    WHERE ename 
    LIKE '_L%';
    
-- ����° ���ڰ� L�� ����� �̸�
SELECT * FROM emp
    WHERE ename
    LIKE '__L%';

-- ����° ���ڰ� L�� �ƴ� ����� �̸�
SELECT * FROM emp
    WHERE ename
    NOT LIKE '__L%';
    


-- IS NULL ������ : NULL���� �ƴ��� Ȯ���ϴ� ������
-- �����Ͱ� NULL�� ��� ���
SELECT * FROM emp
    WHERE mgr IS NULL;
SELECT * FROM emp
    WHERE comm IS NULL;
-- �� IS NULL�� ���·� ����ؾ� ��
SELECT * FROM emp
    WHERE comm = NULL;
-- NOT�� �� ���� IS NOT NULL�� ���·� ���
SELECT * FROM emp
    WHERE comm IS NOT NULL;



-- UNION ������ : �ߺ��� �����ϴ� ������
-- ������ ���� ���� ���� -> �Ʒ��� ���� ����
SELECT * FROM emp
    WHERE deptno = 20
    UNION
        SELECT * FROM emp
            WHERE deptno = 30;

SELECT * FROM emp
    WHERE deptno IN (20,30)
        ORDER BY deptno;
-- UNION�� ���� ����
-- 1. ��� ���� ������ ���ƾ� �Ѵ�.
-- 2. ��� ���� �ڷ����� ���ƾ� �Ѵ�.
-- 1.
SELECT empno, ename, sal, deptno FROM emp
    WHERE deptno = 20
    UNION
        SELECT empno, ename, sal FROM emp
            WHERE deptno =30;
-- 2. 
SELECT empno, ename, sal, deptno FROM emp
    WHERE deptno = 20
    UNION
        SELECT ename, empno, sal, deptno FROM emp
            WHERE deptno =30;

SELECT empno, ename, sal, deptno FROM emp
    WHERE deptno = 20
    UNION
        SELECT sal, job, empno, deptno FROM emp
            WHERE deptno =30;

SELECT empno, ename, job. FROM emp
    WHERE deptno = 10
    UNION
        SELECT deptno, dname, loc FROM dept;
        
-- UNION ALL : �ߺ��� ����ϴ� ������
SELECT * FROM emp
    WHERE deptno = 10
    UNION ALL
        SELECT * FROM emp
            WHERE deptno = 10;
SELECT * FROM emp
    WHERE deptno = 10
    UNION
        SELECT * FROM emp
            WHERE deptno = 10;
            
-- MINUS : ������
-- ������ ��� select ������ �� ���̸��� �־�� ��
SELECT * FROM emp
    MINUS
        SELECT * FROM emp
            WHERE deptno = 10;
SELECT * FROM emp
    WHERE deptno != 10;
    
-- INTERSECT : ������
SELECT * FROM emp
    INTERSECT
        SELECT * FROM emp
            WHERE deptno = 10;



-- �������� �켱 ����
-- 0. ()
-- 1. *, /
-- 2. +, -
-- 3. �� ������ >, >=, <, <=, =, !=, <>, ^=
-- 4. IS NULL, LIKE , IN
-- 5. BETWEEN A AND B
-- 6. NOT
-- 7. AND
-- 8. OR



-- 5�� ��������
-- 1.
SELECT * FROM emp
    WHERE ename LIKE '%S';

-- 2. 
SELECT empno, ename, job, sal, deptno FROM emp
    WHERE deptno = 30
        AND job = 'SALESMAN';
    
-- 3.
SELECT empno, ename, sal, deptno FROM emp
    WHERE deptno IN(20, 30)
        AND sal > 2000;

-- 4.
SELECT * FROM emp
    WHERE NOT (sal >= 2000 AND sal <= 3000);

-- 5.
SELECT ename, empno, sal, deptno FROM emp
    WHERE deptno = 30
        AND NOT sal BETWEEN 1000 AND 2000;

-- 6.
SELECT * FROM emp
    WHERE comm IS NULL
        AND job IN ('MANAGER', 'CLERK')
            AND NOT ename LIKE '_L%';