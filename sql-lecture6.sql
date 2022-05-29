-- ���� ����
-- ������, ��ƼƼ, �����̼�

-- ������ ���� ���� 
-- �Ӽ��� �������� �ƴ� ���� �� �� ������ �ϴ� ���� ����
-- NOT NULL, DEFAULT, CHECK
/*
- 1. NOT NULL �������� : ������ �����Ͱ��� �Է��ؾ� �Ѵ�.
- ���̺��� ������ �� ������
CREATE TABLE TEST
(
	ID		VARCHAR2(50) NOT NULL,
	EMAIL	VARCHAR2(200) NULL,
	PHONE	CHAR(13)	NOT NULL	
);
- ���̺��� ���� �� �Ŀ� ������
ALTER TABLE TEST MODIFY EMAIL VARCHAR2(200) NOT NULL;

- 2. DEFAULT �������� : �����Ͱ��� �Է����� �ʾƵ� �ڵ����� �⺻ �Է°��� ������ ����.
- ���̺��� ������ �� ������
CREATE TABLE TEST
(
	ID		VARCHAR2(50) NOT NULL,
	EMAIL	VARCHAR2(200) NULL,
	PHONE 	CHAR(13) 	NOT NULL,
	PWD		VARCHAR2(200)	DEFAULT '111' -- ���� ���� �Է��� �ʿ� ���� �÷���
)										  -- �����, ��ȸ��, �����ڰ� �ο��ϴ� ���
- ���̺��� ���� �� �Ŀ� ������
ALTER TABLE TEST MODIFY EMAIL VARCHAR2(200) DEFAULT '111';

INSERT INTO TEST("UID", 'PHONE') VALUES('NEWLEC', '222');
*/

INSERT INTO notice (
    id,
    title,
    writer_id
) VALUES (
    8,
    '8��° �Խñ�',
    'PHJ'
);

SELECT * FROM NOTICE ORDER BY REGDATE DESC;

/*
- 3. CHECK �������� : ���� ������ ������ Ȯ���ؼ� �˸��� ������ ���� ���� �ʵ��� ������ ����
- ���̺��� ������ �� �����ϴ� ���
CREATE TABLE TEST
(
	ID		VARCHAR2(50)	NULL,
	PHONE	VARCHAR2(200)	CHECK(PHONE LIKE '010-%-____') NOT NULL,
	EMAIL	VARCHAR2(500)	NULL
);
- ���̺��� ���� �� �Ŀ� ������
ALTER TABLE TEST ADD CONSTRAINT CK_TEST_PHONE CHECK(PHONE LIKE '010-%-____');
 */

INSERT INTO MEMBER(ID, PWD, NAME, GENDER, PHONE)
VALUES('newlec1', '111', '����', '����', '010-3333-3333');

COMMIT;
SELECT * FROM MEMBER;

-- ���Խ��� �̿��� üũ ��������
ALTER TABLE MEMBER 
DROP CONSTRAINT MEMBER_PHONE_CHK1;

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME ='MEMBER' ;

ALTER TABLE MEMBER
ADD CONSTRAINT MEMBER_PHONE_CHK1 CHECK(REGEXP_LIKE(PHONE, '^01[01]-\d{3,4}-\d{4}$'));


-- Entity ��������
-- PRIMARY KEY, UNIQUE
-- �ߺ��� ���ڵ尡 ������ �����Ѵ�.
-- PRIMARY KEY(�⺻Ű) : ���� �ߺ��� �߻��� �� ���� NULL�� ������ �ȵ�
-- UNIQUE(�ߺ�����) : NULL�� ����ϳ� �ߺ��� ���� ������� ����

/*
 - PRIMARY KEY
 CREATE TABLE NOTICE
 (	-- ��������� �������ǿ� ���� �̸��� �ο��ϰ� ������ CONSTRAINT�� ����Ͽ� �̸��� �ο� ���ָ��.
 	ID			NUMBER	CONSTRAINT NOTICE_ID_PK PRIMARY KEY,		-- �⺻Ű ���� ����
 	TITLE		VARCHAR2(300)	NOT NULL,	-- NOT NULL
 	WRITER_ID	VARCHAR2(50)	NOT NULL UNIQUE,	-- NOT NULL/UNIQUE
 	CONTENT		VARCHAR2(4000),	
 	REGDATE		DATE			DEFAULT SYSDATE,	-- �⺻�� ���� ��¥
 	HIT			NUMBER			DEFAULT 0			-- �⺻�� 0
 );
 -- ���� ó�� ������ �ɰ� �Ǹ� �÷��� ���� ������������ �κ��� �־
 -- �� �ؿ��ٰ� ���� ���Ƽ� ���������� �ɰ� �Ҽ��� ����
 CREATE TABLE NOTICE
 (	
 	ID			NUMBER,	
 	TITLE		VARCHAR2(300)	NOT NULL,
 	WRITER_ID	VARCHAR2(50),
 	CONTENT		VARCHAR2(4000),	
 	REGDATE		DATE			DEFAULT SYSDATE,	
 	HIT			NUMBER			DEFAULT 0			
 	
 	CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID),
 	CONSTRAINT NOTICE_ID_UK UNIQUE(WRITER_ID)
 );
 */

-- ���̺��� ���� �� �Ŀ� �������� ������
ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID);

ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_WRITER_UK UNIQUE(WRITER_ID);


-- ������(SEQUENCE) : �Ϸù�ȣ
INSERT INTO NOTICE(ID, TITLE, WRITER_ID)
VALUES(NOTICE_ID_SEQ.NEXTVAL, '������ ����', 'NEWLEC21');
COMMIT;

SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;

INSERT INTO NOTICE(TITLE, WRITER_ID)
VALUES('������ ����2', 'NEWLEC21');





































































