-- system 계정으로 접근했고
-- 샘플 DB 스크립트를 전달해서 샘플 데이터 베이스를 만들기
CREATE TABLE TB_MEMBER(
    id varchar2(20) NOT NULL, --아이디 // 없는게 정상, primary key  에 포함. 
    pwd varchar2(30) NOT NULL, --비밀번호
    name varchar2(30) NOT NULL, -- 이름
    tel varchar2(20) , -- 전화번호
    addr varchar2(100) , -- 주소
    birth varchar2(8) , -- 생년월일
    job varchar2(50),  -- 직업
    gender varchar2(3) NOT NULL, -- 성별
    email varchar2(50) , -- 이메일
    intro VARCHAR(4000) , -- 자기소개
    CONSTRAINT pk_member PRIMARY KEY(id)  -- 기본키 지정
);

COMMIT;
INSERT INTO TEST_JAVA VALUES ('ksh', '1234', '김서현');
INSERT INTO TEST_JAVA VALUES ('ksh2', '1234', '김서현2');
INSERT INTO TEST_JAVA VALUES ('ksh3', '1234', '김서현3');

SELECT * FROM tb_member;