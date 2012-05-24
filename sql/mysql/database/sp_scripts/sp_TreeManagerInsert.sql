/*
************************************************************
************************************************************
<STOREDPROCEDURE>
	<NAME>sp_TreeManagerInsert</NAME>
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
		sp_TreeSelect show the current Tree
		]]>
	</DESCRITION>
	<PARAMETERS>
		<PARAMETER Name="TreeManagerName" Direction="IN" Datetype="varchar(225)"/>
		<PARAMETER Name="TreeManagerDescrition" Direction="IN" Datetype="text"/>
		<PARAMETER Name="TreeManagerShowRoot" Direction="IN" Datetype="tinyint"/>
		<PARAMETER Name="TreeManagerYear" Direction="IN" Datetype="year"/>
	<PARAMETERS>
	<DOCHISTORY>
		<![CDATA[
			n.a
		]]>
	</DOCHISTORY>
</STOREDPROCEDURE>
************************************************************
************************************************************
*/
USE starwolf;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_TreeManagerInsert` $$

CREATE DEFINER=`DevUser`@`localhost` PROCEDURE `sp_TreeManagerInsert`(IN TreeManagerName varchar(225), IN TreeManagerDescrition text, IN TreeManagerShowRoot tinyint, IN TreeManagerYear year)
BEGIN
	DECLARE TreeManagerID INT(10) default 0;
	DECLARE TreeManagerExist INT;

	SELECT COUNT(*) INTO TreeManagerExist FROM tblTreeManager WHERE tblTreeManagerName = TreeManagerName AND tblTreeManagerYear = TreeManagerYear;

	IF TreeManagerExist = 0 THEN

	INSERT INTO tbltreemanager (tblTreeManagerName, tblTreeManagerDescrition, tblTreeManagerShowRoot, tblTreeManagerYear)
	VALUES(TreeManagerName, TreeManagerDescrition, TreeManagerShowRoot, TreeManagerYear);

	SELECT tblTreeManagerID INTO TreeManagerID from tblTreeManager WHERE tblTreeManagerName = TreeManagerName AND tblTreeManagerYear = TreeManagerYear;

	INSERT INTO tbltree (tblTreeParent, tblTreeChild, tblTreeObjectID, tblTreeValue, tblTreeManagerID)
	VALUES (0,0,0,TreeManagerName,TreeManagerID);

	END IF;
END $$

DELIMITER ;

