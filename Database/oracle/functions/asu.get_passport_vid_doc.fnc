DROP FUNCTION ASU.GET_PASSPORT_VID_DOC
/

--
-- GET_PASSPORT_VID_DOC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_PASSPORT_VID_DOC
  RETURN NUMBER DETERMINISTIC
  IS -- Created by -= aAdmin.exe =- 
     -- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
BEGIN
  Return 86;
END;
/

SHOW ERRORS;


DROP PUBLIC SYNONYM GET_PASSPORT_VID_DOC
/

--
-- GET_PASSPORT_VID_DOC  (Synonym) 
--
--  Dependencies: 
--   GET_PASSPORT_VID_DOC (Function)
--
CREATE PUBLIC SYNONYM GET_PASSPORT_VID_DOC FOR ASU.GET_PASSPORT_VID_DOC
/


GRANT EXECUTE ON ASU.GET_PASSPORT_VID_DOC TO PUBLIC
/
