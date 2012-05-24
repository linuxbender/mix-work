/*
************************************************************
************************************************************
<TABEL>
	<NAME>tblTreeManager</NAME>
	<DATABASE>starwolf</DATABASE>
	<AUTOR>daniel glenn</AUTOR>
	<LOCATION>switzerland</LOCATION>
	<PROJECT>starwolf</PROJECT>
	<TECHNOLOGY>LAMP</TECHNOLOGY>
	<DATE>2011-05-09</DATE>
	<VERSION>1.00</VERSION>
	<COMMENT><![CDATA[n.a]]></COMMENT>
	<EMAIL>
		<![CDATA[
			linuxbender@gmail.com
		]]>
	</EMAIL>
	<DESCRITION>
		<![CDATA[
		tblTreeManagerID PK in tblTreeManager and FK in tblTree
		]]>
	</DESCRITION>
	<DOCHISTORY>
		<![CDATA[
			2010-04-03, DP, create script
			2011-05-09, DP, update
		]]>
	</DOCHISTORY>
</TABEL>
************************************************************
************************************************************
*/
USE starwolf;

DROP TABLE IF EXISTS `starwolf`.`tblTreeManager` ;

CREATE  TABLE IF NOT EXISTS `starwolf`.`tblTreeManager` (
  `tblTreeManagerID` BIGINT NOT NULL AUTO_INCREMENT ,
  `tblTreeManagerName` TEXT NULL ,
  `tblTreeManagerDescrition` LONGTEXT NULL ,
  `tblTreeManagerShowRoot` TINYINT(1)  NULL DEFAULT 1 COMMENT 'if you need to show root (0,0) ' ,
  `tblTreeManagerYear` DATETIME NULL DEFAULT '0000-00-00 00:00:00' ,
  PRIMARY KEY (`tblTreeManagerID`) ,
  UNIQUE INDEX `tblTreeManagerID_UNIQUE` (`tblTreeManagerID` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci

