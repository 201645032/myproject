--------------------------------------------------------
--  ������ ������ - �����-6��-01-2019   
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
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','1��','������','12:00',6000,28);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','2��','�����','13:00',6000,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','3��','��İ��','10:00',6000,30);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','4��','�����','11:00',6000,25);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','1��','������','18:30',6500,10);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','2��','�����','19:00',6500,8);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','3��','��İ��','19:30',6500,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�����','4��','�����','20:00',6500,25);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','1��','������','12:00',6000,20);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','2��','�����','13:00',6000,15);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','3��','��İ��','10:00',6000,28);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','4��','�����','11:00',6000,23);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','1��','������','18:30',6500,5);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','2��','�����','19:00',6500,8);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','3��','��İ��','19:30',6500,23);
Insert into HR.MOVIE (DAY,PLACE,NAME,TIME,PRICE,SEAT) values ('�Ͽ���','4��','�����','20:00',6500,1);
