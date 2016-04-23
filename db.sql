/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : orclLink
Source Server Version : 100200
Source Host           : localhost:1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2016-04-22 09:54:44
*/


-- ----------------------------
-- Table structure for AUTHORITIES
-- ----------------------------
DROP TABLE "SCOTT"."AUTHORITIES";
CREATE TABLE "SCOTT"."AUTHORITIES" (
"ID" NUMBER NOT NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"DISPLAY_NAME" VARCHAR2(255 BYTE) NULL ,
"PERMISSIONS" VARCHAR2(255 BYTE) NULL ,
"PARENT_AUTHORITY_ID" NUMBER NULL ,
"URL" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AUTHORITIES
-- ----------------------------
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('15', null, '营销管理', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('16', 'chance', '营销机会管理', null, '15', '/chance/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('17', 'plan', '客户开发计划', null, '15', '/plan/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('18', null, '客户管理', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('19', 'customer', '客户信息管理', null, '18', '/customer/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('20', 'drain', '客户流失管理', null, '18', '/drain/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('21', null, '服务管理', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('22', 'service-create', '服务创建', null, '21', '/service/create');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('23', 'service-allot', '服务分配', null, '21', '/service/allot/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('24', 'service-deal', '服务处理', null, '21', '/service/deal/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('25', 'service-feedback', '服务反馈', null, '21', '/service/feedback/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('26', 'service-archive', '服务归档', null, '21', '/service/archive/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('27', null, '统计报表', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('28', 'report-pay', '客户贡献分析', null, '27', '/report/pay');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('29', 'report-consist', '客户构成分析', null, '27', '/report/consist');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('30', 'report-service', '客户服务分析', null, '27', '/report/service');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('31', 'report-drain', '客户流失分析', null, '27', '/report/drain');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('32', null, '基础数据', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('33', 'dict', '数据字典管理', null, '32', '/dict/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('34', 'product', '查询产品信息', null, '32', '/product/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('35', 'storage', '查询库存信息', null, '32', '/storage/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('36', null, '系统权限管理', null, null, '/');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('37', 'user', '系统用户管理', null, '36', '/user/list');
INSERT INTO "SCOTT"."AUTHORITIES" VALUES ('39', 'role', '角色管理', null, '36', '/role/list');

-- ----------------------------
-- Table structure for BONUS
-- ----------------------------
DROP TABLE "SCOTT"."BONUS";
CREATE TABLE "SCOTT"."BONUS" (
"ENAME" VARCHAR2(10 BYTE) NULL ,
"JOB" VARCHAR2(9 BYTE) NULL ,
"SAL" NUMBER NULL ,
"COMM" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of BONUS
-- ----------------------------

-- ----------------------------
-- Table structure for CONTACTS
-- ----------------------------
DROP TABLE "SCOTT"."CONTACTS";
CREATE TABLE "SCOTT"."CONTACTS" (
"ID" NUMBER NOT NULL ,
"MEMO" VARCHAR2(255 BYTE) NULL ,
"MOBILE" VARCHAR2(255 BYTE) NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"POSITION" VARCHAR2(255 BYTE) NULL ,
"SEX" VARCHAR2(255 BYTE) NULL ,
"TEL" VARCHAR2(255 BYTE) NULL ,
"CUSTOMER_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CONTACTS
-- ----------------------------
INSERT INTO "SCOTT"."CONTACTS" VALUES ('326', '超级联系人', '13912345678', 'enoch', 'CEO', '男', '999999', '213');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('327', '超级联系人', '13912345678', 'Mrs.Huang', 'CEO', '女', '666666', '213');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('257', null, null, '黄先生31', null, null, '13456789900', '256');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('259', null, null, '黄先生5', null, null, '13456789900', '258');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('328', '普通联系人', '124331', 'TempA1', '员工', '女', '11341234', '213');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('142', '英雄人物的名字', '13456789912', '杨倩', '技术经理', '女', '86789967', '141');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('155', null, null, '黄章2', null, null, '13456789900', '154');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('1', null, null, '丽丽', '开发部经理', '女', '13456789900', '2');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('2', null, null, '王自如', null, null, '13456778800', '3');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('3', '岳飞的好朋友', '13455667788', '黄先生', '开发部经理', '男', '86789988', '4');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('4', null, null, '付老师', null, null, '13456778900', '5');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('5', null, null, '陈雷', null, null, '51571522', '6');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('6', null, null, '宋红康', null, null, '13456789900', '7');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('8', '最牛逼的将领', '13999999998', '岳飞', '大帅', '男', '010-99999999', '4');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('332', '普通联系人', '124331', 'enochlj', '员工', '男', '11341234', '213');
INSERT INTO "SCOTT"."CONTACTS" VALUES ('416', null, null, '黄先生1', null, null, '16576576123', '415');

-- ----------------------------
-- Table structure for COUNTRIES
-- ----------------------------
DROP TABLE "SCOTT"."COUNTRIES";
CREATE TABLE "SCOTT"."COUNTRIES" (
"COUNTRY_ID" CHAR(2 BYTE) NOT NULL ,
"COUNTRY_NAME" VARCHAR2(40 BYTE) NULL ,
"REGION_ID" NUMBER NULL ,
PRIMARY KEY ("COUNTRY_ID")
)
ORGANIZATION INDEX NOLOGGING NOCOMPRESS PCTTHRESHOLD 50 

;

-- ----------------------------
-- Records of COUNTRIES
-- ----------------------------
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('AR', 'Argentina', '2');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('AU', 'Australia', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('BE', 'Belgium', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('BR', 'Brazil', '2');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('CA', 'Canada', '2');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('CH', 'Switzerland', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('CN', 'China', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('DE', 'Germany', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('DK', 'Denmark', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('EG', 'Egypt', '4');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('FR', 'France', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('HK', 'HongKong', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('IL', 'Israel', '4');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('IN', 'India', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('IT', 'Italy', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('JP', 'Japan', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('KW', 'Kuwait', '4');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('MX', 'Mexico', '2');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('NG', 'Nigeria', '4');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('NL', 'Netherlands', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('SG', 'Singapore', '3');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('UK', 'United Kingdom', '1');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('US', 'United States of America', '2');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('ZM', 'Zambia', '4');
INSERT INTO "SCOTT"."COUNTRIES" VALUES ('ZW', 'Zimbabwe', '4');

-- ----------------------------
-- Table structure for CUSTOMER_ACTIVITIES
-- ----------------------------
DROP TABLE "SCOTT"."CUSTOMER_ACTIVITIES";
CREATE TABLE "SCOTT"."CUSTOMER_ACTIVITIES" (
"ID" NUMBER NOT NULL ,
"ACTIVITY_DATE" DATE NULL ,
"DESCRIPTION" VARCHAR2(255 BYTE) NULL ,
"PLACE" VARCHAR2(255 BYTE) NULL ,
"TITLE" VARCHAR2(255 BYTE) NULL ,
"CUSTOMER_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CUSTOMER_ACTIVITIES
-- ----------------------------
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('378', TO_DATE('2016-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Happy~~~', '上海', '看电影', '154');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('382', TO_DATE('2016-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '你画我猜', '十堰', '玩游戏', '154');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('377', TO_DATE('2016-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '很开心~~~', '武汉', 'K歌', '154');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('380', TO_DATE('2016-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '风景好美~', '深圳', '看世界之窗', '213');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('385', TO_DATE('2016-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '结果没遇到野人', '十堰', '观赏神农架林区', '213');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('376', TO_DATE('2016-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '交谈愉快', '北京', '会面', '154');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('379', TO_DATE('2016-01-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '还可以', '北京', '观看电影--美人鱼', '154');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('384', TO_DATE('2016-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '武当山~~~', '十堰', '爬山', '213');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('2', TO_DATE('2013-12-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '认识了魅族的老总-郭靖', '北京北体体育场', '手机发展论坛2', '4');
INSERT INTO "SCOTT"."CUSTOMER_ACTIVITIES" VALUES ('3', TO_DATE('2014-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '意向 10000W 的大单', '大连富丽华酒店', 'PARTY', '2');

-- ----------------------------
-- Table structure for CUSTOMER_DRAINS
-- ----------------------------
DROP TABLE "SCOTT"."CUSTOMER_DRAINS";
CREATE TABLE "SCOTT"."CUSTOMER_DRAINS" (
"ID" NUMBER(19) NOT NULL ,
"DELAY" VARCHAR2(255 CHAR) NULL ,
"DRAIN_DATE" TIMESTAMP(6)  NULL ,
"LAST_ORDER_DATE" TIMESTAMP(6)  NULL ,
"REASON" VARCHAR2(255 CHAR) NULL ,
"STATUS" VARCHAR2(255 CHAR) NULL ,
"CUSTOMER_ID" NUMBER(19) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CUSTOMER_DRAINS
-- ----------------------------
INSERT INTO "SCOTT"."CUSTOMER_DRAINS" VALUES ('395', null, TO_TIMESTAMP(' 2016-02-22 20:27:43:364000', 'YYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP(' 2014-02-01 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'ccccccccccccccccccccc', '流失', '141');
INSERT INTO "SCOTT"."CUSTOMER_DRAINS" VALUES ('396', '周五约着打高尔夫球', null, TO_TIMESTAMP(' 2015-12-28 13:30:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '流失预警', '4');

-- ----------------------------
-- Table structure for CUSTOMER_SERVICES
-- ----------------------------
DROP TABLE "SCOTT"."CUSTOMER_SERVICES";
CREATE TABLE "SCOTT"."CUSTOMER_SERVICES" (
"ID" NUMBER(19) NOT NULL ,
"ALLOT_DATE" DATE NULL ,
"CREATE_DATE" DATE NULL ,
"DEAL_DATE" DATE NULL ,
"DEAL_RESULT" VARCHAR2(255 CHAR) NULL ,
"SATISFY" VARCHAR2(255 CHAR) NULL ,
"SERVICE_DEAL" VARCHAR2(255 CHAR) NULL ,
"SERVICE_REQUEST" VARCHAR2(255 CHAR) NULL ,
"SERVICE_STATE" VARCHAR2(255 CHAR) NULL ,
"SERVICE_TITLE" VARCHAR2(255 CHAR) NULL ,
"SERVICE_TYPE" VARCHAR2(255 CHAR) NULL ,
"ALLOT_ID" NUMBER(19) NULL ,
"CREATED_ID" NUMBER(19) NULL ,
"CUSTOMER_ID" NUMBER(19) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CUSTOMER_SERVICES
-- ----------------------------
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('360', TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-29 21:09:07', 'YYYY-MM-DD HH24:MI:SS'), 'PASS', '☆☆☆☆☆', '99999999999999999999999999999999999999999999', 'sdfsadfsa', '已归档', 'AAPLUs2', '投诉', '21', '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('363', TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, 'DONEDONE!!!', 'jhvjhvjjvgjh', '已处理', 'AAPLUs4', '咨询', '21', '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('368', null, TO_DATE('2015-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, 'fsgsafgs', '新创建', 'AAPLUs3', '咨询', null, '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('369', null, TO_DATE('2016-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, 'safgsdfg', '新创建', 'BBPLUs', '咨询', null, '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('359', TO_DATE('2016-01-31 15:05:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, 'AAPLUs', '已分配', 'AAPLUs', '咨询', null, '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('361', TO_DATE('2016-02-01 18:45:42', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, 'asdfgvsfgsdg', '已分配', 'AAPLUs3', '建议', '209', '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('373', TO_DATE('2016-02-29 21:04:39', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, 'FAQ', '已分配', '新买的WENGER包有色差，请求退货', '建议', '212', '21', '7');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('365', TO_DATE('2016-02-01 18:45:34', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-01 18:45:58', 'YYYY-MM-DD HH24:MI:SS'), null, null, 'BINGO~~~~', 'dsafgsdfgds', '已处理', 'AAPLUs3', '建议', '205', '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('240', TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '收到', '☆☆☆☆☆', 'OK。 以安排', '每次送货后, 请电话通知下. ', '已归档', '送货后, 电话通知下', '建议', '24', '24', '2');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('220', TO_DATE('2016-03-09 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-03-01 08:56:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-03-28 06:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'AAA', '☆☆☆☆☆', '一台以上即可打折', '团购多少才能打折优惠啊 ?', '已归档', '团购打折', '咨询', '24', '24', '154');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('221', TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2014-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '已经就此道歉', '☆☆☆☆', '开除了。', '你们的 52 号客服的很不耐烦感觉', '已归档', '服务态度', '投诉', '24', '24', '4');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('371', null, TO_DATE('2016-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null, '不要又模糊的回答!', '新创建', 'iphone7预计什么时候上市?', '咨询', null, '21', '213');
INSERT INTO "SCOTT"."CUSTOMER_SERVICES" VALUES ('372', TO_DATE('2016-01-31 19:41:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-01 18:44:49', 'YYYY-MM-DD HH24:MI:SS'), null, null, 'Pretty GOOD!!!', '请全面分析!!!', '已处理', 'macbook pro和surface pro哪个更值得入手?', '咨询', '21', '21', '6');

-- ----------------------------
-- Table structure for CUSTOMERS
-- ----------------------------
DROP TABLE "SCOTT"."CUSTOMERS";
CREATE TABLE "SCOTT"."CUSTOMERS" (
"ID" NUMBER NOT NULL ,
"ADDRESS" VARCHAR2(255 BYTE) NULL ,
"BANK" VARCHAR2(255 BYTE) NULL ,
"BANK_ACCOUNT" VARCHAR2(255 BYTE) NULL ,
"BANKROLL" NUMBER NULL ,
"CHIEF" VARCHAR2(255 BYTE) NULL ,
"CREDIT" VARCHAR2(255 BYTE) NULL ,
"FAX" VARCHAR2(255 BYTE) NULL ,
"LICENCE_NO" VARCHAR2(255 BYTE) NULL ,
"LOCAL_TAX_NO" VARCHAR2(255 BYTE) NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"NATIONAL_TAX_NO" VARCHAR2(255 BYTE) NULL ,
"NO" VARCHAR2(255 BYTE) NULL ,
"REGION" VARCHAR2(255 BYTE) NULL ,
"SATIFY" VARCHAR2(255 BYTE) NULL ,
"STATE" VARCHAR2(255 BYTE) NULL ,
"TEL" VARCHAR2(255 BYTE) NULL ,
"TURNOVER" NUMBER NULL ,
"WEBSIT" VARCHAR2(255 BYTE) NULL ,
"ZIP" VARCHAR2(255 BYTE) NULL ,
"MANAGER_ID" NUMBER NULL ,
"CUSTOMER_LEVEL" VARCHAR2(255 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CUSTOMERS
-- ----------------------------
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('213', null, null, null, null, null, '☆☆☆☆', null, null, null, '雷布斯', null, '1be80b6d-d240-4b4f-81f6-b7fd7936addc', '武汉', '★★★', '正常', null, null, null, null, '326', '大客户');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('256', null, null, null, null, null, null, null, null, null, '原配件', null, 'bd35f58f-1f96-420b-b8ca-eecd4d28d741', '深圳', null, '正常', null, null, null, null, null, null);
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('258', null, null, null, null, null, null, null, null, null, 'Tech', null, '4b9e9113-d0b7-4e14-97e8-c32f6fef4c80', '十堰', null, '正常', null, null, null, null, null, null);
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('141', 'e世界', '建设银行CCB', 'YX900987677855400', '10', 'Tech', '☆☆', '010-22345678', 'YYZZ-ZX908765545', 'DS-67Y666', '周教主', 'GS-78X00YY', 'e9852130-84fd-495c-a1d7-cb357f1ee399', '武汉', '★★★★', '流失', '86789966', '300000', 'www.hlj.cn', '100001', '142', '战略合作伙伴');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('154', '大连沙河口区', '建设银行', 'YX900987677855400', '10000', '尚硅谷', '☆☆☆☆☆', '010-22345678', 'YYZZ-ZX908765545', 'DS-67Y655', '魅族科技', 'GS-78X00ZZ', '95d687fd-382d-4bad-87d2-6be7a7c57d04', '北京', '★★★★★', '流失', '86789967', '300000', 'www.atguigu.com', '100001', '155', '战略合作伙伴');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('2', '大连沙河口区', '农业银行', 'YX900987677855466', '10000', '陈雷', '☆☆☆☆', '0411-89789901', 'YYZZ-ZX908765544', 'DS-67Y655', '大连重工', 'GS-78X00ZZ', 'dcbc0726-4632-409c-ae27-80e2e8f8be2c', '十堰', '★★★', '正常', '0411-89789900', '900', 'www.atguigu.com', '160000', '1', '大客户');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('3', '北京海龙电子城', '农业银行', 'YX900987677855488', '20000', '尚硅谷', '☆☆☆☆☆', '010-22345678', 'YYZZ-ZX908765599', 'DS-67Y677', '恒大电脑', 'GS-78X00YY', '1f2e93e7-9514-4a88-b7db-b35ace6343b1', '北京', '★★★★★', '删除', '010-12345678', '800', 'www.atguigu.com', '100001', '2', '战略合作伙伴');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('4', 'e世界', '建设银行', 'YX900987677855400', '10', 'enoch', '☆', '010-98765432', 'YYZZ-ZX908765545', 'DS-67Y699', 'UJump', 'GS-78X00OO', 'edf8f801-7fd5-4ebb-9660-6c115de36c87', '北京', '★', '流失预警', '010-98765433', '300000', 'www.atguigu.com', '100001', '3', '合作伙伴');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('5', null, null, null, null, null, '☆☆☆', null, null, null, 'Havard', null, '9a94dfcb-38b0-4e79-ae96-08f19da9f0f1', '武汉', '★★', '正常', null, null, null, null, '4', '普通客户');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('6', null, null, null, null, null, null, null, null, null, '新浪', null, 'ff704114-40cc-41c3-b30a-853f322eae9e', '天津', null, '删除', null, null, null, null, null, null);
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('7', 'e世界', '建设银行', 'YX900987677855400', '10', '尚硅谷', '☆', '010-22345678', 'YYZZ-ZX908765544', 'DS-67Y655', '腾讯', 'GS-78X00OO', '5baaf7e3-556c-42cf-bb2a-b00964dad13a', '上海', '★', '正常', '86789966', '300000', 'www.atguigu.com', '100001', '6', '普通客户');
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('415', null, null, null, null, null, null, null, null, null, 'adfsafgsfg', null, '91aa856a-43b2-42a5-b0be-319e23586d42', null, null, '正常', null, null, null, null, null, null);
INSERT INTO "SCOTT"."CUSTOMERS" VALUES ('254', null, null, null, null, null, '☆☆☆', null, null, null, 'IPHONE6S-SALES', null, 'a127fb9d-b205-485a-aa82-72ed106b216c', '武汉', '★★★★', '正常', null, null, null, null, null, '普通客户');

-- ----------------------------
-- Table structure for DEPARTMENTS
-- ----------------------------
DROP TABLE "SCOTT"."DEPARTMENTS";
CREATE TABLE "SCOTT"."DEPARTMENTS" (
"DEPARTMENT_ID" NUMBER(4) NOT NULL ,
"DEPARTMENT_NAME" VARCHAR2(30 BYTE) NOT NULL ,
"MANAGER_ID" NUMBER(6) NULL ,
"LOCATION_ID" NUMBER(4) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of DEPARTMENTS
-- ----------------------------
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('10', 'Administration', '200', '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('20', 'Marketing', '201', '1800');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('50', 'Shipping', '124', '1500');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('60', 'IT', '103', '1400');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('80', 'Sales', '149', '2500');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('90', 'Executive', '100', '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('110', 'Accounting', '205', '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('190', 'Contracting', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('30', 'Purchasing', '114', '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('40', 'Human Resources', '203', '2400');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('70', 'Public Relations', '204', '2700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('100', 'Finance', '108', '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('120', 'Treasury', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('130', 'Corporate Tax', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('140', 'Control And Credit', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('150', 'Shareholder Services', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('160', 'Benefits', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('170', 'Manufacturing', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('180', 'Construction', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('200', 'Operations', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('210', 'IT Support', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('220', 'NOC', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('230', 'IT Helpdesk', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('240', 'Government Sales', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('250', 'Retail Sales', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('260', 'Recruiting', null, '1700');
INSERT INTO "SCOTT"."DEPARTMENTS" VALUES ('270', 'Payroll', null, '1700');

-- ----------------------------
-- Table structure for DEPT
-- ----------------------------
DROP TABLE "SCOTT"."DEPT";
CREATE TABLE "SCOTT"."DEPT" (
"ID" NUMBER(4) NOT NULL ,
"NAME" VARCHAR2(30 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of DEPT
-- ----------------------------
INSERT INTO "SCOTT"."DEPT" VALUES ('10', 'Administration');
INSERT INTO "SCOTT"."DEPT" VALUES ('20', 'Marketing');
INSERT INTO "SCOTT"."DEPT" VALUES ('50', 'Shipping');
INSERT INTO "SCOTT"."DEPT" VALUES ('60', 'IT');
INSERT INTO "SCOTT"."DEPT" VALUES ('80', 'Sales');
INSERT INTO "SCOTT"."DEPT" VALUES ('90', 'Executive');
INSERT INTO "SCOTT"."DEPT" VALUES ('110', 'Accounting');
INSERT INTO "SCOTT"."DEPT" VALUES ('190', 'Contracting');
INSERT INTO "SCOTT"."DEPT" VALUES ('30', 'Purchasing');
INSERT INTO "SCOTT"."DEPT" VALUES ('40', 'Human Resources');
INSERT INTO "SCOTT"."DEPT" VALUES ('70', 'Public Relations');
INSERT INTO "SCOTT"."DEPT" VALUES ('100', 'Finance');
INSERT INTO "SCOTT"."DEPT" VALUES ('120', 'Treasury');
INSERT INTO "SCOTT"."DEPT" VALUES ('130', 'Corporate Tax');
INSERT INTO "SCOTT"."DEPT" VALUES ('140', 'Control And Credit');
INSERT INTO "SCOTT"."DEPT" VALUES ('150', 'Shareholder Services');
INSERT INTO "SCOTT"."DEPT" VALUES ('160', 'Benefits');
INSERT INTO "SCOTT"."DEPT" VALUES ('170', 'Manufacturing');
INSERT INTO "SCOTT"."DEPT" VALUES ('180', 'Construction');
INSERT INTO "SCOTT"."DEPT" VALUES ('200', 'Operations');
INSERT INTO "SCOTT"."DEPT" VALUES ('210', 'IT Support');
INSERT INTO "SCOTT"."DEPT" VALUES ('220', 'NOC');
INSERT INTO "SCOTT"."DEPT" VALUES ('230', 'IT Helpdesk');
INSERT INTO "SCOTT"."DEPT" VALUES ('240', 'Government Sales');
INSERT INTO "SCOTT"."DEPT" VALUES ('250', 'Retail Sales');
INSERT INTO "SCOTT"."DEPT" VALUES ('260', 'Recruiting');
INSERT INTO "SCOTT"."DEPT" VALUES ('270', 'Payroll');

-- ----------------------------
-- Table structure for DICTS
-- ----------------------------
DROP TABLE "SCOTT"."DICTS";
CREATE TABLE "SCOTT"."DICTS" (
"ID" NUMBER NOT NULL ,
"EDITABLE" NUMBER NULL ,
"ITEM" VARCHAR2(255 BYTE) NULL ,
"TYPE" VARCHAR2(255 BYTE) NULL ,
"VALUE" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of DICTS
-- ----------------------------
INSERT INTO "SCOTT"."DICTS" VALUES ('370', '0', '武汉', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('8', '0', '★', '满意度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('9', '0', '★★', '满意度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('10', '0', '★★★', '满意度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('11', '0', '★★★★', '满意度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('12', '0', '★★★★★', '满意度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('13', '0', '☆', '信用度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('14', '0', '☆☆', '信用度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('15', '0', '☆☆☆', '信用度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('16', '0', '☆☆☆☆', '信用度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('17', '0', '☆☆☆☆☆', '信用度', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('18', '0', '北京', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('19', '0', '上海', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('20', '0', '广州', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('21', '0', '深圳', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('22', '0', '香港', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('28', '0', '辽宁', '地区', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('23', '0', '普通客户', '客户等级', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('24', '0', '大客户', '客户等级', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('25', '0', '重点开发客户', '客户等级', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('26', '0', '合作伙伴', '客户等级', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('27', '0', '战略合作伙伴', '客户等级', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('31', '0', '咨询', '服务类型', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('29', '0', '投诉', '服务类型', null);
INSERT INTO "SCOTT"."DICTS" VALUES ('30', '0', '建议', '服务类型', null);

-- ----------------------------
-- Table structure for EMPLOYEES
-- ----------------------------
DROP TABLE "SCOTT"."EMPLOYEES";
CREATE TABLE "SCOTT"."EMPLOYEES" (
"EMPLOYEE_ID" NUMBER(6) NOT NULL ,
"FIRST_NAME" VARCHAR2(20 BYTE) NULL ,
"LAST_NAME" VARCHAR2(25 BYTE) NOT NULL ,
"EMAIL" VARCHAR2(25 BYTE) NOT NULL ,
"PHONE_NUMBER" VARCHAR2(20 BYTE) NULL ,
"HIRE_DATE" DATE NOT NULL ,
"JOB_ID" VARCHAR2(10 BYTE) NOT NULL ,
"SALARY" NUMBER(8,2) NULL ,
"COMMISSION_PCT" NUMBER(2,2) NULL ,
"MANAGER_ID" NUMBER(6) NULL ,
"DEPARTMENT_ID" NUMBER(4) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of EMPLOYEES
-- ----------------------------
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('100', 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('1987-06-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AD_PRES', '24440', null, null, '90');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('1989-09-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AD_VP', '17170', null, '100', '90');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('1993-01-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AD_VP', '17170', null, '100', '90');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('1990-01-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '9270', null, '102', '60');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('1991-05-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '6180', null, '103', '60');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', TO_DATE('1999-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '4410', null, '103', '60');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', TO_DATE('1999-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', '5974', null, '100', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', TO_DATE('1995-10-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3675', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', TO_DATE('1997-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3255', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', TO_DATE('1998-03-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2730', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', TO_DATE('1998-07-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2625', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', TO_DATE('2000-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '10817.10', '0.20', '100', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', TO_DATE('1996-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '11556.60', '0.30', '149', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', TO_DATE('1998-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '8946.58', '0.20', '149', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', TO_DATE('1999-05-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7210', '0.15', '149', null);
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', TO_DATE('1987-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AD_ASST', '4620', null, '101', '10');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', TO_DATE('1996-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'MK_MAN', '13260', null, '100', '20');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', TO_DATE('1997-08-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'MK_REP', '6180', null, '201', '20');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', TO_DATE('1994-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AC_MGR', '12240', null, '101', '110');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', TO_DATE('1994-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AC_ACCOUNT', '8549', null, '205', '110');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', TO_DATE('1997-06-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '4800', null, '103', '60');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', TO_DATE('1998-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '4800', null, '103', '60');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', TO_DATE('1994-08-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'FI_MGR', '12000', null, '101', '100');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', TO_DATE('1994-08-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', '9000', null, '108', '100');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('110', 'John', 'Chen', 'JCHEN', '515.124.4269', TO_DATE('1997-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', '8200', null, '108', '100');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', TO_DATE('1998-03-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', '7800', null, '108', '100');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', TO_DATE('1994-12-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_MAN', '11000', null, '100', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', TO_DATE('1995-05-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', '3100', null, '114', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', TO_DATE('1997-12-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', '2900', null, '114', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', TO_DATE('1997-07-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', '2800', null, '114', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', TO_DATE('1998-11-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', '2600', null, '114', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', TO_DATE('1999-08-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', '2500', null, '114', '30');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', TO_DATE('1996-07-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', '8000', null, '100', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', TO_DATE('1997-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', '8200', null, '100', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', TO_DATE('1995-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', '7900', null, '100', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', TO_DATE('1997-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', '6500', null, '100', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', TO_DATE('1997-07-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3200', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', TO_DATE('1998-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2700', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', TO_DATE('1999-01-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2400', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', TO_DATE('2000-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2200', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', TO_DATE('1997-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3300', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', TO_DATE('1997-10-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2800', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', TO_DATE('1997-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2500', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', TO_DATE('1999-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2100', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', TO_DATE('1996-06-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3300', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', TO_DATE('1998-08-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2900', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', TO_DATE('1999-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2400', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', TO_DATE('2000-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2200', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', TO_DATE('1995-07-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3600', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', TO_DATE('1997-10-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '3200', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('139', 'John', 'Seo', 'JSEO', '650.121.2019', TO_DATE('1998-02-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2700', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', TO_DATE('1998-04-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '2500', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', TO_DATE('1996-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '14000', '0.40', '100', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', TO_DATE('1997-01-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '13500', '0.30', '100', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', TO_DATE('1997-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '12000', '0.30', '100', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', TO_DATE('1999-10-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '11000', '0.30', '100', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', TO_DATE('1997-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '10000', '0.30', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', TO_DATE('1997-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9500', '0.25', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', TO_DATE('1997-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9000', '0.25', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', TO_DATE('1998-03-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '8000', '0.20', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', TO_DATE('1998-12-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7500', '0.20', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', TO_DATE('1999-11-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7000', '0.15', '145', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', TO_DATE('1996-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '10000', '0.35', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', TO_DATE('1996-03-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9500', '0.35', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', TO_DATE('1996-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9000', '0.35', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', TO_DATE('1997-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '8000', '0.30', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', TO_DATE('1997-12-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7500', '0.30', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', TO_DATE('1998-11-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7000', '0.25', '146', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', TO_DATE('1997-11-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '10500', '0.25', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', TO_DATE('1999-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9500', '0.15', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', TO_DATE('2000-01-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7200', '0.10', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', TO_DATE('2000-02-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '6800', '0.10', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', TO_DATE('2000-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '6400', '0.10', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', TO_DATE('2000-04-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '6200', '0.10', '147', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', TO_DATE('1997-03-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '11500', '0.25', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', TO_DATE('1998-03-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '10000', '0.20', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', TO_DATE('1998-01-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '9600', '0.20', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', TO_DATE('1999-02-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7400', '0.15', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', TO_DATE('1999-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '7300', '0.15', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', TO_DATE('2000-04-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '6100', '0.10', '148', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', TO_DATE('1997-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '8800', '0.25', '149', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', TO_DATE('1998-04-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '8400', '0.20', '149', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', TO_DATE('2000-01-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '6200', '0.10', '149', '80');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', TO_DATE('1998-01-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3200', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', TO_DATE('1998-02-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3100', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', TO_DATE('1999-06-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2500', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', TO_DATE('2000-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2800', null, '120', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', TO_DATE('1996-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '4200', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', TO_DATE('1997-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '4100', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', TO_DATE('1998-06-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3400', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', TO_DATE('1999-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3000', null, '121', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', TO_DATE('1997-06-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3800', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', TO_DATE('1997-08-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3600', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', TO_DATE('1998-07-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2900', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', TO_DATE('1999-12-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2500', null, '122', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', TO_DATE('1996-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '4000', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', TO_DATE('1997-03-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3900', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', TO_DATE('1998-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3200', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', TO_DATE('1999-03-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2800', null, '123', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', TO_DATE('1998-04-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3100', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', TO_DATE('1998-05-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '3000', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', TO_DATE('1999-06-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2600', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', TO_DATE('2000-01-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', '2600', null, '124', '50');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', TO_DATE('1994-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HR_REP', '6500', null, '101', '40');
INSERT INTO "SCOTT"."EMPLOYEES" VALUES ('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', TO_DATE('1994-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PR_REP', '10000', null, '101', '70');

-- ----------------------------
-- Table structure for EXAMSTUDENT
-- ----------------------------
DROP TABLE "SCOTT"."EXAMSTUDENT";
CREATE TABLE "SCOTT"."EXAMSTUDENT" (
"FLOWID" NUMBER(3) NULL ,
"TYPE" NUMBER(4) NULL ,
"IDCARD" VARCHAR2(18 BYTE) NULL ,
"EXAMCARD" VARCHAR2(15 BYTE) NULL ,
"STUDENTNAME" VARCHAR2(20 BYTE) NULL ,
"LOCATION" VARCHAR2(20 BYTE) NULL ,
"GRADE" NUMBER(3) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of EXAMSTUDENT
-- ----------------------------
INSERT INTO "SCOTT"."EXAMSTUDENT" VALUES ('1', '4', '412824195263214584', '200523164754000', '张峰', '郑州', '85');

-- ----------------------------
-- Table structure for JOB_GRADES
-- ----------------------------
DROP TABLE "SCOTT"."JOB_GRADES";
CREATE TABLE "SCOTT"."JOB_GRADES" (
"GRADE_LEVEL" VARCHAR2(3 BYTE) NULL ,
"LOWEST_SAL" NUMBER NULL ,
"HIGHEST_SAL" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of JOB_GRADES
-- ----------------------------
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('A', '1000', '2999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('B', '3000', '5999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('C', '6000', '9999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('D', '10000', '14999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('E', '15000', '24999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('F', '25000', '40000');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('A', '1000', '2999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('B', '3000', '5999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('C', '6000', '9999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('D', '10000', '14999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('E', '15000', '24999');
INSERT INTO "SCOTT"."JOB_GRADES" VALUES ('F', '25000', '40000');

-- ----------------------------
-- Table structure for JOB_HISTORY
-- ----------------------------
DROP TABLE "SCOTT"."JOB_HISTORY";
CREATE TABLE "SCOTT"."JOB_HISTORY" (
"EMPLOYEE_ID" NUMBER(6) NOT NULL ,
"START_DATE" DATE NOT NULL ,
"END_DATE" DATE NOT NULL ,
"JOB_ID" VARCHAR2(10 BYTE) NOT NULL ,
"DEPARTMENT_ID" NUMBER(4) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of JOB_HISTORY
-- ----------------------------
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('102', TO_DATE('1993-01-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1998-07-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', '60');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('101', TO_DATE('1989-09-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1993-10-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AC_ACCOUNT', '110');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('101', TO_DATE('1993-10-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1997-03-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AC_MGR', '110');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('201', TO_DATE('1996-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1999-12-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'MK_REP', '20');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('114', TO_DATE('1998-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1999-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '50');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('122', TO_DATE('1999-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1999-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', '50');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('200', TO_DATE('1987-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1993-06-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AD_ASST', '90');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('176', TO_DATE('1998-03-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1998-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', '80');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('176', TO_DATE('1999-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1999-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', '80');
INSERT INTO "SCOTT"."JOB_HISTORY" VALUES ('200', TO_DATE('1994-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('1998-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AC_ACCOUNT', '90');

-- ----------------------------
-- Table structure for JOBS
-- ----------------------------
DROP TABLE "SCOTT"."JOBS";
CREATE TABLE "SCOTT"."JOBS" (
"JOB_ID" VARCHAR2(10 BYTE) NOT NULL ,
"JOB_TITLE" VARCHAR2(35 BYTE) NOT NULL ,
"MIN_SALARY" NUMBER(6) NULL ,
"MAX_SALARY" NUMBER(6) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of JOBS
-- ----------------------------
INSERT INTO "SCOTT"."JOBS" VALUES ('AD_PRES', 'President', '20000', '40000');
INSERT INTO "SCOTT"."JOBS" VALUES ('AD_VP', 'Administration Vice President', '15000', '30000');
INSERT INTO "SCOTT"."JOBS" VALUES ('AD_ASST', 'Administration Assistant', '3000', '6000');
INSERT INTO "SCOTT"."JOBS" VALUES ('AC_MGR', 'Accounting Manager', '8200', '16000');
INSERT INTO "SCOTT"."JOBS" VALUES ('AC_ACCOUNT', 'Public Accountant', '4200', '9000');
INSERT INTO "SCOTT"."JOBS" VALUES ('SA_MAN', 'Sales Manager', '10000', '20000');
INSERT INTO "SCOTT"."JOBS" VALUES ('SA_REP', 'Sales Representative', '6000', '12000');
INSERT INTO "SCOTT"."JOBS" VALUES ('ST_MAN', 'Stock Manager', '5500', '8500');
INSERT INTO "SCOTT"."JOBS" VALUES ('ST_CLERK', 'Stock Clerk', '2000', '5000');
INSERT INTO "SCOTT"."JOBS" VALUES ('IT_PROG', 'Programmer', '4000', '10000');
INSERT INTO "SCOTT"."JOBS" VALUES ('MK_MAN', 'Marketing Manager', '9000', '15000');
INSERT INTO "SCOTT"."JOBS" VALUES ('MK_REP', 'Marketing Representative', '4000', '9000');
INSERT INTO "SCOTT"."JOBS" VALUES ('FI_MGR', 'Finance Manager', '8200', '16000');
INSERT INTO "SCOTT"."JOBS" VALUES ('FI_ACCOUNT', 'Accountant', '4200', '9000');
INSERT INTO "SCOTT"."JOBS" VALUES ('PU_MAN', 'Purchasing Manager', '8000', '15000');
INSERT INTO "SCOTT"."JOBS" VALUES ('PU_CLERK', 'Purchasing Clerk', '2500', '5500');
INSERT INTO "SCOTT"."JOBS" VALUES ('SH_CLERK', 'Shipping Clerk', '2500', '5500');
INSERT INTO "SCOTT"."JOBS" VALUES ('HR_REP', 'Human Resources Representative', '4000', '9000');
INSERT INTO "SCOTT"."JOBS" VALUES ('PR_REP', 'Public Relations Representative', '4500', '10500');

-- ----------------------------
-- Table structure for LOCATIONS
-- ----------------------------
DROP TABLE "SCOTT"."LOCATIONS";
CREATE TABLE "SCOTT"."LOCATIONS" (
"LOCATION_ID" NUMBER(4) NOT NULL ,
"STREET_ADDRESS" VARCHAR2(40 BYTE) NULL ,
"POSTAL_CODE" VARCHAR2(12 BYTE) NULL ,
"CITY" VARCHAR2(30 BYTE) NOT NULL ,
"STATE_PROVINCE" VARCHAR2(25 BYTE) NULL ,
"COUNTRY_ID" CHAR(2 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of LOCATIONS
-- ----------------------------
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1800', '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2500', 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1000', '1297 Via Cola di Rie', '00989', 'Roma', null, 'IT');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1100', '93091 Calle della Testa', '10934', 'Venice', null, 'IT');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2000', '40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2300', '198 Clementi North', '540198', 'Singapore', null, 'SG');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2400', '8204 Arthur St', null, 'London', null, 'UK');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2600', '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2800', 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
INSERT INTO "SCOTT"."LOCATIONS" VALUES ('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');

-- ----------------------------
-- Table structure for ORDER_ITEMS
-- ----------------------------
DROP TABLE "SCOTT"."ORDER_ITEMS";
CREATE TABLE "SCOTT"."ORDER_ITEMS" (
"ID" NUMBER NOT NULL ,
"ITEM_COUNT" NUMBER NULL ,
"MONEY" NUMBER NULL ,
"ORDER_ID" NUMBER NULL ,
"PRODUCT_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ORDER_ITEMS
-- ----------------------------
INSERT INTO "SCOTT"."ORDER_ITEMS" VALUES ('1', '10', '1000', '1', '1');
INSERT INTO "SCOTT"."ORDER_ITEMS" VALUES ('2', '20', '2000', '1', '3');

-- ----------------------------
-- Table structure for ORDERS
-- ----------------------------
DROP TABLE "SCOTT"."ORDERS";
CREATE TABLE "SCOTT"."ORDERS" (
"ID" NUMBER NOT NULL ,
"ADDRESS" VARCHAR2(255 BYTE) NULL ,
"ORDER_DATE" DATE NULL ,
"NO" VARCHAR2(255 BYTE) NULL ,
"STATUS" VARCHAR2(255 BYTE) NULL ,
"CUSTOMER_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ORDERS
-- ----------------------------
INSERT INTO "SCOTT"."ORDERS" VALUES ('7', '长春', TO_DATE('2014-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98000', '已付款', '141');
INSERT INTO "SCOTT"."ORDERS" VALUES ('8', '深圳', TO_DATE('2014-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98012', '已付款', '154');
INSERT INTO "SCOTT"."ORDERS" VALUES ('1', '北京', TO_DATE('2014-01-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98065', '未付款', '4');
INSERT INTO "SCOTT"."ORDERS" VALUES ('2', '上海', TO_DATE('2014-01-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98066', '已付款', '4');
INSERT INTO "SCOTT"."ORDERS" VALUES ('3', '深圳', TO_DATE('2013-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98088', '已付款', '4');
INSERT INTO "SCOTT"."ORDERS" VALUES ('4', '广州', TO_DATE('2013-05-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98099', '已付款', '4');
INSERT INTO "SCOTT"."ORDERS" VALUES ('5', '大连', TO_DATE('2013-10-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98055', '已付款', '4');
INSERT INTO "SCOTT"."ORDERS" VALUES ('6', '石家庄', TO_DATE('2013-11-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD98011', '未付款', '4');

-- ----------------------------
-- Table structure for PRODUCTS
-- ----------------------------
DROP TABLE "SCOTT"."PRODUCTS";
CREATE TABLE "SCOTT"."PRODUCTS" (
"ID" NUMBER NOT NULL ,
"BATCH" VARCHAR2(255 BYTE) NULL ,
"MEMO" VARCHAR2(255 BYTE) NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"PRICE" NUMBER NULL ,
"TYPE" VARCHAR2(255 BYTE) NULL ,
"UNIT" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PRODUCTS
-- ----------------------------
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('1', '国行', '保证行货', 'ThinkPad T430 笔记本', '8000', 'T430', '台');
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('3', '水货', '不保修', 'Nexus 手机', '2000', 'Nexus5', '台');
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('4', '二手', null, 'ipad', '1000', '2', '台');
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('5', '32G', null, '小米手机', '1500', '2s', '台');
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('6', '金色', null, 'iphone', '5000', '5s', '台');
INSERT INTO "SCOTT"."PRODUCTS" VALUES ('7', '32G', null, '三星NOTE', '3000', '3', '台');

-- ----------------------------
-- Table structure for REGIONS
-- ----------------------------
DROP TABLE "SCOTT"."REGIONS";
CREATE TABLE "SCOTT"."REGIONS" (
"REGION_ID" NUMBER NOT NULL ,
"REGION_NAME" VARCHAR2(25 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of REGIONS
-- ----------------------------
INSERT INTO "SCOTT"."REGIONS" VALUES ('1', 'Europe');
INSERT INTO "SCOTT"."REGIONS" VALUES ('2', 'Americas');
INSERT INTO "SCOTT"."REGIONS" VALUES ('3', 'Asia');
INSERT INTO "SCOTT"."REGIONS" VALUES ('4', 'Middle East and Africa');

-- ----------------------------
-- Table structure for ROLE_AUTHORITY
-- ----------------------------
DROP TABLE "SCOTT"."ROLE_AUTHORITY";
CREATE TABLE "SCOTT"."ROLE_AUTHORITY" (
"ROLE_ID" NUMBER NULL ,
"AUTHORITY_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ROLE_AUTHORITY
-- ----------------------------
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '16');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '17');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '19');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '20');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '22');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '23');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '24');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '25');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '26');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '28');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '29');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '30');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '31');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '33');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '34');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '35');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '37');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('1', '39');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('2', '17');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '16');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '17');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '19');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '20');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '22');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '23');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '24');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '25');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '26');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '28');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '29');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '30');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '31');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '33');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '34');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '35');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '37');
INSERT INTO "SCOTT"."ROLE_AUTHORITY" VALUES ('3', '39');

-- ----------------------------
-- Table structure for ROLES
-- ----------------------------
DROP TABLE "SCOTT"."ROLES";
CREATE TABLE "SCOTT"."ROLES" (
"ID" NUMBER NOT NULL ,
"DESCRIPTION" VARCHAR2(255 BYTE) NULL ,
"ENABLED" NUMBER NULL ,
"NAME" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ROLES
-- ----------------------------
INSERT INTO "SCOTT"."ROLES" VALUES ('3', '测试时使用, 上线需删除', '1', '测试管理员');
INSERT INTO "SCOTT"."ROLES" VALUES ('1', null, '1', '管理员');
INSERT INTO "SCOTT"."ROLES" VALUES ('2', null, '1', '测试');

-- ----------------------------
-- Table structure for SALES_CHANCES
-- ----------------------------
DROP TABLE "SCOTT"."SALES_CHANCES";
CREATE TABLE "SCOTT"."SALES_CHANCES" (
"ID" NUMBER NOT NULL ,
"CONTACT" VARCHAR2(255 BYTE) NULL ,
"CONTACT_TEL" VARCHAR2(255 BYTE) NULL ,
"CREATE_DATE" DATE NULL ,
"CUST_NAME" VARCHAR2(255 BYTE) NULL ,
"DESCRIPTION" VARCHAR2(255 BYTE) NULL ,
"DESIGNEE_DATE" DATE NULL ,
"RATE" NUMBER NULL ,
"SOURCE" VARCHAR2(255 BYTE) NULL ,
"STATUS" NUMBER NULL ,
"TITLE" VARCHAR2(255 BYTE) NULL ,
"CREATED_USER_ID" NUMBER NULL ,
"DESIGNEE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SALES_CHANCES
-- ----------------------------
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('208', '黄先生', '13999999999', TO_DATE('2016-03-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '黄同学', '测试时使用, 上线需删除', TO_DATE('2016-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '校友', '3', '武生院的学生', '24', '209');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('355', '黄老师', '16576576123', TO_DATE('2016-03-29 00:01:05', 'YYYY-MM-DD HH24:MI:SS'), '黄老师', 'DONEDONEDONE', TO_DATE('2016-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '社交', '2', '武生院的老师', '21', '209');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('356', '黄先生', '13687687887', TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '小李Single', 'BINGO', TO_DATE('2016-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '网络', '4', 'ssss', '21', '21');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('203', '黄先生2', '13687687887', TO_DATE('2016-01-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '小李1OOI', '测试时使用, 上线需删除', TO_DATE('2016-01-27 19:28:03', 'YYYY-MM-DD HH24:MI:SS'), '100', '网络Net', '2', '100台iphone', '24', '24');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('435', 'Mr.Lee', '13696965555', TO_DATE('2016-03-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '武汉生物工程学院', 'Important', null, '89', '网络', '1', '机会', '209', null);
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('150', '黄先生31', '13456789900', TO_DATE('2014-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '魅族科技', '好机会, 不可多得！', TO_DATE('2016-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '手机论坛', '3', '原配件', '24', '21');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('156', '黄先生41', '51571522', TO_DATE('2014-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'IPHONE6 直销', '测试时使用, 上线需删除', TO_DATE('2014-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '10', 'IOS 论坛', '4', 'IPHONE6 直销', '24', '21');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('1', '黄先生5', '13456789900', TO_DATE('2014-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '腾讯', 'JavaEE', TO_DATE('2016-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '微信', '3', '技术培训', '21', '21');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('2', '黄先生6', '51571522', TO_DATE('2014-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '新浪', '团队凝聚力', TO_DATE('2016-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', '微博', '2', '团队培训', '21', '21');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('4', '黄先生7', '13456778900', TO_DATE('2014-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '北京培黎师范学院', '50 太高端服务器', TO_DATE('2014-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '客户介绍', '1', '50 台服务器', '21', '24');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('5', '黄先生8', '13455667788', TO_DATE('2014-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '阿拉灯', '靠谱', TO_DATE('2014-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100', '朋友介绍', '1', '手机经销商', '21', '24');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('7', '黄先生9', '13456778800', TO_DATE('2014-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '恒大电脑', '高端服务器 10 台', TO_DATE('2014-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '90', 'QQ 群', '1', '服务器 10 台', '24', '24');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('8', '黄先生10', '13456789900', TO_DATE('2014-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '大连重工', '办公使用', TO_DATE('2016-01-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '微信', '2', '台式机 50 台', '24', '205');
INSERT INTO "SCOTT"."SALES_CHANCES" VALUES ('120', '黄先生11', '13456789912', TO_DATE('2014-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '联想移动', '北京乐 PHONE 总代', TO_DATE('2014-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '80', '手机博览会', '2', '乐Phone代理', '24', '21');

-- ----------------------------
-- Table structure for SALES_PLAN
-- ----------------------------
DROP TABLE "SCOTT"."SALES_PLAN";
CREATE TABLE "SCOTT"."SALES_PLAN" (
"ID" NUMBER NOT NULL ,
"PLAN_DATE" DATE NULL ,
"PLAN_RESULT" VARCHAR2(255 BYTE) NULL ,
"TODO" VARCHAR2(255 BYTE) NULL ,
"CHANCE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SALES_PLAN
-- ----------------------------
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('358', TO_DATE('2016-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '11344', '355');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('325', TO_DATE('2016-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'COOL', 'Sing', '208');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('339', TO_DATE('2016-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, 'Sing198237645', '208');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('265', TO_DATE('2016-01-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), null, '听演唱会', '208');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('140', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AAA-RESULT', 'AAA', '120');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('152', TO_DATE('1991-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AA', 'ASDDD', '150');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('153', TO_DATE('1992-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'BB', 'ASBBB', '150');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('1', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '初步意向', '吃个饭?', '1');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('2', TO_DATE('1991-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '培训费没达成', '泡个脚?', '1');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('3', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'RESULT....', 'XYZZZ', '4');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('4', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AAA-RESULT', 'AAA', '5');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('5', TO_DATE('1991-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'BBB-RESULT', 'BBB', '5');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('7', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AAA-RESULT', 'AAA', '7');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('8', TO_DATE('1990-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AAA-RESULT', 'AAA', '8');
INSERT INTO "SCOTT"."SALES_PLAN" VALUES ('267', TO_DATE('2016-01-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'GREAT', '阅读时光Plus', '208');

-- ----------------------------
-- Table structure for SALGRADE
-- ----------------------------
DROP TABLE "SCOTT"."SALGRADE";
CREATE TABLE "SCOTT"."SALGRADE" (
"GRADE" NUMBER NULL ,
"LOSAL" NUMBER NULL ,
"HISAL" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SALGRADE
-- ----------------------------
INSERT INTO "SCOTT"."SALGRADE" VALUES ('1', '700', '1200');
INSERT INTO "SCOTT"."SALGRADE" VALUES ('2', '1201', '1400');
INSERT INTO "SCOTT"."SALGRADE" VALUES ('3', '1401', '2000');
INSERT INTO "SCOTT"."SALGRADE" VALUES ('4', '2001', '3000');
INSERT INTO "SCOTT"."SALGRADE" VALUES ('5', '3001', '9999');

-- ----------------------------
-- Table structure for STORAGES
-- ----------------------------
DROP TABLE "SCOTT"."STORAGES";
CREATE TABLE "SCOTT"."STORAGES" (
"ID" NUMBER NOT NULL ,
"MEMO" VARCHAR2(255 BYTE) NULL ,
"STOCK_COUNT" NUMBER NULL ,
"STOCK_WARE" VARCHAR2(255 BYTE) NULL ,
"WARE_HOUSE" VARCHAR2(255 BYTE) NULL ,
"PRODUCT_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of STORAGES
-- ----------------------------
INSERT INTO "SCOTT"."STORAGES" VALUES ('1', 'Nexus 手机比较抢手', '100', '1', '北京五棵松', '3');
INSERT INTO "SCOTT"."STORAGES" VALUES ('2', null, '2000', '2', '中关村海龙', '1');
INSERT INTO "SCOTT"."STORAGES" VALUES ('3', null, '200', '3', '京东一号', '3');
INSERT INTO "SCOTT"."STORAGES" VALUES ('4', null, '100', '4', 'e世界', '4');
INSERT INTO "SCOTT"."STORAGES" VALUES ('5', null, '200', '10', '北京五棵松', '1');
INSERT INTO "SCOTT"."STORAGES" VALUES ('6', null, '100', '11', '北京五棵松', '3');
INSERT INTO "SCOTT"."STORAGES" VALUES ('7', null, '100', '13', '北京五棵松', '4');
INSERT INTO "SCOTT"."STORAGES" VALUES ('8', null, '100', '14', '北京五棵松', '5');
INSERT INTO "SCOTT"."STORAGES" VALUES ('9', null, '100', '15', '北京五棵松', '6');
INSERT INTO "SCOTT"."STORAGES" VALUES ('10', null, '100', '16', '北京五棵松', '7');

-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "SCOTT"."USERS";
CREATE TABLE "SCOTT"."USERS" (
"ID" NUMBER NOT NULL ,
"ENABLED" NUMBER NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"PASSWORD" VARCHAR2(255 BYTE) NULL ,
"ROLE_ID" NUMBER NULL ,
"SALT" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "SCOTT"."USERS" VALUES ('205', '1', 'Lincon', '123456', '2', null);
INSERT INTO "SCOTT"."USERS" VALUES ('21', '1', 'bcde', '52bcb02821b4d9d71f955fe71f3d4857', '3', 'e2b87e6eced06509');
INSERT INTO "SCOTT"."USERS" VALUES ('209', '1', 'enochlj', '52bcb02821b4d9d71f955fe71f3d4857', '1', 'e2b87e6eced06509');
INSERT INTO "SCOTT"."USERS" VALUES ('24', '1', 'admin', '52bcb02821b4d9d71f955fe71f3d4857', '1', 'e2b87e6eced06509');
INSERT INTO "SCOTT"."USERS" VALUES ('210', '0', 'emma', '123456', '3', null);
INSERT INTO "SCOTT"."USERS" VALUES ('211', '1', 'fido', '123456', '3', null);
INSERT INTO "SCOTT"."USERS" VALUES ('212', '0', 'Gina', '123456', '3', null);

-- ----------------------------
-- View structure for DEPT_VU
-- ----------------------------
CREATE OR REPLACE FORCE VIEW "SCOTT"."DEPT_VU" AS 
SELECT "ID","NAME"
	FROM
	DEPT;

-- ----------------------------
-- View structure for EMP_DETAILS_VIEW
-- ----------------------------
CREATE OR REPLACE FORCE VIEW "SCOTT"."EMP_DETAILS_VIEW" AS 
SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY 
CONSTRAINTS "SYS_C005514";

-- ----------------------------
-- View structure for EMPLOYEE_VU
-- ----------------------------
CREATE OR REPLACE FORCE VIEW "SCOTT"."EMPLOYEE_VU" AS 
SELECT LAST_NAME,EMPLOYEE_ID,DEPARTMENT_ID
		FROM EMPLOYEES
	WHERE DEPARTMENT_ID=80
WITH READ ONLY 
CONSTRAINTS "SYS_C005538";

-- ----------------------------
-- Procedure structure for CHECK_DRAIN
-- ----------------------------
CREATE OR REPLACE PROCEDURE "SCOTT"."CHECK_DRAIN"
IS

--声明游标
CURSOR drain_cursor IS
  --查询哪些客户已经连续 6 个月和公司没有任何的业务往来.
  SELECT c.id, name, manager_id, o.order_date
  FROM customers c
  JOIN (SELECT customer_id, MAX(order_date) order_date
        FROM orders
        GROUP BY customer_id) o
  ON c.id = o.customer_id
  WHERE o.order_date < SYSDATE - 5
  --WHERE o.order_date < ADD_MONTHS(SYSDATE, -6)
  AND c.state = '正常';

BEGIN

FOR drain_info IN drain_cursor LOOP
  --向流失预警的数据表中插入一条记录
    INSERT INTO customer_drains(id, customer_id, last_order_date, status)
    VALUES(CRM_SEQ.NEXTVAL, drain_info.id, drain_info.order_date, '流失预警');
    --把当前客户的状态修改为流失预警状态
    UPDATE customers SET state = '流失预警' WHERE id = drain_info.id;
END LOOP;

END;
/

-- ----------------------------
-- Procedure structure for PROC_ADDSAL
-- ----------------------------
CREATE OR REPLACE procedure "SCOTT"."PROC_ADDSAL"(dept_id number,total_costs out number)
is
  v_rate number(4,2):=0;
  cursor emp_cursor is select employee_id,hire_date,salary from employees where department_id=dept_id;
begin
  total_costs:=0;
  for c in emp_cursor loop
  
    if to_char(c.hire_date,'yyyy')<'1995' then v_rate:=0.05;
    elsif to_char(c.hire_date,'yyyy')<'1998' then v_rate:=0.03;
    else v_rate:=0.01;
    end if;
    
    total_costs:=total_costs+c.salary*v_rate;
    
    update employees
      set salary=salary*(1+v_rate)
      where employee_id=c.employee_id
        and department_id=dept_id;
  end loop;
  
  dbms_output.put_line(total_costs);
end;
/

-- ----------------------------
-- Procedure structure for PROC_GETTOTALSAL
-- ----------------------------
CREATE OR REPLACE procedure "SCOTT"."PROC_GETTOTALSAL"(v_dept_id number,v_totalSal out number)
is
  cursor emp_cursor is select salary from employees where department_id=v_dept_id;
begin
  v_totalSal:=0;
  for c in emp_cursor loop
    v_totalSal:=v_totalSal+c.salary;
  end loop;
    
  dbms_output.put_line(v_totalSal);
end;
/

-- ----------------------------
-- Function structure for FUNC_GETSUM
-- ----------------------------
CREATE OR REPLACE function "SCOTT"."FUNC_GETSUM"(v_num1 number,v_num2 number)
return number
is
begin
  return v_num1+v_num2;
end;
/

-- ----------------------------
-- Function structure for FUNC_GETTOTALSAL
-- ----------------------------
CREATE OR REPLACE function "SCOTT"."FUNC_GETTOTALSAL"(v_dept_id number)
return number
is
  v_totalSal number(7);
begin
  select sum(salary) into v_totalSal
    from employees
    where department_id=v_dept_id;
    
  return v_totalSal;
exception
  when No_data_found then dbms_output.put_line('部门号有误');
end;
/

-- ----------------------------
-- Function structure for FUNC_GETTOTALSALANDCOUNTS
-- ----------------------------
CREATE OR REPLACE function "SCOTT"."FUNC_GETTOTALSALANDCOUNTS"(v_dept_id number,v_counts out number)
return number
is
  v_totalSal number(7):=0;
  cursor emp_cursor is select salary from employees where department_id=v_dept_id;
begin
  v_counts:=0;
  for c in emp_cursor loop
    v_totalSal:=v_totalSal+c.salary;
    v_counts:=v_counts+1;
  end loop;
    
  return v_totalSal;
end;
/

-- ----------------------------
-- Function structure for FUNC_PRINTWORDS
-- ----------------------------
CREATE OR REPLACE function "SCOTT"."FUNC_PRINTWORDS"(v_words varchar2)
return varchar2
is
begin
  return v_words;
end;
/

-- ----------------------------
-- Function structure for FUNC_RETTIME
-- ----------------------------
CREATE OR REPLACE function "SCOTT"."FUNC_RETTIME"
return date
is
begin
  return sysdate;
end;
/

-- ----------------------------
-- Sequence structure for CRM_SEQ
-- ----------------------------
DROP SEQUENCE "SCOTT"."CRM_SEQ";
CREATE SEQUENCE "SCOTT"."CRM_SEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 20000
 START WITH 455
 CACHE 20;

-- ----------------------------
-- Sequence structure for DEPARTMENTS_SEQ
-- ----------------------------
DROP SEQUENCE "SCOTT"."DEPARTMENTS_SEQ";
CREATE SEQUENCE "SCOTT"."DEPARTMENTS_SEQ"
 INCREMENT BY 10
 MINVALUE 1
 MAXVALUE 9990
 START WITH 280
 NOCACHE ;

-- ----------------------------
-- Sequence structure for DEPT_ID_SEQ
-- ----------------------------
DROP SEQUENCE "SCOTT"."DEPT_ID_SEQ";
CREATE SEQUENCE "SCOTT"."DEPT_ID_SEQ"
 INCREMENT BY 10
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 380
 NOCACHE ;

-- ----------------------------
-- Sequence structure for EMPLOYEES_SEQ
-- ----------------------------
DROP SEQUENCE "SCOTT"."EMPLOYEES_SEQ";
CREATE SEQUENCE "SCOTT"."EMPLOYEES_SEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 207
 NOCACHE ;

-- ----------------------------
-- Sequence structure for LOCATIONS_SEQ
-- ----------------------------
DROP SEQUENCE "SCOTT"."LOCATIONS_SEQ";
CREATE SEQUENCE "SCOTT"."LOCATIONS_SEQ"
 INCREMENT BY 100
 MINVALUE 1
 MAXVALUE 9900
 START WITH 3300
 NOCACHE ;

-- ----------------------------
-- Indexes structure for table AUTHORITIES
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_SDU0Y4LWSYD7J783AYMBDA6"
ON "SCOTT"."AUTHORITIES" ("PARENT_AUTHORITY_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table AUTHORITIES
-- ----------------------------
ALTER TABLE "SCOTT"."AUTHORITIES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AUTHORITIES
-- ----------------------------
ALTER TABLE "SCOTT"."AUTHORITIES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table CONTACTS
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_J0UTURNRU83J56UFV1CYQ02"
ON "SCOTT"."CONTACTS" ("CUSTOMER_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table CONTACTS
-- ----------------------------
ALTER TABLE "SCOTT"."CONTACTS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CONTACTS
-- ----------------------------
ALTER TABLE "SCOTT"."CONTACTS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table COUNTRIES
-- ----------------------------

-- ----------------------------
-- Checks structure for table COUNTRIES
-- ----------------------------
ALTER TABLE "SCOTT"."COUNTRIES" ADD CHECK ("COUNTRY_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table CUSTOMER_ACTIVITIES
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_BG3W9V3B53U7NAV7NVFU79Y"
ON "SCOTT"."CUSTOMER_ACTIVITIES" ("CUSTOMER_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table CUSTOMER_ACTIVITIES
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_ACTIVITIES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CUSTOMER_ACTIVITIES
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_ACTIVITIES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table CUSTOMER_DRAINS
-- ----------------------------

-- ----------------------------
-- Checks structure for table CUSTOMER_DRAINS
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_DRAINS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CUSTOMER_DRAINS
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_DRAINS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table CUSTOMER_SERVICES
-- ----------------------------

-- ----------------------------
-- Checks structure for table CUSTOMER_SERVICES
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_SERVICES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CUSTOMER_SERVICES
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_SERVICES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table CUSTOMERS
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_RGPEM82QDQAUTSQFMWTWYJP"
ON "SCOTT"."CUSTOMERS" ("MANAGER_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table CUSTOMERS
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMERS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CUSTOMERS
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMERS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table DEPARTMENTS
-- ----------------------------

-- ----------------------------
-- Checks structure for table DEPARTMENTS
-- ----------------------------
ALTER TABLE "SCOTT"."DEPARTMENTS" ADD CHECK ("DEPARTMENT_NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DEPARTMENTS
-- ----------------------------
ALTER TABLE "SCOTT"."DEPARTMENTS" ADD PRIMARY KEY ("DEPARTMENT_ID");

-- ----------------------------
-- Indexes structure for table DEPT
-- ----------------------------

-- ----------------------------
-- Checks structure for table DEPT
-- ----------------------------
ALTER TABLE "SCOTT"."DEPT" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DEPT
-- ----------------------------
ALTER TABLE "SCOTT"."DEPT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table DICTS
-- ----------------------------

-- ----------------------------
-- Checks structure for table DICTS
-- ----------------------------
ALTER TABLE "SCOTT"."DICTS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DICTS
-- ----------------------------
ALTER TABLE "SCOTT"."DICTS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table EMPLOYEES
-- ----------------------------

-- ----------------------------
-- Triggers structure for table EMPLOYEES
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."TRI_UPDATE_EMPLOYEES" AFTER UPDATE ON "SCOTT"."EMPLOYEES" REFERENCING OLD AS "OLD" NEW AS "NEW"
begin
  dbms_output.put_line('Hello,World!');
end;

-- ----------------------------
-- Uniques structure for table EMPLOYEES
-- ----------------------------
ALTER TABLE "SCOTT"."EMPLOYEES" ADD UNIQUE ("EMAIL");

-- ----------------------------
-- Checks structure for table EMPLOYEES
-- ----------------------------
ALTER TABLE "SCOTT"."EMPLOYEES" ADD CHECK ("EMAIL" IS NOT NULL);
ALTER TABLE "SCOTT"."EMPLOYEES" ADD CHECK ("HIRE_DATE" IS NOT NULL);
ALTER TABLE "SCOTT"."EMPLOYEES" ADD CHECK ("JOB_ID" IS NOT NULL);
ALTER TABLE "SCOTT"."EMPLOYEES" ADD CHECK ("LAST_NAME" IS NOT NULL);
ALTER TABLE "SCOTT"."EMPLOYEES" ADD CHECK (salary > 0);

-- ----------------------------
-- Primary Key structure for table EMPLOYEES
-- ----------------------------
ALTER TABLE "SCOTT"."EMPLOYEES" ADD PRIMARY KEY ("EMPLOYEE_ID");

-- ----------------------------
-- Indexes structure for table JOB_HISTORY
-- ----------------------------

-- ----------------------------
-- Checks structure for table JOB_HISTORY
-- ----------------------------
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD CHECK (end_date > start_date);
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD CHECK ("EMPLOYEE_ID" IS NOT NULL);
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD CHECK ("END_DATE" IS NOT NULL);
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD CHECK ("JOB_ID" IS NOT NULL);
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD CHECK ("START_DATE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table JOB_HISTORY
-- ----------------------------
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD PRIMARY KEY ("EMPLOYEE_ID", "START_DATE");

-- ----------------------------
-- Indexes structure for table JOBS
-- ----------------------------

-- ----------------------------
-- Checks structure for table JOBS
-- ----------------------------
ALTER TABLE "SCOTT"."JOBS" ADD CHECK ("JOB_TITLE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table JOBS
-- ----------------------------
ALTER TABLE "SCOTT"."JOBS" ADD PRIMARY KEY ("JOB_ID");

-- ----------------------------
-- Indexes structure for table LOCATIONS
-- ----------------------------

-- ----------------------------
-- Checks structure for table LOCATIONS
-- ----------------------------
ALTER TABLE "SCOTT"."LOCATIONS" ADD CHECK ("CITY" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table LOCATIONS
-- ----------------------------
ALTER TABLE "SCOTT"."LOCATIONS" ADD PRIMARY KEY ("LOCATION_ID");

-- ----------------------------
-- Indexes structure for table ORDER_ITEMS
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_3FEA23HXAR30BX7M7H8ED25"
ON "SCOTT"."ORDER_ITEMS" ("PRODUCT_ID" ASC)
LOGGING;
CREATE INDEX "SCOTT"."IDX_FK_9GAP2FMW66V092NTB58RTOH"
ON "SCOTT"."ORDER_ITEMS" ("ORDER_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table ORDER_ITEMS
-- ----------------------------
ALTER TABLE "SCOTT"."ORDER_ITEMS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ORDER_ITEMS
-- ----------------------------
ALTER TABLE "SCOTT"."ORDER_ITEMS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ORDERS
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_ASTYS1DV61MDLP0N0WX0574"
ON "SCOTT"."ORDERS" ("CUSTOMER_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table ORDERS
-- ----------------------------
ALTER TABLE "SCOTT"."ORDERS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ORDERS
-- ----------------------------
ALTER TABLE "SCOTT"."ORDERS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PRODUCTS
-- ----------------------------

-- ----------------------------
-- Checks structure for table PRODUCTS
-- ----------------------------
ALTER TABLE "SCOTT"."PRODUCTS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PRODUCTS
-- ----------------------------
ALTER TABLE "SCOTT"."PRODUCTS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table REGIONS
-- ----------------------------

-- ----------------------------
-- Checks structure for table REGIONS
-- ----------------------------
ALTER TABLE "SCOTT"."REGIONS" ADD CHECK ("REGION_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table REGIONS
-- ----------------------------
ALTER TABLE "SCOTT"."REGIONS" ADD PRIMARY KEY ("REGION_ID");

-- ----------------------------
-- Indexes structure for table ROLE_AUTHORITY
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_17V3U9QBWAJRM5JSAJ4UXUJ"
ON "SCOTT"."ROLE_AUTHORITY" ("AUTHORITY_ID" ASC)
LOGGING;
CREATE INDEX "SCOTT"."IDX_FK_PD9DXRH00OJCI21L1H9PJ77"
ON "SCOTT"."ROLE_AUTHORITY" ("ROLE_ID" ASC)
LOGGING;

-- ----------------------------
-- Indexes structure for table ROLES
-- ----------------------------

-- ----------------------------
-- Checks structure for table ROLES
-- ----------------------------
ALTER TABLE "SCOTT"."ROLES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ROLES
-- ----------------------------
ALTER TABLE "SCOTT"."ROLES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SALES_CHANCES
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_FTKYCV9D4NVMU2C2W2FW31K"
ON "SCOTT"."SALES_CHANCES" ("CREATED_USER_ID" ASC)
LOGGING;
CREATE INDEX "SCOTT"."IDX_FK_HQECYRMH65UWK6DC2NM2HOL"
ON "SCOTT"."SALES_CHANCES" ("DESIGNEE_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table SALES_CHANCES
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_CHANCES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SALES_CHANCES
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_CHANCES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SALES_PLAN
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_FYP32DDRXHRWK4K6QLBGYB0"
ON "SCOTT"."SALES_PLAN" ("CHANCE_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table SALES_PLAN
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_PLAN" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SALES_PLAN
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_PLAN" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table STORAGES
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_GA5F9D7RVVWKJYAH6P02E69"
ON "SCOTT"."STORAGES" ("PRODUCT_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table STORAGES
-- ----------------------------
ALTER TABLE "SCOTT"."STORAGES" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table STORAGES
-- ----------------------------
ALTER TABLE "SCOTT"."STORAGES" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table USERS
-- ----------------------------
CREATE INDEX "SCOTT"."IDX_FK_KRVOTBTIQHUDLKAMVLPAQUS"
ON "SCOTT"."USERS" ("ROLE_ID" ASC)
LOGGING;

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "SCOTT"."USERS" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "SCOTT"."USERS" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."AUTHORITIES"
-- ----------------------------
ALTER TABLE "SCOTT"."AUTHORITIES" ADD FOREIGN KEY ("PARENT_AUTHORITY_ID") REFERENCES "SCOTT"."AUTHORITIES" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."CONTACTS"
-- ----------------------------
ALTER TABLE "SCOTT"."CONTACTS" ADD FOREIGN KEY ("CUSTOMER_ID") REFERENCES "SCOTT"."CUSTOMERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."COUNTRIES"
-- ----------------------------
ALTER TABLE "SCOTT"."COUNTRIES" ADD FOREIGN KEY ("REGION_ID") REFERENCES "SCOTT"."REGIONS" ("REGION_ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."CUSTOMER_ACTIVITIES"
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_ACTIVITIES" ADD FOREIGN KEY ("CUSTOMER_ID") REFERENCES "SCOTT"."CUSTOMERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."CUSTOMER_DRAINS"
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_DRAINS" ADD FOREIGN KEY ("CUSTOMER_ID") REFERENCES "SCOTT"."CUSTOMERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."CUSTOMER_SERVICES"
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMER_SERVICES" ADD FOREIGN KEY ("CREATED_ID") REFERENCES "SCOTT"."USERS" ("ID");
ALTER TABLE "SCOTT"."CUSTOMER_SERVICES" ADD FOREIGN KEY ("CUSTOMER_ID") REFERENCES "SCOTT"."CUSTOMERS" ("ID");
ALTER TABLE "SCOTT"."CUSTOMER_SERVICES" ADD FOREIGN KEY ("ALLOT_ID") REFERENCES "SCOTT"."USERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."CUSTOMERS"
-- ----------------------------
ALTER TABLE "SCOTT"."CUSTOMERS" ADD FOREIGN KEY ("MANAGER_ID") REFERENCES "SCOTT"."CONTACTS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."DEPARTMENTS"
-- ----------------------------
ALTER TABLE "SCOTT"."DEPARTMENTS" ADD FOREIGN KEY ("LOCATION_ID") REFERENCES "SCOTT"."LOCATIONS" ("LOCATION_ID");
ALTER TABLE "SCOTT"."DEPARTMENTS" ADD FOREIGN KEY ("MANAGER_ID") REFERENCES "SCOTT"."EMPLOYEES" ("EMPLOYEE_ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."EMPLOYEES"
-- ----------------------------
ALTER TABLE "SCOTT"."EMPLOYEES" ADD FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "SCOTT"."DEPARTMENTS" ("DEPARTMENT_ID");
ALTER TABLE "SCOTT"."EMPLOYEES" ADD FOREIGN KEY ("JOB_ID") REFERENCES "SCOTT"."JOBS" ("JOB_ID");
ALTER TABLE "SCOTT"."EMPLOYEES" ADD FOREIGN KEY ("MANAGER_ID") REFERENCES "SCOTT"."EMPLOYEES" ("EMPLOYEE_ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."JOB_HISTORY"
-- ----------------------------
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "SCOTT"."DEPARTMENTS" ("DEPARTMENT_ID");
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD FOREIGN KEY ("EMPLOYEE_ID") REFERENCES "SCOTT"."EMPLOYEES" ("EMPLOYEE_ID") DISABLE;
ALTER TABLE "SCOTT"."JOB_HISTORY" ADD FOREIGN KEY ("JOB_ID") REFERENCES "SCOTT"."JOBS" ("JOB_ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."LOCATIONS"
-- ----------------------------
ALTER TABLE "SCOTT"."LOCATIONS" ADD FOREIGN KEY ("COUNTRY_ID") REFERENCES "SCOTT"."COUNTRIES" ("COUNTRY_ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."ORDER_ITEMS"
-- ----------------------------
ALTER TABLE "SCOTT"."ORDER_ITEMS" ADD FOREIGN KEY ("PRODUCT_ID") REFERENCES "SCOTT"."PRODUCTS" ("ID");
ALTER TABLE "SCOTT"."ORDER_ITEMS" ADD FOREIGN KEY ("ORDER_ID") REFERENCES "SCOTT"."ORDERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."ORDERS"
-- ----------------------------
ALTER TABLE "SCOTT"."ORDERS" ADD FOREIGN KEY ("CUSTOMER_ID") REFERENCES "SCOTT"."CUSTOMERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."ROLE_AUTHORITY"
-- ----------------------------
ALTER TABLE "SCOTT"."ROLE_AUTHORITY" ADD FOREIGN KEY ("AUTHORITY_ID") REFERENCES "SCOTT"."AUTHORITIES" ("ID");
ALTER TABLE "SCOTT"."ROLE_AUTHORITY" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "SCOTT"."ROLES" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."SALES_CHANCES"
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_CHANCES" ADD FOREIGN KEY ("CREATED_USER_ID") REFERENCES "SCOTT"."USERS" ("ID");
ALTER TABLE "SCOTT"."SALES_CHANCES" ADD FOREIGN KEY ("DESIGNEE_ID") REFERENCES "SCOTT"."USERS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."SALES_PLAN"
-- ----------------------------
ALTER TABLE "SCOTT"."SALES_PLAN" ADD FOREIGN KEY ("CHANCE_ID") REFERENCES "SCOTT"."SALES_CHANCES" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."STORAGES"
-- ----------------------------
ALTER TABLE "SCOTT"."STORAGES" ADD FOREIGN KEY ("PRODUCT_ID") REFERENCES "SCOTT"."PRODUCTS" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."USERS"
-- ----------------------------
ALTER TABLE "SCOTT"."USERS" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "SCOTT"."ROLES" ("ID");
