--------------------------------------------------------
--  파일이 생성됨 - 토요일-6월-01-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MOVIE
--------------------------------------------------------

  CREATE TABLE "HR"."MOVIE" 
   (	"DAY" VARCHAR2(40 BYTE), 
	"PLACE" VARCHAR2(40 BYTE), 
	"NAME" VARCHAR2(40 BYTE), 
	"TIME" VARCHAR2(40 BYTE), 
	"PRICE" NUMBER(8,0), 
	"SEAT" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.MOVIE
SET DEFINE OFF;
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','1관','악인전','12:00',6000,28);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','2관','어벤져스','13:00',6000,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','3관','걸캅스','10:00',6000,30);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','4관','기생충','11:00',6000,25);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','1관','악인전','18:30',6500,10);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','2관','어벤져스','19:00',6500,8);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','3관','걸캅스','19:30',6500,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('토요일','4관','기생충','20:00',6500,25);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','1관','악인전','12:00',6000,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','2관','어벤져스','13:00',6000,15);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','3관','걸캅스','10:00',6000,28);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','4관','기생충','11:00',6000,23);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','1관','악인전','18:30',6500,5);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','2관','어벤져스','19:00',6500,8);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','3관','걸캅스','19:30',6500,23);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('일요일','4관','기생충','20:00',6500,1);
