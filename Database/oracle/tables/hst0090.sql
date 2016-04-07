ALTER TABLE ASU.HST0090
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.HST0090 CASCADE CONSTRAINTS
/

--
-- HST0090  (Table) 
--
CREATE TABLE ASU.HST0090
(
  FK_ID     NUMBER,
  NAME      VARCHAR2(255 BYTE),
  COUNTRY   VARCHAR2(255 BYTE),
  DATE_UPD  VARCHAR2(255 BYTE),
  DATE_INS  VARCHAR2(255 BYTE),
  CODE      VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.HST0090 IS '������� ������� ������������� � ���������� �������� DBF'
/

COMMENT ON COLUMN ASU.HST0090.FK_ID IS 'ASU.SEQ_HST0090'
/


--
-- K_HST0090_ID  (Index) 
--
--  Dependencies: 
--   HST0090 (Table)
--
CREATE UNIQUE INDEX ASU.K_HST0090_ID ON ASU.HST0090
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- HST0090_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   HST0090 (Table)
--
CREATE OR REPLACE TRIGGER ASU.HST0090_BEFORE_INSERT
  BEFORE INSERT
  ON ASU.HST0090   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
BEGIN
  SELECT ASU.SEQ_HST0090.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table HST0090 
-- 
ALTER TABLE ASU.HST0090 ADD (
  CONSTRAINT K_HST0090_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/
