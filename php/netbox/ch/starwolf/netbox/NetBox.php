<?php
/*
	NET-BOX
	####################################
	daniel glenn papadopoulos
	glenn@starwolf.ch
	12.10.2010
	###################################
	NET-BOX v0.2
	

*/
namespace ch\starwolf\netbox;
abstract class NetBox {
	
	private $Data = NULL;
	
	abstract public function Execution($param);
	
	public function __construct(){
	}
	
	protected function Serialization($param) {
		$this->setData($param);
		$this->Encoding();
	}
	
	private function setData($param) {
		$this->Data = $param;
	}
	
	private function getData() {
		return $this->Data;
	}
	private function Encoding() {
		$this->DataReader($this->getData());
		$this->ResponseJson($this->getData());
	}
	
	private function DataReader($param){
		$DataHolder = NULL;
		$Line = NULL;	
	
		foreach ($param as $Line){
                $DataHolder = "$DataHolder $Line<br>";
        }
		$this->setData(array("ping" => $DataHolder));
	}
	
	private function ResponseJson($param) {
		if(!empty($param)) {
			echo json_encode($param);
		} else {
			$data = array("ping" => "n.a");
			echo json_encode($data);
		}
	}
	public function Replace($param){
		$value = mb_strtolower($param,'UTF-8');
		$search = array("grep", ">", "<", "|", ">>", "<<");
		return trim(str_replace($search, "", $value));
	}
}//end of class
?>
