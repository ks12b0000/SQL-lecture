/*  --- DML -----
 
-- 데이터 삽입하기 - INSERT	
	INSERT 명령 규칙 :INSERT INTO <테이블> VALUES <값목록>
	
	모든 필드 값을 입력하기 : INSERT INTO MEMBER VALUSE(컬럼에 해당되는 순서대로 모든 값을 입력해야함);	
	
	원하는 필드만, 원하는 순서대로 입력하기 : INSERT INTO MEMBER(ID,PWD) VALUES('newlec', '111');
	
	값을 넣어주지 않은 필드 값들은 NULL값으로 들어감
*/
INSERT INTO MEMBER (ID, PWD) VALUES('newlec', '111');

INSERT INTO MEMBER (ID, PWD) VALUES('dragon', '111');
-- 문제가 있을수도 있으니 아직 임시 저장소에 저장해둠
COMMIT;		-- 문제가 없으면 커밋을 통해 완전한 저장소로 저장함
			-- 커밋을 하지 않으면 ROCK에 걸려있음.
ROLLBACK; 	-- 커밋하지 않은 임시 저장소에 있는 것들을 적용하지 말라하는 명령어

SELECT * FROM MEMBER;		-- 모든컬럼 검색 : *

SELECT ID "USER ID", NAME, PWD FROM MEMBER;	-- ID, NAME, PWD의 컬럼만 검색, ID 컬럼의 이름을 AS(생략가능)를 이용하여 user_id로 별칭을 바꿔서 나타내줄 수 있음.
											-- 빈공백을 나타내 주고 싶으면 큰따옴표를 이용하여 나타내줌 

-- 데이터 수정하기 - UPDATE
UPDATE MEMBER SET PWD='222';	-- 모든 유저의 PWD가 '222'로 바뀜

UPDATE MEMBER SET PWD='111' WHERE ID='dragon';	-- WHERE절을 이용하여 ID='dragon'인 사용자의 PWD만 바꿈

UPDATE MEMBER SET PWD='333', NAME='손오공' WHERE ID='dragon';	-- 두개이상 컬럼을 바꿀때 , 콤마를 이용하여 바꿔준다.

-- 테이블 삭제하기 - DELETE 
DELETE MEMBER WHERE ID='TEST';


/*	
	 -- 트랜잭션 --		
 	트랜잭션이란? 업무 실행단위 / 논리 명령단위 / 개념상의 ...
 	
 	업무적인 단위 		      물리적인 명령어 단위 	 
 	 						LOCK	- 2. 그동안 다른 세션이 건드리지 못하도록..
 	 계좌이체 		  =>		 update	   -  1.현재 세션을 위한
 	 						 update		  임시저장소에서 테스트
 	 						UNLOCK		COMMIT;
 							LOCK		
 	 이벤트 게시글 등록   => 	     insert
 	 						 update
 	 						UNLOCK
 */

/* 		
 	- 산술 연산자 -
 	+, -, *, /	 
 	- 문자열 더하기 연산자 -	
 	||
 	- 비교 연산자 - 
 	=, !=, ^=, <>, >, <, >=, <=, IS NULL, IS NOT NULL
 	   ----------
 	    같지 않다 
 	- 관계 연산자 -
 	NOT, AND, OR, BETWEEN, IN
 	- 패턴 연산자 -
 	LIKE, %, _
 */
-- 사용자의 정보를 조회 --

-- 산술 연산자
-- 공지사항의 조회수를 조회하시오. 단 기존 값에 1을 더해서 조회하시오.
SELECT HIT+1 FROM NOTICE; 	-- 컬럼명이 HIT+1로 나옴
SELECT HIT+1 HIT FROM NOTICE;	--컬럼명이 "HIT"가 되도록 하시오.
SELECT 1 + '3' FROM DUAL;	-- DUAL은 범위 테이블임 의미없는 테이블명
							-- 오라클은 숫자더하기 문자열하면 숫자로 바뀜. 더하기는 숫자만 더해주는 연산자
SELECT 1 + 'a' FROM DUAL;	-- a를 숫자로 바꿔주려 하다가 숫자가 아니므로 오류가 난다.


-- 문자열 더하기 연산자
SELECT 1 || '3' FROM DUAL;	-- 문자열 더하기 연산자 ||을 사용하여 문자열로 바꿔서 더해줌
-- 모든 회원의 이름을 조회하시오.
-- 단 이름은 ID를 붙여서 나타내시오. 예)홍길동(hong)
SELECT NAME || '(' || ID || ')' FROM MEMBER; 
-- 위에 그대로 하면 컬럼명이 "NAME || '(' || ID || ')'"으로 나타나므로 별칭을 사용하여 나타내줌.
SELECT NAME || '(' || ID || ')' NAME FROM MEMBER; 


-- 비교 연산자
-- 게시글 중에서 작성자가 'newlec'인 게시글만 조회하시오.
SELECT * FROM NOTICE WHERE WRITER_ID ='newlec';
-- 게시글 중에서 조회수가 3이 넘는 글만 조회하시오.
SELECT * FROM NOTICE WHERE HIT > 3;
-- 게시글 중에서 내용을 입력하지 않은 게시글을 조회하시오.
SELECT * FROM NOTICE WHERE CONTENT IS NULL;


-- 관계 연산자
-- 조회수가 0, 1, 2인 게시글을 조회하시오.
SELECT * FROM NOTICE WHERE HIT BETWEEN 0 AND 2;
-- 조회수가 0, 2, 7인 게시글을 조회하시오.
SELECT * FROM NOTICE WHERE HIT IN (0, 2, 7);
-- 조회수가 0, 2, 7이 아닌 게시글을 조회하시오.
SELECT * FROM NOTICE WHERE HIT NOT IN (0, 2, 7);


-- 패턴 연산자
-- 회원 중에서 '박'씨 성을 조회하시오.
SELECT * FROM MEMBER WHERE NAME LIKE '박%';
-- 회원 중에서 '박'씨이고 이름이 외자인 회원은 조회하시오.
SELECT * FROM MEMBER WHERE NAME LIKE '박_';
-- 회원 중에서 '박'씨 성을 제외한 회원을 조회하시오.
SELECT * FROM MEMBER WHERE NAME NOT LIKE '박%';
-- 회원 중에서 이름에 '도'자가 들어간 회원을 조회하시오.
SELECT * FROM MEMBER WHERE NAME LIKE '%도%';

