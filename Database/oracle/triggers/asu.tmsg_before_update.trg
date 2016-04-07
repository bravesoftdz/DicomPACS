DROP TRIGGER ASU.TMSG_BEFORE_UPDATE
/

--
-- TMSG_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMISEXCH_BUF (Table)
--   TMISEXCH_TASKS (Table)
--   TMISEXCH_TASKS_USERS (Table)
--   TMSG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMSG_BEFORE_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TMSG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 nTmp NUMBER;
BEGIN
 SELECT COUNT(FK_USERID)
   INTO nTmp
   FROM TMISEXCH_TASKS_USERS, tmisexch_tasks
  WHERE tmisexch_tasks.fk_id = fk_taskid
    AND (FK_USERID = :NEW.FK_RECIEVER OR
        (FK_USERID = :NEW.FK_SENDER AND fl_bothdirections = 1));
 IF nTmp > 0 AND :NEW.FP_NEED_READ = 2 AND :NEW.FD_READ<>:OLD.FD_READ THEN
  INSERT INTO TMISEXCH_BUF
   (FC_TEXT, FK_OWNERUSER, FK_RECIPIENTUSER, FK_CLOBID, FD_DATECREATE, FL_NEED_READ)
  VALUES
   ('�������� ������ ' || TO_CHAR(:NEW.FD_READ, 'DD.MM.YYYY') || ' � ' ||
    TO_CHAR(:NEW.FD_READ, 'HH:MI') ||
    DECODE(:NEW.FC_READ_COMMENT,
           '',
           '',
           chr(13) || '�����������: ' || :NEW.FC_READ_COMMENT) || chr(13) ||
    '����� ��������: ' || :NEW.FC_TEXT,
    :NEW.FK_SENDER,
    :NEW.FK_RECIEVER,
    :NEW.FK_BLOB,
    :NEW.FD_SEND,
    :NEW.FP_NEED_READ);
 END IF;
END TMSG_BEFORE_INSERT;
/
SHOW ERRORS;

