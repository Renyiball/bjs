<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-22
	描述：年级管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class GradeController extends AdminbaseController {
	protected	$teaminfos_model,
				$schoolinfos_model,
				$users_model,
				$roleuser_model,
				$gameteamlinks_model,
				$teammembers_model,
				$checkmembers_model;
	function _initialize() {
		parent::_initialize();
		$this->teaminfos_model = M("Teaminfos","*");
		$this->schoolinfos_model = M("Schoolinfos","*");
		$this->users_model = D("Common/Users");
		$this->roleuser_model = D("Common/RoleUser");
		$this->gameteamlinks_model = M("Gameteamlinks","*");
		$this->teammembers_model = M("Teammembers","*");
		$this->checkmembers_model = M("Checkmembers","*");
	}
	public function grade_num(){
		$grade  = array(
						array("id"=>"1","name"=> "一年级"),
						array("id"=>"2","name"=> "二年级"),
						array("id"=>"3","name"=> "三年级"),
						array("id"=>"4","name"=> "四年级"),
						array("id"=>"5","name"=> "五年级"),
						array("id"=>"6","name"=> "六年级"),
						array("id"=>"7","name"=> "七年级"),
						array("id"=>"8","name"=> "八年级"),
						array("id"=>"9","name"=> "九年级")
					);
		return $grade;
	}
	public function class_num(){
		$class  = array(
						array("id"=>"1","name"=> "一班"),
						array("id"=>"2","name"=> "二班"),
						array("id"=>"3","name"=> "三班"),
						array("id"=>"4","name"=> "四班"),
						array("id"=>"5","name"=> "五班"),
						array("id"=>"6","name"=> "六班"),
						array("id"=>"7","name"=> "七班"),
						array("id"=>"8","name"=> "八班"),
						array("id"=>"9","name"=> "九班"),
						array("id"=>"10","name"=> "十班"),
						array("id"=>"11","name"=> "十一"),
						array("id"=>"12","name"=> "十二"),
						array("id"=>"13","name"=> "十三"),
						array("id"=>"14","name"=> "十四"),
						array("id"=>"15","name"=> "十五"),
						array("id"=>"16","name"=> "十六"),
						array("id"=>"17","name"=> "十七"),
						array("id"=>"18","name"=> "十八"),
						array("id"=>"19","name"=> "十九"),
						array("id"=>"20","name"=> "二十")
					);
		return $class;
	}
	public function digital(){
		$class  = array(
						array("id"=>"1","name"=> "一"),
						array("id"=>"2","name"=> "二"),
						array("id"=>"3","name"=> "三"),
						array("id"=>"4","name"=> "四"),
						array("id"=>"5","name"=> "五"),
						array("id"=>"6","name"=> "六"),
						array("id"=>"7","name"=> "七"),
						array("id"=>"8","name"=> "八"),
						array("id"=>"9","name"=> "九"),
						array("id"=>"10","name"=> "十")
					);
		return $class;
	}
	public function team_type(){
		$class  = array(
						array("id"=>"100","name"=> "班级球队"),
						array("id"=>"200","name"=> "年级球队"),
						array("id"=>"300","name"=> "学校球队"),
						array("id"=>"400","name"=> "区县球队"),
						array("id"=>"500","name"=> "市级球队"),
						array("id"=>"600","name"=> "省级球队")
					);
		return $class;
	}
	function upset_string($len = 4) {
	$chars = array(
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
			"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
			"w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", 
			"7", "8", "9"
	);
	$charsLen = count($chars) - 1;
	shuffle($chars);    // 将数组打乱
	$output = "";
	for ($i = 0; $i < $len; $i++) {
		$output .= $chars[mt_rand(0, $charsLen)];
	}
	return $output;
}
	public function index(){
		if(I("get.sid")){
			$school_id = array("parent_id"=>I("get.sid"));
			$schoolinfos = $this->schoolinfos_model
			->where(array('id'=>I("get.sid")))
			->find();
			$this->assign("schoolinfos",$schoolinfos);
		}else{
			if(I('session.school_id') && I('session.packet_id')==5){
				$school_id = array("parent_id"=>intval(I('session.school_id')),"master_userid"=>get_current_admin_id());
			}elseif(I('session.school_id') && I('session.packet_id')!=5){
				$school_id = array("parent_id"=>intval(I('session.school_id')));
			}elseif(!I('session.school_id') && I('session.packet_id')>2){
				$school_id = array("parent_id = 0");
			}else{
				$school_id = array("parent_id > 0");
			}
		}
		$count=$this->teaminfos_model->where($school_id)->count();
		$page = $this->page($count, 20);
		$teaminfos = $this->teaminfos_model
		->where($school_id)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$roleuser = $this->roleuser_model
		->where(array("role_id"=>5))
		->group("user_id")
		->select();
		foreach($roleuser as $k => $role){
			$user[$k] = $role['user_id'];
		}
		if($user){
			$users = $this->users_model
			->where(array("id"=>array("in",$user)))
			->order("id DESC")
			->select();
		}
		$gameteamlinks = $this->gameteamlinks_model
		->order("id DESC")
		->select();
		$ttype = $this->team_type();
		$this->assign("ttype",$ttype);
		$this->assign("page", $page->show('Admin'));
		$this->assign("teaminfos",$teaminfos);
		$this->assign("users",$users);
		$this->assign("gameteamlinks",$gameteamlinks);
		$this->display();		
	}
	function add() {
		if(I("get.sid")){
			$school_id = array("id"=>I("get.sid"));
		}else{
			if(I('session.school_id')){
				$school_id = array("id"=>intval(I('session.school_id')));
			}elseif(!I('session.school_id') && I('session.packet_id')>2){
				$school_id = array("id = 0");
			}else{
				$school_id = array("id > 0");
			}
		}
		$schoolinfos = $this->schoolinfos_model
		->where($school_id)
		->order("id DESC")
		->select();
		$grades = $this->grade_num();
		$classs = $this->class_num();
		$ttype = $this->team_type();
		$this->assign("ttype",$ttype);
		$this->assign("grades",$grades);
		$this->assign("classs",$classs);
		$this->assign("schoolinfos",$schoolinfos);
		$this->display();
	}
	function add_post(){
		if(IS_POST){
			if(!I("post.parent_id") ||!I("post.grade") ||!I("post.class") ||!I("post.team_type")){
				$this->error("请填写数据");
			}
			$schoolinfos = $this->schoolinfos_model->where(array("id"=>intval(I("post.parent_id"))))->order("id DESC")->find();
			if($schoolinfos['school_type'] != 100 &&I("post.grade") > 6){
				if(date("m")<7){
					$yg = date("y")-I("post.grade")+6;
				}else{
					$yg = date("y");
				}
			}else{
				if(date("m")<7){
					$yg = date("y")-I("post.grade");
				}else{
					$yg = date("y");
				}
				if($yg<10){
					$yg = '0'.$yg;
				}
			}
			$teaminfos=$this->teaminfos_model
			->where("team_name like '".$schoolinfos['short_name'].$this->number2chinese(I("post.grade"))."年级%' && team_type = ".I("post.team_type")." && description1 = '".$yg."级入学'")
			->order("id DESC")
			->find();
			if($teaminfos){$this->error("信息已存在");}
			$t=1;
				$classs = $this->class_num();
			for($c=0;$c<I("post.class");$c++){
				if(I("post.team_type") != 100){
					if(I("post.class") >10){$this->error("球队数需小于10个");}
					$nc = '队';
					$nclass = mb_substr($classs[$c]['name'],0,1).$nc;
				}else{
					$nclass = $classs[$c]['name'];
					$nc = '班';
				}
				
				$date[$c]['parent_type'] =$schoolinfos['school_type'];
				$date[$c]['parent_id'] =I("post.parent_id");
				$date[$c]['team_name'] =$schoolinfos['short_name'].$this->number2chinese(I("post.grade")).'年级（'.$t.'）'.$nc;
				$date[$c]['team_type'] =I("post.team_type");
				$date[$c]['short_name'] =$this->number2chinese(I("post.grade")).'年'.$nclass;
				$date[$c]['start_year'] ="20".$yg."-09-01";
				$date[$c]['description1'] =$yg.'级入学';
				$date[$c]['description2'] =I("post.description2");
			$upset = $this->upset_string();
			$teamcount = $this->teaminfos_model->where(array("join_key"=>$upset))->order("id DESC")->count();
			teamcount:
			if($teamcount){
				$upset = $this->upset_string();
				$teamcount = $this->teaminfos_model->where(array("join_key"=>$upset))->order("id DESC")->count();
				goto teamcount;
			}
				$date[$c]['join_key'] =$upset;
				$t++;
			}
			if ($this->teaminfos_model->addAll($date)){
				$this->success("添加成功！",U('Grade/index',array('sid'=>I("get.sid"))));
			} else {
				$this->error("添加失败！");
			}	
		}
	}
	function edit() {
		$teaminfos = $this->teaminfos_model
		->where(array("id"=>intval(I("get.id"))))
		->order("id DESC")
		->find();
		$schoolinfos = $this->schoolinfos_model
		->where(array("id"=>$teaminfos['parent_id']))
		->order("id DESC")
		->find();
		$roleuser = $this->roleuser_model
		->where(array("role_id"=>5))
		->group("user_id")
		->select();
		if($roleuser){
			foreach($roleuser as $k => $role){
				$user[$k] = $role['user_id'];
			}
			$users = $this->users_model
			->where(array("id"=>array("in",$user),"school_id"=>$schoolinfos['id']))
			->order("id DESC")
			->select();
		}
		$grades = $this->grade_num();
		$classs = $this->class_num();
		$this->assign("grades",$grades);
		$this->assign("classs",$classs);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("schoolinfos",$schoolinfos);
		$this->assign("users",$users);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			if(!I("post.team_name") ||!I("post.short_name") ||!I("post.start_year")){
				$this->error("请填写数据");
			}
			if($_FILES){
				$filepath = 'img/Grade/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$imgwidth = 600;
				$image = new \Think\Image(); 
				if($_FILES["team_newlogo"]["name"]){
					$path1 = $_FILES["team_newlogo"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["team_newlogo"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=1.1 || $whscale<=0.9){
						$this->error("LOGO图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['team_logo']=$filepath.$this->thumb_img($_FILES["team_newlogo"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["team_newbg"]["name"]){
					$path1 = $_FILES["team_newbg"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["team_newbg"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("背景图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['team_bg']=$filepath.$this->thumb_img($_FILES["team_newbg"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
			}
			if ($this->teaminfos_model->save($_POST)){
				$this->success("修改成功！",U('Grade/index',array('sid'=>I("get.sid"))));
			} else {
			}	
		}
	}
	function delete() {
		$id = intval(I("get.id"));
		if(!$this->teammembers_model->where(array("team_id"=>$id))->count()){
			$this->teaminfos_model->where(array("id"=>$id))->delete();
			$this->checkmembers_model->where(array("teamid"=>$id))->delete();
			$this->success("删除成功！");
		}else{
			$this->error("此班级已有球员信息、不可删除");
		}
		
	}
}