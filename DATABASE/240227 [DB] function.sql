-- 1. ���� �Լ�
-- UPPER LOWER INITCAP : ��ҹ��� ��ȯ �Լ�
-- �ǽ� 6-1 (p.130)
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;

-- �ǽ� 6-2 (p.131)
SELECT * FROM emp
    WHERE UPPER(ename) = UPPER('Scott');
    
-- �ǽ� 6-3 (p.131)    
SELECT * FROM emp
    WHERE UPPER(ename) LIKE UPPER('%scott%');
    


-- LENGTH(�� �̸�) : ���ڿ��� ���̸� ���ϴ� �Լ�
-- �ǽ� 6-4 (p.132)
SELECT ename, LENGTH(ename) FROM emp;
-- �ǽ� 6-5 (p.133)
SELECT ename, LENGTH(ename) FROM emp
    WHERE LENGTH(ename) >= 5;

-- LENGTHB : byte���� ��ȯ���� ��
-- �ǽ� 6-6 (p.133)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM dual;
-- dual : ���� ������, �Լ� Ȯ�ο�



-- SUBSTR : ���ڿ� �Ϻθ� �����ϴ� �Լ�
-- SUBSTR(���ڿ� ������, ���� ��ġ, ������ ����)
-- SUBSTR(���ڿ� ������, ���� ��ġ) : ���� ��ġ���� ���ڿ� ������ ����
-- �ǽ� 6-7 (p.134)
SELECT job, SUBSTR(job,1,2), SUBSTR(job,3,2), SUBSTR(job,5) FROM emp;

-- �ǽ� 6-8 (p.136)
SELECT job, SUBSTR(job, -LENGTH(job)),
SUBSTR(job, -LENGTH(job),2),
SUBSTR(job, -3) FROM emp;

-- ��� �̸��� ù �� ���ڿ� ������ �� ���ڸ� ����ϴ� sql���� �ۼ��ϼ���.
SELECT ename, SUBSTR(ename,1,2), SUBSTR(ename, -2) FROM emp;

-- �ֹε�Ϲ�ȣ�� �� 6���ڿ� ��ȭȣ�� �� 8���ڸ� ����ϴ� SQL�� �ۼ�
SELECT '971210-2000000', SUBSTR('971210-2000000',1,6),
    '010-1234-5678', SUBSTR('010-1234-5678',1,8) FROM dual;
    


-- INSTR : ���ڿ� ������ �ȿ��� Ư�� ������ ��ġ�� ã�� �Լ�
-- INSTR(��� ���ڿ� ������, ã������ ����, ���� ��ġ, ���� ��ġ�κ��� ���°)
-- �ǽ� 6-9 (p.137)
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
INSTR('HELLO, ORACLE!','L',5) AS INSTR_2,
INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3 FROM dual;

SELECT INSTR('HELLO, ORACLE!','ORACLE') AS INSTR FROM dual;

-- �ǽ� 6-10 (p.138)
-- : INSTR�� �̿��Ͽ� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT * FROM emp
    WHERE INSTR(ename, 'S') > 0;
    
-- �ǽ� 6-11 (p.138)
-- : LIKE�� �̿��Ͽ� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT * FROM emp
    WHERE ename LIKE '%S%';

-- INSTR�� LIKE�� ����Ͽ� �ι�°�� ����° ���ڰ� LA�� ��� �̸��� ã�� SQL�� �ۼ�
-- - INSTR
SELECT * FROM emp
    WHERE INSTR(ename,'LA') = 2;
-- - LIKE
SELECT * FROM emp
    WHERE ename LIKE '_LA%';
    
    
    
-- REPLACE : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲ�
-- �ǽ� 6-12 (P.139)
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678','-',' ') AS REPLACE_1,
    REPLACE('010-1234-5678','-') AS REPLACE_2 FROM dual;

-- ��ҹ��� ��������� ��
SELECT REPLACE('Hello','hello') AS ���� FROM dual;



-- LPAD, RPAD : �������� �� ������ Ư�� ���ڷ� ä��� �Լ�
-- �ǽ� 6-13 (P.140)
SELECT 'Oracle',
    LPAD('Oracle',10,'#') AS LPAD_1,
    RPAD('Oracle',10,'*') AS RPAD_1,
    LPAD('Oracle',10) AS LPAD_2,
    RPAD('Oracle',10) AS RPAD_2 FROM dual;

-- �ǽ� 6-14 (p.141)
SELECT RPAD('971210-',14,'*') AS RPAD_1,
RPAD('010-1234-',13,'*') AS RPAD_2 FROM dual;

-- �ֹε�Ϲ�ȣ�� 8�ڸ� ����ϰ� �������� *�� ���
-- ��ȭ��ȣ�� 9�ڸ� ����ϰ� �������� *�� ���
SELECT RPAD(SUBSTR('900101-1234567',1,7),LENGTH('900101-1234567'),'*') AS �ֹε�Ϲ�ȣ,
    RPAD(SUBSTR('010-1234-5678',1,9),LENGTH('010-1234-5678'),'*') AS ��ȭ��ȣ FROM dual;



-- CONCAT : ���ڿ� + ���ڿ�
-- �ǽ� 6-15 (P.142)
SELECT CONCAT(empno, ename),
    CONCAT(empno, CONCAT(' : ', ename)) FROM EMP;
    
-- | ��� ����
SELECT empno || ename, empno || ' : ' || ename FROM emp;

-- TRIM : ���� �����̳� Ư�� ���ڸ� ����
-- LTRIM, RTRIM : ���� / ������ �����̳� Ư�� ���ڸ� ����
SELECT '[' || TRIM(' - -ORACLE- - ') || ']' AS TRIM,
-- ' - -ORACLE- - '�� ���� ���� ����
    '[' || TRIM('-' FROM '- -ORACLE- -') || ']' AS TRIM,
    -- '- -ORACLE- -'���� ���� - ����
    '[' || TRIM('-' FROM '---ORACLE---') || ']' AS TRIM FROM dual;


-- �ǽ� 6-18 (p.144)
SELECT '[' || TRIM (' -ORACLE- ') || ']' AS "���� ���� ����",
    '[' || LTRIM (' -ORACLE- ') || ']' AS "���� ���� ����",
    '[' || LTRIM ('<-ORACLE->', '-<') || ']' AS "���� -< ����",
    '[' || RTRIM (' -ORACLE- ') || ']' AS "������ ���� ����",
    '[' || RTRIM ('<-ORACLE->', '>-') || ']' AS "������ >- ����" FROM dual;


-- 2. ���� �Լ�
-- ROUND : Ư�� ��ġ���� �ݿø�
-- �ǽ� 6-19 (p.147)
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2 FROM dual;

-- TRUNC : Ư�� ��ġ���� ����
-- �ǽ� 6-20 (p.148)
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2 FROM dual;

-- CEIL, FLOOR : ���� ����� ū/���� ������ ã�� �Լ�
-- �ǽ� 6-21 (p.148)
SELECT CEIL(3.14),
    FLOOR(3.14),
    CEIL(-3.14),
    FLOOR(-3.14) FROM dual;
    
-- MOD : ���ڸ� ���� �� ������ ���� ����
-- �ǽ� 6-22 (p.149)
SELECT MOD(15,6),
    MOD(10,2),
    MOD(11,2) FROM dual;



-- 3. ��¥ �Լ�
-- SYSDATE : ���� ��¥�� ����ϴ� �Լ�
-- �ǽ� 6-23 (p.150)
SELECT SYSDATE AS NOW,
    SYSDATE-1 AS YESTERDAY,
    SYSDATE+1 AS TOMORROW FROM dual;
    
-- ADD_MONTHS : �� ���� ���ϴ� �Լ�
-- �ǽ� 6-24 (p.151)
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM dual;

-- �ǽ� 6-25 (p.151)
-- �Ի� 10�ֳ��� �Ǵ� ����� ������ ����ϱ�
SELECT empno, ename, hiredate,
    ADD_MONTHS(hiredate,12*10) AS WORK10YEAR FROM emp;

-- �ǽ� 6-26 (p.152)
-- �Ի� 32�� �̸��� ��� ������ ����ϱ�
SELECT empno, ename, hiredate, sysdate FROM emp
    WHERE ADD_MONTHS(hiredate, 12*37) > SYSDATE;

-- MONTHS_BETWEEN : �� ��¥ ���� ���� �� ���̸� ����
-- �ǽ� 6-27 (p.153)
SELECT empno, ename, hiredate, sysdate,
    SYSDATE - hiredate AS DAY,
    -- ��¥�� ��¥�� ������ �� ����
    MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTH1,
    MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) AS MONTH3 FROM emp;
    
-- NEXT_DAY : ������ ��¥���� ������ ������ ���ƿ��� ���� ����� ��¥�� ����ϴ� �Լ�
-- LAST_DAY : ���� ������ ���� ����ϴ� �Լ�
-- �ǽ� 6-28 (p.154)
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '������'),
    LAST_DAY(SYSDATE) FROM dual;

-- ���� ��¥�� �������� 3�� ���� �������� ��¥�� ������ ���� ����ϴ� sql��
SELECT ADD_MONTHS(SYSDATE, 3) AS "���� + 3����",
    NEXT_DAY(ADD_MONTHS(SYSDATE, 3), '������') AS "3�� �� ������",
    LAST_DAY(ADD_MONTHS(SYSDATE, 3)) AS "3�� �� ������ ��" FROM dual;
    


-- 4. �� ��ȯ �Լ�
-- �ڵ� �� ��ȯ
SELECT 100 + '200' FROM dual;
-- -> ���� '200'�� �ڵ����� �������·� ��ȯ
SELECT 100 + '200A' FROM dual;
-- -> ��ġ�� �������ϴٰ� ������ ��
SELECT '100' + '200' FROM dual;
-- -> ���ڷ� �ڵ� �� ��ȯ, ���� 300�� ����
SELECT '2024/02/27' FROM dual;
-- -> �ܼ� ���ڿ��� ���
SELECT '2024/02/27' - hiredate FROM emp;

-- TO_CHAR : ����/��¥ �����͸� ���� �����ͷ� ��ȯ
-- �ǽ� 6-33 (p.159)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD AM HH12:MI:SS') AS ���糯¥�ð�,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') AS ���糯¥�ð� FROM dual;

-- �ǽ� 6-35 (p.160)
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG FROM dual;

-- �ǽ� 6-36 (p.160)
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'DD') AS DD,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS DAY_KOR,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY_ENG FROM dual;
    


-- ���� ������ ���ڷ� ��ȯ
-- �ǽ� 6-38 (p.162)
SELECT sal,
    TO_CHAR(sal, '$999,999') AS SAL_$,
    -- 9�� ���x
    TO_CHAR(sal, 'L999,999') AS SAL_L,
    -- L�� ������ ������ ��ȭ�� ǥ��
    TO_CHAR(sal, '999,999.00') AS SAL_1,
    -- 0�� ���� �Ұ���
    -- �����Ͱ� ������ �ش� ������ ǥ��
    -- �����Ͱ� ������ 0���� ǥ��
    TO_CHAR(sal, '000,999,999.00') AS SAL_2,
    TO_CHAR(sal, '000999999.00') AS SAL_3,
    TO_CHAR(sal, '999,999,00') AS SAL_4 FROM emp;


    
-- TO_NUMBER : ���� ������(���ڷ� �� ����)�� ���� �����ͷ� ��ȯ
-- �ǽ� 6-40 (p.163)
SELECT '1,300' - '1,500' FROM dual;
-- ������ �ȿ� ','�� �� �־� ','�� ���ڷ� �ν��߱� ������ ��ȯ �Ұ�

-- �ǽ� 6-41 (P.164)
SELECT TO_NUMBER('1,500','999,999') - TO_NUMBER('1,300','999,999') FROM dual;



-- TO_DATE : ���� �����͸� ��¥ �����ͷ� ��ȯ
SELECT TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE,
TO_DATE('20180714','YYYYMMDD') AS TODATE FROM dual;


-- �ǽ� 6-43 (p.165)
-- 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ����ϱ�
SELECT * FROM emp
    WHERE hiredate > TO_DATE('1981/06/01','YYYY/MM/DD');

-- todate ���̵� ���������� ������ �߻��� Ȯ���� ������
SELECT * FROM emp
    WHERE hiredate > '1981/06/01';
