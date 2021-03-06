--------------------------------------------------------
--  파일이 생성됨 - 화요일-6월-04-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MOVIEUSER
--------------------------------------------------------

  CREATE TABLE "HR"."MOVIEUSER" 
   (	"NAME" VARCHAR2(40 BYTE), 
	"ID" NUMBER(10,0), 
	"PW" VARCHAR2(40 BYTE), 
	"CALL" NUMBER(12,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.MOVIEUSER
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007036
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007036" ON "HR"."MOVIEUSER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table MOVIEUSER
--------------------------------------------------------

  ALTER TABLE "HR"."MOVIEUSER" MODIFY ("CALL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIEUSER" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIEUSER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIEUSER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
