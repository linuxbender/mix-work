<?php
/*
	NET-BOX
	####################################
    daniel glenn
    linuxbender@gmail.com
    http://starwolf.ch
    http://creativecommons.org/licenses/by-nc-sa/3.0/
    12.10.2010
	###################################
	NET-BOX v0.2
*/

namespace ch\starwolf\netbox\moduls;
use ch\starwolf\netbox\NetBox;

class Mod_Traceroute extends NetBox {
	
	private $URL;
	private $Port;
	private $Data = NULL;
	
	public function __construct(){
	}
	
	public function Execution($param){
		$this->setURL($param['URL']);
		$this->setPort($param['PORT']);
		exec(traceroute -4 -p ".$this->getPort()." -w 1 ".$this->getURL() , $this->Data);
		$this->Serialization($this->getData());
	}
	
	protected function setPort($param) {
		$this->Port = $param;
	}
	
	private function getPort(){
		return $this->Port;
	}
	
	protected function setURL($param){
		$this->URL = $param;	
	}
	
	private function getURL(){
		return $this->URL;
	}
	
	private function setData($param) {
		$this->Data = $param;
	}
	
	private function getData() {
		return $this->Data;
	}
}//enf of class
?>

