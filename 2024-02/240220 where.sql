-- WHERE절 : SELECT문에서 조건에 맞는 특정 행을 출력하는 SQL문(SELECT문 필요)
-- WHERE절 X
SELECT * FROM emp;
-- WHERE절 O
SELECT * FROM emp WHERE deptno = 30;
SELECT * FROM emp WHERE deptno = 20;
SELECT * FROM emp WHERE deptno = 10;

-- AND : (그리고) 양쪽 항의 결과가 모두 true(참)일 때 true를 반환하고,
--        나머지는 모두 false(거짓)
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
-- deptno가 30이고, job이 'SALESMAN'인 데이터를 출력

-- OR : (또는) 양쪽 항 중에 하나라도 결과가 true(참)이면 true를 반환하고,
--       양쪽 항이 모두 false이면 false를 반환
SELECT * FROM emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 AND job = 'CLERK';
SELECT * FROM emp WHERE deptno = 10 OR job = 'MANAGER';

-- 대소 비교 연산자 : <, <=, >, >=
SELECT * FROM emp WHERE sal > 1000;
SELECT * FROM emp WHERE sal >= 2000;
SELECT * FROM emp WHERE sal < 1600;
SELECT * FROM emp WHERE sal <= 1600;
-- 문자열의 경우 첫 글자부터 한 글자씩 비교를 함
SELECT * FROM emp WHERE ename < 'B';
SELECT * FROM emp WHERE ename <= 'FORC';

-- 등가 비교 연산자 : = / !=, <>, ^=
SELECT * FROM emp WHERE sal = 3000;
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;
-- 사원 정보 테이블에서 급여를 2000이상 받으면서 직책이 매니저가 아닌 사람
SELECT * FROM emp
    WHERE sal >= 2000
    AND job != 'MANAGER';
    
-- NOT 연산자 : (다르다) / !=, <>, ^=
SELECT * FROM emp
    WHERE NOT(sal = 3000 and sal = 1600);
SELECT * FROM emp
    WHERE NOT (sal = 3000 or sal = 1600);
SELECT * FROM emp
    WHERE NOT(sal = 3000 and sal = 1600);
SELECT * FROM emp
    WHERE sal != 3000;

-- IN 연산자 : 조건이 여러 개일 때 사용하는 연산자
-- = 필요 없음
SELECT * FROM emp
    WHERE job IN ('MANAGER', 'PRESIDENT');
    
SELECT * FROM emp
    WHERE job IN ('MANAGER', 'PRESIDENT');
    
SELECT * FROM emp
    WHERE job != 'MANAGER'
        AND job <> 'PRESIDENT'
        AND job ^= 'CLERK';
        
-- IN 연산자를 활용하여 부서번호가 10, 20번인 사원 정보 출력
SELECT * FROM emp
    WHERE deptno
        IN(10, 20);



-- BETWEEN A AND B : A보다 크거나 같고, B보다 작거나 같을 때 출력하는 연산자
SELECT * FROM emp
    WHERE sal BETWEEN 2000 AND 3000;
-- 대소 비교 연산자를 이용하여 급여가 2000보다 크거나 같고 3000보다 작거나 같은 사원을 출력
SELECT * FROM emp
    WHERE sal >= 2000
    AND sal <= 3000;
    
-- NOT BETWEEN A AND B
SELECT * FROM emp
    WHERE sal
    NOT BETWEEN 2000 AND 3000;
SELECT * FROM emp
    WHERE sal < 2000 or sal > 3000;
    
    

-- LIKE 연산자 : 비슷한 문자열을 찾는 연산자, 와일드 카드 문자를 사용해야 함
-- 와일드 카드 문자 : '_'(어떤 문자든 상관없이 한 글자)
--                  '%'(어떤 문자든 상관없이 여러 문자)
-- 첫번째 글자가 S로 시작하는 사원의 이름
SELECT * FROM emp
    WHERE ename
    LIKE 'S%';
    
-- 두번째 글자가 L인 사원의 이름
SELECT * FROM emp
    WHERE ename 
    LIKE '_L%';
    
-- 세번째 글자가 L인 사원의 이름
SELECT * FROM emp
    WHERE ename
    LIKE '__L%';

-- 세번째 문자가 L이 아닌 사원의 이름
SELECT * FROM emp
    WHERE ename
    NOT LIKE '__L%';
    


-- IS NULL 연산자 : NULL인지 아닌지 확인하는 연산자
-- 데이터가 NULL일 경우 출력
SELECT * FROM emp
    WHERE mgr IS NULL;
SELECT * FROM emp
    WHERE comm IS NULL;
-- 꼭 IS NULL의 형태로 사용해야 함
SELECT * FROM emp
    WHERE comm = NULL;
-- NOT을 쓸 때는 IS NOT NULL의 형태로 사용
SELECT * FROM emp
    WHERE comm IS NOT NULL;



-- UNION 연산자 : 중복을 제거하는 합집합
-- 순서는 위에 적은 문장 -> 아래에 적은 문장
SELECT * FROM emp
    WHERE deptno = 20
    UNION
        SELECT * FROM emp
            WHERE deptno = 30;

SELECT * FROM emp
    WHERE deptno IN (20,30)
        ORDER BY deptno;
-- UNION의 제약 사항
-- 1. 출력 열의 개수가 같아야 한다.
-- 2. 출력 열의 자료형이 같아야 한다.
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
        
-- UNION ALL : 중복을 허용하는 합집합
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
            
-- MINUS : 차집합
-- 정렬의 경우 select 다음에 그 열이름이 있어야 함
SELECT * FROM emp
    MINUS
        SELECT * FROM emp
            WHERE deptno = 10;
SELECT * FROM emp
    WHERE deptno != 10;
    
-- INTERSECT : 교집합
SELECT * FROM emp
    INTERSECT
        SELECT * FROM emp
            WHERE deptno = 10;



-- 연산자의 우선 순위
-- 0. ()
-- 1. *, /
-- 2. +, -
-- 3. 비교 연산자 >, >=, <, <=, =, !=, <>, ^=
-- 4. IS NULL, LIKE , IN
-- 5. BETWEEN A AND B
-- 6. NOT
-- 7. AND
-- 8. OR



-- 5장 연습문제
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