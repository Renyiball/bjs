<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-20
	描述：后台登陆
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class PublicController extends AdminbaseController {

    function _initialize() {}
    
    //后台登陆界面
    public function login() {
    	if(isset($_SESSION['ADMIN_ID'])){//已经登录
    		$this->success(L('LOGIN_SUCCESS'),U("Index/index"));
    	}else{
    		if(empty($_SESSION['adminlogin'])){
    			redirect(__ROOT__."/admin");
    		}else{
    			$this->display(":login");
    		}
    		
    	}
    }
    
    public function logout(){
    	session('ADMIN_ID',null); 
    	$this->redirect("public/login");
    }
    
    public function dologin(){
    	$name = I("post.username");
    	if(empty($name)){
    		$this->error(L('USERNAME_OR_EMAIL_EMPTY'));
    	}
    	$pass = I("post.password");
    	if(empty($pass)){
    		$this->error(L('PASSWORD_REQUIRED'));
    	}
    	$verrify = I("post.verify");
    	if(empty($verrify)){
    		$this->error(L('CAPTCHA_REQUIRED'));
    	}
    	//验证码
    	if(!sp_check_verify_code()){
    		$this->error(L('CAPTCHA_NOT_RIGHT'));
    	}else{
    		$user = D("Common/Users");
    		if(strpos($name,"@")>0){//邮箱登陆
    			$where['user_email']=$name;
    		}else{
    			$where['user_login']=$name;
    		}
    		
    		$result = $user->where($where)->find();
    		if(!empty($result) && $result['user_type']==1){
    			if($result['user_pass'] == sp_password($pass)){
    				
    				$role_user_model=M("RoleUser");
    				
    				$role_user_join = C('DB_PREFIX').'role as b on a.role_id =b.id';
    				
    				$groups=$role_user_model->alias("a")->join($role_user_join)->where(array("user_id"=>$result["id"],"status"=>1))->getField("role_id",true);
    				
    				if( $result["id"]!=1 && ( empty($groups) || empty($result['user_status']) ) ){
    					$this->error(L('USE_DISABLED'));
    				}
    				$_SESSION["ADMIN_ID"]=$result["id"];
    				$_SESSION['name']=$result["user_login"];
					if($result["school_id"]){
    					$_SESSION['school_id']=$result["school_id"];
					}else{
						$_SESSION['school_id']=NULL;
					}
					if($groups){
						foreach($groups as $packet){
							if($packet == 5){
    							$_SESSION['packet_id']=$packet;
							}else{
    							$_SESSION['packet_id']=$packet;
							}
						}
					}else{
						$_SESSION['packet_id']=NULL;
					}
					$_SESSION['score']=$result['score']+1;
					$_SESSION['birthday']=$result['birthday'];
    				$result['last_login_ip']=get_client_ip();
    				$result['last_login_time']=date("Y-m-d H:i:s");
    				$result['score']=array("exp","score+1");
    				$user->save($result);
    				setcookie("admin_username",$name,time()+30*24*3600,"/");
    				$this->success(L('LOGIN_SUCCESS'),U("Index/index"));
    			}else{
    				$this->error(L('PASSWORD_NOT_RIGHT'));
    			}
    		}else{
    			$this->error(L('USERNAME_NOT_EXIST'));
    		}
    	}
    }

}