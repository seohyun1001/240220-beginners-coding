-- 블록
-- DECLARE : (선언부) 변수, 상수, 커서 선언
-- BEGIN : (실행부) 조건문, 반복문, SELECT 등의 실행문
-- EXCEPTION : (예외처리부분)
-- END;
-- / : PLSQL을 끝내는 종료 기호 한줄에 /만 존재해야 함.



-- 실습 16-1(p.420)
SET SERVEROUTPUT ON;
-- 실행 결과를 화면에 출력해주는 설정
-- 세션 관련 설정으로 세션 접속시에 실행해야 하며 접속을 해제하면 초기화 됨

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO PL/SQL');
END;
/



-- 변수 선언 하기
-- 변수명 자료형 := 대입값;

-- 실습 16-4(p.423)
DECLARE
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || v_ename);
END;
/

-- 실습 16-5(p.425)
-- 상수에 값 대입 후 출력하기 : CONSTANT
DECLARE
    v_tax CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || v_TAX);
END;
/

-- 실습 16-6(p.425)
-- 변수에 기본값 설정 후 출력하기 : DEFAULT
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    v_deptno := 20;
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

-- 실습 16-7(p.426)
-- 변수에 NOT NULL을 설정하고 값을 대입한 후 출력
DECLARE
    v_deptno NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

-- 실습 16-8(p.427)
-- 변수에 NOT NULL 및 기본값을 설정하고 값을 대입한 후 출력
DECLARE
    v_deptno NUMBER(2) NOT NULL DEFAULT 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/



-- 참조 자료형 : 특정 테이블의 열 자료형을 참조하여 사용하는 자료형
-- 변수명 테이블명.필드명%TYPE : 열 자료형 참조
-- 변수명 테이블명%ROWTYPE : 모든 열의 구조를 참조

-- 실습 16-9(p.428)
-- 참조형(열)의 변수에 값을 대입한 후 출력
DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

-- 실습 16-10(p.429)
-- 참조형(행)의 변수에 값을 대입한 후 출력
DECLARE
    v_dept_row dept%ROWTYPE;
BEGIN
    SELECT deptno, dname, loc INTO v_dept_row
        FROM dept WHERE deptno = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || v_dept_row.loc);
END;
/



-- 조건 제어문
-- 실습 16-14(p.434) : IF문
DECLARE
    v_score NUMBER := 87;
BEGIN
    IF v_score >=90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF v_score >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    ELSIF v_score >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    ELSIF v_score >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END IF;
END;
/

-- CASE문
DECLARE
    v_score NUMBER := 87;
BEGIN
    CASE
        WHEN v_score >=90 THEN
            DBMS_OUTPUT.PUT_LINE('A');
        WHEN v_score >= 80 THEN
            DBMS_OUTPUT.PUT_LINE('B');
        WHEN v_score >= 70 THEN
            DBMS_OUTPUT.PUT_LINE('C');
        WHEN v_score >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('D');
        ELSE
            DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/



-- 반복 제어문
-- 실습 16-17(p.439) : 기본 LOOP
DECLARE
    v_num NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || v_num);
        v_num := v_num + 1;
        EXIT WHEN v_num > 4;
        -- EXIT의 조건이 TRUE라면 반복문 종료
    END LOOP;
END;
/

-- 실습 16-18(p.440) : WHILE LOOP
DECLARE
    v_num NUMBER := 0;
BEGIN
    WHILE v_num < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || v_num);
        v_num := v_num + 1;
    END LOOP;
END;
/

-- 실습 16-19(p.441) : FOR LOOP
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/

-- 실습 16-20(p.442) : REVERSE FOR LOOP
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/

-- 실습 16-21(p.442) : CONTINUE
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/



-- 연습문제(p.444)
-- 1.
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/

-- 2.
DECLARE
    v_deptno_row dept%ROWTYPE;
    v_deptno dept.deptno%TYPE := 41;
BEGIN
    SELECT dname INTO v_deptno_row.dname FROM dept WHERE deptno = v_deptno;
     CASE
        WHEN v_deptno = 10 THEN
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_deptno_row.dname);
        WHEN v_deptno = 20 THEN
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_deptno_row.dname);
        WHEN v_deptno = 30 THEN
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_deptno_row.dname);
        WHEN v_deptno = 40 THEN
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_deptno_row.dname);
        END CASE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
END;
/



-- 윤년 확인하기
-- 4로 나누어 떨어지면서, 100으로 나누어 떨어지지 않으면 윤년
-- year 변수를 사용하여 윤년이라면 '윤년입니다' 윤년이 아니라면 '윤년이 아닙니다'
DECLARE
    year NUMBER := 2024;
BEGIN
    IF (MOD(year, 4) = 0 AND MOD(year, 100) <> 0) OR (MOD(year, 400) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('윤년입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('윤년이 아닙니다.');
    END IF;
END;
/



-- 가위바위보 게임 만들기
-- 랜덤값 게임 만들기 : DBMS_RANDOM(범위 시작, 종료)
-- 0:가위, 1:바위, 2:보
DECLARE
    rsp_user NUMBER(1) := TRUNC(DBMS_RANDOM.VALUE(0, 2));
    rsp_com NUMBER(1) := TRUNC(DBMS_RANDOM.VALUE(0, 2));
    USER VARCHAR2(10);
    COM VARCHAR2(10);
BEGIN
    IF rsp_user = 0 THEN
        USER := '가위';
    ELSIF rsp_user = 1 THEN
        USER := '바위';
    ELSE
        USER := '보';
    END IF;
    
    IF rsp_com = 0 THEN
        COM := '가위';
    ELSIF rsp_com = 1 THEN
        COM := '바위';
    ELSE
        COM := '보';
    END IF;
    
    IF rsp_user = 0 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('무승부입니다.' );
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('패배했습니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('승리했습니다.');
        END IF;
    ELSIF rsp_user = 1 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('승리했습니다.');
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('무승부입니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('패배했습니다.');
        END IF;
    ELSIF rsp_user = 2 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('패배했습니다.');
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('승리했습니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('당신 : ' || USER || ' / 컴퓨터 : ' || COM);
            DBMS_OUTPUT.PUT_LINE('무승부입니다.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('0:가위, 1:바위, 2:보 중에 입력해주십시오.');
    END IF;
END;
/