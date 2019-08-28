-- ----------------------------
-- Table structure for date
-- ----------------------------
DROP TABLE IF EXISTS `userinform`;
CREATE TABLE `userinform`(
`StudentId` char(20) NOT NULL,
`Username`  varchar(20)  NOT NULL,
`Password`  VARCHAR(20) NOT NULL,
`Money`  NUMERIC(6,2) ,
`Schoolzone`  char(10) ,
`Telphone` char(20) ,
`Department` VARCHAR(40) ,
`Gradeyear` CHAR(10) ,
`remarks`  VARCHAR(40),
primary key (`StudentId`,`Username` )
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


DROP TABLE IF EXISTS `Bookinform`;
CREATE TABLE `Bookinform`(
`BookId`  varchar(30) NOT NULL,
`BookISBN` VARCHAR(20) NOT NULL,
`BookName` VARCHAR(30) NOT NULL,
`BookDescribe` VARCHAR(60)  NOT NULL,
`BookStatus` VARCHAR(30) NOT NULL,
`BookGrade` VARCHAR(30) NOT NULL,
`BookDepartment` VARCHAR(30) NOT NULL,
`BookImage` VARCHAR(30) NOT NULL,
`BookPrice`  NUMERIC(6,2) NOT NULL,
`Username`  varchar(20)  NOT NULL,
primary key (`BookId`),
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`(
`OrderId` varchar(30) NOT NULL,
`BookId`  varchar(30) NOT NULL,
`BuyerId`  char(20) NOT NULL,
`Ordermoney` NUMERIC(6,2) NOT NULL,
`Ordertime`  DATA NOT NULL,
`SalerId` char(20) NOT NULL,
primary key (`OrderId`,`BookId`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;



  DROP TABLE IF EXISTS `friendinform`;
  CREATE TABLE `friendinform`(
  `Myname` varchar(20) NOT NULL,
  `fUsername`  varchar(20)  NOT NULL,
  `fSchoolzone`  char(10) ,
  `fTelphone` char(20) ,
  `fDepartment` VARCHAR(40) ,
  `fGradeyear` CHAR(10) ,
  primary key ( `fUsername`,`Myname`)
  )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

   DROP TABLE IF EXISTS `SELECT_BOOK`
     CREATE TABLE `SELECT_BOOK`(
    `BookId`  varchar(30) NOT NULL,
    `BookStatus` VARCHAR(30) NOT NULL,
    `BookSellerId`  varchar(30) NOT NULL,
    `BookBuyerid` varchar(30) NOT NULL,
    primary key (`BookId`,`BookSellerId`,`BookBuyerid`),
     )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

DROP TABLE IF EXISTS `OrderSheet`;
CREATE TABLE `OrderSheet` (
	`OrderId`        varchar(30)  NOT NULL,          --订单编号
	`OrderDate`      varchar(30)  NOT NULL,          --订单时间
	`BookId`         varchar(30)  NOT NULL,          --书籍编号
	`BookSellerid`   varchar(20)  NOT NULL,          --卖家账号
	`BookBuyerid`    varchar(20)  NOT NULL,          --买家账号
	`BookStatus`     varchar(30)  NOT NULL,          --书籍状态
	`Ordermoney`     varchar(30)  NOT NULL,          --订单金额
	CONSTRAINT OrderSheetpk1 PRIMARY KEY (`OrderId`),
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


BookStatus:上架、未上架、售出。