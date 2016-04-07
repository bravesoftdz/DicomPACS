DROP INDEX ASU.TSHABLON_I_FK_SMID_FK_VRACHID
/

--
-- TSHABLON_I_FK_SMID_FK_VRACHID  (Index) 
--
CREATE INDEX ASU.TSHABLON_I_FK_SMID_FK_VRACHID ON ASU.TSHABLON
(FK_SMID, FK_VRACHID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

