CREATE TABLE MYUSER (
    USERNO NUMBER(10),
    USERID VARCHAR2(20),    -- 데이터의 공간이 가변적으로 잡힘
                            -- 크기가 들어가는 데이터만큼 자동조절되는 VARCHAR2,반면 ?					
                            -- VARCHAR인 경우 20전부다 사용.
    USERPW VARCHAR(30),     -- 데이터의 공간이 고정됨?
    NICKNAME VARCHAR(30),
    EMAIL VARCHAR(50),
    PRIMARY KEY(USERNO)     -- PK 고유키,각각 다른 값을 가진다. 테이블의 대표,기준이되는 데이터이다.?
                            -- PRIMARY KEY 지정함으로써 데이터를 쉽게 알아볼수 있고 PRIMARY KEY의 값을 통해서 검색하면 검색속도가 빨라진다.
);

DROP TABLE MYUSER;          -- 테이블 삭제

CREATE SEQUENCE SEO_USER
 START WITH 1 INCREMENT BY 1;    
-- 시퀀스로 USERNO를 자동으로 1씩증가 시켜줌 (오라클)

INSERT INTO MYUSER (  -- INSERT문으로 데이터 추가
    USERNO,         -- 이 내용들을 다 지우고 데이터가 들어갈 자리에 맞게 VALUES를 작성 해줘도 됨.
    USERID,         
    USERPW,
    NICKNAME,
    EMAIL
)
VALUES (SEO_USER.NEXTVAL,'id586','asdfaSDsdfwer','고글','asdfSDA@navaaa.com');

/*  
    데이터조회문 SELECT
    전체가져오기 : SELECT *
    열을 제한해서 조회하기 : SELECT USERNO,NICKNAME
    특정 데이터만 조회하기 : WHERE USERNO = 2
*/
SELECT *        
FROM MYUSER
WHERE USERNO = 1;

-- 데이터 수정(변경) 
UPDATE MYUSER 
SET NICKNAME ='부글',
EMAIL = 'ALPA@NGJAD'
WHERE USERNO = 2;

-- 데이터 삭제 
-- 데이터 전체삭제 :
DELETE FROM MYUSER;

-- USERNO가 2인 데이터만 삭제 :
DELETE FROM MYUSER
WHERE USERNO = 2;





































