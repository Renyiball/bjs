<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-04-14
	描述：用户活跃
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class ActiveController extends AdminbaseController {
	protected $Accesslogs_obj;
	function _initialize() {
		parent::_initialize();
		$this->Accesslogs_obj = M("Accesslogs","*");
	}
	public function index(){
    	$this->_list();
    }

	public function _list(){
		$now = date('Y-m',strtotime('-2 month'));
		 $Query =$this->Accesslogs_obj
		 ->field("max(id) id")
		 ->where("loginuserid > 0")
		 ->group("loginuserid")
		 ->select(false); 
		 $count = count($this->Accesslogs_obj
		->field('b.id')
		->table("($Query)a,accesslogs b")
		->where("a.id=b.id && (date(created) > '$now')")
		->order("id desc")
		->select());
		$page = $this->page($count, 20);
		$accesslogs = $this->Accesslogs_obj
		->field("b.id , b.funcname , b.art , b.loginuserid,b.remote_addr,b.created,b.remote_port,b.response_data")
		->table("($Query)a,accesslogs b")
		->where("a.id=b.id && (date(created) > '$now')")
		->order("id desc")
		->limit($page->firstRow . ',' . $page->listRows)
		->select(); 
		$this->assign("accesslogs",$accesslogs);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}
	public function look(){
    	if(I("get.id")){
			$count=$this->Accesslogs_obj->where(array("loginuserid"=>I("get.id")))-> count();
			$page = $this->page($count, 20);
			$items = $this->Accesslogs_obj
			->where(array("loginuserid"=>I("get.id")))
			->order("id desc")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			$this->assign("page", $page->show('Admin'));
			$this->assign("lists",$items);
			$this->display();
		}else{
			$this->error($this->Accesslogs_obj->getError());
		}
	}

}