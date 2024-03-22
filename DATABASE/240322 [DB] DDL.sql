-- DDL(Data Definition Language)
-- : 생성, 변경, 삭제 관련 기능
-- 주의) 명령어를 수행하자마자 데이터베이스에 수행한 내용이 바로 반영되는 특성이 있음
--      -> 자동 커밋된다!

-- CREATE TABLE (소유계정).테이블이름(
-- 열1 이름 열1 자료형,
-- 열2 이름 열2 자료형,
-- ...
-- 열n 이름 열n 자료형
-- );



-- 실습 12-1(p.313)
CREATE TABLE emp_ddl(
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2)
);
-- NUMBER(7,2) : 1000000.01
DESC emp_ddl;



-- 실습 12-4(p.315)
CREATE TABLE emp_ddl_30
    AS SELECT * FROM emp
        WHERE deptno = 30;
SELECT * FROM emp_ddl_30;

-- 실습 12-5(p.315)
CREATE TABLE empdept_ddl
    AS SELECT E.empno, E.ename, E.job, E.mgr, E.hiredate,
                E.sal, E.comm, D.deptno, D.dname, D.loc
                FROM emp E
        INNER JOIN dept D ON D.deptno = E.deptno
    WHERE 1<>1;
SELECT * FROM empdept_ddl;



-- ALTER : 테이블을 변경
-- 실습 12-6(p.317)
CREATE TABLE emp_alter
    AS SELECT * FROM emp;
SELECT * FROM emp_alter;

-- 실습 12-7(p.318) : ALTER - ADD
ALTER TABLE emp_alter
    ADD HP VARCHAR2(20);
SELECT * FROM emp_alter;



-- RENAME : 열 이름 변경
-- 실습 12-8(p.318) : ALTER - RENAME
ALTER TABLE emp_alter
    RENAME COLUMN hp TO tel;
SELECT * FROM emp_alter;



-- MODIFY : 열의 자료형을 변경
-- 실습 12-9(p.319) : ALTER - MODIFY
-- 이미 존재하는 데이터가 변경하려는 타입의 길이보다 크다면 변경 불가능
ALTER TABLE emp_alter
    MODIFY empno NUMBER(5);
DESC emp_alter;



-- DROP : 특정 열을 삭제
-- 실습 12-10(p.319) : ALTER - DROP
ALTER TABLE emp_alter
    DROP COLUMN tel;
SELECT * FROM emp_alter;



-- RENAME : 테이블 이름을 변경
-- 실습 12-11(p.321)
RENAME emp_alter TO emp_rename;
SELECT * FROM emp_alter;
-- -> 테이블 또는 뷰가 존재하지 않습니다.
SELECT * FROM emp_rename;
-- -> 조회 됨



-- TRUNCATE : 테이블의 데이터를 삭제
-- 실습 12-14(p.322)
-- *) DELECT문에 WHERE을 적지 않은 것과 같이 모든 데이터를 삭제하지만
-- TRUNCATE는 트랜잭션의 영향을 받지 않는다.
TRUNCATE TABLE emp_rename;
SELECT * FROM emp_rename;



-- DROP : 테이블을 삭제
-- 실습 12-15(p.323)
DROP TABLE emp_rename;
-- TABLE emp_rename이(가) 삭제되었습니다. 라고 뜸
-- 커밋의 영향을 받지 않아 실행하면 바로 반영됨.
-- 백업 데이터가 있지 않은 이상 조심해서 사용할 것.



-- 연습문제 (p.324~P.325)
-- 1.
CREATE TABLE emp_hw (
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2)
);
DESC emp_hw;

-- 2.
ALTER TABLE emp_hw
    ADD bigo VARCHAR2(20);
DESC emp_hw;

-- 3.
ALTER TABLE emp_hw
    MODIFY bigo VARCHAR2(30);
DESC emp_hw;

-- 4.
ALTER TABLE emp_hw
    RENAME COLUMN bigo TO remark;
DESC emp_hw;

-- 5.
INSERT INTO emp_hw
    (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp;
SELECT * FROM emp_hw;

-- 6.
DROP TABLE emp_hw;
SELECT * FROM emp_hw;
-- -> 테이블 또는 뷰가 존재하지 않습니다. 라고 뜸.