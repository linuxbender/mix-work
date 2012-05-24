<?php
/*
 * autoload util
 * the spl_autoload works only on windows server..
 * TODO: check the future release from PHP for this Bug on Unix System.
 *
 * spl_autoload_extensions(".php");
 * spl_autoload_register();
 */

function __autoload($className) {
	$fileName = str_replace("\\", "/", $className).".php";
	if (file_exists($fileName)) {
		require_once $fileName;
		return true;
	}
}
?>
