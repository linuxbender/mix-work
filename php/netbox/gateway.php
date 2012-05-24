<?php
/*
	NET-BOX
	####################################
	daniel glenn papadopoulos
	glenn@starwolf.ch
	21.11.2010
	###################################
	NET-BOX v0.2
*/
include_once 'ch/starwolf/utils/AutoLoad.php';
use ch\starwolf\netbox\moduls as mod;

if (isset($_GET['MOD']) && !empty($_GET['MOD'])){
	$pMod = strtoupper(trim($_GET['MOD']));
	switch ($pMod) {
		case 'PING':
			$URL = (isset($_GET['URL']) && !empty($_GET['URL'])) ? $_GET['URL'] : 0;
			$oNetBox = new mod\Mod_Ping();
			
			$URL = $oNetBox->Replace($URL);
			
			$oNetBox->Execution(trim($URL));
		break;
		case 'TRACEROUTE':
			$URL = (isset($_GET['URL']) && !empty($_GET['URL'])) ? $_GET['URL'] : 0;
			$PORT = (isset($_GET['PORT']) && !empty($_GET['PORT'])) ? $_GET['PORT'] : 0;
			$oNetBox = new mod\Mod_Traceroute();
			
			$URL = $oNetBox->Replace($URL);
			$PORT = $oNetBox->Replace($PORT);
			
			$param = array('URL' => $URL, 'PORT' => $PORT);
			$oNetBox->Execution($param);
		break;
		case 'NSLOOKUP':
			$URL = (isset($_GET['URL']) && !empty($_GET['URL'])) ? $_GET['URL'] : 0;
			$TYPE = (isset($_GET['TYPE']) && !empty($_GET['TYPE'])) ? $_GET['TYPE'] : 0;
			$oNetBox = new mod\Mod_NSLookup();
			
			$URL = $oNetBox->Replace($URL);
			$TYPE = $oNetBox->Replace($TYPE);
			
			$param = array('URL' => $URL, 'TYPE' => $TYPE);
			$oNetBox->Execution($param);
		break;
		case 'NMAP':
			$URL = (isset($_GET['URL']) && !empty($_GET['URL'])) ? $_GET['URL'] : 0;
			$PORT = (isset($_GET['PORT']) && !empty($_GET['PORT'])) ? $_GET['PORT'] : 0;
			$oNetBox = new mod\Mod_NMap();
			
			$URL = $oNetBox->Replace($URL);
			$PORT = $oNetBox->Replace($PORT);
			
			$param = array('URL' => $URL, 'PORT' => $PORT);
			$oNetBox->Execution($param);
		break;
		case 'WHOIS':
			$URL = (isset($_GET['URL']) && !empty($_GET['URL'])) ? $_GET['URL'] : 0;
			$oNetBox = new mod\Mod_Whois();
			
			$URL = $oNetBox->Replace($URL);
			
			$oNetBox->Execution(trim($URL));
		break;
	}
}//end if  
?>