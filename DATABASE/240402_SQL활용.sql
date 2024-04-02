-- 1.
INSERT INTO emp
    VALUES (seq_emp_sequence.NEXTVAL, '이순신',104,'부장',500,NULL);



-- 2.
UPDATE dept
    SET area =
        CASE
            WHEN dname = '영업부' THEN '서울'
            ELSE '부산'
        END;



-- 3.
DELETE FROM emp
    WHERE deptno =
        (SELECT E.deptno FROM emp E
        INNER JOIN dept D ON D.deptno = E.deptno
        WHERE D.dname = '홍보부');



-- 4.
SELECT name, pay, 
    CASE
        WHEN pay <= 200 THEN pay * 0.05
        WHEN pay <= 300 THEN pay * 0.1
        WHEN pay <= 400 THEN pay * 0.15
        ELSE pay * 0.2
    END AS TAX
FROM emp;



-- 5.
SELECT E.name, D.dname, E.position FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
    WHERE D.dname IN('영업부','총무부')
        ORDER BY name;



-- 6.
SELECT E1.name, E2.name FROM emp E1
    LEFT OUTER JOIN emp E2 ON E1.pempno = E2.empno;



-- 7.
SELECT D.dname, TRUNC(AVG(E.pay)) AS AVG_PAY FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
    GROUP BY D.dname
        HAVING AVG(e.PAY) >= 350;



-- 8.
SELECT E.name, D.dname, E.pay FROM emp E
    INNER JOIN dept D ON E.deptno = D.deptno
    WHERE (E.deptno, E.pay) IN (
        SELECT E2.deptno, MAX(E2.pay) FROM emp E2
        GROUP BY E2.deptno);



-- 9.
SELECT E.name, D.dname FROM emp E
    INNER JOIN dept D ON D.deptno = E.deptno
    WHERE E.deptno = 
        (SELECT deptno FROM emp WHERE name = '이성규')
        AND name NOT LIKE('이성규');



-- 10.
SELECT name, position, pay FROM emp
    WHERE pay > 
        (SELECT MIN(pay) FROM emp
            GROUP BY position
                HAVING position = '과장');