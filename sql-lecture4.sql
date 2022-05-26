-- RegExLib.com
-- 정규식을 이용한 패턴 비교
-- 제목에 전화번호가 포함된 게시글을 조회하시오.
SELECT * FROM NOTICE WHERE REGEXP_LIKE(TITLE, '01[016-9]-\d{3,4}-\d{4}');
/*
010-2222-3333
011-333-4444
016-234-4363
017-444-5555
018-123-2345
019-214-2345
[016-9] : 0이나 1이나 6에서9까지 
\d : [0-9]랑 같다  d는 소문자로 써줘야됨.
\d{3,4} : \d가 3번이나 4번 반복됨.
^01[016-9]-\d{3,4}-\d{4}$
^ : 시작 $ : 끝 이므로
010-2222-3333 앞에나 뒤에 다른 문자들이 들어가있으면 시작과 끝이 다르므로 검색이 안된다.
검색 되게 하려면 시작과 끝을 정하지 않고 01[016-9]-\d{3,4}-\D{4} 작성하여 
이 패턴이 포함되어 있는 문자를 검색해 달라해줌.
*/

-- 문자열 비교를 위한 정규식
/*
 	ks12b0000@gmail.com
 	
 	이메일에 꼭 들어가는 것들 : @ . (org com net 3중 1개) 
 	이메일 찾기 위한 식 : \D\w*@\D\w* . (org | com | net)
 	[0-9a-zA-z]과 일치하는 것 : \w
 	? : 0 or 1
 	* : 0개 이상
 	+ : 1개 이상
 	| : org 또는 com 또는 net
 	\D : [^0-9] 0부터 9까지가 아닌걸로만 올수 있도록하는 부정연산자
 */

-- ROWNUM 그리고 행 제한하기

--회원 목록에서 상위 5명만 조회하시오.
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 5;
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 2 AND 10; -- 오류

-- 앞에 별도로 ROWNUM을 만들어주고 별칭을 NUM 으로해서 검색해주면 NUM의 숫자에 맞는 값들을 출력해준다.
SELECT * FROM (SELECT ROWNUM NUM, MEMBER.* FROM MEMBER)
WHERE NUM BETWEEN 6 AND 10;


-- 중복 값 제거 DISTINCT
SELECT DISTINCT AGE FROM MEMBER;


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





