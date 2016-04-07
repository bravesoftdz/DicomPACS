DROP FUNCTION ASU.GET_COUNT_INCOME_PERIOD_VID
/

--
-- GET_COUNT_INCOME_PERIOD_VID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   GET_PAC_VID_KODE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_INCOME_PERIOD_VID" 
  ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZNID IN NUMBER)
  RETURN  NUMBER IS
  CURSOR c IS SELECT COUNT(*) FROM TSROKY
              WHERE FK_PRYB=2 AND (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2) AND GET_PAC_VID_KODE(FK_PACID)=pFK_PRIZNID;
  i NUMBER;
BEGIN
  IF c%ISOPEN THEN
    CLOSE c;
  END IF;
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;

