DROP TABLE BOARD;
DROP TABLE PRODUCT;
DROP TABLE ORDERS;
DROP TABLE COMPANY;
DROP TABLE MEMBER;

DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE COMPANY_SEQ;
DROP SEQUENCE ORDER_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE BOARD_SEQ;

CREATE SEQUENCE MEMBER_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE COMPANY_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE ORDERS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE PRODUCT_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE BOARD_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCACHE NOCYCLE;

SELECT * FROM MEMBER;
CREATE TABLE MEMBER(
	MNO NUMBER PRIMARY KEY,
	MID VARCHAR2(30) NOT NULL UNIQUE,
	MPW VARCHAR2(30) NOT NULL,
	MNAME VARCHAR2(30) NOT NULL,
	MEMAIL VARCHAR2(200) NOT NULL UNIQUE,
	MPHONE VARCHAR2(20), 
	MADDRESS VARCHAR2(200),
	MREGDATE DATE DEFAULT SYSDATE
);

CREATE TABLE BOARD(
	BNO NUMBER PRIMARY KEY,
	MID VARCHAR2(30) REFERENCES MEMBER (MID),
	BTITLE VARCHAR2(1000) NOT NULL,
	BCONTENT VARCHAR2(4000),
	BFILENAME VARCHAR2(1000),
	BPW VARCHAR2(30),
	BIP VARCHAR2(30),	-- 작성IP
	BHIT NUMBER DEFAULT 0,		
	BLASTMODIFY DATE DEFAULT SYSDATE,	-- 최종 수정일
	BREGDATE DATE DEFAULT SYSDATE,		-- 최초 작성일
	BDELETE NUMBER DEFAULT 0,			-- 삭제여부	(삭제: -1, 정상: 0)
	BGROUP NUMBER,		-- 게시글 그룹 (어떤 게시글과 거기에 달린 댓글들은 모두 같은 그룹)
	BGROUPORD NUMBER,	-- 게시글 순서 (같은 그룹에서 표시할 순서)
	BDEPTH NUMBER		-- 게시글/댓글 구분 (게시글: 0, 댓글: 1 이상)
);

CREATE TABLE COMPANY(
	CNO NUMBER PRIMARY KEY,
	CNAME VARCHAR2(100) NOT NULL UNIQUE,
	CPHONE VARCHAR2(20),
	CADDRESS VARCHAR2(200)
--	,
--	CBANK VARCHAR2(100) NOT NULL,
--	CACCOUNTNUMBER VARCHAR2(100) NOT NULL,
--	CACCOUNTHOLDER VARCHAR2(30) NOT NULL
);

CREATE TABLE ORDERS(
	ONO NUMBER PRIMARY KEY,
	MID VARCHAR2(30) REFERENCES MEMBER (MID),
	OREGDATE DATE DEFAULT SYSDATE
);

CREATE TABLE PRODUCT(
	PNO NUMBER PRIMARY KEY,
	ONO	NUMBER REFERENCES ORDERS (ONO),
	CNO NUMBER REFERENCES COMPANY (CNO),
	PPRICE NUMBER DEFAULT -1,
	PREGDATE DATE DEFAULT SYSDATE,
	PSALE NUMBER DEFAULT 0
);


