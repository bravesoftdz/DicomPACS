DROP INDEX ASU.TNAZLECH_BY_DATA_PACID
/

--
-- TNAZLECH_BY_DATA_PACID  (Index) 
--
CREATE UNIQUE INDEX ASU.TNAZLECH_BY_DATA_PACID ON ASU.TNAZLECH
(FK_PACID, FD_RUN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4480K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

