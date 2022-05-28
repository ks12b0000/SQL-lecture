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
-- 1. ���ڿ� �Լ�
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



-- 2. ���� �Լ�

-- ���밪�� ���ϴ� �Լ� ABS(n)
SELECT ABS(35), ABS(-35) FROM DUAL; 

-- ����/����� �˷��ִ� �Լ� SIGN(n)
SELECT SIGN(35), SIGN(-35), SIGN(0) FROM DUAL;  

-- ������ �ݿø� ���� �˷��ִ� �Լ� ROUND(n,i)
SELECT ROUND(34.456789), ROUND(34.56789) FROM DUAL;  
SELECT ROUND(34.456789,2), ROUND(34.56789,3) FROM DUAL; -- �ݿø� �� �Ҽ����� ��ġ�� ���� �� ����

-- ������ ������ ���� ��ȯ�ϴ� �Լ� MOD(n1, n2)
SELECT TRUNC(17/5) ��, MOD(17, 5) ������ FROM DUAL; 

-- ������ ������ ���ϴ� �Լ��� �������� ���ϴ� �Լ� POWER(n1, n2)/ SQRT(n)
SELECT POWER(5, 2), SQRT(25) FROM DUAL;  



-- 3. ��¥ �Լ�

-- ���� �ð��� ��� �Լ�
SELECT SYSDATE FROM DUAL;

-- ���� �ð��� ���� ����
ALTER SESSION SET TIME_ZONE = '09:00';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ��¥ ���� �Լ� EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM ...)
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MINUTE FROM SYSTIMESTAMP) FROM DUAL;
SELECT EXTRACT(SECOND FROM SYSTIMESTAMP) FROM DUAL;

-- ���� ȸ�� �߿� �����(2, 3, 5, 11, 12)�� �޿� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT EXTRACT(MONTH FROM SYSDATE) || '��' FROM DUAL;
SELECT * FROM MEMBER WHERE EXTRACT(MONTH FROM REGDATE) IN (2, 3, 5, 11, 12);

-- ��¥�� �����ϴ� �Լ� ADD_MONTH(��¥, ����)
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;  -- ���� �޿��� 1�� ������
SELECT ADD_MONTHS(SYSDATE, -1) FROM DUAL; 	-- ���� �޿��� 1�� ����

-- ���� ȸ�� �߿� �������� 6������ �� �Ǵ� ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE ADD_MONTHS(SYSDATE, -6) < REGDATE; 

-- ��¥�� ���̸� �˾Ƴ��� �Լ� MONTHS_BETWEEN(��¥,��¥)
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2013-12-24')) FROM DUAL; 

-- ���� ȸ�� �߿� �������� 6������ �Ѵ� ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE ADD_MONTHS(SYSDATE, -6) > REGDATE; 

-- ���� ȸ�� �߿� �������� ���� ��¥�� 6���� �Ѱ� ���̳��� ȸ���� ��ȸ�Ͻÿ�
SELECT * FROM MEMBER WHERE MONTHS_BETWEEN(SYSDATE, REGDATE) > 6; 
SELECT MONTHS_BETWEEN(SYSDATE, REGDATE) FROM MEMBER; 

-- ���� ������ �˷��ִ� �Լ� NEXT_DAY(���糯¥, ��������)
SELECT NEXT_DAY(SYSDATE, '�Ͽ���') FROM DUAL; 
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;  -- ���ڷε� ǥ�� �Ҽ� ���� 1 ���� �Ͽ��� 7�� �����

-- ���� ������ ���ڸ� �˷��ִ� �Լ� LAST_DAY(��¥)
SELECT LAST_DAY(SYSDATE) FROM DUAL; 
-- ADD_MONTHS�� �̿��Ͽ� ���� �޿� +n, -n �����־ �ٸ� ���� ������ ���ڸ� �˼�����.
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, -5)) FROM DUAL;

-- ������ �������� ��¥�� �ݿø��ϴ�/�ڸ��� �Լ� ROUND/TRUNC(��¥, ����)
SELECT ROUND(TO_DATE('2022-10-30'), 'YEAR'), TRUNC(TO_DATE('2022-10-30'), 'YEAR') FROM DUAL;  
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH') FROM DUAL;



-- 4. ��ȯ �Լ�
-- NUMBER ������ ���ڿ��� ��ȯ TO_CHAR(NUMBER)
/*
 	  TO_CHAR()     TO_DATE()
 	    --->		  --->
    ���� <-->   ���ڿ�   <-->   ��¥
        <---		  <---		
     TO_NUMBER()    TO_CHAR()
     
     SELECT TO_CHAR(12345678,'$99,999,999,999.99) FROM DUAL;
     							----------------
     							�տ� ���� ���̺��� ���� ��
     	���˹���    |    ����
     	  9			  ����
     	  0	      ���ڸ��� ä��� ����
     	  $		    �տ� $ ǥ��
     	  , 	  õ ���� ������ ǥ��
     	  . 	     �Ҽ��� ǥ��
 */	 
SELECT TO_CHAR(12345678,'99999999') || 'HELLO' FROM DUAL;
SELECT TO_CHAR(1234567890,'99,999,999') || 'HELLO' FROM DUAL; -- �տ� ���� ���̰� �� ��� �ùٸ��� ���� ����� ����. ������ ���̸� ���������
SELECT TO_CHAR(1234567,'09,999,999,999') || 'HELLO' FROM DUAL; -- �ڿ� ���� ���̰� �� ��� �տ� �ڸ��� �������� ä���� �տ� 0�� ���� ������ 0���� ä����
SELECT TO_CHAR(1234567,'$09,999,999,999') || 'HELLO' FROM DUAL; -- ǥ���� �����ϴ°� ���� �̱� �޷��� �տ� �޷��� �ٿ���
SELECT TRIM(TO_CHAR(1234567,'9,999,999,999.99')) || '��' FROM DUAL; -- TRIM�� ����Ͽ� �� ������ ������ �� ����
SELECT TRIM(TO_CHAR(1234567.345,'9,999,999,999.99')) || '��' FROM DUAL;
-- .���̿��Ͽ� �Ҽ����� ��Ÿ���� �� ���� �ڿ� �Ҽ��� ���̺��� �տ� �Ҽ��� ���̰� �� ��� �ڿ� ���̸�ŭ �ݿø��Ǿ ��Ÿ��



/*
 	���˹���			|    ����
YYYY/RRRR/YY/YEAR	 �⵵ǥ�� : 4�ڸ�/Y2K/2�ڸ�/����
   MM/MON/MONTH		 ��ǥ�� : 2�ڸ�/����3�ڸ�/������ü
   DD/DAY/DDTH		 ��ǥ�� : 2�ڸ�/����/2�ڸ�ST
   	 AM/PM			 	����/����ǥ��
   	HH/HH24		     �ð�ǥ�� : 12�ð�/24�ð�
   	  MI			 ��ǥ�� : 0~59��
   	  SS			 ��ǥ�� : 0~59��
 */
-- DATE ������ ���ڿ��� ��ȯ TO_CHAR(DATETIME)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD PM HH12:MI:SS') FROM DUAL;

-- ���ڿ��� ��¥ �������� ��ȯ�ϴ� �Լ� TO_DATE(���ڿ�, ��¥����)
SELECT TO_DATE('2022-05-28', 'YYYY-MM-DD') FROM DUAL; 

-- ���ڿ��� ������������ ��ȯ�ϴ� �Լ� TO_TIMESTAMP(���ڿ�)
SELECT TO_TIMESTAMP('2022-05-28', 'YYYY-MM-DD') FROM DUAL; 

-- ���ڿ��� ������������ ��ȯ�ϴ� �Լ� TO_NUMBER(���ڿ�)
SELECT TO_NUMBER('2022') FROM DUAL; 
SELECT TO_NUMBER('2') + 3 FROM DUAL;



-- 5. NULL ���� �Լ�
-- ��ȯ ���� NULL�� ��쿡 ��ü ���� �����ϴ� NVL(NULL, ��ü��)�Լ� 
SELECT AGE + 3 FROM MEMBER;  -- NULL ���� ���� �����൵ NULL�� ��
SELECT NVL(AGE, 0) FROM MEMBER; -- NULL ���� 0���� ��ü��
SELECT TRUNC(NVL(AGE, 0)/10)*10 FROM MEMBER; 
-- NVL���� ������ �ϳ� �� Ȯ���� NVL2(�Է°�, NOTLULL��ü��, NULL��ü��) �Լ�
SELECT NVL2(AGE, TRUNC(AGE/10)*10, 0) FROM MEMBER; -- NULL�� �ƴѰ�츸 ������ �� �� �ֵ����� NULL�� ���� 0�� ����
-- ���� SELECT TRUNC(NVL(AGE, 0)/10)*10 FROM MEMBER; 
-- ������ NULL�� ���� ������ ������ �� ��� ���� ���������� �����ϴ� Ƚ���� �޶���.

-- �� ���� ���� ��� NULL �׷��� ���� ��� ù ��° �� ��ȯ NULLIF(��1, ��2) �Լ�
SELECT NULLIF(AGE, 29) FROM MEMBER; -- AGE�� 29�� ���� NULL�� �ٲ���

-- ���ǿ� ���� �� �����ϱ� DECODE(���ذ�, �񱳰�, ��°�, �񱳰�, ��°�)
SELECT DECODE(GENDER, '����', 1, 2) FROM MEMBER; -- ������ ������ ��� 1��ǥ�� �ƴҰ�� 2��ǥ��
SELECT DECODE(SUBSTR(PHONE, 1, 3), '011','SK','016','KT', '��Ÿ')
FROM MEMBER;   -- ����ȣ �� 3�ڸ��� 011�� ��� SK, 016�ϰ�� KT �������� ��Ÿ�� ǥ��

SELECT DECODE(SUBSTR(PHONE, 1, 3),
					'011', 'SK',
					'016', 'KT',
					'��Ÿ') || ', ' || PHONE 
					FROM MEMBER;
-- �������� ���� ���� ó�� �ۼ��� �� ����						


-- 6. ���� ��
/*	
  	SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY	-- ������ �ٲ��� �ȵ�.			
	FROM���� �⺻���� ������ ������ �����ϴ� ����, ���̺�, ���� ���� ���̺��� ���� �ִ� ���ڵ带 ��ģ ������ �ü� ���� ������ �����͸� �����ϴ� ��
	-> WHERE���� ����Ͽ� ���ǿ� �´� �͸� ���͸� �Ҽ� ���� 
	-> GROUP BY���� ���� �Լ�
	-> HAVING ����� ����� ���͸��� �� ���
	-> ORDER BY���� ����� ���Ŀ� �����ϴ� ��
*/

-- �����ϱ� ORDER BY��
-- ASC(��������), DESC(��������) �ۼ����� ������ �⺻���� ASC�������� ���ĵ�
				
-- �̸��� �������� �������� �����ؼ� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER ORDER BY NAME DESC ;

-- ȸ�� �߿��� '��'�� ���� ���� ȸ���� ��ȸ�Ͻÿ�. �� ���̸� ������������ ����
SELECT * FROM MEMBER WHERE NAME LIKE '��%' ORDER BY AGE ASC;

-- ȸ�� �߿��� '��'�� ���� ���� ȸ���� ��ȸ�Ͻÿ�. �� ���̸� ������������ �����ϰ� ���̰� ������ REGDATE�� ������������ �����Ͻÿ�
SELECT * FROM MEMBER WHERE NAME LIKE '��%' ORDER BY AGE ASC, REGDATE DESC; -- �߰� 2������



-- 7. ���� �Լ�
-- SUM(�հ�), MIN(�ּҰ�), MAX(�ִ밪), COUNT(��), AVG(��հ�)
SELECT COUNT(ID) FROM NOTICE;	-- ��ü ���ڵ� �� NULL�� �������ϹǷ� ���� NULL�� ���� �ʴ� �÷����� ���Ѵ�
SELECT SUM(HIT) FROM NOTICE;	-- �������� ��ü ��ȸ��
SELECT AVG(HIT) FROM NOTICE;	-- �������� ��� ��ȸ��
-- ���̵� �������� �ۼ� Ƚ�� ���ϱ�
SELECT WRITER_ID, COUNT(ID) COUNT 
FROM NOTICE 
GROUP BY WRITER_ID 
ORDER BY COUNT DESC ;

-- ���� ���� 
-- FROM -> CONNECT BY -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 

-- HAVING��
-- ȸ���� �Խñ� �� ��ȸ�Ͻÿ� �� �Խñ� ���� 2�̸��� ���ڵ常 ����Ͻÿ�.
SELECT WRITER_ID, COUNT(ID) COUNT 
FROM NOTICE 
GROUP BY WRITER_ID 
HAVING COUNT(ID) < 2; 
-- �����Լ��� GROUP BY�� ���ĺ��� ��� �Ҽ� ����
-- ROWNUM�� WHERE���뿡�� ��������Ƿ�
-- ORDER BY HIT ������ ���������� ROWNUM�� ���ѹ���
-- ������ ���� ROWNUM�� ���̰� ������ �������
-- HIT�������� ���� �� �Ϸù�ȣ�� ���̰� ����� ��
SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;
--ORDER BY HIT;

-- RANK�� ����ϸ� ����� �ٲ�
SELECT RANK() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;

-- RANK�� ����������� ���� 1����� 3���� �Ѿ�µ�
-- DENSE_RANK �� ����ϸ� ���� 1����� ���� 2�� �̾����� �������
SELECT DENSE_RANK() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;
--  PARTITION BY�� ����Ͽ� �׷캰�� �����Ͽ� �׷캰 ����� ���� �� �ִ�
-- ���� ������ ������������ ���ĵ�
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;






