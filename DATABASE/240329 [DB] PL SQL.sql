-- ���
-- DECLARE : (�����) ����, ���, Ŀ�� ����
-- BEGIN : (�����) ���ǹ�, �ݺ���, SELECT ���� ���๮
-- EXCEPTION : (����ó���κ�)
-- END;
-- / : PLSQL�� ������ ���� ��ȣ ���ٿ� /�� �����ؾ� ��.



-- �ǽ� 16-1(p.420)
SET SERVEROUTPUT ON;
-- ���� ����� ȭ�鿡 ������ִ� ����
-- ���� ���� �������� ���� ���ӽÿ� �����ؾ� �ϸ� ������ �����ϸ� �ʱ�ȭ ��

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO PL/SQL');
END;
/



-- ���� ���� �ϱ�
-- ������ �ڷ��� := ���԰�;

-- �ǽ� 16-4(p.423)
DECLARE
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || v_ename);
END;
/

-- �ǽ� 16-5(p.425)
-- ����� �� ���� �� ����ϱ� : CONSTANT
DECLARE
    v_tax CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || v_TAX);
END;
/

-- �ǽ� 16-6(p.425)
-- ������ �⺻�� ���� �� ����ϱ� : DEFAULT
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