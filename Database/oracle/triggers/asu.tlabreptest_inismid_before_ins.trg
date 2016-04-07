DROP TRIGGER ASU.TLABREPTEST_INISMID_BEFORE_INS
/

--
-- TLABREPTEST_INISMID_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TLABREPTEST (Sequence)
--   TLABREPTEST_INISMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLABREPTEST_INISMID_BEFORE_INS" 
 BEFORE
  INSERT
 ON tlabreptest_inismid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF :NEW.FK_ID IS NULL THEN
    SELECT  SEQ_TLABREPTEST.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;

