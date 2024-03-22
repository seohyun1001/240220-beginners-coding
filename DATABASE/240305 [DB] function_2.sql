-- 5. NULL ó�� �Լ�
-- NVL �Լ�
-- �ǽ� 6-45 (p.167)
SELECT empno, ename, sal, comm, sal+comm,
    NVL(comm, 0), sal+NVL(comm, 0) FROM emp;
-- NVL ���� �Ű��������� ���� ������ Ÿ���̾�� ��



-- NVL2 �Լ�
-- (NULL���θ� �˻��� ������, NULL�� �ƴ� �� ��ȯ�� ������, NULL�� �� ��ȯ�� ������)
-- �ǽ� 6-46 (p.169)
SELECT empno, ename, comm, NVL2(comm, 'O', 'X'),
    NVL2(comm, sal*12+comm, sal*12) AS ANNSAL FROM emp;
    
    

-- 6. �ٸ� ������ ��ȯ�ϴ� �Լ�
-- DECODE
-- (�˻� ���, ����1, ����1�� ��ȯ, ����2, ����2�� ��ȯ, ... ,
-- ����n, ����n�� ��ȯ, �ƹ��͵� ��ġ���� ���� �� ��ȯ)

-- �ǽ� 6-47 (p.170)
SELECT empno, ename, job, sal,
    DECODE(job, 'MANAGER', sal*1.1,
                'SALESMAN', sal*1.05,
                'ANALYST', sal,
                sal*1.03) AS UPSAL FROM emp;



-- CASE
-- CASE �˻� ���
    -- WHEN ����1 THEN ����1�� ��ȯ
    -- WHEN ����2 THEN ����2�� ��ȯ ...
    -- ELSE �ƹ��͵� ��ġ���� ���� �� ��ȯ
-- END

-- �ǽ� 6-48 (p.172)
SELECT empno, ename, job, sal,
    CASE job
        WHEN 'MANAGER' THEN sal*1.1
        WHEN 'SALESMAN' THEN sal*1*05
        WHEN 'ANALYST' THEN sal
        ELSE sal*1.03
    END AS UPSAL
    FROM emp;
    
-- �ǽ� 6-49 (p.173)
SELECT empno, ename, comm,
    CASE
        WHEN comm IS NULL THEN '�ش���� ����'
        WHEN comm = 0 THEN '���� ����'
        WHEN comm > 0 THEN '���� : ' || comm
    END AS COMM_TEXT
    FROM emp;
-- * ����) ������ Ÿ�� ������� ��



-- p.174 ~ p.175 ��������
-- 1.
SELECT empno,
    SUBSTR(empno,1,2) || '**' AS MASKING_EMPNO,
    ename,
    SUBSTR(ename,1,1) || '****' AS MASKING_ENAME FROM emp
    WHERE LENGTH(ename) = 5;

SELECT empno,
    RPAD(SUBSTR(empno,1,2), LENGTH(empno), '*') AS MASKING_EMPNO,
    ename,
    RPAD(SUBSTR(ename,1,1), LENGTH(ename), '*') AS MASKING_ENAME FROM emp
    WHERE LENGTH(ename) >= 5 AND LENGTH(ename) < 6;

-- 2.
SELECT empno, ename, sal,
    TRUNC(sal/21.5,2) AS DAY_PAY,
    ROUND(sal/21.5/8,1) AS TIME_PAY FROM emp;
    
-- 3.
SELECT empno, ename, hiredate,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate, 3),'������'),'YYYY-MM-DD') AS "R_JOB",
    CASE
        WHEN comm IS NULL THEN 'N/A'
        ELSE TO_CHAR(comm) END AS COMM
    FROM emp;
    
-- 4.
SELECT empno, ename, NVL(TO_CHAR(mgr),' ') AS MGR,
    CASE
        WHEN TO_CHAR(mgr) IS NULL THEN ' '
        ELSE TO_CHAR(mgr)
    END AS CASE_MGR,
    
    CASE
        WHEN mgr IS NULL THEN '0000'
        WHEN SUBSTR(mgr,1,2) = 75 THEN '5555'
        WHEN SUBSTR(mgr,1,2) = 76 THEN '6666'
        WHEN SUBSTR(mgr,1,2) = 77 THEN '7777'
        WHEN SUBSTR(mgr,1,2) = 78 THEN '8888'
        ELSE TO_CHAR(mgr)
    END AS CHG_MGR
    FROM emp;