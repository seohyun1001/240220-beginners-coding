-- 8�� ����

-- union
SELECT * FROM emp WHERE deptno = 10
UNION
SELECT * FROM emp WHERE deptno = 20;

-- �ǽ� 8-1(p.216)
-- SQL-99 ���� ��� : ���� ���� ���� ���� ����
SELECT * FROM emp, dept
ORDER BY empno, dept.deptno;

-- �ǽ� 8-2(p.218)
-- ���� ���� o
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno
ORDER BY empno, dept.deptno;

-- SQL-99 ��� : ���� ���� ���� ���� �Ұ���
SELECT * FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno
ORDER BY emp.empno, dept.deptno;



-- �ǽ� 8-3(p.219)
-- ���̺��� ��Ī�� ��𼭵� ��� �����ϴ�.
SELECT * FROM emp E
INNER JOIN dept D ON E.deptno = D.deptno
ORDER BY E.empno;

-- � ���� = INNER JOIN, SIMPLE JOIN
-- : Ư�� ���� ��Ȯ�� ��ġ�ϴ� �����͸� ����Ͽ� JOIN�� �ϴ� ���
-- ��κ� �ܷ�Ű�� ����Ͽ� JOIN�� �����ϰ� ��
-- �׷��� �ݵ�� �ܷ�Ű�� �ʿ�� ����
-- INNER ��������
SELECT * FROM emp E
    INNER JOIN dept D ON E.deptno = d.deptno;



-- �� ���� : � ������ ������ ��� ���� ���
-- ������ ���� �����͸� ����Ͽ� �����ϴ� ���
SELECT * FROM emp E
INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal;



-- ��ü ���� : ���� ���̺��� �� �� ����ϴ� ���� ���
SELECT E.empno, E.ename, E.mgr,
    E2.empno AS MGR_EMPNO,
    E2.ename AS MGR_ENAME FROM emp E
INNER JOIN emp E2 ON E.mgr = E2.empno;

SELECT * FROM emp E
INNER JOIN dept D ON E.empno = D.deptno;
-- -> ���� ���� ��� �����Ͱ� ������ ����



-- �ǽ� 8-9(p.229)
-- ���� �ܺ� ���� 
-- : ���� ���̺��� �������� ��ġ���� �ʴ� ��� �����͸� �Բ� ����ϴ� ����
SELECT E.empno, E.ename, E.mgr,
    E2.empno AS MGR_EMPNO,
    E2.ename AS MGR_ENAME
FROM emp E
LEFT OUTER JOIN emp E2 ON E.mgr = E2.empno
ORDER BY E.empno;

-- �ǽ� 8-10(p.229)
-- ������ �ܺ� ����
-- : ������ ���̺��� �������� ��ġ���� �ʴ� ��� �����͸� �Բ� ����ϴ� ����
SELECT E.empno, E.ename, E.mgr,
    E2.empno AS MGR_EMPNO,
    E2.ename AS MGR_ENAME FROM emp E
RIGHT OUTER JOIN emp E2 ON E.mgr = E2.empno
ORDER BY E.empno;

-- FULL OUTER JOIN : ������ ��ġ���� �ʴ� �����ͱ��� ����ϴ� ����
SELECT E.empno, E.ename, E.mgr,
    E2.empno AS MGR_EMPNO,
    E2.ename AS MGR_ENAME FROM emp E
FULL OUTER JOIN emp E2 ON E.mgr = E2.empno
ORDER BY E.empno;



-- NATURAL JOIN : Ư�� ���� ���� ������ ���������� �������� �ʰ�
-- �̸��� �ڷ����� ���� ���� ã�Ƽ� �ڵ����� ����
-- � ���ο��� ���� ����
-- � ������ ����(DEPTNO)�� ��Ī�� �� �� ����
-- �ǽ� 8-11(p.232)
SELECT E.empno, E.ename, E.job, E.mgr,
    E.hiredate, E.sal, E.comm, deptno,
    D.dname, D.loc FROM emp E
NATURAL JOIN dept D
ORDER BY deptno, E.empno;



-- JOIN ~ USING
-- ���ο� ����� ���ؿ��� �����Ͽ� ����ϴ� ����
SELECT E.empno, E.ename, E.job, E.mgr,
    E.hiredate, E.sal, E.comm, deptno,
    D.dname, D.loc FROM emp E
JOIN dept D USING(deptno)
ORDER BY deptno, E.empno;



-- JOIN ~ ON
-- ���� ���� ���� ����
-- ���� ���� �̸��� �޶� ���� ����, �ڷ����� ���ƾ� ��
-- �/��/�ܺ�/��ü �� ��� ������ ��� ����
-- ���� : SELECT / FROM / JOIN ON / WHERE / ORDER BY
SELECT E.empno, E.ename, E.job, E.mgr,
    E.hiredate, E.sal, E.comm, D.deptno,
    D.dname, D.loc FROM emp E
JOIN dept D ON E.deptno = d.deptno
ORDER BY deptno, E.empno;



-- � ���� <> �� ���� : ������ ������ = �ΰ�, �ƴѰ�
-- ���� ���� <> �ܺ� ���� : ��ġ���� �ʴ� �����͸� ����ϴ°�, ���� �ʴ°�
-- ��ü ���� : ���� ���̺��� ����ϴ°�



-- ���� ���̺��� �����ϴ� ���
SELECT * FROM emp E
    INNER JOIN dept D ON E.deptno = D.deptno
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
    INNER JOIN emp M ON E.mgr = M.empno
WHERE E.sal >= 2000
ORDER BY E.deptno;



-- ���� ���� 
-- p.239~p.240
-- 1.
SELECT D.deptno, D.dname, E.empno, E.ename, E.sal
FROM dept D
    INNER JOIN emp E ON D.deptno = E.deptno
WHERE E.sal > 2000;

-- 2.
SELECT E.deptno, D.dname,
    TRUNC(AVG(E.sal)) AS AVG_SAL,
    MAX(E.sal) AS MAX_SAL,
    MIN(E.sal) AS MIN_SAL,
    COUNT(*) AS CNT
FROM emp E
    INNER JOIN dept D ON E.deptno = d.deptno
GROUP BY E.deptno, D.dname;

-- 3.
SELECT D.deptno, D.dname, E.empno, E.ename, E.job, E.sal
FROM dept D
    LEFT OUTER JOIN emp E ON D.deptno = E.deptno
    ORDER BY D.deptno;

-- 4.
SELECT D.deptno, D.dname, E.empno, E.ename, E.mgr,
        E.sal, E.deptno, S.losal, S.hisal, S.grade,
        E.mgr AS MGR_EMPNO,
        M.ename AS MGR_ENAME
FROM dept D                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    LEFT OUTER JOIN emp E ON D.deptno = E.deptno
    LEFT OUTER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
    LEFT OUTER JOIN emp M ON E.mgr = M.empno
ORDER BY D.deptno, E.empno;



-- ��������
-- �׷��Լ�
-- 1. �� �μ����� �ִ� �޿��� ���ϼ���.
SELECT deptno, MAX(sal) FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 2. �� ����(JOB)���� �ִ� �޿��� ���ϼ���.
SELECT job, MAX(sal) FROM emp
GROUP BY job
ORDER BY job;

-- 3. �� �μ����� ��� �޿��� ���ϼ���.
SELECT deptno, TRUNC(AVG(sal)) AS AVG_SAL FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 4. �� ����(JOB)���� �ο����� ���ϼ���.
SELECT job, COUNT(*) FROM emp
GROUP BY job
ORDER BY job;

-- 5. �� �μ��� �ο����� �߰�����(COMM)�� �޴� �ο����� ���ϼ���.
SELECT deptno, COUNT(deptno) AS CNT1, COUNT(comm) AS CNT2 FROM emp
GROUP BY deptno, comm
ORDER BY deptno;

-- 6. �� �⵵���� �Ի��� �ο����� ���ϼ���.
SELECT TO_CHAR(hiredate, 'YYYY') AS HIREDATE, COUNT(*) FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY')
ORDER BY hiredate;

-- 7. �μ��� ��� �޿��� ���ϰ� �� ����� ��� �޿��� 2000 �̻��� �μ��� ����ϼ���.
SELECT deptno, TRUNC(AVG(sal)) AS AVG_SAL FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000
ORDER BY deptno;

-- 8. �޿��� 1000 �̻��� ������ �μ��� ��� �޿��� ���ϰ� �� ����� ��ձ޿��� 2000�̻��� �μ��� ����ϼ���.
SELECT D.dname, TRUNC(AVG(E.sal)) AS AVG_SAL FROM dept D
INNER JOIN emp E ON D.deptno = E.deptno
WHERE E.sal >= 1000
GROUP BY D.dname
HAVING AVG(E.sal) > 2000
ORDER BY D.dname;


----------------------------------------------------------------------------------------------------------------
-- ����
-- 1. ����̸��� SCOTT�� ����� ���(EMPNO), �̸�(ENAME),  �μ���(DNAME)�� ����ϼ���.
SELECT E.empno, E.ename, D.dname FROM emp E
    INNER JOIN dept D ON E.deptno = D.deptno
    WHERE UPPER(E.ename) = UPPER('SCott');

-- 2. ����̸�(ENAME)�� �޿�(SAL)�� �޿����(GRADE)�� ����ϼ���.
SELECT E.ename, E.sal, S.grade FROM emp E
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
ORDER BY empno;

-- 3. �� 2���������� �μ����� �߰����� ����ϼ���.
SELECT D.dname, E.ename, E.sal, S.grade FROM emp E
    INNER JOIN salgrade S ON E.sal BETWEEN S.losal AND S.hisal
    INNER JOIN dept D ON E.deptno = D.deptno
ORDER BY D.deptno, E.empno;

-- 4. ����̸��� �Ŵ����� �̸��� �Ʒ��� ���� �������� ����ϼ���.
--	"XXX"�� �Ŵ����� "XXX" �Դϴ�.
SELECT '"' || E.ename || '"�� �Ŵ����� "' || E2.ename || '" �Դϴ�.' AS MANAGER FROM emp E
INNER JOIN emp E2 ON E.mgr = E2.empno
ORDER BY E.deptno;

-- 5. �μ���ȣ(DEPTNO)�� 30���� ������� �̸�(ENAME), ����(JOB), �μ���ȣ(DEPTNO), �μ���ġ(LOC)�� ����ϼ���.
SELECT E.ename, E.job, D.deptno, D.loc FROM emp E
INNER JOIN dept D ON D.deptno = E.deptno
WHERE E.deptno = 30
ORDER BY E.empno;

-- 6. ���ʽ�(COMM)�� ���� ����� �̸�(ENAME), ���ʽ�(COMM), �μ���(DNAME), �μ���ġ(LOC)�� ����ϼ���.
SELECT E.ename, E.comm, D.dname, D.loc FROM emp E
INNER JOIN dept D ON D.deptno = E.deptno
WHERE comm IS NOT NULL AND comm > 0
ORDER BY E.empno;

-- 7. DALLAS���� �ٹ��ϴ� ������� �̸�(ENAME), ����(JOB), �μ���ȣ(DEPTNO), �μ���(DNAME)�� ����ϼ���.
SELECT E.ename, E.job, E.deptno, D.dname FROM emp E
INNER JOIN dept D ON D.deptno = E.deptno
WHERE D.loc = 'DALLAS'
ORDER BY empno;

-- 8. �̸��� 'A'�� ���� ������� �̸�(ENAME)�� �μ���(DNAME)�� ����ϼ���.
SELECT E.ename, D.dname FROM emp E
INNER JOIN dept D ON D.deptno = E.deptno
WHERE UPPER(ename) LIKE UPPER('%A%');
