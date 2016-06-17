<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-03-31
	描述：启动页图
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class StartImgController extends AdminbaseController {
	protected	$Moredetails_model;			
	function _initialize() {
		parent::_initialize();
		$this->Moredetails_model = M("Moredetails","*");

	}
	/**
	 *首页展示
	 */
	public function index(){
		$ImgInfo = $this->Moredetails_model->select();
		$this->assign('ImgInfo',$ImgInfo);
		$this->assign("webshowimg",webroot_url);
		$this->display();		
	}
	function add() {
		$this->display();
	}
	/**
	 * 添加
	 */
	function add_post(){
		if(!I("post.detail_key")){
				$this->error("请填写数据");
			}
		if($_FILES){
				$filepath = 'img/StartImg/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$imgwidth = 600;
				if($_FILES["detail_value"]["name"]){
					$path1 = $_FILES["detail_value"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$data['detail_value']=$filepath.$this->thumb_img($_FILES["detail_value"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["detail_value"]["name"]){
					$path1 = $_FILES["detail_value"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$data['detail_value']=$filepath.$this->thumb_img($_FILES["detail_value"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
		}
		$time = date("Y-m-d H:i:s");
		$data['parentid']  = 'app_adv_main';
		$data['detail_key']  = I("post.detail_key");
		$data['showorder'] = I('post.showorder');
		$data['relatedid'] = 'adv_0001';
		$data['created']   = $time;
		$data['userid']    = get_current_admin_id();
		$res  = $this->Moredetails_model->add($data);
		if ($res){
				M('moredetails','*')->execute("insert into moredetails(parentid,relatedid,detail_key,detail_value,created,userid) values ('app_adv_para','adv_0001','PHP','".I("post.detail_value1")."','$time','1')");
				$this->success("添加成功！",U('StartImg/index'));
			} else {
				$this->error("添加失败！");
			}
	}
	function edit() {
		$infos = $this->Moredetails_model
		->where(array("id"=>intval(I("get.id"))))
		->find();
		$this->assign("infos",$infos);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		if($_FILES){
			$filepath = 'img/StartImg/'.date("Y").'/'.date("m").'/';
			if(!file_exists(update_img.$filepath)){
				mkdir(update_img.$filepath, 0777,true);  
			}
			$infos = $this->Moredetails_model->where(array("id"=>intval(I("post.id"))))->find();
			$imgwidth = 600;
			if($_FILES["detail_value"]["name"]){
				if ($infos['detail_value']) {
					$logo = update_img.$infos['detail_value'];
					if (file_exists($logo)){ unlink ($logo);}
				}
				$path1 = $_FILES["detail_value"]["name"]; 
				$path2 = time().substr($path1,strpos($path1,'.'));
				$_POST['detail_value']=$filepath.$this->thumb_img($_FILES["detail_value"]["tmp_name"],$imgwidth,update_img.$filepath);
			}
		}
		$_POST['showorder'] = I("post.showorder");
		$_POST['detail_key'] = I("post.detail_key");
		if ($this->Moredetails_model->where(array("id"=>intval(I("post.id"))))->save($_POST)){
			$this->success("修改成功！",U('StartImg/index'));
		} else {
			$this->error("修改失败！");
		}		
	}
}