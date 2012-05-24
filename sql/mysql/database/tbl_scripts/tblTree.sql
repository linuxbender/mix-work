/*
************************************************************
************************************************************
<TABEL>
	<NAME>tblTree</NAME>
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
		Database Table tblTree hold all tree objects in the web application.
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

DROP TABLE IF EXISTS `starwolf`.`tblTree` ;

CREATE  TABLE IF NOT EXISTS `starwolf`.`tblTree` (
  `tblTreeID` BIGINT NOT NULL AUTO_INCREMENT ,
  `tblTreeManagerID` BIGINT NOT NULL ,
  `tblTreeLeft` BIGINT NOT NULL ,
  `tblTreeRight` BIGINT NOT NULL ,
  `tblTreeValue` TEXT NOT NULL ,
  PRIMARY KEY (`tblTreeID`, `tblTreeManagerID`) ,
  UNIQUE INDEX `tblTreeID_UNIQUE` (`tblTreeID` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci

