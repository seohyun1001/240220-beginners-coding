-- ������ �Լ�
-- sum���� �հ� ���ϱ�
SELECT SUM(sal) FROM emp;

-- *���ǻ���
-- ������ �Լ��� ������ �Լ��� ������� ���� �Ϲ� ���� ���� ����� �� ����

-- �ǽ� 7-4(p.179)
SELECT SUM(DISTINCT sal),
    SUM(ALL sal),
    SUM(sal) FROM EMP;

-- COUNT
-- �ǽ� 7-5(p.181)
SELECT COUNT(*) FROM emp;

-- �ǽ� 7-6(p.181)
SELECT COUNT(*) FROM emp
    WHERE deptno = 30;
    
-- �ǽ� 7-7(p.181)
SELECT COUNT(DISTINCT sal),
    COUNT(ALL sal),
    COUNT(sal) FROM emp;

-- null���� ���� ���� ����
-- �ǽ� 7-8(p.182)
SELECT COUNT(comm) FROM emp;

-- �ǽ� 7-9(p.182)
SELECT COUNT(comm) FROM emp
    WHERE comm IS NOT NULL;

-- MAX, MIN : ��¥�� ����!
SELECT MAX(sal), MIN(sal),
    MAX(hiredate), MIN(hiredate) FROM emp;

-- �ǽ� 7-10(p.183)
SELECT MAX(sal) FROM emp
    WHERE deptno = 10;

-- �ǽ� 7-11(p.183)
SELECT MIN(sal) FROM emp
    WHERE deptno = 10;

-- AVG
-- �ǽ� 7-14(p.184)
SELECT ROUND(AVG(sal),0) AS "30" FROM emp
    WHERE deptno = 30;

-- ������� �޿��� ����, ���, �ִ�, �ּ�, �ѿ��� ���ϴ� SQL��
SELECT SUM(sal) AS SUM,
    ROUND(AVG(sal), 0) AS AVG,
    MAX(sal) AS MAX,
    MIN(sal) AS MIN,
    COUNT(empno) AS TOTAL FROM emp;



-- GROUP BY ��
-- �ǽ� 7-16(p.186)
SELECT '10' AS deptno,
    SUM(sal) AS SUM,
    ROUND(AVG(sal), 0) AS AVG,
    MAX(sal) AS MAX,
    MIN(sal) AS MIN,
    COUNT(empno) AS TOTAL FROM emp
    WHERE deptno = 10
    UNION ALL
SELECT '20' AS deptno,
    SUM(sal) AS SUM,
    ROUND(AVG(sal), 0) AS AVG,
    MAX(sal) AS MAX,
    MIN(sal) AS MIN,
    COUNT(empno) AS TOTAL FROM emp
    WHERE deptno = 20
    UNION ALL
SELECT '30' AS deptno,
    SUM(sal) AS SUM,
    ROUND(AVG(sal), 0) AS AVG,
    MAX(sal) AS MAX,
    MIN(sal) AS MIN,
    COUNT(empno) AS TOTAL FROM emp
    WHERE deptno = 30;
    
-- �ǽ� 7-17(p.187)
SELECT TRUNC(AVG(sal)), deptno FROM emp
    GROUP BY deptno;
SELECT TRUNC(AVG(sal)), mgr FROM emp
    GROUP BY mgr;
SELECT TRUNC(AVG(sal)), mgr, count(*) FROM emp
    GROUP BY mgr;
SELECT empno, AVG(sal) FROM emp
    GROUP BY empno;

-- �ǽ� 7-18(p.188)
SELECT deptno, job, AVG(sal) FROM emp
    GROUP BY deptno, job
    ORDER BY deptno, job;
    
    

-- HAVING ��(GROUP BY�� ���ǽ�)
-- �ǽ� 7-20(p.190)
-- �ǽ� 7-22(p.192)
SELECT deptno, job, AVG(sal) FROM emp
    GROUP BY deptno, job
        HAVING AVG(sal) >= 2000
    ORDER BY deptno, job;

-- �ǽ� 7-23(p.192)
SELECT deptno, job, AVG(sal) FROM emp
    WHERE sal <= 3000
    GROUP BY deptno, job
        HAVING AVG(sal) >= 2000
    ORDER BY deptno, job;
    
-- �޿��� 2000�� �Ѵ� ��� ��, �μ��� ��� �޿��� ����ϴ� SQL��
SELECT deptno, TRUNC(AVG(sal)) AS AVERAGE FROM emp
    WHERE sal >= 2000
        GROUP BY deptno
            ORDER BY deptno;

-- ��å�� ������� 2���� �Ѵ� ��å�� ����ϴ� SQL��
SELECT job, COUNT(*) FROM emp
    GROUP BY job
        HAVING COUNT(*) > 2;



-- ROLLUP : �ұ׷�, ��׷�, �Ѱ�, N+1���� �׷캰 ����� ����ϴ� �Լ�
-- �ǽ� 7-25(p.196)
SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), TRUNC(AVG(sal)) FROM emp
    GROUP BY ROLLUP(deptno, job)
        ORDER BY deptno, job;

-- CUBE
-- �ǽ� 7-26(p.197)   
SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), TRUNC(AVG(sal)) FROM emp
    GROUP BY CUBE(deptno, job)
        ORDER BY deptno, job;

-- GROUPING SETS
-- �ǽ� 7-29(p.201)
SELECT deptno, job, COUNT(*) FROM emp
    GROUP BY GROUPING SETS(deptno, job)
        ORDER BY deptno, job;
        
        

-- �׷�ȭ �Լ�
-- GROUPING
-- GROUPING_ID : 2���� �̿�
-- �ǽ� 7-32(p.205)
SELECT deptno, job, COUNT(*), SUM(sal),
    GROUPING(deptno),
    GROUPING(job),
    GROUPING_ID(deptno, job) FROM emp
        GROUP BY CUBE(deptno, job)
            ORDER BY deptno, job;

-- LISTAGG
-- �ǽ� 7-33(p.206)
SELECT deptno, ename FROM emp
    GROUP BY deptno, ename;

-- �ǽ� 7-34(p.207)
SELECT deptno,
    LISTAGG(ename, ', ')
    WITHIN GROUP(ORDER BY sal DESC) AS ENAMES FROM emp
    GROUP BY deptno;

-- p.212~p.213
-- 1.
SELECT deptno,
    TRUNC(AVG(SAL)) AS AVG_SAL,
    MAX(sal) AS MAX_SAL,
    MIN(sal) AS MIN_SAL,
    COUNT(*) AS CNT FROM emp
        GROUP BY deptno
            ORDER BY deptno DESC;

-- 2.
SELECT job, COUNT(*) FROM EMP
    GROUP BY job
        HAVING COUNT(*) >= 3;

-- 3.
SELECT TO_CHAR(hiredate, 'YYYY') AS HIRE_YEAR,
    deptno, COUNT(*) AS CNT FROM emp
        GROUP BY TO_CHAR(hiredate, 'YYYY'), deptno
            ORDER BY TO_CHAR(hiredate, 'YYYY'), deptno;

-- 4.
SELECT 
    CASE
        WHEN comm IS NULL THEN 'X'
        ELSE 'O'
        END AS EXIST_COMM,
        COUNT(*) AS CNT
            FROM emp
                GROUP BY
                CASE WHEN comm IS NULL THEN 'X' ELSE 'O' END;
                
-- 5.
SELECT deptno, TO_CHAR(hiredate, 'yyyy') AS HIRE_YEAR,
    COUNT(*) AS CNT,
    MAX(sal) AS MAX_SAL,
    SUM(sal) AS SUM_SAL,
    AVG(sal) AS AVG_SAL FROM emp
        GROUP BY ROLLUP(deptno, TO_CHAR(hiredate, 'yyyy'))
            ORDER BY deptno;