CREATE TABLE board
(
    bno    NUMBER NOT NULL,
    title    VARCHAR2(50) NOT NULL,
    content    VARCHAR2 NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER NOT NULL,
    like    NUMBER NOT NULL,
    del    CHAR(1) NOT NULL,
    mno    VARCHAR2 NOT NULL
);

ALTER TABLE board
 ADD CONSTRAINT board_bno_PK PRIMARY KEY ( bno );


CREATE TABLE bookmark
(
    dno    NUMBER NOT NULL,
    mno    VARCHAR2 NOT NULL,
    bm_no    NUMBER NOT NULL
);

ALTER TABLE bookmark
 ADD CONSTRAINT bookmark_bm_no_PK PRIMARY KEY ( bm_no );


CREATE TABLE display
(
    dno    NUMBER NOT NULL,
    dname    VARCHAR2(50) NOT NULL,
    start_date    DATE NOT NULL,
    end_date    DATE NOT NULL,
    loc    VARCHAR2(50) NOT NULL,
    poster    BLOB NOT NULL,
    tag    VARCHAR2(10) NOT NULL,
    content    VARCHAR2 NOT NULL,
    hours    DATE NOT NULL,
    fee    NUMBER(6) NOT NULL,
    artist    VARCHAR2(20),
    tel    VARCHAR2(20),
    home_pg    VARCHAR2,
    mno    VARCHAR2 NOT NULL
);

ALTER TABLE display
 ADD CONSTRAINT display_dno_PK PRIMARY KEY ( dno );


CREATE TABLE member
(
    mno    VARCHAR2 NOT NULL,
    id    VARCHAR2(12) NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    nick_nm    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(20) NOT NULL,
    gender    CHAR(2) NOT NULL,
    age    NUMBER(3) NOT NULL,
    loc    VARCHAR2(12) NOT NULL,
    del    CHAR(1) NOT NULL,
    reg_date    DATE NOT NULL
);

ALTER TABLE member
 ADD CONSTRAINT member_mno_PK PRIMARY KEY ( mno );


CREATE TABLE reply
(
    re_no    NUMBER NOT NULL,
    content    VARCHAR2 NOT NULL,
    reg_date    DATE NOT NULL,
    ref    NUMBER NOT NULL,
    ref_level    NUMBER NOT NULL,
    ref_step    NUMBER NOT NULL,
    del    CHAR(1) NOT NULL,
    bno    NUMBER NOT NULL,
    mno    VARCHAR2 NOT NULL
);

ALTER TABLE reply
 ADD CONSTRAINT reply_re_no_PK PRIMARY KEY ( re_no );


CREATE TABLE reservation
(
    rs_no    NUMBER NOT NULL,
    cnt    NUMBER(4) NOT NULL,
    mno    VARCHAR2 NOT NULL,
    dno    NUMBER NOT NULL
);

ALTER TABLE reservation
 ADD CONSTRAINT reservation_rs_no_PK PRIMARY KEY ( rs_no );


CREATE TABLE review
(
    rv_no    NUMBER NOT NULL,
    star_rate    NUMBER(1,1) NOT NULL,
    content    VARCHAR2 NOT NULL,
    date    DATE NOT NULL,
    dno    NUMBER NOT NULL,
    mno    VARCHAR2 NOT NULL
);

ALTER TABLE review
 ADD CONSTRAINT review_rv_no_PK PRIMARY KEY ( rv_no );