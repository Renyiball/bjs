<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-04-14
	描述：注册统计
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class RegisterController extends AdminbaseController{
	protected	$users_model;
	
	function _initialize() {
		parent::_initialize();
		$this->users_model = M("Users","*");
	}
	public function regist_source(){
		$regist_source  = array(
						array("id"=>"1010","name"=> "安卓端  —  手机号码"),
						array("id"=>"2010","name"=> "苹果端  —  手机号码"),
						array("id"=>"3010","name"=> "手机端  —  手机号码"),
						array("id"=>"4010","name"=> "微信端  —  手机号码"),
						array("id"=>"5010","name"=> "PC端  —  手机号码"),
						array("id"=>"1020","name"=> "安卓端  —  微信登陆"),
						array("id"=>"2020","name"=> "苹果端  —  微信登陆"),
						array("id"=>"3020","name"=> "手机端  —  微信登陆"),
						array("id"=>"4020","name"=> "微信端  —  微信登陆"),
						array("id"=>"5020","name"=> "PC端  —  微信登陆"),
						array("id"=>"1030","name"=> "安卓端  —  QQ登陆"),
						array("id"=>"2030","name"=> "苹果端  —  QQ登陆"),
						array("id"=>"3030","name"=> "手机端  —  QQ登陆"),
						array("id"=>"4030","name"=> "微信端  —  QQ登陆"),
						array("id"=>"5030","name"=> "PC端  —  QQ登陆"),
						array("id"=>"6060","name"=> "客户端  —  赛事报名")
					);
		return $regist_source;
	}
	function index(){
		$count=$this->users_model->count();
		$page = $this->page($count, 20);
		$users = $this->users_model
		->order("id desc")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$source = $this->regist_source();
		$this->assign("page", $page->show('Admin'));
		$this->assign("users",$users);
		$this->assign("source",$source);
		$this->display();
	}
}