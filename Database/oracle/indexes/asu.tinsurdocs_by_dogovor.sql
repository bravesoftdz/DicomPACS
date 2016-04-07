DROP INDEX ASU.TINSURDOCS_BY_DOGOVOR
/

--
-- TINSURDOCS_BY_DOGOVOR  (Index) 
--
CREATE INDEX ASU.TINSURDOCS_BY_DOGOVOR ON ASU.TINSURDOCS
(FK_DOGOVORID)
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

