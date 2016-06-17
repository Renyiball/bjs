<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-21
	描述：比赛规则
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class RulesController extends AdminbaseController {
	protected	$rules_model,
				$users_model,
				$gameinfos_model;
	function _initialize() {
		parent::_initialize();
		$this->rules_model = D("Common/Rules");
		$this->users_model = D("Common/Users");
		$this->gameinfos_model = M("Gameinfos","*");
	}
	function index(){
		$this->_lists();
	}
	function _lists(){
		if(I('session.school_id')){
			$school_id = array("school_id"=>intval(I('session.school_id')));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$school_id = array("school_id = 0");
		}else{
			$school_id = array("school_id > 0");
		}
		$users = $this->users_model
		->where($school_id)
		->order("id DESC")
		->select();
		foreach($users as$k=>$use){
			$user[$k] = $use['id'];
		}
		$gameinfos = $this->gameinfos_model
		->where($school_id)
		->order("id DESC")
		->select();
		if(I('session.school_id') && $user){
			$where = array('rule_userid'=>array("in",$user));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$where=  array('rule_userid = 0');
		}else{
			$where=  array('rule_userid > 0');
		}
		$count=$this->rules_model->where($where)->count();
		$page = $this->page($count, 20);
		$rules = $this->rules_model
		->where($where)->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$this->assign("rules",$rules);
		$this->assign("gameinfos",$gameinfos);
		$this->assign("users",$users);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}
	function add(){
		if(I('session.school_id')){
			$school_id = array("ISNULL(rules_url) or rules_url=''","school_id"=>intval(I('session.school_id')));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$school_id = array("school_id='0'");
		}else{
			$school_id = array("ISNULL(rules_url) or rules_url=''");
		}
		$gameinfos = $this->gameinfos_model
		->where($school_id)
		->order("id DESC")
		->select();
		$this->assign("gameinfos",$gameinfos);
		$this->display();
	}
	function add_post(){
		$_POST['rule_date'] = date("Y-m-d H:i:s");
		$_POST['rule_modify'] = date("Y-m-d H:i:s");
		$_POST['rule_userid'] = get_current_admin_id();
		$rulesid = $this->rules_model->add($_POST);
		if ($rulesid){
			if(I('post.game_id')){
				$this->gameinfos_model->where(array('id'=>I('post.game_id')))->setField('rules_url','http://'.$_SERVER['HTTP_HOST'].U('portal/article/index',array('id'=>$rulesid)));
			}
			$this->success("添加成功！",U('Event/index'));
		} else {
			$this->error("添加失败！");
		}
	}
	public function edit(){
		$id=  intval(I("get.id"));
		$rules = $this->rules_model
		->where(array("id"=>$id))
		->find();
		if(I('session.school_id')){
			$school_id = array("school_id"=>intval(I('session.school_id')));
		}else{
			$school_id = array();
		}
		$gameinfos = $this->gameinfos_model
		->where($school_id)
		->order("id DESC")
		->select();
		$this->assign("rules",$rules);
		$this->assign("gameinfos",$gameinfos);
		$this->display();
	}
	function edit_post(){
		$rules = $this->rules_model->where(array("id"=>I("post.id")))->find();
		$this->gameinfos_model->where(array('id'=>$rules['game_id']))->setField('rules_url',NULL);
		$this->rules_model->where(array("game_id"=>I("post.game_id")))->setField('game_id',NULL);
		$_POST['rule_modify'] = date("Y-m-d H:i:s");
		$_POST['rule_userid'] = get_current_admin_id();
		if ($this->rules_model->save($_POST)){
			if(I("post.game_id")){
				$this->gameinfos_model->where(array('id'=>I("post.game_id")))->setField('rules_url','http://'.$_SERVER['HTTP_HOST'].U('portal/article/index',array('id'=>I("post.id"))));
			}
			$this->success("修改成功！",U('Event/index'));
		} else {
			$this->error("修改失败！");
		}
	}
	function delete(){
		$id=  intval(I("get.id"));
		if ($this->rules_model->where(array('id'=>I("get.id")))->delete()!==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
}