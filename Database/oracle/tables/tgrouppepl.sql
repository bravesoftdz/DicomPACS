DROP TABLE ASU.TGROUPPEPL CASCADE CONSTRAINTS
/

--
-- TGROUPPEPL  (Table) 
--
CREATE TABLE ASU.TGROUPPEPL
(
  FK_ID    NUMBER                               NOT NULL,
  FC_NAME  VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
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

COMMENT ON COLUMN ASU.TGROUPPEPL.FK_ID IS 'SEQUENCE=[SEQ_TGROUPPEPL]'
/

COMMENT ON COLUMN ASU.TGROUPPEPL.FC_NAME IS '������������'
/


--
-- TGROUPPEPL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TGROUPPEPL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGROUPPEPL_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TGROUPPEPL   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TGROUPPEPL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

