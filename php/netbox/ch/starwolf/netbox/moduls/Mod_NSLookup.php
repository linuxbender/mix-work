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

class Mod_NSLookup extends NetBox {
	
	private $URL;
	private $TYPE;
	private $Data = NULL;
	
	public function __construct(){
	}
	
	public function Execution($param){
		$this->setURL($param['URL']);
		$this->setType($param['TYPE']);
		exec("nslookup -type=".$this->getType()." ".$this->getURL(), $this->Data);
		$this->Serialization($this->getData());
	}
	
	protected function setType($param) {
		$this->Port = $param;
	}
	
	private function getType(){
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
