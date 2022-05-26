-- RegExLib.com
-- ���Խ��� �̿��� ���� ��
-- ���� ��ȭ��ȣ�� ���Ե� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE REGEXP_LIKE(TITLE, '01[016-9]-\d{3,4}-\d{4}');
/*
010-2222-3333
011-333-4444
016-234-4363
017-444-5555
018-123-2345
019-214-2345
[016-9] : 0�̳� 1�̳� 6����9���� 
\d : [0-9]�� ����  d�� �ҹ��ڷ� ����ߵ�.
\d{3,4} : \d�� 3���̳� 4�� �ݺ���.
^01[016-9]-\d{3,4}-\d{4}$
^ : ���� $ : �� �̹Ƿ�
010-2222-3333 �տ��� �ڿ� �ٸ� ���ڵ��� �������� ���۰� ���� �ٸ��Ƿ� �˻��� �ȵȴ�.
�˻� �ǰ� �Ϸ��� ���۰� ���� ������ �ʰ� 01[016-9]-\d{3,4}-\D{4} �ۼ��Ͽ� 
�� ������ ���ԵǾ� �ִ� ���ڸ� �˻��� �޶�����.
*/

-- ���ڿ� �񱳸� ���� ���Խ�
/*
 	ks12b0000@gmail.com
 	
 	�̸��Ͽ� �� ���� �͵� : @ . (org com net 3�� 1��) 
 	�̸��� ã�� ���� �� : \D\w*@\D\w* . (org | com | net)
 	[0-9a-zA-z]�� ��ġ�ϴ� �� : \w
 	? : 0 or 1
 	* : 0�� �̻�
 	+ : 1�� �̻�
 	| : org �Ǵ� com �Ǵ� net
 	\D : [^0-9] 0���� 9������ �ƴѰɷθ� �ü� �ֵ����ϴ� ����������
 */

-- ROWNUM �׸��� �� �����ϱ�

--ȸ�� ��Ͽ��� ���� 5�� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 5;
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 2 AND 10; -- ����

-- �տ� ������ ROWNUM�� ������ְ� ��Ī�� NUM �����ؼ� �˻����ָ� NUM�� ���ڿ� �´� ������ ������ش�.
SELECT * FROM (SELECT ROWNUM NUM, MEMBER.* FROM MEMBER)
WHERE NUM BETWEEN 6 AND 10;


-- �ߺ� �� ���� DISTINCT
SELECT DISTINCT AGE FROM MEMBER;


/*
 	�Լ��� ���� :
 	���ڿ��Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, NULL�����Լ�, �����Լ� 	
 */

-- ���ڿ� �����Լ� SUBSTR(���ڿ�, ������ġ, ����)	
SELECT SUBSTR('Hello', 1, 3) FROM DUAL; -- Hello�� ù��° ���ں��� 3��° ���ڱ����� ���
SELECT SUBSTR('Hello', 3) FROM DUAL; -- Hello 3��° �ڸ� ���ں��� �����.

-- ��� �л��� �̸��� ��� ������ ��ȸ�Ͻÿ�.
SELECT NAME, BIRTHDAY FROM MEMBER;
SELECT NAME, SUBSTR(BIRTHDAY, 6, 2) MONTH FROM MEMBER; 

-- ȸ�� �߿��� ��ȭ��ȣ�� 011���� �����ϴ� ȸ���� ��� ������ ����Ͻÿ�.
SELECT * FROM MEMBER WHERE SUBSTR(PHONE, 1, 3) ='011'; -- �Լ��� WHERE���� ���� ���ڵ尡 1�ﰳ�� ������ 1����� �Լ� ȣ���� �Ͼ�� �ϹǷ� ������
SELECT * FROM MEMBER WHERE PHONE LIKE '011%'; -- ������ �̿��Ͽ� �˻��ϴ°� �ٶ���

-- ȸ�� �߿��� ���� ���� 7,8,9,10���� ȸ���� ��� ������ ����Ͻÿ�.
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6, 2) BETWEEN 7 AND 10;
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6, 2) IN ('07', '08', '09', '10');

-- ��ȭ��ȣ�� ������� ���� ȸ�� �߿��� ���� ���� 7,8,9���� ȸ���� ��� ������ ����Ͻÿ�.
SELECT * FROM MEMBER WHERE PHONE IS NULL AND SUBSTR(BIRTHDAY, 6, 2) BETWEEN 7 AND 9; 
SELECT * FROM MEMBER WHERE PHONE IS NULL AND SUBSTR(BIRTHDAY, 6, 2) IN ('07', '08', '09');


/*
 	���ڿ� ���� �Լ� : CONCAT
 	���ڿ� ���� : ||
 	���ڿ� Ʈ�� �Լ� : �� ������ ���ִ� �Լ�
 	LTRIM : ������ �� ������ ������
 	RTRIM : �������� �� ������ ������
 	TRIM : ��ü �� ������ ������
 	
 	���ڿ� �ҹ��� �Ǵ� �빮�ڷ� �����ϱ�
 	LOWER : �ҹ��ڷ� �ٲ���
 	UPPER : �빮�ڷ� �ٲ���
 */
-- ���ڿ� �ҹ��� �Ǵ� �빮�ڷ� �����ϱ�
SELECT LOWER('NOWlsdoqQ') FROM DUAL; 
SELECT UPPER('NOWlsdoqQ') FROM DUAL;

-- ȸ���� ���̵� 'newlec'�� ȸ���� ��ȸ�Ͻÿ�.(�� ��/�빮�ڸ� ������ ����)
SELECT *  FROM MEMBER WHERE UPPER(ID) ='NEWLEC';

-- ���ڿ� ��ġ �Լ� REPLACE(���ڿ�, ã�� ���ڿ�, ��ġ�� ���ڿ�)/TRANSLATE()
SELECT REPLACE ('WHERE WE ARE', 'WE', 'YOU') FROM DUAL; -- ���ڿ� ��ü�� �ٲ�
SELECT TRANSLATE ('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;
-- TRANSLATE��  W�� Y�� E�� O�� �ٲ��ְ� U�� �ƹ� �ǹ̾��Ե�
-- ������ ���ڰ� �ٸ� ���ڳ��� ��ġ�Ǿ �ٲ�



/*
-- ���ڿ� �е� �Լ�
LPAD : ������ ���� ��ŭ ���ʺ��� Ư�����ڷ� ä����.
SELECT LPAD(��, �ѹ��ڱ���, ä�﹮��) FROM DUAL;
RPAD : ������ ���� ��ŭ �����ʺ��� Ư�����ڷ� ä����.
SELECT RPAD(��, �ѹ��ڱ���, ä�﹮��) FROM DUAL;
*/
SELECT LPAD('HELLO', 5, '0') FROM DUAL; -- �е� ������ ���� ������ ���ڰ� ��µ��� ����
SELECT LPAD('HELLO', 10, '0') FROM DUAL; -- 5���� ������� ���� 5���� ����鿡 0���� ä����
SELECT RPAD('HELLO', 10, '0') FROM DUAL;

-- ù ���ڸ� �빮�ڷ� �ٲٴ� �Լ� INITCAP(���ڿ�)
SELECT INITCAP('the important thing is ...') FROM DUAL; -- ��� �ܾ��� ù���ڰ� ĸ�� ������ 

-- ���ڿ� �˻� �Լ� INSTR(���ڿ�, �˻����ڿ�, ��ġ, ã�� ��)
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO') FROM DUAL; -- ù��°�� TO�� �˻�����
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2) FROM DUAL; -- �ι�° TO�� �˻����ְ� ����

-- ȸ���� ��ȭ��ȣ���� �� ��° ���(-) ���ڰ� �����ϴ� ��ġ�� ����Ͻÿ�.
SELECT INSTR(PHONE, '-', 1, 2) FROM MEMBER; 

-- ȸ���� ��ȭ��ȣ���� ù ��° ��� ���ڿ� �� ��° ��� ���� ������ ������?
SELECT INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1) -1 FROM MEMBER;

-- ȸ���� ��ȭ��ȣ���� ù ��°�� �� ��° ������ ������ ����Ͻÿ�.
SELECT SUBSTR(PHONE, 5, INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1)-1) FROM MEMBER;

-- ���ڿ� ���̸� ��� �Լ�
SELECT LENGTH ('WHERE WE ARE') FROM DUAL;

-- ��� ȸ���� �ڵ��� ��ȣ�� ��ȣ�� ���ڿ� ���̸� ��ȸ�Ͻÿ�.
SELECT PHONE, LENGTH(PHONE) FROM MEMBER;

-- �ڵ� ���� ���ڷ� ��ȯ�ϴ� �Լ�
SELECT ASCII('A') FROM DUAL; 

-- �ڵ� ���� ���ڷ� ��ȯ�ϴ� �Լ�
SELECT CHR(65) FROM DUAL;





