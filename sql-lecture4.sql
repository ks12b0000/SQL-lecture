/*	
 	함수의 구분 :
 	문자열함수, 숫자함수, 날짜함수, 변환함수, NULL관련함수, 집계함수 	
 */

-- 문자열 추출함수 SUBSTR(문자열, 시작위치, 길이)	
SELECT SUBSTR('Hello', 1, 3) FROM DUAL; -- Hello를 첫번째 문자부터 3번째 문자까지만 출력
SELECT SUBSTR('Hello', 3) FROM DUAL; -- Hello 3번째 자리 문자부터 출력함.

-- 모든 학생의 이름과 출생 월만을 조회하시오.
SELECT NAME, BIRTHDAY FROM MEMBER;
SELECT NAME, SUBSTR(BIRTHDAY, 6, 2) MONTH FROM MEMBER; 

-- 회원 중에서 전화번호가 011으로 시작하는 회원의 모든 정보를 출력하시오.
SELECT * FROM MEMBER WHERE SUBSTR(PHONE, 1, 3) ='011'; -- 함수가 WHERE절에 들어가면 레코드가 1억개가 있으면 1억번의 함수 호출이 일어나야 하므로 별로임
SELECT * FROM MEMBER WHERE PHONE LIKE '011%'; -- 패턴을 이용하여 검색하는게 바람직

-- 회원 중에서 생년 월이 7,8,9,10월인 회원의 모든 정보를 출력하시오.
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6, 2) BETWEEN 7 AND 10;
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6, 2) IN ('07', '08', '09', '10');

-- 전화번호를 등록하지 않은 회원 중에서 생년 월이 7,8,9월인 회원의 모든 정보를 출력하시오.
SELECT * FROM MEMBER WHERE PHONE IS NULL AND SUBSTR(BIRTHDAY, 6, 2) BETWEEN 7 AND 9; 
SELECT * FROM MEMBER WHERE PHONE IS NULL AND SUBSTR(BIRTHDAY, 6, 2) IN ('07', '08', '09');


/*
 	문자열 덧셈 함수 : CONCAT
 	문자열 연산 : ||
 	문자열 트림 함수 : 빈 공간을 없애는 함수
 	LTRIM : 왼쪽의 빈 공간을 없애줌
 	RTRIM : 오른쪽의 빈 공간을 없애줌
 	TRIM : 전체 빈 공간을 없애줌
 	
 	문자열 소문자 또는 대문자로 변경하기
 	LOWER : 소문자로 바꿔줌
 	UPPER : 대문자로 바꿔줌
 */
-- 문자열 소문자 또는 대문자로 변경하기
SELECT LOWER('NOWlsdoqQ') FROM DUAL; 
SELECT UPPER('NOWlsdoqQ') FROM DUAL;

-- 회원의 아이디가 'newlec'인 회원을 조회하시오.(단 소/대문자를 가리지 않음)
SELECT *  FROM MEMBER WHERE UPPER(ID) ='NEWLEC';

-- 문자열 대치 함수 REPLACE(문자열, 찾는 문자열, 대치할 문자열)/TRANSLATE()
SELECT REPLACE ('WHERE WE ARE', 'WE', 'YOU') FROM DUAL; -- 문자열 통체로 바뀜
SELECT TRANSLATE ('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;
-- TRANSLATE는  W는 Y로 E는 O로 바꿔주고 U는 아무 의미없게됨
-- 각각의 문자가 다른 문자끼리 대치되어서 바뀜



/*
-- 1. 문자열 함수
LPAD : 지정한 길이 만큼 왼쪽부터 특정문자로 채워줌.
SELECT LPAD(값, 총문자길이, 채울문자) FROM DUAL;
RPAD : 지정한 길이 만큼 오른쪽부터 특정문자로 채워줌.
SELECT RPAD(값, 총문자길이, 채울문자) FROM DUAL;
*/
SELECT LPAD('HELLO', 5, '0') FROM DUAL; -- 패딩 영역이 없기 때문에 문자가 출력되지 않음
SELECT LPAD('HELLO', 10, '0') FROM DUAL; -- 5개의 빈공백이 생김 5개의 빈공백에 0으로 채워줌
SELECT RPAD('HELLO', 10, '0') FROM DUAL;

-- 첫 글자를 대문자로 바꾸는 함수 INITCAP(문자열)
SELECT INITCAP('the important thing is ...') FROM DUAL; -- 모든 단어의 첫글자가 캡이 씌워짐 

-- 문자열 검색 함수 INSTR(문자열, 검색문자열, 위치, 찾을 수)
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO') FROM DUAL; -- 첫번째의 TO만 검사해줌
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2) FROM DUAL; -- 두번째 TO를 검사해주게 해줌

-- 회원의 전화번호에서 두 번째 대시(-) 문자가 존재하는 위치를 출력하시오.
SELECT INSTR(PHONE, '-', 1, 2) FROM MEMBER; 

-- 회원의 전화번호에서 첫 번째 대시 문자와 두 번째 대시 문자 사이의 간격은?
SELECT INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1) -1 FROM MEMBER;

-- 회원의 전화번호에서 첫 번째와 두 번째 사이의 국번을 출력하시오.
SELECT SUBSTR(PHONE, 5, INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1)-1) FROM MEMBER;

-- 문자열 길이를 얻는 함수
SELECT LENGTH ('WHERE WE ARE') FROM DUAL;

-- 모든 회원의 핸드폰 번호와 번호의 문자열 길이를 조회하시오.
SELECT PHONE, LENGTH(PHONE) FROM MEMBER;

-- 코드 값을 숫자로 반환하는 함수
SELECT ASCII('A') FROM DUAL; 

-- 코드 값을 문자로 반환하는 함수
SELECT CHR(65) FROM DUAL;



-- 2. 숫자 함수

-- 절대값을 구하는 함수 ABS(n)
SELECT ABS(35), ABS(-35) FROM DUAL; 

-- 음수/양수를 알려주는 함수 SIGN(n)
SELECT SIGN(35), SIGN(-35), SIGN(0) FROM DUAL;  

-- 숫자의 반올림 값을 알려주는 함수 ROUND(n,i)
SELECT ROUND(34.456789), ROUND(34.56789) FROM DUAL;  
SELECT ROUND(34.456789,2), ROUND(34.56789,3) FROM DUAL; -- 반올림 할 소수점의 위치를 정할 수 있음

-- 숫자의 나머지 값을 반환하는 함수 MOD(n1, n2)
SELECT TRUNC(17/5) 몫, MOD(17, 5) 나머지 FROM DUAL; 

-- 숫자의 제곱을 구하는 함수와 제곱근을 구하는 함수 POWER(n1, n2)/ SQRT(n)
SELECT POWER(5, 2), SQRT(25) FROM DUAL;  



-- 3. 날짜 함수

-- 현재 시간을 얻는 함수
SELECT SYSDATE FROM DUAL;

-- 세션 시간과 포맷 변경
ALTER SESSION SET TIME_ZONE = '09:00';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- 날짜 추출 함수 EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM ...)
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MINUTE FROM SYSTIMESTAMP) FROM DUAL;
SELECT EXTRACT(SECOND FROM SYSTIMESTAMP) FROM DUAL;

-- 가입 회원 중에 비수기(2, 3, 5, 11, 12)월 달에 가입한 회원을 조회하시오.
SELECT EXTRACT(MONTH FROM SYSDATE) || '월' FROM DUAL;
SELECT * FROM MEMBER WHERE EXTRACT(MONTH FROM REGDATE) IN (2, 3, 5, 11, 12);

-- 날짜를 누적하는 함수 ADD_MONTH(날짜, 정수)
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;  -- 현재 달에서 1을 더해줌
SELECT ADD_MONTHS(SYSDATE, -1) FROM DUAL; 	-- 현재 달에서 1을 빼줌

-- 가입 회원 중에 가입한지 6개월이 안 되는 회원을 조회하시오.
SELECT * FROM MEMBER WHERE ADD_MONTHS(SYSDATE, -6) < REGDATE; 

-- 날짜의 차이를 알아내는 함수 MONTHS_BETWEEN(날짜,날짜)
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2013-12-24')) FROM DUAL; 

-- 가입 회원 중에 가입한지 6개월이 넘는 회원을 조회하시오.
SELECT * FROM MEMBER WHERE ADD_MONTHS(SYSDATE, -6) > REGDATE; 

-- 가입 회원 중에 가입한지 현재 날짜와 6개월 넘게 차이나는 회원을 조회하시오
SELECT * FROM MEMBER WHERE MONTHS_BETWEEN(SYSDATE, REGDATE) > 6; 
SELECT MONTHS_BETWEEN(SYSDATE, REGDATE) FROM MEMBER; 

-- 다음 요일을 알려주는 함수 NEXT_DAY(현재날짜, 다음요일)
SELECT NEXT_DAY(SYSDATE, '일요일') FROM DUAL; 
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;  -- 숫자로도 표현 할수 있음 1 부터 일요일 7은 토요일

-- 월의 마지막 일자를 알려주는 함수 LAST_DAY(날짜)
SELECT LAST_DAY(SYSDATE) FROM DUAL; 
-- ADD_MONTHS를 이용하여 현재 달에 +n, -n 을해주어서 다른 달의 마지막 일자를 알수있음.
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, -5)) FROM DUAL;

-- 지정된 범위에서 날짜를 반올림하는/자르는 함수 ROUND/TRUNC(날짜, 포맷)
SELECT ROUND(TO_DATE('2022-10-30'), 'YEAR'), TRUNC(TO_DATE('2022-10-30'), 'YEAR') FROM DUAL;  
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH') FROM DUAL;



-- 4. 변환 함수
-- NUMBER 형식을 문자열로 변환 TO_CHAR(NUMBER)
/*
 	  TO_CHAR()     TO_DATE()
 	    --->		  --->
    숫자 <-->   문자열   <-->   날짜
        <---		  <---		
     TO_NUMBER()    TO_CHAR()
     
     SELECT TO_CHAR(12345678,'$99,999,999,999.99) FROM DUAL;
     							----------------
     							앞에 숫자 길이보다 길어야 함
     	포맷문자    |    설명
     	  9			  숫자
     	  0	      빈자리를 채우는 문자
     	  $		    앞에 $ 표시
     	  , 	  천 단위 구분자 표시
     	  . 	     소수점 표시
 */	 
SELECT TO_CHAR(12345678,'99999999') || 'HELLO' FROM DUAL;
SELECT TO_CHAR(1234567890,'99,999,999') || 'HELLO' FROM DUAL; -- 앞에 숫자 길이가 더 길면 올바르지 않은 결과가 나옴. 포맷의 길이를 맞춰줘야함
SELECT TO_CHAR(1234567,'09,999,999,999') || 'HELLO' FROM DUAL; -- 뒤에 숫자 길이가 더 길면 앞에 자리는 공백으로 채워짐 앞에 0을 쓰면 공백을 0으로 채워줌
SELECT TO_CHAR(1234567,'$09,999,999,999') || 'HELLO' FROM DUAL; -- 표현해 내야하는게 만약 미국 달러면 앞에 달러를 붙여줌
SELECT TRIM(TO_CHAR(1234567,'9,999,999,999.99')) || '원' FROM DUAL; -- TRIM을 사용하여 빈 공백을 없애줄 수 있음
SELECT TRIM(TO_CHAR(1234567.345,'9,999,999,999.99')) || '원' FROM DUAL;
-- .을이용하여 소수점을 나타내줄 수 있음 뒤에 소수점 길이보다 앞에 소수점 길이가 더 길면 뒤에 길이만큼 반올림되어서 나타냄



/*
 	포맷문자			|    설명
YYYY/RRRR/YY/YEAR	 년도표시 : 4자리/Y2K/2자리/영문
   MM/MON/MONTH		 월표시 : 2자리/영문3자리/영문전체
   DD/DAY/DDTH		 일표시 : 2자리/영문/2자리ST
   	 AM/PM			 	오전/오후표시
   	HH/HH24		     시간표시 : 12시간/24시간
   	  MI			 분표시 : 0~59분
   	  SS			 초표시 : 0~59초
 */
-- DATE 형식을 문자열로 변환 TO_CHAR(DATETIME)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD PM HH12:MI:SS') FROM DUAL;

-- 문자열을 날짜 형식으로 변환하는 함수 TO_DATE(문자열, 날짜포맷)
SELECT TO_DATE('2022-05-28', 'YYYY-MM-DD') FROM DUAL; 

-- 문자열을 숫자형식으로 변환하는 함수 TO_TIMESTAMP(문자열)
SELECT TO_TIMESTAMP('2022-05-28', 'YYYY-MM-DD') FROM DUAL; 

-- 문자열을 숫자형식으로 변환하는 함수 TO_NUMBER(문자열)
SELECT TO_NUMBER('2022') FROM DUAL; 
SELECT TO_NUMBER('2') + 3 FROM DUAL;



-- 5. NULL 관련 함수
-- 반환 값이 NULL일 경우에 대체 값을 제공하는 NVL(NULL, 대체값)함수 
SELECT AGE + 3 FROM MEMBER;  -- NULL 값에 값을 더해줘도 NULL이 됨
SELECT NVL(AGE, 0) FROM MEMBER; -- NULL 값을 0으로 대체함
SELECT TRUNC(NVL(AGE, 0)/10)*10 FROM MEMBER; 
-- NVL에서 조건을 하나 더 확장한 NVL2(입력값, NOTLULL대체값, NULL대체값) 함수
SELECT NVL2(AGE, TRUNC(AGE/10)*10, 0) FROM MEMBER; -- NULL이 아닌경우만 연산을 할 수 있도록함 NULL일 경우는 0이 나옴
-- 위에 SELECT TRUNC(NVL(AGE, 0)/10)*10 FROM MEMBER; 
-- 조건은 NULL값 까지 연산을 수행함 두 결과 값은 동일하지만 수행하는 횟수가 달라짐.

-- 두 값이 같은 경우 NULL 그렇지 않은 경우 첫 번째 값 반환 NULLIF(값1, 값2) 함수
SELECT NULLIF(AGE, 29) FROM MEMBER; -- AGE가 29인 값을 NULL로 바꿔줌

-- 조건에 따른 값 선택하기 DECODE(기준값, 비교값, 출력값, 비교값, 출력값)
SELECT DECODE(GENDER, '남성', 1, 2) FROM MEMBER; -- 성별이 남성일 경우 1로표시 아닐경우 2로표시
SELECT DECODE(SUBSTR(PHONE, 1, 3), '011','SK','016','KT', '기타')
FROM MEMBER;   -- 폰번호 앞 3자리가 011일 경우 SK, 016일경우 KT 나머지는 기타로 표시

SELECT DECODE(SUBSTR(PHONE, 1, 3),
					'011', 'SK',
					'016', 'KT',
					'기타') || ', ' || PHONE 
					FROM MEMBER;
-- 가독성이 좋게 위에 처럼 작성할 수 있음						


-- 6. 연산 절
/*	
  	SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY	-- 순서가 바뀌어서는 안됨.			
	FROM절은 기본적인 데이터 구조를 연산하는 공간, 테이블, 여러 개의 테이블이 갖고 있는 레코드를 합친 연산이 올수 있음 격자형 데이터를 마련하는 것
	-> WHERE절을 사용하여 조건에 맞는 것만 필터링 할수 있음 
	-> GROUP BY절은 집계 함수
	-> HAVING 집계된 결과를 필터링할 때 사용
	-> ORDER BY절은 집계된 이후에 정렬하는 것
*/

-- 정렬하기 ORDER BY절
-- ASC(오름차순), DESC(내림차순) 작성하지 않으면 기본으로 ASC차순으로 정렬됨
				
-- 이름을 기준으로 역순으로 정렬해서 조회하시오.
SELECT * FROM MEMBER ORDER BY NAME DESC ;

-- 회원 중에서 '박'씨 성을 가진 회원을 조회하시오. 단 나이를 오름차순으로 정렬
SELECT * FROM MEMBER WHERE NAME LIKE '박%' ORDER BY AGE ASC;

-- 회원 중에서 '박'씨 성을 가진 회원을 조회하시오. 단 나이를 오름차순으로 정렬하고 나이가 같으면 REGDATE를 내림차순으로 정렬하시오
SELECT * FROM MEMBER WHERE NAME LIKE '박%' ORDER BY AGE ASC, REGDATE DESC; -- 추가 2차정렬



-- 7. 집계 함수
-- SUM(합계), MIN(최소값), MAX(최대값), COUNT(수), AVG(평균값)
SELECT COUNT(ID) FROM NOTICE;	-- 전체 레코드 수 NULL은 빼서구하므로 절대 NULL이 들어가지 않는 컬럼으로 구한다
SELECT SUM(HIT) FROM NOTICE;	-- 공지사항 전체 조회수
SELECT AVG(HIT) FROM NOTICE;	-- 공지사항 평균 조회수
-- 아이디별 공지사항 작성 횟수 구하기
SELECT WRITER_ID, COUNT(ID) COUNT 
FROM NOTICE 
GROUP BY WRITER_ID 
ORDER BY COUNT DESC ;

-- 실행 순서 
-- FROM -> CONNECT BY -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 

-- HAVING절
-- 회원별 게시글 수 조회하시오 단 게시글 수가 2미만인 레코드만 출력하시오.
SELECT WRITER_ID, COUNT(ID) COUNT 
FROM NOTICE 
GROUP BY WRITER_ID 
HAVING COUNT(ID) < 2; 
-- 집계함수는 GROUP BY절 이후부터 사용 할수 있음
-- ROWNUM은 WHERE절쯤에서 만들어지므로
-- ORDER BY HIT 순으로 섞여버려서 ROWNUM을 엉켜버림
-- 정렬할 이후 ROWNUM을 붙이고 싶을때 방법있음
-- HIT기준으로 정렬 후 일련번호를 붙이게 만들어 줌
SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;
--ORDER BY HIT;

-- RANK를 사용하면 등수로 바뀜
SELECT RANK() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;

-- RANK를 사용했을때는 공동 1등다음 3으로 넘어갔는데
-- DENSE_RANK 를 사용하면 공동 1등다음 수를 2로 이어지게 만들어줌
SELECT DENSE_RANK() OVER (ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;
--  PARTITION BY를 사용하여 그룹별로 정렬하여 그룹별 등수도 정할 수 있다
-- 기준 정렬은 오름차순으로 정렬됨
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT), ID, TITLE ,WRITER_ID , REGDATE , HIT 
FROM NOTICE;






