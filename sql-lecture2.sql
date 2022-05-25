/* 	----- DDL  -----
    1. SQL(Structured Query Language)�� ����
       - ������ ���� DDL(Data Definition Language) : CREATE(���̺� ����)/ALTER(���̺� ����)/DROP(���̺� ����)
       - ������ ���� DML(Data Manipulation Language) : SELECT(������ ��ȸ)/INSERT(������ �Է�)/UPDATE(������ ����)/DELETE(������ ����)
       - ������ ���� DCL(Data Control Language) : GRANT(���� ����)/REVOKE(���� ����)
    
    CRUD : Create Read Update Delete
    
    ���� Ÿ��(������ �ʱ� ������ �ӵ���ü�� ����) : CHAR(����Ʈ��) NCHAR(���ڼ�)
    ���� Ÿ��(ũ�Ⱑ �ڵ������� ���ϱ� ������ ������ ���� �ӵ� ����) : VARCHAR2(����Ʈ��) NVARCHAR2(���ڼ�)
  
    �ѱ�(�����ڵ�)�� 2����Ʈ�� �ڸ��� �����ϱ� ������
    CHAR/VARCHAR �������� ������ ��쿡�� 2���� �ڸ����� �غ��ؾ��Ѵ�.
    �ִ� 3������ �ѱ��� �����ϰ��� �Ѵٸ� CHAR(6) /VARCHAR(6)�� ������ ������ �����ؾ��Ѵ�.
    �ݸ�, NCHAR(3)/NVARCHAR(3)���� �����ϸ� �ѱ��̵� �����̵� ������ 3���ڸ�  �����Ҽ� �־
    �� �ܼ��ϰ� ����ϰ� ���� �����͸� �Է��� �� �ִ� 
    �ٸ� �ѱ�(�����ڵ�)�� �������� ���� ���� Ȯ���ϴٸ�  NCHAR/NVARCHAR���� CHAR/VARCHAR�� 
    �� ������ ���� �����ؼ� ������� ������ �ȴ� . ��뷮 ������ ���̽� ���� ���� �׷���.

	2. Character ����
	   - CLOB : ��뷮 �ؽ�Ʈ ������ Ÿ��(�ִ� 4Gbyte)
       - NCLOB : ��뷮 �ؽ�Ʈ �����ڵ� ������ Ÿ��(�ִ� 4Gbyte)
	
	3. Numeric ����
		Number��� �ɷ� �����ϰ� �Ǽ��� ������ ��� ���� �ѹ��� ���� �� �ִ�.
	   - Number(4) : �ִ� 4�ڷ� �̷���� ����
	   - Number(6,2) : �Ҽ��� 2�ڸ��� �����ϴ� �ִ� 6�ڸ��� ����
	   				   (�Ҽ��� ��° �ڸ����� �ݿø�)
	   - Number(6,-2) : �Ҽ��� -2�ڸ����� �ݿø��ϴ� �ִ� 6�ڸ��� ����
	   - Number : Number(38,*)  �ƽø� 38�� ���ɷ� �ν�
	   - Number(*, 5) : Number(38,5)	�Ҽ��� 5�� �� 38�� ¥�� ���ڷ� �������

	4. Date ����
	   - DATE : �� �� �� ǥ�����ִ� �ڷ���
	   - TIMESTAMP : �� �� �� �� �� �� ���� ǥ�����ִ� �ڷ���

*/

-- ���̺� ����
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


-- ���̺� ���� 
ALTER TABLE MEMBER MODIFY ID NVARCHAR2(50);

-- ���̺� ����
ALTER TABLE MEMBER DROP COLUMN AGE;

-- ���̺� �߰�
ALTER TABLE MEMBER ADD EMAIL VARCHAR2(200);


-- ������ ���̺��� ����

CREATE TABLE NOTICE
(
	ID			NUMBER,
	TITLE		NVARCHAR2(100),
	WRITER_ID	NVARCHAR2(50),
	CONTENT		CLOB,
	REGDATE		TIMESTAMP,
	HIT 		NUMBER,
	FILES		NVARCHAR2(1000)
);


CREATE TABLE "COMMENT"		-- ������ �������� ���̺���ε� ���̺������ ����ϱ� ���� ū����ǥ�� ������
(
	ID			NUMBER,
	CONTENT		NVARCHAR2(2000),
	REGDATE		TIMESTAMP,
	WRITER_ID	NVARCHAR2(50),
	NOTICE_ID	NUMBER
);


CREATE TABLE ROLE
(
	ID			VARCHAR2(50),
	DISCRIPTION	NVARCHAR2(500)
);


CREATE TABLE MEMBER_ROLE
(
	MEMBER_ID	NVARCHAR2(50),
	ROLE_ID		VARCHAR2(50)
);






