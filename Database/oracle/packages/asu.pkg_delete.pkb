DROP PACKAGE BODY ASU.PKG_DELETE
/

--
-- PKG_DELETE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DELETE" IS
-----------------------------------
-- Created  15.05.2006 by X-SIDE --
-- Modified 22.05.2006 by Xand   --
-----------------------------------
FUNCTION DELETE_FROM_TEPIKRIZ(PFK_ID IN NUMBER,pSotrId NUMBER) RETURN NUMBER IS
CURSOR cEPIK IS SELECT FK_ID FROM TEPIKRIZ WHERE FK_ID = PFK_ID AND FK_VRACHID = pSotrId;
BEGIN
  FOR C IN cEPIK LOOP
  UPDATE TEPIKRIZ
  SET FL_PODPIS = -10
  WHERE FK_ID = PFK_ID
  AND fk_vrachid=pSotrID;
  COMMIT;
  RETURN 0;
  END LOOP;
  RETURN 1;
END;

FUNCTION DELETE_FROM_VNAZ(PFK_ID IN NUMBER,pSotrId NUMBER) RETURN NUMBER IS
CURSOR cCHILDNAZ IS SELECT * FROM VNAZ WHERE FK_NAZOWNER = PFK_ID;
CURSOR cCHILDMED IS SELECT * FROM TNAZMED WHERE FK_OSMOTRID= PFK_ID;
CURSOR cCHILDDIAG IS SELECT * FROM TDIAG WHERE FK_NAZID = PFK_ID;
/*Modified by Spasskiy 12112008 �������� �������� �� FK_ISPOLID(���� FK_VRACHID)*/
CURSOR cVNAZ IS SELECT FK_ID FROM VNAZ WHERE FK_ID = PFK_ID AND FK_ISPOLID = pSotrId;
BEGIN
  FOR C IN cVNAZ LOOP
  DELETE FROM TPRIEMNAZ WHERE FK_PARENTID = PFK_ID;
  COMMIT;
  FOR C IN cCHILDNAZ LOOP
    UPDATE VNAZ SET FK_NAZOWNER = -1 WHERE FK_ID = C.FK_ID;
    INSERT INTO TPRIEMNAZ(FK_NAZID, FK_PARENTID, FK_STATE) VALUES(C.FK_ID, -1, C.FK_NAZSOSID);
  END LOOP;

  FOR A IN cCHILDMED LOOP
    UPDATE TNAZMED SET FK_OSMOTRID = -1 WHERE FK_ID = A.FK_ID;
    INSERT INTO TPRIEMNAZ(FK_NAZID, FK_PARENTID, FK_STATE) VALUES(A.FK_ID, -1, A.FK_STATE);
  END LOOP;

  -- ��� �������� ������� ���� ������� � ��������, ������������ � ������ ������� �������
  -- �� ������� ��������� �. � ������ ������ http://192.168.1.2:15000/redmine/issues/show/8484
  -- Kashira.O 06.12.2010
  FOR I IN cCHILDDIAG LOOP
    -- UPDATE TDIAG SET FK_NAZID = -1 WHERE FK_ID =I.FK_ID;
    DELETE ASU.TDIAG WHERE FK_ID =I.FK_ID;
  END LOOP;
  
  DELETE FROM VNAZ WHERE FK_ID = PFK_ID;
  COMMIT;
  RETURN 0;
  END LOOP;
  RETURN 1;
END;



   -- Enter further code below as specified in the Package spec.
END;
/

SHOW ERRORS;

