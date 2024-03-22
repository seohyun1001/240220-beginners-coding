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