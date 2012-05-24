/*
************************************************************
************************************************************
<STOREDPROCEDURE>
	<NAME>sp_TreeSelect</NAME>
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
		Add a new node into the current tree.
		]]>
	</DESCRITION>
	<PARAMETERS>
		<PARAMETER Name="TreeValuePos" Direction="IN" Datetype="varchar(225)"/>
		<PARAMETER Name="TreeValueAdd" Direction="IN" Datetype="varchar(225)"/>
		<PARAMETER Name="TreeManagerID" Direction="IN" Datetype="int(10)"/>
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
DROP PROCEDURE IF EXISTS `sp_TreeAdd` $$
CREATE DEFINER=`DevUser`@`localhost` PROCEDURE `sp_TreeAdd`(IN TreeValuePos varchar(225), IN TreeValueAdd varchar(225), IN TreeManagerID int(10))
BEGIN
-- LOCK TABLE tblTree WRITE;
-- START TRANSACTION;

	SELECT @myRight := tblTreeRight FROM tblTree
	WHERE tblTreeValue = TreeValuePos AND tblTreeManagerID = TreeManagerID;

	UPDATE tblTree SET tblTreeRight = tblTreeRight + 2 WHERE tblTreeRight > @myRight AND tblTreeManagerID = TreeManagerID;
	UPDATE tblTree SET tblTreeLeft = tblTreeLeft + 2 WHERE tblTreeLeft > @myRight AND tblTreeManagerID = TreeManagerID;

	INSERT INTO tblTree(tblTreeValue, tblTreeLeft, tblTreeRight, tblTreeManager) VALUES(TreeValueAdd, @myRight + 1, @myRight + 2,TreeManagerID);

-- COMMIT;
-- UNLOCK TABLES;

END $$
DELIMITER ;

