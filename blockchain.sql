CREATE TABLE BPS_BLOCK(
    BLOCKINDEX NUMBER NOT NULL,
    PREVIOUSHASH VARCHAR2 (100),
    TIMESTAMP VARCHAR2 (100),
    DATA VARCHAR2 (100),
    CURRENTHASH VARCHAR2 (100),
    PROOF NUMBER NOT NULL,
    CONSTRAINTS PK_BPS_BLOCK PRIMARY KEY(BLOCKINDEX)
);

insert into BPS_user(Name,Key,Balence)
values('������',1234,1000);

insert into BPS_BLOCK(BLOCKINDEX,PREVIOUSHASH,PROOF)
values(8,8,9);



INSERT INTO BPS_USERS(NAME, KEY, BALENCE) VALUES ('�赿��', '1335', 0);

SELECT * FROM BPS_BLOCK;

DROP TABLE BPS_BLOCK;

select * from BPS_BLOCK;