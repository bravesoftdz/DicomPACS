DROP TABLE ASU.TRECIPE_DLO_EXP_LGOT CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_LGOT  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_LGOT
(
  FK_ID        NUMBER,
  C_KAT        VARCHAR2(5 BYTE),
  COD_122      VARCHAR2(5 BYTE),
  FC_NAME      VARCHAR2(300 BYTE),
  FP_LGOT      NUMBER,
  FL_NOZOLOGY  NUMBER(1)                        DEFAULT 0
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_LGOT IS '������� ��� �������� �����. Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.FK_ID IS '����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.C_KAT IS '��� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.COD_122 IS '��� ����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.FC_NAME IS '�������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.FP_LGOT IS '����� ������: ASU.PKG_DLO.cLGOT_RECIPE_LGOT_FED = 3, ASU.PKG_DLO.cLGOT_RECIPE_LGOT_REG=2'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LGOT.FL_NOZOLOGY IS '1 - ���������, 0 - ���'
/


--
-- TRECIPE_DLO_EXP_LGOT_COD  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_LGOT (Table)
--
CREATE INDEX ASU.TRECIPE_DLO_EXP_LGOT_COD ON ASU.TRECIPE_DLO_EXP_LGOT
(C_KAT, FP_LGOT)
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
-- TRECIPE_DLO_EXP_LGOT_FK_ID  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_LGOT (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_LGOT_FK_ID ON ASU.TRECIPE_DLO_EXP_LGOT
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
-- TRECIPE_DLO_EXP_LGOT_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_LGOT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_LGOT_INS" 
 BEFORE
  INSERT
 ON asu.trecipe_dlo_exp_lgot
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_EXP_LGOT.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;

