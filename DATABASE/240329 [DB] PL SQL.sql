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

-- �ǽ� 16-7(p.426)
-- ������ NOT NULL�� �����ϰ� ���� ������ �� ���
DECLARE
    v_deptno NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

-- �ǽ� 16-8(p.427)
-- ������ NOT NULL �� �⺻���� �����ϰ� ���� ������ �� ���
DECLARE
    v_deptno NUMBER(2) NOT NULL DEFAULT 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/



-- ���� �ڷ��� : Ư�� ���̺��� �� �ڷ����� �����Ͽ� ����ϴ� �ڷ���
-- ������ ���̺��.�ʵ��%TYPE : �� �ڷ��� ����
-- ������ ���̺��%ROWTYPE : ��� ���� ������ ����

-- �ǽ� 16-9(p.428)
-- ������(��)�� ������ ���� ������ �� ���
DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || v_deptno);
END;
/

-- �ǽ� 16-10(p.429)
-- ������(��)�� ������ ���� ������ �� ���
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



-- ���� ���
-- �ǽ� 16-14(p.434) : IF��
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

-- CASE��
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



-- �ݺ� ���
-- �ǽ� 16-17(p.439) : �⺻ LOOP
DECLARE
    v_num NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || v_num);
        v_num := v_num + 1;
        EXIT WHEN v_num > 4;
        -- EXIT�� ������ TRUE��� �ݺ��� ����
    END LOOP;
END;
/

-- �ǽ� 16-18(p.440) : WHILE LOOP
DECLARE
    v_num NUMBER := 0;
BEGIN
    WHILE v_num < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || v_num);
        v_num := v_num + 1;
    END LOOP;
END;
/

-- �ǽ� 16-19(p.441) : FOR LOOP
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/

-- �ǽ� 16-20(p.442) : REVERSE FOR LOOP
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/

-- �ǽ� 16-21(p.442) : CONTINUE
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/



-- ��������(p.444)
-- 1.
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
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



-- ���� Ȯ���ϱ�
-- 4�� ������ �������鼭, 100���� ������ �������� ������ ����
-- year ������ ����Ͽ� �����̶�� '�����Դϴ�' ������ �ƴ϶�� '������ �ƴմϴ�'
DECLARE
    year NUMBER := 2024;
BEGIN
    IF (MOD(year, 4) = 0 AND MOD(year, 100) <> 0) OR (MOD(year, 400) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('������ �ƴմϴ�.');
    END IF;
END;
/



-- ���������� ���� �����
-- ������ ���� ����� : DBMS_RANDOM(���� ����, ����)
-- 0:����, 1:����, 2:��
DECLARE
    rsp_user NUMBER(1) := TRUNC(DBMS_RANDOM.VALUE(0, 2));
    rsp_com NUMBER(1) := TRUNC(DBMS_RANDOM.VALUE(0, 2));
    USER VARCHAR2(10);
    COM VARCHAR2(10);
BEGIN
    IF rsp_user = 0 THEN
        USER := '����';
    ELSIF rsp_user = 1 THEN
        USER := '����';
    ELSE
        USER := '��';
    END IF;
    
    IF rsp_com = 0 THEN
        COM := '����';
    ELSIF rsp_com = 1 THEN
        COM := '����';
    ELSE
        COM := '��';
    END IF;
    
    IF rsp_user = 0 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('���º��Դϴ�.' );
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�й��߽��ϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�¸��߽��ϴ�.');
        END IF;
    ELSIF rsp_user = 1 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�¸��߽��ϴ�.');
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('���º��Դϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�й��߽��ϴ�.');
        END IF;
    ELSIF rsp_user = 2 THEN
        IF rsp_com = 0 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�й��߽��ϴ�.');
        ELSIF rsp_com = 1 THEN
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('�¸��߽��ϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('��� : ' || USER || ' / ��ǻ�� : ' || COM);
            DBMS_OUTPUT.PUT_LINE('���º��Դϴ�.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('0:����, 1:����, 2:�� �߿� �Է����ֽʽÿ�.');
    END IF;
END;
/