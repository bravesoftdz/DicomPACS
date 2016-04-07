DROP PACKAGE BODY ASU.PKG_PACIENT
/

--
-- PKG_PACIENT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PACIENT" 
IS
PROCEDURE DO_DELETE_CONVOY(pFK_ID IN NUMBER) IS
BEGIN
  DELETE FROM TPACCONVOY WHERE FK_ID=pFK_ID;
END;
PROCEDURE DO_ADD_CONVOY(pFK_PACID IN NUMBER,pFK_CONVOYID IN NUMBER) IS
CURSOR c(pPacID NUMBER,pConvoyID NUMBER) IS SELECT FK_ID FROM TPACCONVOY WHERE FK_PACID=pPacID AND FK_CONVOYID=pConvoyID;
i NUMBER;
BEGIN
  OPEN c(pFK_PACID,pFK_CONVOYID);
  FETCH c INTO i;
  IF c%NOTFOUND THEN
    INSERT INTO TPACCONVOY (FK_PACID,FK_CONVOYID) VALUES (pFK_PACID,pFK_CONVOYID);
  END IF;
  CLOSE c;
END;
PROCEDURE DO_SPLIT_PUT(pFK_PACID IN NUMBER,pFC_PUT IN VARCHAR2) IS
i NUMBER;
s VARCHAR2(50);
BEGIN
  DELETE FROM TPUTS WHERE FK_PACID=pFK_PACID;
  IF pFC_PUT IS NOT NULL THEN
    FOR i IN 1..LENGTH(pFC_PUT) LOOP
      IF SUBSTR(pFC_PUT,i,1)=',' AND TRIM(s) IS NOT NULL THEN
        INSERT INTO TPUTS(FK_PACID,FC_PUT) VALUES(pFK_PACID,TRIM(s));
        s:=NULL;
      ELSIF SUBSTR(pFC_PUT,i,1)!=',' THEN
        s:=s||SUBSTR(pFC_PUT,i,1);
      END IF;
    END LOOP;
    IF TRIM(s) IS NOT NULL THEN
      INSERT INTO TPUTS(FK_PACID,FC_PUT) VALUES(pFK_PACID,TRIM(s));
    END IF;
  END IF;
END;

PROCEDURE DO_WRITE_IB(pFK_PACID IN NUMBER,pFK_IBID IN NUMBER,pFK_IBY IN NUMBER) IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  UPDATE TKARTA SET FK_IBID=pFK_IBID,FK_IBY=pFK_IBY WHERE FK_ID=pFK_PACID;
  COMMIT;
END;
END; -- Package Body PKG_PACIENT
/

SHOW ERRORS;


DROP SYNONYM BUH.PKG_PACIENT
/

--
-- PKG_PACIENT  (Synonym) 
--
--  Dependencies: 
--   PKG_PACIENT (Package Body)
--
CREATE SYNONYM BUH.PKG_PACIENT FOR ASU.PKG_PACIENT
/

