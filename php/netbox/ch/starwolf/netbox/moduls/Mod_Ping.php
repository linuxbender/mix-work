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

class Mod_Ping extends NetBox {
	
	private $URL;
	private $Data = NULL;
	private $PingCount = 4;
	
	public function __construct(){
	}
	
	public function Execution($param = NULL){
		$this->setURL($param);
		exec("ping -c ".$this->getPingCount()." ".$this->getURL(),$this->Data);
		$this->Serialization($this->getData());
	}
	
	protected function setPingCount($param) {
		$this->PingCount = $param;
	}
	
	private function getPingCount(){
		return $this->PingCount;
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
