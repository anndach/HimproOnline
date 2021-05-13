/*
 Navicat Premium Data Transfer

 Source Server         : himpro
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 14.11.0.3:3306
 Source Schema         : covid_db

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 13/05/2021 15:21:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appoint
-- ----------------------------
DROP TABLE IF EXISTS `appoint`;
CREATE TABLE `appoint`  (
  `regdate` date NOT NULL,
  `cid` varchar(13) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `date_appoint` date NOT NULL,
  `time_appoint` time NOT NULL,
  `slot_time` varchar(50) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`regdate`, `cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_version
-- ----------------------------
DROP TABLE IF EXISTS `db_version`;
CREATE TABLE `db_version`  (
  `version_num` int(7) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(50) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `sql` text CHARACTER SET tis620 COLLATE tis620_thai_ci NULL,
  `d_update` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for files_store
-- ----------------------------
DROP TABLE IF EXISTS `files_store`;
CREATE TABLE `files_store`  (
  `uuid` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `filetype` varchar(15) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `filesize` double NULL DEFAULT NULL,
  `rawdata` longblob NULL,
  `user_upload` varbinary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  INDEX `filename`(`filename`) USING BTREE,
  INDEX `userupload`(`user_upload`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_data_send
-- ----------------------------
DROP TABLE IF EXISTS `log_data_send`;
CREATE TABLE `log_data_send`  (
  `cid` int(13) NOT NULL,
  `hn` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `visit_uuid` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `raw_json` text CHARACTER SET tis620 COLLATE tis620_thai_ci NULL,
  `result_json` text CHARACTER SET tis620 COLLATE tis620_thai_ci NULL,
  `d_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`visit_uuid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `hn`(`hn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for person_target
-- ----------------------------
DROP TABLE IF EXISTS `person_target`;
CREATE TABLE `person_target`  (
  `cid` varchar(13) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `hn` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `title_name` varchar(15) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `fname` varchar(150) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `lname` varchar(150) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `eng_title` varchar(25) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `eng_fname` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `eng_mname` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `eng_lname` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `eng_full_address` text CHARACTER SET tis620 COLLATE tis620_thai_ci NULL,
  `counsel` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=ให้คำแนะนำแล้ว, 0=ยังไม่ให้คำแนะนำ',
  `needle1` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=ฉีดแล้ว,0=ยังไม่ฉีด',
  `needle2` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=ฉีดแล้ว,0=ยังไม่ฉีด',
  `moph_data_chk` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=พบข้อมูลการฉีด, 0=ไม่พบข้อมูลการฉีด',
  `moph_immuniz_chk` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=มีข้อมูลในกระทรวงแล้ว, 0=ไม่มีข้อมูลในระบบกระทรวง',
  `moph_person_id` int(7) NULL DEFAULT NULL,
  `moph_person_type` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `moph_person_risk_id` int(7) NULL DEFAULT NULL,
  `moph_person_risk_name` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `moph_need_vaccine` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'Y=ต้องการฉีด N = ไม่ต้องการฉีด',
  `moph_immuniz_update` datetime NULL DEFAULT NULL,
  `need_update` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '1' COMMENT '0=ไม่ต้องการอับเดทข้อมูลใหม่, 1=ต้องการอับเดทข้อมูลใหม่',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for screen_covid
-- ----------------------------
DROP TABLE IF EXISTS `screen_covid`;
CREATE TABLE `screen_covid`  (
  `regdate` date NOT NULL,
  `cid` varchar(13) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `hn` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `age` int(3) NULL DEFAULT NULL COMMENT 'อายุ',
  `phone` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `occupation` varchar(100) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `road` varchar(50) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `moo` int(3) NULL DEFAULT NULL,
  `province` varchar(6) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `amphur` varchar(6) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `tambon` varchar(6) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `movefrom` varchar(100) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'เดินทางมาจากพื้นที่เสี่ยง จังหวัด หรือ ประเทศ',
  `touchrick` varchar(150) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'มีประวัติสัมผัสผู้ป่วยยืนยัน หรือเสี่ยงสูง',
  `himpro_register` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=ลงทะเบียนใน himpro แล้ว, 0=ยังไม่ลงทะเบียนใน himpro',
  `himpro_docno` int(10) NULL DEFAULT NULL COMMENT 'เลขที่ vist ฟิว docno ใน himpro',
  `pay_status` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=จ่ายเงินแล้ว, 0 ยังไม่จ่ายเงิน',
  `qa1` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ไอ',
  `qa2` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'เจ็บคอ มีน้ำมูก',
  `qa3` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'จมูกไม่ได้กลิ่น',
  `qa4` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ลิ้นไม่รับรส',
  `qa5` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'หายใจเร็ว/หายใจเหนื่อย/หายใจลำบาก',
  `qa6` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ประวัติมีไข้ หรือ อุณหภูมิกายตั้งแต่ 37.5 ◦C ขึ้นไป',
  `qa7` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ตาแดง',
  `qa8` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'มีผื่นคัน',
  `qa9` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'อยู่อาศัยหรือเดินทางจากประเทศ/จังหวัดที่เป็นพื้นที่เสี่ยงการระบาดของ COVID-19 ตามประกาศของ สสจ.ศรีสะเกษ ภายใน 14 วัน',
  `qa10` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ไปสถานที่เสี่ยงในวันและเวลาตามประกาศของศูนย์บริหารสถานการณ์การแพร่ระบาด COVID-19 จ.ศรีสะเกษ',
  `qa11` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'เป็นผู้สัมผัสกับผู้ป่วยยืนยันหรือสงสัยติดเชื้อ COVID-19',
  `qa12` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ปฎิบัติหน้าที่ในสถานบริการสาธารณสุข โดยพิจารณาตามความเหมาะสม',
  `qa13` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'ปฏิบัติงานในสถานกักกันโรค',
  `qa14` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'มีอาการติดเชื้อทางเดินหายใจเป็นกลุ่มก้อน 5 รายขึ้นไปในสถานที่เดียวกัน โดยเชื่อมโยงทางระบาดวิทยา',
  `qa15` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'แพทย์ผู้ตรวจสงสัยว่าเป็น COVID-19',
  `other` text CHARACTER SET tis620 COLLATE tis620_thai_ci NULL COMMENT 'อื่นๆ',
  `pay_method` varchar(150) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'รูปแบบการชำระเงิน เช่น โอนผ่านธนาคาร, ชำระผ่านบัตรเครดิต',
  `user_recode` varchar(250) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ผู้บันทึกข้อมูล',
  `close_job` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT '1=ปิดจ๊อบ จบกระบวนการ ให้บริการแล้ว, 0= รอรับบริการ',
  `d_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regdate`, `cid`) USING BTREE,
  INDEX `fullname`(`fullname`) USING BTREE,
  INDEX `hn`(`hn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for updatePersonTarget
-- ----------------------------
DROP PROCEDURE IF EXISTS `updatePersonTarget`;
delimiter ;;
CREATE PROCEDURE `updatePersonTarget`()
BEGIN
	#Routine body goes here...
INSERT IGNORE covid_db.person_target (cid)
SELECT cid FROM (
SELECT REPLACE(p.cardid,'-','')'cid',o.* 
FROM hos.vaccine v INNER JOIN opd.ptvaccine o on v.`code` = o.`code` 
LEFT JOIN pt.pt p on o.hn = p.hn
WHERE v.thocode = 'c19' and o.regdate BETWEEN '2021-01-01' and DATE_FORMAT(NOW(),'%Y-%m-%d')
UNION
SELECT REPLACE(p.cardid,'-','')'cid',o.* 
FROM hos.vaccine v INNER JOIN pcu.ptvaccine o on v.`code` = o.`code` 
LEFT JOIN pt.pt p on o.hn = p.hn
WHERE v.thocode = 'c19' and o.regdate BETWEEN '2021-01-01' and DATE_FORMAT(NOW(),'%Y-%m-%d'))as a;

UPDATE covid_db.person_target t INNER JOIN pt.pt p on t.cid = REPLACE(p.cardid,'-','') SET t.hn = p.hn WHERE t.hn is null;

UPDATE covid_db.person_target t INNER JOIN pt.pt p on t.hn = p.hn SET t.title_name = p.pttitle,t.fname = p.ptfname,t.lname = p.ptlname WHERE t.title_name is null;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
