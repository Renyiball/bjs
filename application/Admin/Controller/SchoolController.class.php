<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-22
	描述：学校管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class SchoolController extends AdminbaseController {
	protected	$schoolinfos_model,
				$users_model,
				$applyStatus_model;
	function _initialize() {
		parent::_initialize();
		$this->schoolinfos_model = M("Schoolinfos","*");
		$this->users_model = D("Common/Users");
		$this->applyStatus_model = M("ApplyStatus","*");
	}
	public function status_num(){
		$status  = array(
						array("id"=>"100",	"name"=> "未提交"),
						array("id"=>"200",	"name"=> "已提交"),
						array("id"=>"300",	"name"=> "已备货"),
						array("id"=>"400",	"name"=> "已发送")
					);
		return $status;
	}
	public function school_type(){
		$type  = array(
						array("id"=>"100",	"name"=> "小学"),
						array("id"=>"200",	"name"=> "初中"),
						array("id"=>"300",	"name"=> "初高中"),
						array("id"=>"400",	"name"=> "高中"),
						array("id"=>"500",	"name"=> "大专"),
						array("id"=>"600",	"name"=> "大学")
					);
		return $type;
	}
	
	public function index(){
		if(I('session.school_id')){
			$school_id = array("id"=>intval(I('session.school_id')));
			$schoolid = array("school_id"=>intval(I('session.school_id')));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$school_id = array("id = 0");
			$schoolid = array("id = 0");
		}else{
			$school_id = array("status = 200");
			$schoolid = array("id > 0");
		}
		$apply=$this->applyStatus_model->where($schoolid)->select();
		$count=$this->schoolinfos_model->where($school_id)->count();
		$page = $this->page($count, 20);
		$schoolinfos = $this->schoolinfos_model
		->where($school_id)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$status = $this->status_num();
		$schooltype = $this->school_type();
		$this->assign("apply",$apply);
		$this->assign("page", $page->show('Admin'));
		$this->assign("schoolinfos",$schoolinfos);
		$this->assign("status",$status);
		$this->assign("schooltype",$schooltype);
		$this->display();		
	}
	function add() {
		$schooltype = $this->school_type();
		$this->assign("schooltype",$schooltype);
		$this->display();
	}
	function add_post(){
		if(IS_POST){
			if(!I("post.school_name") ||!I("post.short_name")||!I("post.school_type")){
				$this->error("请填写数据");
			}
			if(I("post.pos_province")=='省份' || I("post.pos_city")=='地级市' || I("post.pos_district")=='市、县级市'){
				$_POST['pos_province']=$_POST['pos_city']=$_POST['pos_district']=NULL;
			}
			$sname = I("post.school_name");
			if($this->schoolinfos_model->where(array('school_name'=>array('like',"%$sname")))->find()){
				$this->error("您所输入的学校名称已经被创建！");
			}
			if($_FILES){
				$filepath = 'img/School/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$imgwidth = 600;
				$image = new \Think\Image(); 
				if($_FILES["school_logo"]["name"]){
					$path1 = $_FILES["school_logo"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["school_logo"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=1.1 || $whscale<=0.9){
						$this->error("LOGO图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['school_logo']=$filepath.$this->thumb_img($_FILES["school_logo"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["school_bg"]["name"]){
					$path1 = $_FILES["school_bg"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["school_bg"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("背景图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['school_bg']=$filepath.$this->thumb_img($_FILES["school_bg"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
			}
			$_POST['status'] = 200;
			$schoolid = $this->schoolinfos_model->add($_POST);
			if ($schoolid){
				if(I('session.packet_id') >2){
					$this->users_model->where(array("id"=>get_current_admin_id()))->setField('school_id',$schoolid);
				}
				$_SESSION['school_id']=$schoolid;
				$this->success("添加成功！",U('School/index'));
			} else {
				$this->error("添加失败！");
			}		
		}
	}
	function edit() {
		$schoolinfos = $this->schoolinfos_model
		->where(array("id"=>intval(I("get.id"))))
		->find();
		$this->assign("schoolinfos",$schoolinfos);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			if(!I("post.short_name")){
				$this->error("请填写数据");
			}
			if(I("post.pos_province")=='省份' || I("post.pos_city")=='地级市' || I("post.pos_district")=='市、县级市'){
				$_POST['pos_province']=$_POST['pos_city']=$_POST['pos_district']=NULL;
			}
			if($_FILES){
				$filepath = 'img/School/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$infos = $this->schoolinfos_model->where(array("id"=>intval(I("post.id"))))->find();
				$imgwidth = 600;
				$image = new \Think\Image(); 
				if($_FILES["school_newlogo"]["name"]){
					if ($infos['school_logo']) {
						$logo = update_img.$infos['school_logo'];
						if (file_exists($logo)){ unlink ($logo);}
					}
					$path1 = $_FILES["school_newlogo"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["school_newlogo"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=1.1 || $whscale<=0.9){
						$this->error("LOGO图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['school_logo']=$filepath.$this->thumb_img($_FILES["school_newlogo"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["school_newbg"]["name"]){
					if ($infos['school_bg']) {
						$bg = update_img.$infos['school_bg'];
						if (file_exists($logo)){ unlink ($bg);}
					}
					$path1 = $_FILES["school_newbg"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["school_newbg"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("背景图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['school_bg']=$filepath.$this->thumb_img($_FILES["school_newbg"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
			}
			if ($this->schoolinfos_model->save($_POST)){
				$this->success("修改成功！",U('School/index'));
			} else {
				$this->error("修改失败！");
			}		
		}
	}
}