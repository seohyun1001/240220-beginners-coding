-- �ǽ� 9-1(p.242)
SELECT sal FROM emp
WHERE ename = 'JONES';

-- �ǽ� 9-2(p.243)
SELECT * FROM emp 
WHERE sal > 2975;

-- �ǽ� 9-3(p.244)
SELECT * FROM emp
WHERE sal >
    (SELECT sal FROM emp WHERE ename = 'JONES');
    


-- �ǽ� 9-4(p.246)
SELECT * FROM emp
    WHERE hiredate <
        (SELECT hiredate FROM emp WHERE ename = 'SCOTT');



-- �ǽ� 9-5(p.247)
SELECT E.empno, E.ename, E.job, E.sal, D.deptno, D.dname, D.loc
    FROM emp E
        INNER JOIN dept D ON E.deptno = D.deptno
            WHERE E.deptno = 20 AND E.sal >
            (SELECT AVG(sal) FROM EMP);

-- 30�� �μ��� ��� �޿����� ���� �޴� 20�� �μ��� ������� ����ϴ� SQL��
SELECT * FROM emp
WHERE deptno = 20 AND sal >
    (SELECT AVG(sal) FROM emp WHERE deptno = 30);
    


-- �ǽ� 9-7(p.250)
-- �� �μ��� �ְ� �޿���, ������ �޿��� �޴� ��� ���� ���
SELECT * FROM emp
    WHERE sal IN(SELECT MAX(sal) FROM emp 
                    GROUP BY deptno);
-- �ְ� �޿��� �ݾ��� ���� �ʵ���� ���� ��µ�



-- �ǽ� 9-9(p.251)
-- IN�� �Ȱ��� ����
SELECT * FROM emp
    WHERE sal = ANY(SELECT MAX(sal) FROM emp 
                    GROUP BY deptno);
-- �ǽ� 9-10(p.252)
SELECT * FROM emp
    WHERE sal = SOME(SELECT MAX(sal) FROM emp 
                    GROUP BY deptno);
                    
-- �ǽ� 9-11(p.252)
-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ� 
SELECT * FROM emp
    WHERE sal < ANY (SELECT sal FROM emp
                        WHERE deptno = 30)
        ORDER BY sal, empno;
        
        

-- �ǽ� 9-14(p.255)
SELECT * FROM emp
    WHERE sal < ALL (SELECT sal FROM emp
                        WHERE deptno = 30)
        ORDER BY sal, empno;
        
        

-- �ǽ� 9-16(p.256)
SELECT * FROM emp
    WHERE EXISTS(SELECT dname FROM dept WHERE deptno = 10);

-- �ǽ� 9-17(p.256)
SELECT * FROM emp
    WHERE EXISTS(SELECT dname FROM dept WHERE deptno = 50);



-- �ǽ� 9-18(p.258)
-- ���߿� �������� ����ϱ�
SELECT * FROM emp
    WHERE (deptno, sal) IN
    (SELECT deptno, MAX(sal) FROM emp
    GROUP BY deptno);



-- �ǽ� 9-19(p.259)
-- FROM ������ ����ϴ� �������� = �ζ��� ��
SELECT E10.empno, E10.ename, E10.deptno, D.dname, D.loc
    FROM (SELECT * FROM emp WHERE deptno = 10) E10
        INNER JOIN (SELECT * FROM dept) D ON E10.deptno = D.deptno;

-- �ǽ� 9-20(p.260)       
WITH
    E10 AS (SELECT * FROM emp WHERE deptno = 10),
    D AS (SELECT * FROM dept)
SELECT E10.empno, E10.ename, E10.deptno, D.dname, D.loc
    FROM E10
     INNER JOIN D ON E10.deptno = D.deptno;

-- �ǽ� 9-21(p.261)
-- * ����) SELECT�� ���������� �ݵ�� ����� �ϳ��� �������� �ۼ��ؾ� ��
SELECT empno, ename, job, sal,
    (SELECT grade FROM salgrade
        WHERE E.sal BETWEEN losal AND hisal) AS SALGRADE,
            deptno,
            (SELECT dname FROM dept
                WHERE E.deptno = dept.deptno) AS dname
                    FROM emp E;

SELECT E.empno, E.ename, E.job, E.sal, S.grade, D.deptno, D.dname
    FROM emp E
        INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
        INNER JOIN dept D ON E.deptno = D.deptno;



-- ���� ����
-- p.262 ~ 263
-- 1.
SELECT E.job, E.empno, E.ename, E.sal, E.deptno, D.dname FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
        WHERE job = 
            (SELECT job FROM emp WHERE ename = 'ALLEN');

-- 2.
SELECT E.empno, E.ename, D.dname, E.hiredate, D.loc, E.sal, S.grade FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
        WHERE sal > ANY
            (SELECT AVG(SAL) FROM emp)
                ORDER BY E.sal desc, E.empno;

-- 3.
SELECT E.empno, E.ename, E.job, D.deptno, D.dname, D.loc FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
        WHERE E.deptno = 10 and job NOT IN
            (SELECT job FROM emp WHERE deptno = 30);

-- 4.
SELECT E.empno, E.ename, E.sal, S.grade FROM EMP E
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
        WHERE E.sal >
            (SELECT MAX(sal) FROM emp WHERE job = 'SALESMAN')
                ORDER BY E.empno;

SELECT E.empno, E.ename, E.sal, S.grade FROM EMP E
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
        WHERE E.sal > ALL
            (SELECT sal FROM emp WHERE job = 'SALESMAN')
                ORDER BY E.empno;
                


-- �������� ��������
-- 1. SCOTT�� �޿�(SAL)�� �����ϰų� �� ���� �޴� ����� �̸�(ENAME)�� �޿�(SAL)�� ����ϼ���.
SELECT ename, sal FROM emp
    WHERE sal >=
        (SELECT sal FROM emp WHERE UPPER(ename) = UPPER('SCOTT'));

-- 2. ������ 'CLERK'�� ����� �μ���ȣ(DEPTNO)�� �μ���(DNAME)�� ����ϼ���.
SELECT D.deptno, D.dname FROM dept D
    INNER JOIN emp E ON E.deptno = D.deptno
        WHERE job = 'CLERK';

SELECT E.deptno, D.dname FROM emp E
INNER JOIN dept D ON D.deptno = E.deptno
    WHERE E.deptno IN
    (SELECT deptno FROM emp WHERE job = 'CLERK');
    
    SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM EMP
    WHERE JOB = 'CLERK'
);

-- 3. �̸��� T�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϴ� ����� ���(EMPNO)�� �̸�(ENAME)�� ����ϼ���.
SELECT empno, ename FROM emp
    WHERE deptno IN
    (SELECT DISTINCT deptno FROM emp WHERE ename LIKE('%T%'));

-- 4. �μ� ��ġ�� DALLAS�� ��� ����� �̸�(ENAME), �μ���ȣ(DEPTNO)�� ����ϼ���.
SELECT E.ename, D.deptno FROM emp E
INNER JOIN dept D ON E.deptno = D.deptno
WHERE D.loc = 'DALLAS'
ORDER BY empno;

SELECT ename, deptno FROM emp
WHERE deptno =
    (SELECT deptno FROM dept WHERE LOC = 'DALLAS')
    ORDER BY empno;

-- 5. SALES �μ��� ��� ����� �̸�(ENAME)�� �޿�(SAL)�� ����ϼ���.
SELECT E.ename, E.sal FROM EMP E
INNER JOIN dept D ON E.deptno = D.deptno
WHERE D.dname = 'SALES'
ORDER BY empno;

SELECT ename, sal FROM emp
WHERE deptno =
    (SELECT deptno FROM dept WHERE dname = 'SALES')
    ORDER BY empno;

-- 6.  KING���� �����ϴ�(=�Ŵ����� KING�� ���) ��� ����� �̸�(ENAME)�� �޿�(SAL)�� ����ϼ���.
SELECT ename, sal FROM emp
WHERE mgr =
    (SELECT empno FROM emp WHERE ename = 'KING')
    ORDER BY empno;

SELECT E.ename, E.sal FROM emp E
INNER JOIN emp E2 ON E.mgr = E2.empno
    WHERE E2.ename = 'KING'
    ORDER BY E.empno;

-- 7. �ڽ��� �޿��� ��ձ޿����� ���� �̸��� S�� ���� ����� ������ �μ����� �ٹ��ϴ� 
-- ��� ����� �̸�(ENAME), �޿�(SAL)�� ����ϼ���.
SELECT ename, sal FROM emp
WHERE sal >
    (SELECT AVG(sal) FROM emp)
        AND deptno IN
            (SELECT DISTINCT deptno FROM emp WHERE ename LIKE('%S%'))
            ORDER BY sal;
