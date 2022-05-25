/* 	----- DDL  -----
    1. SQL(Structured Query Language)의 종류
       - 데이터 정의 DDL(Data Definition Language) : CREATE(테이블 생성)/ALTER(테이블 수정)/DROP(테이블 삭제)
       - 데이터 조작 DML(Data Manipulation Language) : SELECT(데이터 조회)/INSERT(데이터 입력)/UPDATE(데이터 수정)/DELETE(데이터 삭제)
       - 데이터 제어 DCL(Data Control Language) : GRANT(권한 생성)/REVOKE(권한 삭제)
    
    CRUD : Create Read Update Delete
    
    고정 타입(변하지 않기 때문에 속도자체는 빠름) : CHAR(바이트수) NCHAR(글자수)
    가변 타입(크기가 자동적으로 변하기 때문에 고정에 비해 속도 느림) : VARCHAR2(바이트수) NVARCHAR2(글자수)
  
    한글(유니코드)은 2바이트의 자리를 차지하기 때문에
    CHAR/VARCHAR 형식으로 정의할 경우에는 2배의 자릿수를 준비해야한다.
    최대 3글자의 한글을 저장하고자 한다면 CHAR(6) /VARCHAR(6)로 데이터 형식을 지정해야한다.
    반면, NCHAR(3)/NVARCHAR(3)으로 지정하면 한글이든 영문이든 무조건 3글자를  저장할수 있어서
    더 단순하고 명료하게 문자 데이터를 입력할 수 있다 
    다만 한글(유니코드)을 저장하지 않을 것이 확실하다면  NCHAR/NVARCHAR보다 CHAR/VARCHAR가 
    더 공간을 적게 차지해서 성능향상에 도움이 된다 . 대용량 데이터 베이스 에서 더욱 그렇다.

	2. Character 형식
	   - CLOB : 대용량 텍스트 데이터 타입(최대 4Gbyte)
       - NCLOB : 대용량 텍스트 유니코드 데이터 타입(최대 4Gbyte)
	
	3. Numeric 형식
		Number라는 걸로 간단하게 실수와 정수를 모든 것을 한번에 끝낼 수 있다.
	   - Number(4) : 최대 4자로 이루어진 숫자
	   - Number(6,2) : 소수점 2자리를 포함하는 최대 6자리의 숫자
	   				   (소수점 둘째 자리에서 반올림)
	   - Number(6,-2) : 소수점 -2자리에서 반올림하는 최대 6자리의 숫자
	   - Number : Number(38,*)  맥시멈 38이 들어간걸로 인식
	   - Number(*, 5) : Number(38,5)	소수점 5가 들어간 38개 짜리 숫자로 만들어짐

	4. Date 형식
	   - DATE : 년 월 일 표현해주는 자료형
	   - TIMESTAMP : 년 월 일 시 분 초 까지 표현해주는 자료형

*/

-- 테이블 생성
CREATE TABLE MEMBER
(
    ID          VARCHAR2(50),
    PWD         NVARCHAR2(50),
    NAME        NVARCHAR2(50),
    GENDER      NCHAR(2), -- 남성, 여성 / CHAR(2 CHAR) = 2글자 바람직하지 않음.
                          -- 문자를 기반이면 N을 써주는게 더 바람직한 옵션임.
    AGE         NUMBER,
    BIRTHDAY    CHAR(10),   -- 2000-01-02
    PHONE       CHAR(13),   -- 010-1234-2345 고정 길이는 CHAR이 좋음
    REGDATE     DATE
);

INSERT INTO MEMBER (GENDER) VALUES('남성');

SELECT LENGTHB (GENDER) FROM MEMBER;
DROP TABLE MEMBER;
-- LENGTHB 바이트의 길이 나타냄 영어는 한글자당 1바이트 한글은 1글자당 3바이트
SELECT LENGTHB('ab') FROM DUAL;
SELECT LENGTHB('한글') FROM DUAL;

SELECT * FROM NLS_DATABASE_PARAMETERS;


-- 테이블 수정 
ALTER TABLE MEMBER MODIFY ID NVARCHAR2(50);

-- 테이블 삭제
ALTER TABLE MEMBER DROP COLUMN AGE;

-- 테이블 추가
ALTER TABLE MEMBER ADD EMAIL VARCHAR2(200);


-- 수업용 테이블의 구성

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


CREATE TABLE "COMMENT"		-- 예약어여서 부적합한 테이블명인데 테이블명으로 사용하기 위해 큰따옴표로 감싸줌
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






