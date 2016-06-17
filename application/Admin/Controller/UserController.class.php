<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-20
	描述：本站用户
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class UserController extends AdminbaseController{
	protected	$users_model,
				$role_model,
				$schoolinfos_model;
	
	function _initialize() {
		parent::_initialize();
		$this->users_model = D("Common/Users");
		$this->role_model = D("Common/Role");
		$this->roleuser_model = D("Common/RoleUser");
		$this->schoolinfos_model = M("Schoolinfos","*");
	}
	function index(){
		if(I('session.school_id')){
			$sid = array("user_type"=>1,"school_id"=>I('session.school_id'));
		}elseif(I('session.packet_id') == 2){
			$roleuser = $this->roleuser_model
			->where(array("role_id"=>3))
			->select();
			foreach($roleuser as$k=>$role){
				$ruser[$k] = $role['user_id'];
			}
			$sid = array("user_type"=>1,"id"=>array('in',$ruser));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$sid = array("id = 0");
		}else{
			$sid = array("user_type"=>1);
		}
		$count=$this->users_model->where($sid)->count();
		$page = $this->page($count, 20);
		$users = $this->users_model
		->where($sid)
		->order("id asc")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->display();
	}
	
	
	function add(){
		$roles=$this->role_model->where(array("status"=>1,"id"=>array('gt',I('session.packet_id'))))->order("id asc")->select();
		$this->assign("roles",$roles);
		$this->display();
	}
	
	function add_post(){
		if(IS_POST){
			if(!I('post.school_id') && I('session.packet_id') > 2){
				$this->error("请先创建学校");
			}
			$rid=I('post.role_id');
			if ($this->users_model->create()) {
				$result=$this->users_model->add();
				if ($result!==false) {
					$role_user_model=M("RoleUser");
					$role_user_model->add(array("role_id"=>$rid,"user_id"=>$result));
					$this->success("添加成功！", U("user/index"));
				} else {
					$this->error("添加失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
			
		}
	}
	
	
	function edit(){
		$id= intval(I("get.id"));
		$roles=$this->role_model->where(array("status"=>1,"id"=>array('gt',I('session.packet_id'))))->order("id desc")->select();
		$this->assign("roles",$roles);
		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id",true);
		$this->assign("role_ids",$role_ids[0]);
			
		$user=$this->users_model->where(array("id"=>$id))->find();
		$schoolinfos=$this->schoolinfos_model->where(array("id"=>$user['school_id']))->order("id desc")->find();
		$this->assign($user);
		$this->assign("schoolinfos",$schoolinfos);
		$this->display();
	}
	
	function edit_post(){
		if (IS_POST) {
			if(empty($_POST['user_pass'])){
				unset($_POST['user_pass']);
			}
			if ($this->users_model->create()) {
				$result=$this->users_model->save();
				if ($result!==false) {
					$uid=intval($_POST['id']);
					$rid=intval($_POST['role_id']);
					$role_user_model=M("RoleUser");
					$role_user_model->where(array("user_id"=>$uid))->delete();
					$role_user_model->add(array("role_id"=>$rid,"user_id"=>$uid));
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}			
		}
	}
	
	/**
	 *  删除
	 */
	function delete(){
		$id = intval(I("get.id"));
		if($id==1){
			$this->error("最高管理员不能删除！");
		}
		
		if ($this->users_model->where("id=$id")->delete()!==false) {
			M("RoleUser")->where(array("user_id"=>$id))->delete();
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
	
	
	function userinfo(){
		$id=get_current_admin_id();
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	
	function userinfo_post(){
		if (IS_POST) {
			if($_FILES){
				$filepath = 'img/Users/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				if($_FILES["avatar"]["name"]){
					$path1 = $_FILES["avatar"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$_POST['avatar']=$filepath.$this->thumb_img($_FILES["avatar"]["tmp_name"],64,update_img.$filepath);
				}
				if($_FILES["new_avatar"]["name"]){
					$users = $this->users_model->where(array("id"=>get_current_admin_id()))->find();
					if ($users['avatar']) {
						$avatar = update_img.$users['avatar'];
						if (file_exists($avatar)){ unlink ($avatar);}
					}
					$path1 = $_FILES["new_avatar"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$_POST['avatar']=$filepath.$this->thumb_img($_FILES["new_avatar"]["tmp_name"],64,update_img.$filepath);
				}
			}
			$_POST['id']=get_current_admin_id();
			$create_result=$this->users_model
			->field("user_login,last_login_ip,last_login_time,create_time,user_status,score,user_type",true)//排除相关字段
			->create();
			if ($create_result) {
				if ($this->users_model->save()!==false) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		}
	}
	
	function ban(){
        $id=intval($_GET['id']);
    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','0');
    		if ($rst) {
    			$this->success("管理员停用成功！", U("user/index"));
    		} else {
    			$this->error('管理员停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','1');
    		if ($rst) {
    			$this->success("管理员启用成功！", U("user/index"));
    		} else {
    			$this->error('管理员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
	
	
	
}