<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-04-15
	描述：论坛文章
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class ForumsController extends AdminbaseController {
	protected	$forums_model,
				$users_model,
				$forumcomments_model;
	function _initialize() {
		parent::_initialize();
		$this->forums_model = M("Forums","*");
		$this->users_model = M("Users","*");
		$this->forumcomments_model = M("Forumcomments","*");
	}
	function index(){
		$this->_lists();
	}
	function _lists(){
		$count=$this->forums_model->count();
		$page = $this->page($count, 20);
		$forums = $this->forums_model
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		foreach($forums as$k=>$forum){
			$userid[$k] = $forum['userid'];
		}
		if($userid){
			$userid = array_merge(array_unique($userid));
			$users = $this->users_model->where(array('id'=>array('in',$userid)))->select();
		}
		$this->assign("forums",$forums);
		$this->assign("users",$users);
		$this->assign("page", $page->show('Admin'));
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function comment(){
		$count=$this->forumcomments_model->where(array('forum_id'=>I("get.id")))->count();
		$page = $this->page($count, 20);
		$forums = $this->forumcomments_model
		->where(array('forum_id'=>I("get.id")))
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		foreach($forums as$k=>$forum){
			$userid[$k] = $forum['userid'];
		}
		if($userid){
			$userid = array_merge(array_unique($userid));
			$users = $this->users_model->where(array('id'=>array('in',$userid)))->select();
		}
		$this->assign("forums",$forums);
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->display();
	}
}