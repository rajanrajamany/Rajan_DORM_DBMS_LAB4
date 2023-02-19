CREATE TABLE IF NOT EXISTS  product (
PRO_ID	INT PRIMARY KEY  AUTO_INCREMENT,
PRO_NAME	VARCHAR(20) NOT NULL DEFAULT "DUMMY",
PRO_DESC	VARCHAR(60),
CAT_ID	INT, 
FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);