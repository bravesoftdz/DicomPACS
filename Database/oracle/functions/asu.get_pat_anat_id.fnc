DROP FUNCTION ASU.GET_PAT_ANAT_ID
/

--
-- GET_PAT_ANAT_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAT_ANAT_ID" 
  RETURN NUMBER
  IS --by aAdmin.exe
BEGIN
  Return 770611;
END;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_PAT_ANAT_ID TO PUBLIC
/
