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