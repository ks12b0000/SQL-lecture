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
-- 문자열 패딩 함수
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



-- 숫자 함수

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



-- 날짜 함수

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































