CREATE TABLE MYUSER (
    USERNO NUMBER(10),
    USERID VARCHAR2(20),    -- �������� ������ ���������� ����
                            -- ũ�Ⱑ ���� �����͸�ŭ �ڵ������Ǵ� VARCHAR2,�ݸ� ?					
                            -- VARCHAR�� ��� 20���δ� ���.
    USERPW VARCHAR(30),     -- �������� ������ ������?
    NICKNAME VARCHAR(30),
    EMAIL VARCHAR(50),
    PRIMARY KEY(USERNO)     -- PK ����Ű,���� �ٸ� ���� ������. ���̺��� ��ǥ,�����̵Ǵ� �������̴�.?
                            -- PRIMARY KEY ���������ν� �����͸� ���� �˾ƺ��� �ְ� PRIMARY KEY�� ���� ���ؼ� �˻��ϸ� �˻��ӵ��� ��������.
);

DROP TABLE MYUSER;          -- ���̺� ����

CREATE SEQUENCE SEO_USER
 START WITH 1 INCREMENT BY 1;    
-- �������� USERNO�� �ڵ����� 1������ ������ (����Ŭ)

INSERT INTO MYUSER (  -- INSERT������ ������ �߰�
    USERNO,         -- �� ������� �� ����� �����Ͱ� �� �ڸ��� �°� VALUES�� �ۼ� ���൵ ��.
    USERID,         
    USERPW,
    NICKNAME,
    EMAIL
)
VALUES (SEO_USER.NEXTVAL,'id586','asdfaSDsdfwer','���','asdfSDA@navaaa.com');

/*  
    ��������ȸ�� SELECT
    ��ü�������� : SELECT *
    ���� �����ؼ� ��ȸ�ϱ� : SELECT USERNO,NICKNAME
    Ư�� �����͸� ��ȸ�ϱ� : WHERE USERNO = 2
*/
SELECT *        
FROM MYUSER
WHERE USERNO = 1;

-- ������ ����(����) 
UPDATE MYUSER 
SET NICKNAME ='�α�',
EMAIL = 'ALPA@NGJAD'
WHERE USERNO = 2;

-- ������ ���� 
-- ������ ��ü���� :
DELETE FROM MYUSER;

-- USERNO�� 2�� �����͸� ���� :
DELETE FROM MYUSER
WHERE USERNO = 2;





































