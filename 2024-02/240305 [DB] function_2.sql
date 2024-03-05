-- 5. NULL 처리 함수
-- NVL 함수
-- 실습 6-45 (p.167)
SELECT empno, ename, sal, comm, sal+comm,
    NVL(comm, 0), sal+NVL(comm, 0) FROM emp;
-- NVL 안의 매개변수들은 같은 데이터 타입이어야 함



-- NVL2 함수
-- (NULL여부를 검사할 데이터, NULL이 아닐 때 반환할 데이터, NULL일 때 반환할 데이터)
-- 실습 6-46 (p.169)
SELECT empno, ename, comm, NVL2(comm, 'O', 'X'),
    NVL2(comm, sal*12+comm, sal*12) AS ANNSAL FROM emp;
    
    

-- 6. 다른 데이터 반환하는 함수
-- DECODE
-- (검사 대상, 조건1, 조건1의 반환, 조건2, 조건2의 반환, ... ,
-- 조건n, 조건n의 반환, 아무것도 일치하지 않을 때 반환)

-- 실습 6-47 (p.170)
SELECT empno, ename, job, sal,
    DECODE(job, 'MANAGER', sal*1.1,
                'SALESMAN', sal*1.05,
                'ANALYST', sal,
                sal*1.03) AS UPSAL FROM emp;



-- CASE
-- CASE 검사 대상
    -- WHEN 조건1 THEN 조건1의 반환
    -- WHEN 조건2 THEN 조건2의 반환 ...
    -- ELSE 아무것도 일치하지 않을 때 반환
-- END

-- 실습 6-48 (p.172)
SELECT empno, ename, job, sal,
    CASE job
        WHEN 'MANAGER' THEN sal*1.1
        WHEN 'SALESMAN' THEN sal*1*05
        WHEN 'ANALYST' THEN sal
        ELSE sal*1.03
    END AS UPSAL
    FROM emp;
    
-- 실습 6-49 (p.173)
SELECT empno, ename, comm,
    CASE
        WHEN comm IS NULL THEN '해당사항 없음'
        WHEN comm = 0 THEN '수당 없음'
        WHEN comm > 0 THEN '수당 : ' || comm
    END AS COMM_TEXT
    FROM emp;
-- * 주의) 데이터 타입 맞춰줘야 함



-- p.174 ~ p.175 연습문제
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
    TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate, 3),'월요일'),'YYYY-MM-DD') AS "R_JOB",
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