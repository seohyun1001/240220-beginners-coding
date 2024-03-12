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
SELECT deptno, empno, ename, sal FROM emp
WHERE deptno = 20 AND sal >
    (SELECT AVG(sal) FROM emp WHERE deptno = 30);