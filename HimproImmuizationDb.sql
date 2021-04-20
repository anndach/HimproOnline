-- --------------------------------------------------------
-- Host:                         14.11.0.3
-- Server version:               5.7.19-0ubuntu0.16.04.1-log - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for covid_db
CREATE DATABASE IF NOT EXISTS `covid_db` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `covid_db`;

-- Dumping structure for table covid_db.appoint
CREATE TABLE IF NOT EXISTS `appoint` (
  `regdate` date NOT NULL,
  `cid` varchar(13) NOT NULL,
  `date_appoint` date NOT NULL,
  `time_appoint` time NOT NULL,
  `slot_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`regdate`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for table covid_db.db_version
CREATE TABLE IF NOT EXISTS `db_version` (
  `version_num` int(7) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(50) NOT NULL,
  `sql` text,
  `d_update` datetime DEFAULT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for table covid_db.files_store
CREATE TABLE IF NOT EXISTS `files_store` (
  `uuid` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filetype` varchar(15) DEFAULT NULL,
  `filesize` double DEFAULT NULL,
  `rawdata` longblob,
  `user_upload` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `filename` (`filename`),
  KEY `userupload` (`user_upload`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for table covid_db.log_data_send
CREATE TABLE IF NOT EXISTS `log_data_send` (
  `cid` int(13) NOT NULL,
  `hn` varchar(10) DEFAULT NULL,
  `visit_uuid` varchar(255) NOT NULL,
  `raw_json` text,
  `result_json` text,
  `d_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`visit_uuid`) USING BTREE,
  KEY `cid` (`cid`),
  KEY `hn` (`hn`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for table covid_db.person_target
CREATE TABLE IF NOT EXISTS `person_target` (
  `cid` varchar(13) NOT NULL,
  `hn` varchar(10) DEFAULT NULL,
  `title_name` varchar(15) DEFAULT NULL,
  `fname` varchar(150) DEFAULT NULL,
  `lname` varchar(150) DEFAULT NULL,
  `eng_title` varchar(25) DEFAULT NULL,
  `eng_fname` varchar(255) DEFAULT NULL,
  `eng_mname` varchar(255) DEFAULT NULL,
  `eng_lname` varchar(255) DEFAULT NULL,
  `eng_full_address` text,
  `counsel` varchar(1) DEFAULT '0' COMMENT '1=ให้คำแนะนำแล้ว, 0=ยังไม่ให้คำแนะนำ',
  `needle1` varchar(1) DEFAULT '0' COMMENT '1=ฉีดแล้ว,0=ยังไม่ฉีด',
  `needle2` varchar(1) DEFAULT '0' COMMENT '1=ฉีดแล้ว,0=ยังไม่ฉีด',
  `moph_data_chk` varchar(1) DEFAULT '0' COMMENT '1=พบข้อมูลการฉีด, 0=ไม่พบข้อมูลการฉีด',
  `moph_immuniz_chk` varchar(1) DEFAULT '0' COMMENT '1=มีข้อมูลในกระทรวงแล้ว, 0=ไม่มีข้อมูลในระบบกระทรวง',
  `moph_person_id` int(7) DEFAULT NULL,
  `moph_person_type` varchar(255) DEFAULT NULL,
  `moph_person_risk_id` int(7) DEFAULT NULL,
  `moph_person_risk_name` varchar(255) DEFAULT NULL,
  `moph_need_vaccine` varchar(1) DEFAULT NULL COMMENT 'Y=ต้องการฉีด N = ไม่ต้องการฉีด',
  `moph_immuniz_update` datetime DEFAULT NULL,
  `need_update` varchar(1) DEFAULT '1' COMMENT '0=ไม่ต้องการอับเดทข้อมูลใหม่, 1=ต้องการอับเดทข้อมูลใหม่',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for table covid_db.screen_covid
CREATE TABLE IF NOT EXISTS `screen_covid` (
  `regdate` date NOT NULL,
  `cid` varchar(13) NOT NULL,
  `hn` varchar(10) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `age` int(3) DEFAULT NULL COMMENT 'อายุ',
  `phone` varchar(10) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `road` varchar(50) DEFAULT NULL,
  `moo` int(3) DEFAULT NULL,
  `province` varchar(6) NOT NULL,
  `amphur` varchar(6) NOT NULL,
  `tambon` varchar(6) NOT NULL,
  `movefrom` varchar(100) DEFAULT NULL COMMENT 'เดินทางมาจากพื้นที่เสี่ยง จังหวัด หรือ ประเทศ',
  `touchrick` varchar(150) DEFAULT NULL COMMENT 'มีประวัติสัมผัสผู้ป่วยยืนยัน หรือเสี่ยงสูง',
  `himpro_register` varchar(1) DEFAULT '0' COMMENT '1=ลงทะเบียนใน himpro แล้ว, 0=ยังไม่ลงทะเบียนใน himpro',
  `himpro_docno` int(10) DEFAULT NULL COMMENT 'เลขที่ vist ฟิว docno ใน himpro',
  `pay_status` varchar(1) DEFAULT '0' COMMENT '1=จ่ายเงินแล้ว, 0 ยังไม่จ่ายเงิน',
  `qa1` varchar(1) DEFAULT '0' COMMENT 'ไอ',
  `qa2` varchar(1) DEFAULT '0' COMMENT 'เจ็บคอ มีน้ำมูก',
  `qa3` varchar(1) DEFAULT '0' COMMENT 'จมูกไม่ได้กลิ่น',
  `qa4` varchar(1) DEFAULT '0' COMMENT 'ลิ้นไม่รับรส',
  `qa5` varchar(1) DEFAULT '0' COMMENT 'หายใจเร็ว/หายใจเหนื่อย/หายใจลำบาก',
  `qa6` varchar(1) DEFAULT '0' COMMENT 'ประวัติมีไข้ หรือ อุณหภูมิกายตั้งแต่ 37.5 ◦C ขึ้นไป',
  `qa7` varchar(1) DEFAULT '0' COMMENT 'ตาแดง',
  `qa8` varchar(1) DEFAULT '0' COMMENT 'มีผื่นคัน',
  `qa9` varchar(1) DEFAULT '0' COMMENT 'อยู่อาศัยหรือเดินทางจากประเทศ/จังหวัดที่เป็นพื้นที่เสี่ยงการระบาดของ COVID-19 ตามประกาศของ สสจ.ศรีสะเกษ ภายใน 14 วัน',
  `qa10` varchar(1) DEFAULT '0' COMMENT 'ไปสถานที่เสี่ยงในวันและเวลาตามประกาศของศูนย์บริหารสถานการณ์การแพร่ระบาด COVID-19 จ.ศรีสะเกษ',
  `qa11` varchar(1) DEFAULT '0' COMMENT 'เป็นผู้สัมผัสกับผู้ป่วยยืนยันหรือสงสัยติดเชื้อ COVID-19',
  `qa12` varchar(1) DEFAULT '0' COMMENT 'ปฎิบัติหน้าที่ในสถานบริการสาธารณสุข โดยพิจารณาตามความเหมาะสม',
  `qa13` varchar(1) DEFAULT '0' COMMENT 'ปฏิบัติงานในสถานกักกันโรค',
  `qa14` varchar(1) DEFAULT '0' COMMENT 'มีอาการติดเชื้อทางเดินหายใจเป็นกลุ่มก้อน 5 รายขึ้นไปในสถานที่เดียวกัน โดยเชื่อมโยงทางระบาดวิทยา',
  `qa15` varchar(1) DEFAULT '0' COMMENT 'แพทย์ผู้ตรวจสงสัยว่าเป็น COVID-19',
  `other` text COMMENT 'อื่นๆ',
  `pay_method` varchar(150) DEFAULT NULL COMMENT 'รูปแบบการชำระเงิน เช่น โอนผ่านธนาคาร, ชำระผ่านบัตรเครดิต',
  `user_recode` varchar(250) DEFAULT NULL COMMENT 'ผู้บันทึกข้อมูล',
  `close_job` varchar(1) DEFAULT '0' COMMENT '1=ปิดจ๊อบ จบกระบวนการ ให้บริการแล้ว, 0= รอรับบริการ',
  `d_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regdate`,`cid`),
  KEY `fullname` (`fullname`),
  KEY `hn` (`hn`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- Data exporting was unselected.

-- Dumping structure for procedure covid_db.updatePersonTarget
DELIMITER //
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
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


INSERT INTO `covid_db`.`db_version` (`version_name`, `d_update`) VALUES ('1.0', '2021-04-20 09:51:19');