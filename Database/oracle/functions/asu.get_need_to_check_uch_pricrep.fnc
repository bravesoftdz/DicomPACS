DROP FUNCTION ASU.GET_NEED_TO_CHECK_UCH_PRICREP
/

--
-- GET_NEED_TO_CHECK_UCH_PRICREP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_NEED_TO_CHECK_UCH_PRICREP
  RETURN NUMBER DETERMINISTIC
  IS -- Created by -= aAdmin.exe =- 
     -- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
BEGIN
  Return 0;
END;
/

SHOW ERRORS;


DROP PUBLIC SYNONYM GET_NEED_TO_CHECK_UCH_PRICREP
/

--
-- GET_NEED_TO_CHECK_UCH_PRICREP  (Synonym) 
--
--  Dependencies: 
--   GET_NEED_TO_CHECK_UCH_PRICREP (Function)
--
CREATE PUBLIC SYNONYM GET_NEED_TO_CHECK_UCH_PRICREP FOR ASU.GET_NEED_TO_CHECK_UCH_PRICREP
/


GRANT EXECUTE ON ASU.GET_NEED_TO_CHECK_UCH_PRICREP TO PUBLIC
/
