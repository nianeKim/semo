drop table member;
-- 회원
CREATE TABLE member
(
	mno    NUMBER CONSTRAINT member_mno_PK PRIMARY KEY NOT NULL,
    id    VARCHAR2(12) NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    nick_nm    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(20) NOT NULL,
    gender    CHAR(2) default 'm' NOT NULL ,
    age    NUMBER(3) NOT NULL,
    loc    VARCHAR2(12) NOT NULL,
    del    CHAR(1) default 'n' NOT NULL ,
    reg_date    DATE NOT NULL
);
select * from member;

drop table display;
-- 전시
CREATE TABLE display -- fee에 default 추가
(
    dno    NUMBER CONSTRAINT display_dno_PK PRIMARY KEY NOT NULL,
    dname    VARCHAR2(50) NOT NULL,
    start_date    DATE NOT NULL,
    end_date    DATE NOT NULL,
    loc    VARCHAR2(50) NOT NULL,
    poster    BLOB NOT NULL,
    tag    VARCHAR2(10) NOT NULL,
    intro    VARCHAR2(500) NOT NULL,
    detail_img  BLOB,
    detail_txt VARCHAR2(1000),
    hours    DATE NOT NULL,
    fee    NUMBER(6) default 0,
    fee_adult   NUMBER(6),
    fee_teen    NUMBER(6),
    fee_child   NUMBER(6),
    discount    NUMBER(3),
    artist    VARCHAR2(20),
    tel    VARCHAR2(20),
    home_pg    VARCHAR2(100),
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint display_mno_fk references member NOT NULL
);
select * from display;

drop table bookmark;
-- 북마크
CREATE TABLE bookmark
(
    bm_no    NUMBER CONSTRAINT bookmark_bm_no_PK PRIMARY KEY NOT NULL,
    mno    NUMBER constraint bookmark_mno_fk references member NOT NULL,
    dno    NUMBER constraint bookmark_dno_fk references display NOT NULL
);
select * from bookmark;

drop table reservation;
-- 예매
CREATE TABLE reservation
(
    rs_no    NUMBER CONSTRAINT reservation_rs_no_PK PRIMARY KEY NOT NULL,
    cnt    NUMBER(4) NOT NULL,
    mno    NUMBER constraint reservation_mno_fk references member NOT NULL,
    dno    NUMBER constraint reservation_dno_fk references display NOT NULL
);
select * from reservation;

drop table review;

-- 한줄 리뷰
CREATE TABLE review -- likes, del 칼럼 추가
(
    rv_no    NUMBER CONSTRAINT review_rv_no_PK PRIMARY KEY NOT NULL,
    star_rate    NUMBER(1,1) NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    likes    NUMBER default 0 NOT NULL,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint review_mno_fk references member NOT NULL,
    dno    NUMBER constraint review_dno_fk references display NOT NULL
);
select * from review;

drop table board;
-- 게시판(스토리)
CREATE TABLE board
(
    bno    NUMBER CONSTRAINT board_bno_PK PRIMARY KEY NOT NULL,
    title    VARCHAR2(50) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint board_mno_fk references member NOT NULL
);
select * from board;

drop table reply;
-- 게시판에 댓글(답글 포함)
CREATE TABLE reply
(
    re_no    NUMBER CONSTRAINT reply_re_no_PK PRIMARY KEY NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    ref    NUMBER NOT NULL,
    ref_level    NUMBER NOT NULL,
    ref_step    NUMBER NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint reply_mno_fk references member NOT NULL,
    bno    NUMBER constraint reply_bno_fk references board NOT NULL
);
select * from reply;