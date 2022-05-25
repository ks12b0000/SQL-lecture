/*  --- DML -----
 
-- ������ �����ϱ� - INSERT	
	INSERT ��� ��Ģ :INSERT INTO <���̺�> VALUES <�����>
	
	��� �ʵ� ���� �Է��ϱ� : INSERT INTO MEMBER VALUSE(�÷��� �ش�Ǵ� ������� ��� ���� �Է��ؾ���);	
	
	���ϴ� �ʵ常, ���ϴ� ������� �Է��ϱ� : INSERT INTO MEMBER(ID,PWD) VALUES('newlec', '111');
	
	���� �־����� ���� �ʵ� ������ NULL������ ��
*/
INSERT INTO MEMBER (ID, PWD) VALUES('newlec', '111');

INSERT INTO MEMBER (ID, PWD) VALUES('dragon', '111');
-- ������ �������� ������ ���� �ӽ� ����ҿ� �����ص�
COMMIT;		-- ������ ������ Ŀ���� ���� ������ ����ҷ� ������
			-- Ŀ���� ���� ������ ROCK�� �ɷ�����.
ROLLBACK; 	-- Ŀ������ ���� �ӽ� ����ҿ� �ִ� �͵��� �������� �����ϴ� ��ɾ�

SELECT * FROM MEMBER;		-- ����÷� �˻� : *

SELECT ID "USER ID", NAME, PWD FROM MEMBER;	-- ID, NAME, PWD�� �÷��� �˻�, ID �÷��� �̸��� AS(��������)�� �̿��Ͽ� user_id�� ��Ī�� �ٲ㼭 ��Ÿ���� �� ����.
											-- ������� ��Ÿ�� �ְ� ������ ū����ǥ�� �̿��Ͽ� ��Ÿ���� 

-- ������ �����ϱ� - UPDATE
UPDATE MEMBER SET PWD='222';	-- ��� ������ PWD�� '222'�� �ٲ�

UPDATE MEMBER SET PWD='111' WHERE ID='dragon';	-- WHERE���� �̿��Ͽ� ID='dragon'�� ������� PWD�� �ٲ�

UPDATE MEMBER SET PWD='333', NAME='�տ���' WHERE ID='dragon';	-- �ΰ��̻� �÷��� �ٲܶ� , �޸��� �̿��Ͽ� �ٲ��ش�.

-- ���̺� �����ϱ� - DELETE 
DELETE MEMBER WHERE ID='TEST';


/*	
	 -- Ʈ����� --		
 	Ʈ������̶�? ���� ������� / �� ��ɴ��� / ������� ...
 	
 	�������� ���� 		      �������� ��ɾ� ���� 	 
 	 						LOCK	- 2. �׵��� �ٸ� ������ �ǵ帮�� ���ϵ���..
 	 ������ü 		  =>		 update	   -  1.���� ������ ����
 	 						 update		  �ӽ�����ҿ��� �׽�Ʈ
 	 						UNLOCK		COMMIT;
 							LOCK		
 	 �̺�Ʈ �Խñ� ���   => 	     insert
 	 						 update
 	 						UNLOCK
 */

/* 		
 	- ��� ������ -
 	+, -, *, /	 
 	- ���ڿ� ���ϱ� ������ -	
 	||
 	- �� ������ - 
 	=, !=, ^=, <>, >, <, >=, <=, IS NULL, IS NOT NULL
 	   ----------
 	    ���� �ʴ� 
 	- ���� ������ -
 	NOT, AND, OR, BETWEEN, IN
 	- ���� ������ -
 	LIKE, %, _
 */
-- ������� ������ ��ȸ --

-- ��� ������
-- ���������� ��ȸ���� ��ȸ�Ͻÿ�. �� ���� ���� 1�� ���ؼ� ��ȸ�Ͻÿ�.
SELECT HIT+1 FROM NOTICE; 	-- �÷����� HIT+1�� ����
SELECT HIT+1 HIT FROM NOTICE;	--�÷����� "HIT"�� �ǵ��� �Ͻÿ�.
SELECT 1 + '3' FROM DUAL;	-- DUAL�� ���� ���̺��� �ǹ̾��� ���̺��
							-- ����Ŭ�� ���ڴ��ϱ� ���ڿ��ϸ� ���ڷ� �ٲ�. ���ϱ�� ���ڸ� �����ִ� ������
SELECT 1 + 'a' FROM DUAL;	-- a�� ���ڷ� �ٲ��ַ� �ϴٰ� ���ڰ� �ƴϹǷ� ������ ����.


-- ���ڿ� ���ϱ� ������
SELECT 1 || '3' FROM DUAL;	-- ���ڿ� ���ϱ� ������ ||�� ����Ͽ� ���ڿ��� �ٲ㼭 ������
-- ��� ȸ���� �̸��� ��ȸ�Ͻÿ�.
-- �� �̸��� ID�� �ٿ��� ��Ÿ���ÿ�. ��)ȫ�浿(hong)
SELECT NAME || '(' || ID || ')' FROM MEMBER; 
-- ���� �״�� �ϸ� �÷����� "NAME || '(' || ID || ')'"���� ��Ÿ���Ƿ� ��Ī�� ����Ͽ� ��Ÿ����.
SELECT NAME || '(' || ID || ')' NAME FROM MEMBER; 


-- �� ������
-- �Խñ� �߿��� �ۼ��ڰ� 'newlec'�� �Խñ۸� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE WRITER_ID ='newlec';
-- �Խñ� �߿��� ��ȸ���� 3�� �Ѵ� �۸� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT > 3;
-- �Խñ� �߿��� ������ �Է����� ���� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE CONTENT IS NULL;


-- ���� ������
-- ��ȸ���� 0, 1, 2�� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT BETWEEN 0 AND 2;
-- ��ȸ���� 0, 2, 7�� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT IN (0, 2, 7);
-- ��ȸ���� 0, 2, 7�� �ƴ� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT NOT IN (0, 2, 7);


-- ���� ������
-- ȸ�� �߿��� '��'�� ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE NAME LIKE '��%';
-- ȸ�� �߿��� '��'���̰� �̸��� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE NAME LIKE '��_';
-- ȸ�� �߿��� '��'�� ���� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE NAME NOT LIKE '��%';
-- ȸ�� �߿��� �̸��� '��'�ڰ� �� ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE NAME LIKE '%��%';

