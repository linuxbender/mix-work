/*
************************************************************
************************************************************
<TRIGGER>
	<NAME>t_Insert_tblTreeManager</NAME>
	<DATABASE>starwolf</DATABASE>
	<AUTOR>daniel glenn papadopoulos</AUTOR>
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
		Trigger for the archiv application system.
		]]>
	</DESCRITION>
	<DOCHISTORY>
		<![CDATA[
			2010-04-03, DP, create script
			2011-05-09, DP, update
		]]>
	</DOCHISTORY>
</TRIGGER>
************************************************************
************************************************************
*/
USE starwolf;

DELIMITER $$
DROP TRIGGER IF EXISTS `starwolf`.`t_Insert_tblTreeManager` $$
CREATE DEFINER=`DevUser`@`localhost` TRIGGER t_Insert_tblTreeManager AFTER INSERT ON `starwolf`.`tblTreeManager` FOR EACH ROW
BEGIN
	DECLARE UserCurrent BIGINT default 0;
	SET UserCurrent = @UserCurrent;

	INSERT INTO `starwolf`.`tblArchivTreeManager`
	(`tblArchivTreeManagerDate`,
	`tblArchivTreeManagerStm`,
	`tblArchivTreeManagerCurrentUserID`,
	`tblTreeManagerID`,
	`tblTreeManagerName`,
	`tblTreeManagerDescrition`,
	`tblTreeManagerShowRoot`,
	`tblTreeManagerYear`)
	VALUES
	( SYSDATE(),
	'INSERT',
	UserCurrent,
	NEW.tblTreeManagerID,
	NEW.tblTreeManagerName,
	NEW.tblTreeManagerDescrition,
	NEW.tblTreeManagerShowRoot,
	NEW.tblTreeManagerYear);
END$$
DELIMITER ;

