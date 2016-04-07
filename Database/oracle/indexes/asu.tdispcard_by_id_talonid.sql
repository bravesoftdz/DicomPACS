DROP INDEX ASU.TDISPCARD_BY_ID_TALONID
/

--
-- TDISPCARD_BY_ID_TALONID  (Index) 
--
CREATE INDEX ASU.TDISPCARD_BY_ID_TALONID ON ASU.TDISPCARD
(FK_ID, FK_TALONID)
NOLOGGING
TABLESPACE INDX
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

