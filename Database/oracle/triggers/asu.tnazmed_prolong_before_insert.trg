DROP TRIGGER ASU.TNAZMED_PROLONG_BEFORE_INSERT
/

--
-- TNAZMED_PROLONG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZMED_PROLONG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMED_PROLONG_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TNAZMED_PROLONG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF :NEW.FK_ID IS NULL THEN
    SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END TNAZMED_PROLONG_BEFORE_INSERT;
/
SHOW ERRORS;

