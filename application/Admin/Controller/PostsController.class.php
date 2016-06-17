<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-04-05
	描述：活动文章
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class PostsController extends AdminbaseController {
	protected	$rules_model,
				$typeconfigs_model;
	function _initialize() {
		parent::_initialize();
		$this->posts_model = D("Common/Posts");
		$this->typeconfigs_model = M("Typeconfigs","*");
		$this->users_model = D("Common/Users");
	}
	function push_url($url){
	    $ch = curl_init();  
	    curl_setopt($ch, CURLOPT_URL, $url);  
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true) ; // 获取数据返回    
	    curl_setopt($ch, CURLOPT_BINARYTRANSFER, true) ; // 在启用 CURLOPT_RETURNTRANSFER 时候将获取数据返回    
	    $r = curl_exec($ch);  
	    curl_close($ch);  
	    return $r;  
	} 
	function index(){
		$this->_lists();
	}
	function _lists(){
		$count=$this->posts_model->count();
		$page = $this->page($count, 20);
		$posts = $this->posts_model
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		foreach($posts as$k=>$post){
			$userid[$k] = $post['post_userid'];
		}
		if($userid){
			$userid = array_merge(array_unique($userid));
			$users = $this->users_model->where(array('id'=>array('in',$userid)))->select();
		}
		$typeconfigs = $this->typeconfigs_model->where(array('parentID'=>10001))->select();
		$this->assign("posts",$posts);
		$this->assign("page", $page->show('Admin'));
		$this->assign("typeconfigs",$typeconfigs);
		$this->assign("users",$users);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function add(){
		$typeconfigs = $this->typeconfigs_model->where(array('showOrder>0','parentID'=>10001))->select();
		$this->assign("typeconfigs",$typeconfigs);
		$this->display();
	}
	function add_post(){
		$_POST['post_date'] = date("Y-m-d H:i:s");
		$_POST['post_modify'] = date("Y-m-d H:i:s");
		$_POST['post_userid'] = get_current_admin_id();
		if($_FILES){
			$filepath = 'img/Posts/'.date("Y").'/'.date("m").'/';
			if(!file_exists(update_img.$filepath)){
				mkdir(update_img.$filepath, 0777,true);  
			}
			$imgwidth = 600;
			if($_FILES["post_image"]["name"]){
				$path1 = $_FILES["post_image"]["name"]; 
				$path2 = time().substr($path1,strpos($path1,'.'));
				
				$image = new \Think\Image(); 
				$image->open($_FILES["post_image"]["tmp_name"]);
				$width = $image->width();
				$height = $image->height();
				$whscale = sprintf("%.2f",$width/$height);
				if($whscale>=2.7 || $whscale<=2.5){
					$this->error("图片宽高比为".$whscale."不符合上传要求，请修改图片");
				}
				
				$_POST['post_image']=$filepath.$this->thumb_img($_FILES["post_image"]["tmp_name"],$imgwidth,update_img.$filepath);
			}
		}
		if($this->posts_model->where(array('post_title'=>I("post.post_title")))->find()){
			$this->error("此活动文章已存在");
		}
		$postid = $this->posts_model->add($_POST);
		if ($postid){
			if(I("post.post_push")){
				$push = localhost_url."index.php?g=api&m=Jpush&a=index&uid=0&pform=0&mid=2&mtype=$postid&content=".I("post.post_title");
				$this->push_url($push);
				$this->success("添加成功,已推送！",U('Posts/index'));
			}else{
				$this->success("添加成功！",U('Posts/index'));
			}
		} else {
			$this->error("添加失败！");
		}
	}
	public function edit(){
		$id=  intval(I("get.id"));
		$post=$this->posts_model->where(array('id'=>$id))->find();
		$typeconfigs = $this->typeconfigs_model->where(array('showOrder>0','parentID'=>10001))->select();
		$this->assign("typeconfigs",$typeconfigs);
		$this->assign("post",$post);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		$_POST['post_modify'] = date("Y-m-d H:i:s");
		$_POST['post_userid'] = get_current_admin_id();
		if($_FILES){
			$filepath = 'img/Posts/'.date("Y").'/'.date("m").'/';
			if(!file_exists(update_img.$filepath)){
				mkdir(update_img.$filepath, 0777,true);  
			}
			$imgwidth = 600;
			if($_FILES["new_image"]["name"]){
				$path1 = $_FILES["new_image"]["name"]; 
				$path2 = time().substr($path1,strpos($path1,'.'));
				
				$image = new \Think\Image(); 
				$image->open($_FILES["new_image"]["tmp_name"]);
				$width = $image->width();
				$height = $image->height();
				$whscale = sprintf("%.2f",$width/$height);
				if($whscale>=2.7 || $whscale<=2.5){
					$this->error("图片宽高比为".$whscale."不符合上传要求，请修改图片");
				}
				
				$_POST['post_image']=$filepath.$this->thumb_img($_FILES["new_image"]["tmp_name"],$imgwidth,update_img.$filepath);
			}
		}
		if ($this->posts_model->save($_POST)){
			if(I("post.post_push")){
				$mtype = I("post.id");
				$push = localhost_url."index.php?g=api&m=Jpush&a=index&uid=0&pform=0&mid=2&mtype=$mtype&content=".I("post.post_title");
				$this->push_url($push);
				$this->success("修改成功,已推送！",U('Posts/index'));
			}else{
				$this->success("修改成功！",U('Posts/index'));
			}
		} else {
			$this->error("修改失败！");
		}
	}
    public function openpost() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst2 = $this->posts_model->where("id=$id")->setField('post_status','1');
    		if ($rst2) {
    			$this->success("开启成功！");
    		} else {
    			$this->error('开启失败！');
    		}
    	} else {
			$this->error($this->posts_model->getError());
    	}
    }
    public function closepost() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst2 = $this->posts_model->where("id=$id")->setField('post_status','0');
    		if ($rst2) {
    			$this->success("关闭成功！");
    		} else {
    			$this->error('关闭失败！');
    		}
    	} else {
			$this->error($this->posts_model->getError());
    	}
    }
	function top(){
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst2 = $this->posts_model->where("id=$id")->setField('post_istop','1');
    		if ($rst2) {
    			$this->success("置顶成功！");
    		} else {
    			$this->error('置顶失败！');
    		}
    	} else {
			$this->error($this->posts_model->getError());
    	}
	}
	function down(){
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst2 = $this->posts_model->where("id=$id")->setField('post_istop','0');
    		if ($rst2) {
    			$this->success("取消置顶成功！");
    		} else {
    			$this->error('取消置顶失败！');
    		}
    	} else {
			$this->error($this->posts_model->getError());
    	}
	}
	function delete(){
		$id=  intval(I("get.id"));
		if($id){
			if ($this->posts_model->where(array('id'=>$id))->delete()!==false) {
				$imgname = $this->posts_model->where("id=$id")->find();
				$imgurl = update_img.$imgname['post_image'];
				if (file_exists($imgurl)){$delete_ok = unlink ($imgurl);}
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		} else {
			$this->error($this->posts_model->getError());
    	}
	}
}