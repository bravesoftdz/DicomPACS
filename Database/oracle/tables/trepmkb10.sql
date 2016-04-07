DROP TABLE ASU.TREPMKB10 CASCADE CONSTRAINTS
/

--
-- TREPMKB10  (Table) 
--
CREATE TABLE ASU.TREPMKB10
(
  FN_ROWNUM   VARCHAR2(6 BYTE),
  FC_CLASS    VARCHAR2(6 BYTE),
  FC_NAME     VARCHAR2(4000 BYTE),
  FC_MKB10    VARCHAR2(7 BYTE),
  FL_SHOWREP  NUMBER(1)                         DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TREPMKB10 IS '������� ���������� ��� ������ �� ���10'
/

COMMENT ON COLUMN ASU.TREPMKB10.FN_ROWNUM IS '����� �� �������'
/

COMMENT ON COLUMN ASU.TREPMKB10.FC_CLASS IS '�����'
/

COMMENT ON COLUMN ASU.TREPMKB10.FC_NAME IS '�������� ������'
/

COMMENT ON COLUMN ASU.TREPMKB10.FC_MKB10 IS '���������� �� ���-10'
/


DROP SYNONYM STAT.TREPMKB10
/

--
-- TREPMKB10  (Synonym) 
--
--  Dependencies: 
--   TREPMKB10 (Table)
--
CREATE SYNONYM STAT.TREPMKB10 FOR ASU.TREPMKB10
/

