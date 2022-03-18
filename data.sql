/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/6/18 13:15:55                           */
/*==============================================================*/


drop table if exists BND;

drop table if exists COM;

drop table if exists ENT;

drop table if exists ORD;

drop table if exists PC;

drop table if exists SP;

drop table if exists SPY;

drop table if exists ST;

/*==============================================================*/
/* Table: BND                                                   */
/*==============================================================*/
create table BND
(
   BND_ID               varchar(16) not null,
   BND_N                varchar(16) not null,
   primary key (BND_ID)
);

/*==============================================================*/
/* Table: COM                                                   */
/*==============================================================*/
create table COM
(
   COM_ID               varchar(16) not null,
   COM_N                varchar(16),
   COM_SEX              varchar(16),
   primary key (COM_ID)
);

/*==============================================================*/
/* Table: ENT                                                   */
/*==============================================================*/
create table ENT
(
   ENT_ID               varchar(16) not null,
   ENT_N                varchar(16) not null,
   primary key (ENT_ID)
);

/*==============================================================*/
/* Table: ORD                                                   */
/*==============================================================*/
create table ORD
(
   ORD_ID               varchar(16) not null,
   ORD_TIME             date not null,
   PC_ID                varchar(16) not null,
   PC_N                 varchar(16) not null,
   PC_TP                varchar(16) not null,
   ORD_NUM              int not null,
   ST_N                 varchar(16) not null,
   ST_ID                varchar(16) not null,
   ST_ARS               varchar(16) not null,
   COM_ID               varchar(16),
   COM_N                varchar(16),
   COM_SEX              varchar(16),
   PC_ORD_P             float(20) not null,
   ORD_P                float(20) not null,
   primary key (ORD_ID)
);

/*==============================================================*/
/* Table: PC                                                    */
/*==============================================================*/
create table PC
(
   PC_ID                varchar(16) not null,
   PC_N                 varchar(16) not null,
   BND_ID               varchar(16) not null,
   BND_N                varchar(16) not null,
   PC_TP                varchar(16) not null,
   PC_TIME              date not null,
   PC_ORD_P             float(20) not null,
   PC_SP_P              float(20) not null,
   primary key (PC_ID)
);

/*==============================================================*/
/* Table: SP                                                    */
/*==============================================================*/
create table SP
(
   SPY_ID               varchar(16) not null,
   SPY_N                varchar(16) not null,
   primary key (SPY_ID)
);

/*==============================================================*/
/* Table: SPY                                                   */
/*==============================================================*/
create table SPY
(
   SP_ID                varchar(16) not null,
   SP_TIME              date not null,
   SPY_ID               varchar(16) not null,
   SPY_N                varchar(16) not null,
   ST_ID                varchar(16) not null,
   ST_N                 varchar(16) not null,
   ST_ARS               varchar(16) not null,
   PC_ID                varchar(16) not null,
   PC_N                 varchar(16) not null,
   PC_TP                varchar(16) not null,
   SP_NUM               int not null,
   PC_SP_P              float(20) not null,
   SP_P                 float(20) not null,
   primary key (SP_ID)
);

/*==============================================================*/
/* Table: ST                                                    */
/*==============================================================*/
create table ST
(
   ST_ID                varchar(16) not null,
   ENT_ID               varchar(16) not null,
   ST_N                 varchar(16) not null,
   ST_ARS               varchar(16) not null,
   primary key (ST_ID)
);

alter table ORD add constraint FK_Reference_3 foreign key (COM_ID)
      references COM (COM_ID) on delete restrict on update restrict;

alter table ORD add constraint FK_Reference_4 foreign key (ST_ID)
      references ST (ST_ID) on delete restrict on update restrict;

alter table ORD add constraint FK_Reference_5 foreign key (PC_ID)
      references PC (PC_ID) on delete restrict on update restrict;

alter table PC add constraint FK_OWN foreign key (BND_ID)
      references BND (BND_ID) on delete restrict on update restrict;

alter table SPY add constraint FK_Reference_6 foreign key (ST_ID)
      references ST (ST_ID) on delete restrict on update restrict;

alter table SPY add constraint FK_Reference_7 foreign key (SPY_ID)
      references SP (SPY_ID) on delete restrict on update restrict;

alter table ST add constraint FK_Reference_2 foreign key (ENT_ID)
      references ENT (ENT_ID) on delete restrict on update restrict;

/*==============================================================*/
/* INSERT                                            */
/*==============================================================*/
INSERT INTO bnd ( BND_ID,BND_N)
 VALUES
('KO','可口可乐'),
 ('WW','旺旺'),
 ('PE','百事可乐'),
 ('NS','农夫山泉'),
 ('TY','统一');

INSERT INTO com (COM_N,COM_ID,COM_SEX)
VALUES('COM01','潘国林','女'),
('COM02','卢雨桐','女'),
('COM03','曾丽','女'),
('COM04','黄滟','女'),
('COM05','卢彬彬','女'),
('COM06','简锦杰','男'),
('COM07','王海','男'),
('COM08','骆航','男'),
('COM09','胡少峰 ','男'),
('COM10','李服仪','男');

INSERT INTO ent (ENT_ID,ENT_N)
VALUES
('00','新世纪百货');

INSERT INTO pc (PC_ID,PC_N,BND_ID,PC_TP,PC_TIME,PC_ORD_P,PC_SP_P,BND_N)
VALUES 
('KO01','可口可乐','KO','饮料','2022-1-1',3.00,1.50,'可口可乐'),
('KO02','零度可乐','KO','饮料','2022-1-1',4.00,2.00,'可口可乐'),
('KO03','雪碧','KO','饮料','2022-1-1',3.00,1.50,'可口可乐'),
('KO04','芬达','KO','饮料','2022-1-1',3.00,1.50,'可口可乐'),
('KO05','冰露','KO','饮料','2022-1-1',1.00,0.40,'可口可乐'),
('KO06','纯悦','KO','饮料','2022-1-1',2.00,0.90,'可口可乐'),
('PE01','百事可乐','PE','饮料','2022-1-1',3.00,1.90,'百事可乐'),
('PE02','七喜','PE','饮料','2022-1-1',3.00,1.90,'百事可乐'),
('PE03','美年达','PE','饮料','2022-1-1',3.00,1.90,'百事可乐'),
('PE04','激浪','PE','饮料','2022-1-1',3.00,1.90,'百事可乐'),
('PE05','北冰洋','PE','饮料','2022-1-1',4.00,2.50,'百事可乐'),
('PE06','佳得乐','PE','饮料','2022-1-1',5.00,2.90,'百事可乐'),
('NS01','农夫山泉','NS','饮料','2022-1-1',2.00,0.90,'农夫山泉'),
('NS02','东方树叶','NS','饮料','2022-1-1',4.00,1.90,'农夫山泉'),
('NS03','菜π','NS','饮料','2022-1-1',5.00,2.90,'农夫山泉'),
('NS04','NFC果汁','NS','饮料','2022-1-1',8.00,3.90,'农夫山泉'),
('NS05','尖叫','NS','饮料','2022-1-1',4.00,1.90,'农夫山泉'),
('WW01','旺旺牛奶','WW','饮料','2022-1-1',5.00,1.90,'旺旺'),
('WW02','旺旺雪饼','WW','副食','2022-1-1',1.00,0.30,'旺旺'),
('WW03','旺旺碎冰冰','WW','副食','2022-1-1',1.00,0.30,'旺旺'),
('WW04','旺旺仙贝','WW','副食','2022-1-1',1.00,0.30,'旺旺'),
('WW05','旺旺泡芙','WW','副食','2022-1-1',1.00,0.30,'旺旺'),
('TY01','阿萨姆奶茶','TY','饮料','2022-1-1',4.00,2.30,'统一'),
('TY02','红烧牛肉面','TY','副食','2022-1-1',4.00,2.30,'统一'),
('TY03','老坛酸菜面','TY','饮料','2022-1-1',4.00,2.30,'统一');

INSERT INTO sp (SPY_ID,SPY_N)
VALUES
('SPY01','菜园坝批发站'),
('SPY02','万州批发站'),
('SPY03','开州批发站');

INSERT INTO st (ST_ID,ENT_ID,ST_N,ST_ARS)
VALUES
('ST01','00','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号'),
('ST02','00','新世纪百货(开州商都)','汉丰街道办事处开州大道88号'),
('ST03','00','新世纪百货(万州商都店)','重庆市万州区太白路2号');

INSERT INTO spy (SP_ID,SP_TIME,SPY_ID,SPY_N,ST_ID,ST_N,ST_ARS,PC_ID,PC_N,PC_TP,SP_NUM,PC_SP_P,SP_P)
VALUES
('SP001','2021-01-01','SPY01','菜园坝批发站','ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','KO01','可口可乐','饮料',1000,1.50,1500),
('SP002','2021-01-01','SPY01','菜园坝批发站','ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','KO02','零度可乐','饮料',1000,2.00,2000),
('SP003','2021-01-01','SPY01','菜园坝批发站','ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','KO03','雪碧','饮料',1000,1.50,1500),
('SP004','2021-01-01','SPY01','菜园坝批发站','ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','KO04','芬达','饮料',1000,1.50,1500),
('SP005','2021-01-01','SPY01','菜园坝批发站','ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','PE01','百事可乐','饮料',1000,1.90,1900),
('SP006','2021-01-01','SPY03','开州批发站','ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','PE01','百事可乐','饮料',1000,1.90,1900),
('SP007','2021-01-01','SPY03','开州批发站','ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','PE02','七喜','饮料',1000,1.90,1900),
('SP008','2021-01-01','SPY03','开州批发站','ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','PE03','美年达','饮料',1000,1.90,1900),
('SP009','2021-01-01','SPY03','开州批发站','ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','PE04','激浪','饮料',1000,1.90,1900),
('SP010','2021-01-01','SPY03','开州批发站','ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','PE06','佳得乐','饮料',1000,2.90,2900),
('SP011','2021-01-01','SPY02','万州批发站','ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','WW02','旺旺雪饼','副食',1000,0.30,300),
('SP012','2021-01-01','SPY02','万州批发站','ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','WW03','旺旺碎冰冰','副食',1000,0.30,300),
('SP013','2021-01-01','SPY02','万州批发站','ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','WW05','旺旺泡芙','副食',1000,0.30,300),
('SP014','2021-01-01','SPY02','万州批发站','ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','TY02','红烧牛肉面','副食',1000,2.30,2300),
('SP015','2021-01-01','SPY02','万州批发站','ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','TY03','老坛酸菜面','副食',1000,2.30,2300)
;

INSERT INTO ord(ORD_ID,ORD_TIME,PC_ID,PC_N,PC_TP,ORD_NUM,ST_N,ST_ID,ST_ARS,COM_ID,COM_N,COM_SEX,PC_ORD_P,ORD_P)
VALUES
('ORD01','2021-04-01','KO01','可口可乐','饮料',3,'ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','COM03','曾丽','女',3.00,9.00),
('ORD02','2021-04-01','KO02','零度可乐','饮料',3,'ST01','新世纪百货(世纪新都店)','重庆市江北区观音桥步行街7号','COM03','曾丽','女',4.00,12.00),
('ORD03','2021-04-01','PE01','百事可乐','饮料',5,'ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','COM01','潘国林','女',3.00,15.00),
('ORD04','2021-04-01','PE06','佳得乐','饮料',2,'ST02','新世纪百货(开州商都)','汉丰街道办事处开州大道88号','COM01','潘国林','女',5.00,10.00),
('ORD05','2021-04-01','WW02','旺旺雪饼','副食',20,'ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','COM10','李服仪','男',1.00,20.00),
('ORD06','2021-04-01','TY03','老坛酸菜面','副食',2,'ST03','新世纪百货(万州商都店)','重庆市万州区太白路2号','COM10','李服仪','男',4.00,8.00)
;