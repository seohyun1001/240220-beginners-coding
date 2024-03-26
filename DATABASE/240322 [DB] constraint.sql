-- 제약 조건

-- NOT NULL : NULL을 설정할 수 없도록 하는 제약 조건
-- 실습 14-1(p.362)
-- 테이블 생성
CREATE TABLE table_notnull (
    login_id VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20)
);
DESC table_notnull;

-- 데이터 사전으로 제약 조건 확인
SELECT * FROM user_constraints;

-- 실습 14-2(p.362)
INSERT INTO table_notnull (login_id, login_pwd, tel)
    VALUES ('test_id_01', NULL, '010-1234-5678');
-- -> NULL을 삽입할 수 없다고 오류 뜸.

-- 실습 14-3(p.363)
INSERT INTO table_notnull (login_id, login_pwd)
    VALUES ('test_id_01', '1234');
SELECT * FROM table_notnull;
-- -> 삽입됨

-- 실습 14-4(p.363)
UPDATE table_notnull
    SET login_pwd = NULL
    WHERE login_id = 'test_id_01';
-- -> NULL로 업데이트 할 수 없다고 뜸



-- 실습 14-6(p.365)
-- 제약 조건 이름 직접 지정
CREATE TABLE table_notnull2 (
    login_id VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    login_pwd VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    tel VARCHAR2(20)
);
-- 데이터 사전으로 제약 조건 확인
SELECT * FROM user_constraints;



-- 실습 14-7(p.366)
-- 생성한 테이블에 제약 조건 추가하기
ALTER TABLE table_notnull
    MODIFY(tel NOT NULL);
-- -> NULL값이 발견되었습니다. 라고 뜸

-- 실습 14-8(p.366)
-- tel 데이터 수정하기
UPDATE table_notnull
    SET tel = '010-1234-5678'
        WHERE login_id = 'test_id_01';
SELECT * FROM table_notnull;

-- 실습 14-9(p.367)
-- 제약 조건 재추가하기
ALTER TABLE table_notnull
    MODIFY(tel NOT NULL);
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- 실습 14-10(p.367)
-- 제약 조건에 이름 지정해서 추가하기
ALTER TABLE table_notnull2
     MODIFY(tel CONSTRAINT TBLNN_TEL_NN NOT NULL);
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- 실습 14-12(p.368)
-- 생성했던 제약 조건의 이름 변경하기
ALTER TABLE table_notnull2
    RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints;

-- 실습 14-13(p.369)
-- 제약 조건 삭제하기
ALTER TABLE table_notnull2
    DROP CONSTRAINT TBLNN2_TEL_NN;
DESC table_notnull2;



-- UNIQUE : 데이터의 중복을 허용하지 않음, NULL값은 입력 가능
CREATE TABLE table_unique (
    login_id VARCHAR2(20) CONSTRAINT tblunq_lgnid_unq UNIQUE,
    login_pwd VARCHAR2(20) CONSTRAINT tblnn_lgnpw_nn NOT NULL,
    tel VARCHAR2(20)
    );
DESC table_unique;

-- 실습 14-16(p.371)
INSERT INTO table_unique
    VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
SELECT * FROM table_unique;

-- 실습 14-17(p.371)
INSERT INTO table_unique
    VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
-- -> 무결성 제약 조건에 위배됨

-- 실습 14-18(p.372)
INSERT INTO table_unique
    VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');

-- 실습 14-19(p.372)
INSERT INTO table_unique
    VALUES (NULL, 'PWD01', '010-1234-5678');
    
-- 실습 14-20(p.373)
UPDATE table_unique
    SET login_id = 'TEST_ID_01'
        WHERE login_id IS NULL;
-- -> 무결성 제약 조건에 위배됨
SELECT * FROM table_unique;



-- PRIMARY KEY(기본키, 주키, PK)
-- * 데이터 중복을 허용하지 않으며, NULL도 허용하지 않음.
-- * 테이블 당 하나만 지정 가능.
-- * 기본키를 지정하면 해당 열에는 자동으로 인덱스가 만들어진다.

-- 실습 14-29(p.377)
CREATE TABLE table_pk(
    login_id VARCHAR2(20) CONSTRAINT tblpk_lgnid_pk PRIMARY KEY,
    login_pwd VARCHAR2(20) CONSTRAINT tblpk_lgnpw_nn NOT NULL,
    tel VARCHAR2(20)
);

-- 실습 14-30,31(p.378)
SELECT owner, constraint_name, constraint_type, table_name
    FROM user_constraints
    WHERE table_name = 'TABLE_PK';

SELECT index_name, table_owner, table_name
    FROM user_indexes WHERE table_name = 'TABLE_PK';

SELECT * FROM user_ind_columns WHERE table_name = 'TABLE_PK';

-- 실습 14-33,34(p.379)
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES('TEST_ID_01', '1234', '010-1234-5678');
-- 한 번 더 입력
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES('TEST_ID_01', '1234', '010-1234-5678');
-- -> 무결성 제약에 위배됨

-- 실습 14-35(p.380)
INSERT INTO table_pk(login_id, login_pwd, tel)
    VALUES(NULL, '1234', '010-1234-5678');
-- -> NULL값 입력 불가



-- P.381 한 발 더 나가기
-- : 테이블 레벨 제약 조건 지정 방식
CREATE TABLE table_name (
    col1 VARCHAR2(20),
    col2 VARCHAR2(20),
    col3 VARCHAR2(20),
    PRIMARY KEY(col1),
    CONSTRAINT constraint_name UNIQUE(col2)
);
-- NOT NULL은 따로 지정 불가.



-- 실습 14-37(p.382)
-- : EMP 테이블과 DEPT 테이블의 제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
    FROM user_constraints WHERE table_name IN('EMP', 'DEPT');

-- FOREIGN KEY(외래키, FK)
-- : 서로 다른 테이블 간 관계를 정의하는 데 사용하는 제약 조건
-- 특정 테이블에서 기본키 제약 조건을 지정한 열을 다른 테이블의 특정 열에서 참조하겠다는 의미로 사용

-- 실습 14-38(p.382) : 외래키가 참조하는 열에 존재하지 않는 데이터 입력하기
INSERT INTO emp
    VALUES(9999, '홍길동', 'CLERK', 7788, TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);
-- -> 부모키가 없습니다.(DEPT 테이블의 DEPTNO 필드에 50이 없음)

-- 40으로 바꿔서 삽입
INSERT INTO emp
    VALUES(9999, '홍길동', 'CLERK', 7788, TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 40);
-- -> 삽입됨



-- 실습 14-39(p.384)
CREATE TABLE dept_fk (
    deptno NUMBER(2) CONSTRAINT deptfk_deptno_Pk PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);

-- 실습 14-40(p.385)
CREATE TABLE emp_fk (
    empno NUMBER(4) CONSTRAINT empfk_empno_pk PRIMARY KEY,
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm NUMBER(7,2),
    deptno NUMBER(2) CONSTRAINT empfk_deptno_fk REFERENCES dept_fk(deptno)
);

-- REFERENCES 참조할 테이블명 (참조할 필드명)



-- 실습 14-41(p.386) : emp_fk 테이블에 데이터 추가
SELECT * FROM emp_fk;
INSERT INTO emp_fk
    VALUES (9999, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
-- -> 부모 키가 없다고 뜸

-- 실습 14-42(p.386) : dept_fk 테이블에 데이터 추가
SELECT * FROM dept_fk;
INSERT INTO dept_fk
    VALUES (10, 'TEST_DANEM','TEST_LOC');
    
-- 실습 14-43(p.386) : 실습 14-41 다시 실행
INSERT INTO emp_fk
    VALUES (9999, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
SELECT * FROM emp_fk;
-- -> 추가 완료

INSERT INTO emp_fk
    VALUES (9991, 'TEST_NAME2', 'TEST_JOB2', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 4000, NULL, NULL);
-- -> NULL 값은 입력 가능 / NULL 값 입력 불가능 하게 하려면 외래키 설정시 NOT NULL도 설정 해주기
SELECT * FROM emp_fk;



-- 실습 14-44(p.387) : FOREIGN KEY 참조 행 데이터 삭제하기
DELETE FROM dept_fk
    WHERE deptno = 10;
-- -> 무결성 제약 조건 위배됨(자식 레코드가 발견 되었습니다)
-- 다른 테이블에서 외래키로 열을 참조하고 있고,
-- 이미 자식 레코드가 추가되어 있다면 삭제할 수 없음

-- 삭제 방법
-- 1) 현재 삭제하려는 열 값을 참조하는 데이터를 먼저 삭제한다.
    -- 자식 레코드 삭제 후 부모키 삭제
    -- 데이터를 삭제할 때 참조하는 데이터도 함께 삭제하는 옵션
    -- CONSTRAINT 제약조건명 REFERENCES 참조한 테이블명 (참조한 필드명) ON DELETE CASCADE
    
-- 2) 현재 삭제하려는 열 값을 참조하는 데이터를 수정한다.
    -- 자식 레코드를 NULL값이나 부모 레코드와는 다른 데이터로 수정
    -- 데이터를 삭제할 때 참조하는 데이터를 모두 NULL값으로 변경하는 옵션
    -- CONSTRAINT 제약조건명 REFERENCES 참조한 테이블명 (참조한 필드명) ON DELETE SET NULL
    
-- 3) 현재 삭제하려는 열을 참조하는 사직 테이블의 FOREIGN KEY 제약 조건을 해제한다.

INSERT INTO dept_fk
    SELECT * FROM dept WHERE deptno >= 20;
SELECT * FROM dept_fk;

SELECT * FROM emp_fk;
INSERT INTO emp_fk SELECT * FROM emp;

-- =============== 데이터 추가 ===============

ALTER TABLE emp_fk
DROP CONSTRAINT empfk_deptno_fk;

ALTER TABLE emp_fk
    MODIFY (deptno CONSTRAINT empfk_deptno_fk REFERENCES dept_fk (deptno) ON DELETE CASCADE);
    
DELETE FROM dept_fk WHERE deptno = 30;
-- 부모키 삭제 -> 자식 레코드도 삭제됨
-- -> emp_fk 테이블에서 deptno가 30인 데이터들이 전부 삭제됨
SELECT * FROM emp_fk;



ALTER TABLE emp_fk
DROP CONSTRAINT empfk_deptno_fk;

ALTER TABLE emp_fk
    MODIFY (deptno CONSTRAINT empfk_deptno_fk REFERENCES dept_fk (deptno) ON DELETE SET NULL);

DELETE FROM dept_fk WHERE deptno = 20;
-- -> emp_fk 테이블에서 deptno가 20인 데이터들이 NULL로 바뀜
SELECT * FROM emp_fk;