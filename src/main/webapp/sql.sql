-- 회원
drop table member;
CREATE TABLE member
(
	mno    NUMBER CONSTRAINT member_mno_PK PRIMARY KEY NOT NULL,
    id    VARCHAR2(12) NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    nick_nm    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(20) NOT NULL,
    gender    CHAR(2) default 'm' NOT NULL,
    age    NUMBER(3) NOT NULL,
    loc    VARCHAR2(12) NOT NULL,
    del    CHAR(1) default 'n' NOT NULL,
    reg_date    DATE NOT NULL
);
select * from member;
insert into member values (0, 'admin', '1234', '관리자', '관리자', '010-111-1111', 'f', 0,'0','n', sysdate) 

-- 전시
drop table display;
CREATE TABLE display
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
    fee    NUMBER(6),
    fee_adult   NUMBER(6),
    fee_teen    NUMBER(6),
    fee_child   NUMBER(6),
    discount    NUMBER(3) default 0,
    artist    VARCHAR2(20),
    tel    VARCHAR2(20),
    home_pg    VARCHAR2(100),
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint display_mno_fk references member NOT NULL
);
select * from display;

-- display column type 수정
alter table display modify(hours varchar2(20));
alter table display modify(fee number(6) default 0);
alter table display modify(fee_adult number(6) default 0);
alter table display modify(fee_teen number(6) default 0);
alter table display modify(fee_child number(6) default 0);

-- 북마크
drop table bookmark;
CREATE TABLE bookmark
(
    bm_no    NUMBER CONSTRAINT bookmark_bm_no_PK PRIMARY KEY NOT NULL,
    mno    NUMBER constraint bookmark_mno_fk references member NOT NULL,
    dno    NUMBER constraint bookmark_dno_fk references display NOT NULL
);
select * from bookmark;

-- 예매
drop table reservation;
CREATE TABLE reservation
(
    rs_no    NUMBER CONSTRAINT reservation_rs_no_PK PRIMARY KEY NOT NULL,
    cnt    NUMBER(4) default 0,
    cnt_adult    NUMBER(3) default 0,
    cnt_teen    NUMBER(3) default 0,
    cnt_child    NUMBER(3) default 0,
    mno    NUMBER constraint reservation_mno_fk references member NOT NULL,
    dno    NUMBER constraint reservation_dno_fk references display NOT NULL
);
select * from reservation;

-- 한줄 리뷰
drop table review;
CREATE TABLE review
(
    rv_no    NUMBER CONSTRAINT review_rv_no_PK PRIMARY KEY NOT NULL,
    star_rate    NUMBER(1,1) NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint review_mno_fk references member NOT NULL,
    dno    NUMBER constraint review_dno_fk references display NOT NULL
);
select * from review;

-- 게시판(스토리)
drop table board;
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

alter table board add(poster blob);

-- 게시판에 댓글(답글 포함)
drop table reply;
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