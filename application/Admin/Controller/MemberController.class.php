<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-22
	描述：球员管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class MemberController extends AdminbaseController {
	protected	$teaminfos_model,
				$teammembers_model,
				$users_model,
				$schoolinfos_model;
	function _initialize() {
		parent::_initialize();
		$this->teaminfos_model = M("Teaminfos","*");
		$this->teammembers_model = M("Teammembers","*");
		$this->users_model = M("Users","*");
		$this->schoolinfos_model = M("Schoolinfos","*");
		$this->checkmembers_model = M("Checkmembers","*");
	}
	public function index(){
		if(I('session.school_id') && I('session.packet_id')==5){
			$school_id = array("parent_id"=>intval(I('session.school_id')),"master_userid"=>get_current_admin_id());
		}elseif(I('session.school_id') && I('session.packet_id')!=5){
			$school_id = array("parent_id"=>intval(I('session.school_id')));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$school_id = array("parent_id = 0");
		}else{
			$school_id = array("parent_id > 0");
		}
		$teaminfos = $this->teaminfos_model->where($school_id)->select();
		foreach($teaminfos as$k=>$team){
			$tea[$k] = $team['id'];
		}
		if(I("get.gid")){
			$teamid = array("team_id"=>I("get.gid"));
		}else{
			if($tea){
				$teamid = array('team_id'=>array("in",array_merge(array_unique($tea))));
			}elseif(!I('session.school_id') && I('session.packet_id')>2){
				$teamid = array("team_id = 0");
			}else{
				$teamid = array('team_id >0');
			}
		}
		$count=$this->teammembers_model->where($teamid)->count();
		$page = $this->page($count, 20);
		$teammembers = $this->teammembers_model
		->where($teamid)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$users = $this->users_model->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign("teammembers",$teammembers);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("users",$users);
		$this->display();		
	}
	function edit() {
		$teammembers = $this->teammembers_model
		->where(array("id"=>intval(I("get.id"))))
		->find();
		$teaminfos = $this->teaminfos_model
		->where(array("id"=>$teammembers['team_id']))
		->order("id DESC")
		->find();
		$users = $this->users_model
		->where(array("id"=>$teammembers['related_userid']))
		->order("id DESC")
		->find();
		$this->assign("teammembers",$teammembers);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("users",$users);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			if(!I("post.userid") ||!I("post.teamid") ||!I("post.start_year")){
				$this->error("请填写数据");
			}
			if ($this->teamsinfos_model->save($_POST)){
				$this->success("修改成功！",U('Grade/index'));
			} else {
				$this->error("修改失败！");
			}	
		}
	}
/*
	 *查看学籍号认证列表
	 */
	function stu_num(){

		if(I('session.school_id') && I('session.packet_id')==5){
			$school_id = array("parent_id"=>intval(I('session.school_id')),"master_userid"=>get_current_admin_id());
		}elseif(I('session.school_id') && I('session.packet_id')!=5){
			$school_id = array("parent_id"=>intval(I('session.school_id')));
		}else{
			$school_id = array("parent_id > 0");
		}
		$teaminfos = $this->teaminfos_model->where($school_id)->select();
		foreach($teaminfos as$k=>$team){
			$tea[$k] = $team['id'];
		}
		if(I("get.gid")){
			$teamid = array("teamid"=>I("get.gid"));
		}else{
			if($tea){
				$teamid = array('teamid'=>array("in",array_merge(array_unique($tea))));
			}else{
				$teamid = array('teamid >0');
			}
		}
		$tid = I("get.gid");
		$teacher = $this->checkmembers_model->where("teacher_number is not null and teamid=".$tid)->select();
		
		if(empty($teacher)){
			$c=41;
			$d=0;
			$w_t = $this->checkmembers_model->field("teacher_number")->where("teacher_number is not null")->order("teacher_number desc")->find();
			$teacher_num = substr($w_t['teacher_number'],2);
			if($teacher_num<='99999'){
				for($i=$teacher_num;$i<$teacher_num+2;$i++){
					$data1[$d]['test_type']=100;
					$data1[$d]['teacher_number']="t0".$i;
					$data1[$d]['status']=0;
					$data1[$d]['teamid']=$tid;
					$data1[$d]['order_in_team']=$c++;
					$d++;
				}
				$this->checkmembers_model->addAll($data1);
			}else{
				$teacher_num2 = substr($w_t['teacher_number'],1);
				for($i=$teacher_num2;$i<$teacher_num2+2;$i++){
					$data1[$d]['test_type']=100;
					$data1[$d]['teacher_number']="t".$i;
					$data1[$d]['status']=0;
					$data1[$d]['teamid']=$tid;
					$data1[$d]['order_in_team']=$c++;
					$d++;
				}
				$this->checkmembers_model->addAll($data1);
			}
			
		}
		$res = $this->checkmembers_model->where("student_number>0 and teamid=".$tid)->select();

		if(!empty($res)){
			$count=$this->checkmembers_model->where($teamid)->count();
			$page = $this->page($count, 20);
			$teammembers = $this->checkmembers_model
			->where($teamid)
			->order("order_in_team")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			$this->assign("page", $page->show('Admin'));
			$this->assign("data",$teammembers);
		}else{
			$a=0;
			$b=1;
			$res = $this->checkmembers_model->where("student_number>0")->order("student_number desc")->find();
			$stu_num = $res['student_number'];
			for($i=$stu_num+1;$i<$stu_num+41;$i++){
				$data[$a]['test_type']=100;
				$data[$a]['student_number']=$i;
				$data[$a]['status']=0;
				$data[$a]['teamid']=$teamid['teamid'];
				$data[$a]['order_in_team']=$b++;
				$a++;
			}
			$res = $this->checkmembers_model->addAll($data);
			if($res){
				$count=$this->checkmembers_model->where($teamid)->count();
				$page = $this->page($count, 20);
				$teammembers = $this->checkmembers_model
				->where("teamid = ".$teamid['teamid'])
				->order("order_in_team")
				->limit($page->firstRow . ',' . $page->listRows)
				->select();
				$this->assign("data",$teammembers);
				$this->assign("page", $page->show('Admin'));
			}
		}
		
		$this->display();
	}

}