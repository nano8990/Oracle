CREATE TABLE USERS
(
  USERID  VARCHAR2(30 BYTE)                     NOT NULL,
  NAME    VARCHAR2(100 BYTE)                    NOT NULL,
  GENDER  VARCHAR2(10 BYTE),
  CITY    VARCHAR2(30 BYTE)
);

INSERT INTO USERS VALUES('DJ','�赿��','FEMALE','ULSAN');

CREATE TABLE USERS_GIT
(
  USERID      VARCHAR2(100 BYTE),
  GITID       VARCHAR2(100 BYTE),
  GITADDRESS  VARCHAR2(100 BYTE)
);

INSERT INTO USERS_GIT VALUES('DJ','DONGJOON','WWW.GITHUB.COM/NANO8990');