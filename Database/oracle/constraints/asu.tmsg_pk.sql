ALTER TABLE ASU.TMSG
  DROP CONSTRAINT TMSG_PK
/

-- 
-- Non Foreign Key Constraints for Table TMSG 
-- 
ALTER TABLE ASU.TMSG ADD (
  CONSTRAINT TMSG_PK
 PRIMARY KEY
 (FK_ID))
/
