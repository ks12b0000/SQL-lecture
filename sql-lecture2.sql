/* 
    SQL(Structured Query Language)�� ����
    ������ ���� DDL(Data Definition Language) : CREATE(���̺� ����)/ALTER(���̺� ����)/DROP(���̺� ����)
    ������ ���� DML(Data Manipulation Language) : SELECT(������ ��ȸ)/INSERT(������ �Է�)/UPDATE(������ ����)/DELETE(������ ����)
    ������ ���� DCL(Data Control Language) : GRANT(���� ����)/REVOKE(���� ����)
    
    CRUD : Create Read Update Delete
    
    ���� Ÿ��(������ �ʱ� ������ �ӵ���ü�� ����) : CHAR(����Ʈ��) NCHAR(���ڼ�)
    ���� Ÿ��(ũ�Ⱑ �ڵ������� ���ϱ� ������ ������ ���� �ӵ� ����) : VARCHAR2(����Ʈ��) NVARCHAR2(���ڼ�)
    
    CLOB : ��뷮 �ؽ�Ʈ ������ Ÿ��(�ִ� 4Gbyte)
    NCLOB : ��뷮 �ؽ�Ʈ �����ڵ� ������ Ÿ��(�ִ� 4Gbyte)
    
    �ѱ�(�����ڵ�)�� 2����Ʈ�� �ڸ��� �����ϱ� ������
    CHAR/VARCHAR �������� ������ ��쿡�� 2���� �ڸ����� �غ��ؾ��Ѵ�.
    �ִ� 3������ �ѱ��� �����ϰ��� �Ѵٸ� CHAR(6) /VARCHAR(6)�� ������ ������ �����ؾ��Ѵ�.
    �ݸ�, NCHAR(3)/NVARCHAR(3)���� �����ϸ� �ѱ��̵� �����̵� ������ 3���ڸ�  �����Ҽ� �־
    �� �ܼ��ϰ� ����ϰ� ���� �����͸� �Է��� �� �ִ� 
    �ٸ� �ѱ�(�����ڵ�)�� �������� ���� ���� Ȯ���ϴٸ�  NCHAR/NVARCHAR���� CHAR/VARCHAR�� 
    �� ������ ���� �����ؼ� ������� ������ �ȴ� . ��뷮 ������ ���̽� ���� ���� �׷���.




*/

CREATE TABLE MEMBER
(
    ID          VARCHAR2(50),
    PWD         NVARCHAR2(50),
    NAME        NVARCHAR2(50),
    GENDER      NCHAR(2), -- ����, ���� / CHAR(2 CHAR) = 2���� �ٶ������� ����.
                          -- ���ڸ� ����̸� N�� ���ִ°� �� �ٶ����� �ɼ���.
    AGE         NUMBER,
    BIRTHDAY    CHAR(10),   -- 2000-01-02
    PHONE       CHAR(13),   -- 010-1234-2345 ���� ���̴� CHAR�� ����
    REGDATE     DATE
);

INSERT INTO MEMBER (GENDER) VALUES('����');

SELECT LENGTHB (GENDER) FROM MEMBER;
DROP TABLE MEMBER;
-- LENGTHB ����Ʈ�� ���� ��Ÿ�� ����� �ѱ��ڴ� 1����Ʈ �ѱ��� 1���ڴ� 3����Ʈ
SELECT LENGTHB('ab') FROM DUAL;
SELECT LENGTHB('�ѱ�') FROM DUAL;

SELECT * FROM NLS_DATABASE_PARAMETERS;




















