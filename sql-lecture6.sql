-- 제약 조건
-- 도메인, 엔티티, 릴레이션

-- 도메인 제약 조건 
-- 속성에 도메인이 아닌 값이 올 수 없도록 하는 제약 조건
-- NOT NULL, DEFAULT, CHECK
/*
- 1. NOT NULL 제약조건 : 무조건 데이터값을 입력해야 한다.
- 테이블을 생성할 때 적용방법
CREATE TABLE TEST
(
	ID		VARCHAR2(50) NOT NULL,
	EMAIL	VARCHAR2(200) NULL,
	PHONE	CHAR(13)	NOT NULL	
);
- 테이블을 생성 한 후에 적용방법
ALTER TABLE TEST MODIFY EMAIL VARCHAR2(200) NOT NULL;

- 2. DEFAULT 제약조건 : 데이터값을 입력하지 않아도 자동으로 기본 입력값이 들어가도록 해줌.
- 테이블을 생성할 때 적용방법
CREATE TABLE TEST
(
	ID		VARCHAR2(50) NOT NULL,
	EMAIL	VARCHAR2(200) NULL,
	PHONE 	CHAR(13) 	NOT NULL,
	PWD		VARCHAR2(200)	DEFAULT '111' -- 굳이 직접 입력할 필요 없는 컬럼들
)										  -- 등록일, 조회수, 관리자가 부여하는 비번
- 테이블을 생성 한 후에 적용방법
ALTER TABLE TEST MODIFY EMAIL VARCHAR2(200) DEFAULT '111';

INSERT INTO TEST("UID", 'PHONE') VALUES('NEWLEC', '222');
*/

INSERT INTO notice (
    id,
    title,
    writer_id
) VALUES (
    8,
    '8번째 게시글',
    'PHJ'
);

SELECT * FROM NOTICE ORDER BY REGDATE DESC;

/*
- 3. CHECK 제약조건 : 값의 범위나 형식을 확인해서 알맞지 않으면 값이 들어가지 않도록 오류를 내줌
- 테이블을 생성할 때 설정하는 방법
CREATE TABLE TEST
(
	ID		VARCHAR2(50)	NULL,
	PHONE	VARCHAR2(200)	CHECK(PHONE LIKE '010-%-____') NOT NULL,
	EMAIL	VARCHAR2(500)	NULL
);
- 테이블을 생성 한 후에 적용방법
ALTER TABLE TEST ADD CONSTRAINT CK_TEST_PHONE CHECK(PHONE LIKE '010-%-____');
 */

INSERT INTO MEMBER(ID, PWD, NAME, GENDER, PHONE)
VALUES('newlec1', '111', '뉴렉', '남성', '010-3333-3333');

COMMIT;
SELECT * FROM MEMBER;

-- 정규식을 이용한 체크 제약조건
ALTER TABLE MEMBER 
DROP CONSTRAINT MEMBER_PHONE_CHK1;

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME ='MEMBER' ;

ALTER TABLE MEMBER
ADD CONSTRAINT MEMBER_PHONE_CHK1 CHECK(REGEXP_LIKE(PHONE, '^01[01]-\d{3,4}-\d{4}$'));


-- Entity 제약조건
-- PRIMARY KEY, UNIQUE
-- 중복된 레코드가 없도록 제한한다.
-- PRIMARY KEY(기본키) : 절대 중복이 발생할 수 없고 NULL도 들어오면 안됨
-- UNIQUE(중복불허) : NULL은 허용하나 중복은 절대 허용하지 않음

/*
 - PRIMARY KEY
 CREATE TABLE NOTICE
 (	-- 명시적으로 제약조건에 대한 이름을 부여하고 싶으면 CONSTRAINT를 사용하여 이름을 부여 해주면됨.
 	ID			NUMBER	CONSTRAINT NOTICE_ID_PK PRIMARY KEY,		-- 기본키 제약 조건
 	TITLE		VARCHAR2(300)	NOT NULL,	-- NOT NULL
 	WRITER_ID	VARCHAR2(50)	NOT NULL UNIQUE,	-- NOT NULL/UNIQUE
 	CONTENT		VARCHAR2(4000),	
 	REGDATE		DATE			DEFAULT SYSDATE,	-- 기본값 현재 날짜
 	HIT			NUMBER			DEFAULT 0			-- 기본값 0
 );
 -- 위에 처럼 제약을 걸게 되면 컬럼이 많이 지저분해지는 부분이 있어서
 -- 맨 밑에다가 빼서 몰아서 제약조건을 걸게 할수도 있음
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

-- 테이블을 생성 한 후에 제약조건 적용방법
ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID);

ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_WRITER_UK UNIQUE(WRITER_ID);


-- 시퀀스(SEQUENCE) : 일련번호
INSERT INTO NOTICE(ID, TITLE, WRITER_ID)
VALUES(NOTICE_ID_SEQ.NEXTVAL, '시퀀스 예제', 'NEWLEC21');
COMMIT;

SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;

INSERT INTO NOTICE(TITLE, WRITER_ID)
VALUES('시퀀스 예제2', 'NEWLEC21');





































































