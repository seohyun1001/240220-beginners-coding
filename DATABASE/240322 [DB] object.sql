-- 사용자 테이블 : 데이터베이스를 통해 관리할 데이터를 저장하는 테이블

-- 데이터 사전 : 데이터베이스가 생성될 때 함께 생성된
            -- 메모리, 성능, 사용자, 권한, 객체 등
            -- 데이터베이스 운영에 필요한 정보를 보관하는 테이블
            
-- 데이터 사전 뷰 : 데이터 사전에 저장되어 있는 데이터를 열람할 수 있도록 만들어둔 뷰
    -- USER_**** : 현재 접속한 계정이 소유한 객체 정보
    -- ALL_**** : 현재 접속한 계정이 권한을 가지고 있는 모든 객체 정보
    -- DBA_**** : 관리자 권한을 가진 계정만 사용할 수 있는 객체 정보
    -- V$_**** : 데이터베이스 성능 관련 정보
    
-- 어떤 데이터 사전 뷰가 있는지 확인하는 명령어
SELECT * FROM dict;
SELECT * FROM dictionary;

-- 현재 접속한 계정이 소유한 테이블을 확인하는 데이터 사전 뷰
SELECT * FROM USER_TABLES;
-- NUM_ROWS : 행의 개수
-- -> COUNT(*) 함수로 행이 개수를 확인할 때 행의 개수가 많으면 많을수록 시간이 오래 걸림
-- -> NUM_ROWS로 확인하면 빠르다

-- 권한이 있는 테이블만 확인
SELECT * FROM ALL_TABLES;

-- 관리자 권한이 있어야 확인 가능
SELECT * FROM DBA_TABLES;
-- -> 관리자 권한이 없기 때문에 'SCOTT' 계정에서는 확인할 수 없음
-- -> SYSTEM 또는 SYS 계정으로 실행



-- 인덱스

-- 실습 13-8(p.335)
SELECT * FROM user_indexes;

-- 실습 13-9(p.335)
SELECT * FROM user_ind_columns;

-- 실습 13-10(p.336)
-- emp 테이블의 sal 열에 인덱스를 생성하기
CREATE INDEX inx_emp_sal
    ON emp(sal);
    
-- 실습 13-11(p.336)
-- 생성된 인덱스 살펴보기
SELECT * FROM user_ind_columns;

-- 실습 13-12(p.337)
-- 삭제
DROP INDEX inx_emp_sal;

SELECT * FROM user_ind_columns;



-- 뷰(가상 테이블)
-- : 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
    -- SELECT문을 저장하기 때문에 물리적 데이터를 따로 저장하지는 않음
-- * 사용 목적
-- 1) 편리성 : SELECT문의 복잡도를 완화시키기 위해
-- 2) 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 경우

-- 실습 13-14(p.340)
-- VIEW 생성 권한 설정
GRANT CREATE VIEW TO SCOTT;

-- 실습 13-15(p.341)
-- 뷰 생성하기
CREATE VIEW vw_emp20
    AS(SELECT empno, ename, job, deptno FROM emp WHERE deptno = 20);

SELECT * FROM vw_emp20;

-- 실습 13-16(p.341)
-- 생성한 뷰 확인하기
SELECT * FROM user_views;

-- 실습 13-19(p.343)
-- 뷰 삭제
DROP VIEW vw_emp20;



-- 인라인 뷰를 사용한 TOP-N SQL문
-- 인라인 뷰
-- : CREATE문을 통해 객체로 만들어지는 뷰 외에 SQL문에서 일회성으로 만들어서 사용하는 뷰
-- SELECT문에서 사용되는 서브쿼리,
-- WITH절에서 미리 이름을 정의해 두고 사용하는 SELECT문 등.


-- ROWNUM : 행번호를 출력하는 의사 열
        -- 필요한 개수만큼 데이터 출력을 제한하는 데 사용
-- 의사 열 : 데이터가 저장되는 실제 테이블에 존재하지는 않지만
        -- 특정 목적을 위해 테이블에 저장되어 있는 열처럼 사용 가능한 열

-- 실습 13-20(p.344)
SELECT ROWNUM, E.* FROM emp E;

-- ROWNUM 정렬 안됨
SELECT ROWNUM, E.* FROM emp E
    WHERE ROWNUM <= 10 ORDER BY hiredate;

-- 서브 쿼리를 이용하여 먼저 데이터를 정렬한 후 ROWNUM 설정
SELECT ROWNUM, E.* FROM (SELECT * FROM emp ORDER BY sal DESC) E WHERE ROWNUM <= 10;

SELECT table_name, num_rows FROM user_tables WHERE table_name = 'EMP';



-- MAX() 함수로 다음 번호 생성하기
SELECT MAX(empno) + 1 FROM emp;
-- 단점 : 데이터가 많으면 다음 번호를 얻는 시간이 오래 걸릴 수 있다.
        -- 같은 시간에 SELECT문을 실행하면 같은 값을 돌려준다.

-- 시퀀스 : 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체
-- 실습 13-26(p.349)
CREATE TABLE dept_sequence
    AS SELECT * FROM dept WHERE 1 != 1;

-- 실습 13-27(p.350)
CREATE SEQUENCE seq_dept_sequence
    INCREMENT BY 10 -- 몇 씩 증가시킬지(기본값 1)
    START WITH 10 -- 시작값(기본값 1)
    MAXVALUE 90 -- 최대값
    MINVALUE 0 -- 최소값
    NOCYCLE -- 반복여부(기본값 CYCLE)
    CACHE 2; -- 메모리에 저장해 둘 다음 값들(기본값 20)
SELECT * FROM user_sequences;

-- 시퀀스 사용 방법
-- 시퀀스 이름.NEXTVAL : 다음 번호를 생성
-- 반드시 INSERT문에서 실행해야 함.
INSERT INTO dept_sequence
    VALUES (seq_dept_sequence.NEXTVAL, 'DATABASE', 'SEOUL');

-- 실습 13-30(p.351)
-- 시퀀스 이름.CURRVAL : 마지막으로 생성한 번호 반환
-- SELECT문에서 마지막 번호를 확인할 때 사용하는 명령어
SELECT seq_dept_sequence.CURRVAL FROM dual;

-- 실습 13-32(p.352)
ALTER SEQUENCE seq_dept_sequence
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;

-- 실습 13-36(p.353)
DROP SEQUENCE seq_dept_sequence;



-- 동의어(SYNONYM)
-- : 테이블/뷰/시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체
-- 실습 13-37(p.355)
-- SYNONYM 권한 부여
GRANT CREATE SYNONYM TO SCOTT;
-- -> SCOTT 계정만 사용할 동의어 생성 가능한 권한 부여
GRANT CREATE PUBLIC SYNONYM TO SCOTT;
-- -> 전체 계정에서 사용할 동의어 생성 가능한 권한 부여

-- 실습 13-38(p.355)
-- 동의어 생성
CREATE SYNONYM E FOR emp;

-- 실습 13-39(p.355)
-- 동의어 사용
SELECT * FROM E;

-- 실습 13-40(p.356)
-- 동의어 삭제
DROP SYNONYM E;



-- 연습문제(p.357~p.358)
-- 1.
    -- 1-1.
CREATE TABLE empidx
    AS SELECT * FROM emp;
SELECT * FROM empidx;

    -- 1-2.
CREATE INDEX idx_empidx_empno
    ON empidx(empno);
SELECT * FROM user_ind_columns;

-- 2.
CREATE VIEW empidx_over15k
    AS (SELECT empno, ename, job, deptno, sal, 
        NVL2(comm, 'O','X') AS COMM FROM empidx
        WHERE sal > 1500);
SELECT * FROM user_views;
SELECT * FROM empidx_over15k;

-- 3.
    -- 3-1.
CREATE TABLE deptseq
    AS SELECT * FROM dept;
SELECT * FROM deptseq;

    -- 3-2.
CREATE SEQUENCE seq_deptseq_sequence
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;
SELECT * FROM user_sequences;

    -- 3-3.
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'WEB', 'BUSAN');
INSERT INTO deptseq (deptno, dname, loc)
    VALUES(seq_deptseq_sequence.NEXTVAL, 'MOBILE', 'ILSAN');
SELECT * FROM deptseq;