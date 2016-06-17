<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-21
	描述：赛事管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class EventController extends AdminbaseController {
	protected	$gameinfos_model,
				$gameteamlinks_model,
				$teaminfos_model,
				$tusers_model,
				$schoolinfos_model,
				$teammembers_model,
				$gameteamplayerlinks_model,
				$users_model;
	function _initialize() {
		parent::_initialize();
		$this->gameinfos_model = M("Gameinfos","*");
		$this->gameteamlinks_model = M("Gameteamlinks","*");
		$this->teaminfos_model = M("Teaminfos","*");
		$this->tusers_model = D("Common/Users");
		$this->schoolinfos_model = M("Schoolinfos","*");
		$this->teammembers_model = M("Teammembers","*");
		$this->gameteamplayerlinks_model = M("Gameteamplayerlinks","*");
		$this->users_model = M("Users","*");
	}
	public function packet_num(){
		$packet  = array(
						array("id"=>"A组",	"name"=> "A组"),
						array("id"=>"B组",	"name"=> "B组"),
						array("id"=>"C组",	"name"=> "C组"),
						array("id"=>"D组",	"name"=> "D组"),
						array("id"=>"E组",	"name"=> "E组"),
						array("id"=>"F组",	"name"=> "F组"),
						array("id"=>"G组",	"name"=> "G组"),
						array("id"=>"H组",	"name"=> "H组"),
						array("id"=>"I组",	"name"=> "I组"),
						array("id"=>"J组",	"name"=> "J组"),
						array("id"=>"K组",	"name"=> "K组"),
						array("id"=>"L组",	"name"=> "L组"),
						array("id"=>"M组",	"name"=> "M组"),
						array("id"=>"N组",	"name"=> "N组")
					);
		return $packet;
	}
	public function player_num(){
		$player  = array(
						array("id"=>"3人制",	"name"=> "三人制"),
						array("id"=>"4人制",	"name"=> "四人制"),
						array("id"=>"5人制",	"name"=> "五人制"),
						array("id"=>"6人制",	"name"=> "六人制"),
						array("id"=>"7人制",	"name"=> "七人制"),
						array("id"=>"8人制",	"name"=> "八人制"),
						array("id"=>"9人制",	"name"=> "九人制"),
						array("id"=>"10人制",	"name"=> "十人制"),
						array("id"=>"11人制",	"name"=> "十一人制")
					);
		return $player;
	}
	public function status_num(){
		$status  = array(
						array("id"=>"50",	"name"=> "未启用"),
						array("id"=>"100",	"name"=> "开赛"),
						array("id"=>"200",	"name"=> "已关闭")
					);
		return $status;
	}
	public function index(){
		if(I('session.school_id')){
			$school_id = array("school_id"=>intval(I('session.school_id')));
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$school_id = array("school_id = 0");
		}else{
			$school_id = array("school_id>0");
		}
		$count=$this->gameinfos_model->where($school_id)->count();
		$page = $this->page($count, 20);
		$gameinfos = $this->gameinfos_model
		->where($school_id)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign("gameinfos",$gameinfos);
		$this->display();		
	}
	function add() {
		$players = $this->player_num();
		$statuss = $this->status_num();
		$this->assign("players",$players);
		$this->assign("statuss",$statuss);
		$this->display();
	}
	function add_post(){
		if(IS_POST){
			if(!I("post.game_name") ||!I("post.game_description1") ||!I("post.player_type") ||!I("post.host_title") ||!I("post.host_field")){
				$this->error("请填写数据");
			}
			if(I('session.school_id')){
				$schoolinfos = $this->schoolinfos_model->where(array("id"=>intval(I('session.school_id'))))->find();
				$_POST['province']=$schoolinfos['pos_province'];
				$_POST['city']=$schoolinfos['pos_city'];
				$_POST['district']=$schoolinfos['pos_district'];
			}elseif(!I('session.school_id') && I('session.packet_id')>2){
				$this->error("您不属于任何学校");
			}else{
				$_POST['province']=$_POST['city']=$_POST['district']=null;
			}
			if($this->gameinfos_model->where(array('game_name'=>I("post.game_name")))->find()){
				$this->error("赛事名称已存在，请区分添加");
			}
			if($_FILES){
				$filepath = 'img/Event/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$imgwidth = 600;
				$image = new \Think\Image(); 
				if($_FILES["game_logo"]["name"]){
					$path1 = $_FILES["game_logo"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_logo"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=1.1 || $whscale<=0.9){
						$this->error("LOGO图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_logo']=$filepath.$this->thumb_img($_FILES["game_logo"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["game_adv"]["name"]){
					$path1 = $_FILES["game_adv"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_adv"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("广告图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_adv']=$filepath.$this->thumb_img($_FILES["game_adv"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["game_bg"]["name"]){
					$path1 = $_FILES["game_bg"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_bg"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("背景图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_bg']=$filepath.$this->thumb_img($_FILES["game_bg"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
			}
			$_POST['school_id'] = I('session.school_id');
			$_POST['created'] = date("Y-m-d H:i:s");
			$_POST['userid'] = get_current_admin_id();
			if ($this->gameinfos_model->add($_POST)){
				$this->success("添加成功！",U('Event/index'));
			} else {
				$this->error("添加失败！");
			}		
		}
	}
	function edit() {
		$gameinfos = $this->gameinfos_model
		->where(array("id"=>intval(I("get.id"))))
		->find();
		$players = $this->player_num();
		$statuss = $this->status_num();
		$this->assign("players",$players);
		$this->assign("statuss",$statuss);
		$this->assign("gameinfos",$gameinfos);
		$this->assign("webshowimg",webroot_url);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			if(!I("post.game_name") ||!I("post.game_description1") ||!I("post.player_type") ||!I("post.host_title") ||!I("post.host_field")){
				$this->error("请填写数据");
			}
			if($this->gameinfos_model->where(array('id'=>array('neq',I("post.id")),'game_name'=>I("post.game_name")))->find()){
				$this->error("赛事名称已存在，请区分添加");
			}
			if($_FILES){
				$filepath = 'img/Event/'.date("Y").'/'.date("m").'/';
				if(!file_exists(update_img.$filepath)){
					mkdir(update_img.$filepath, 0777,true);  
				}
				$infos = $this->gameinfos_model->where(array("id"=>intval(I("post.id"))))->find();
				$imgwidth = 600;
				$image = new \Think\Image(); 
				if($_FILES["game_newlogo"]["name"]){
					if ($infos['game_logo']) {
						$logo = update_img.$infos['game_logo'];
						if (file_exists($logo)){ unlink ($logo);}
					}
					$path1 = $_FILES["game_newlogo"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_newlogo"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=1.1 || $whscale<=0.9){
						$this->error("LOGO图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_logo']=$filepath.$this->thumb_img($_FILES["game_newlogo"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["game_newadv"]["name"]){
					if ($infos['game_adv']) {
						$adv = update_img.$infos['game_adv'];
						if (file_exists($logo)){ unlink ($adv);}
					}
					$path1 = $_FILES["game_newadv"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_newadv"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("广告图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_adv']=$filepath.$this->thumb_img($_FILES["game_newadv"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
				if($_FILES["game_newbg"]["name"]){
					if ($infos['game_bg']) {
						$bg = update_img.$infos['game_bg'];
						if (file_exists($logo)){ unlink ($bg);}
					}
					$path1 = $_FILES["game_newbg"]["name"]; 
					$path2 = time().substr($path1,strpos($path1,'.'));
					$image->open($_FILES["game_newbg"]["tmp_name"]);
					$width = $image->width();
					$height = $image->height();
					$whscale = sprintf("%.2f",$width/$height);
					if($whscale>=3.5 || $whscale<=3.3){
						$this->error("背景图片宽高比为".$whscale."不符合上传要求，请修改图片");
					}
					$_POST['game_bg']=$filepath.$this->thumb_img($_FILES["game_newbg"]["tmp_name"],$imgwidth,update_img.$filepath);
				}
			}
			$_POST['created'] = date("Y-m-d H:i:s");
			$_POST['userid'] = get_current_admin_id();
			if ($this->gameinfos_model->save($_POST)){
				$this->success("修改成功！",U('Event/index'));
			} else {
				$this->error("修改失败！");
			}		
		}
	}
	function team(){
		$gameteamlinks = $this->gameteamlinks_model
		->where(array("game_id"=>intval(I("get.gid"))))
		->select();
		foreach($gameteamlinks as $k=>$links){
			$gameteam[$k] = $links['team_id'];
		}
		if($gameteam){
			$count = $this->teaminfos_model
			->where(array("id"=>array('in',$gameteam)))
			->count();
			$page = $this->page($count, 20);
			$teaminfos = $this->teaminfos_model
			->where(array("id"=>array('in',$gameteam)))
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			$users = $this->tusers_model
			->where(array("shcool_id"=>$teaminfos[0]['parent_id']))
			->order("id DESC")
			->select();
			$this->assign("page", $page->show('Admin'));
		}
		$this->assign("gameteamlinks",$gameteamlinks);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("users",$users);
		$this->assign("fpost",I("get."));
		$this->display();
	}
	
	function move(){
		if(IS_POST){
			if(I("get.ids") && I("post.packet")){
				$game['cur_group'] = $_POST['packet'];
				$game['created'] = date("Y-m-d H:i:s");
				if ($this->gameteamlinks_model->where(array("team_id"=>array('in',I("get.ids")),'game_id'=>I("get.gid")))->save($game)){
					$this->success("分组调整成功！");
				} else {
					$this->error("分组调整失败！");
				}
			}
		}else{
			$packet = $this->packet_num();
			$this->assign("packet",$packet);
			$this->display();
		}
	}
	function addteam(){
		$ginfos = $this->gameteamlinks_model->where(array("game_id"=>I("get.gid")))->select();
		foreach($ginfos as$k=>$info){
			$ginfo[$k] = $info['team_id'];
		}
		if(I('session.school_id') && $ginfo){
			$school_id = array("parent_id"=>intval(I('session.school_id')),'id'=>array('not in',$ginfo));
		}elseif(I('session.school_id') && !$ginfo){
			$school_id = array("parent_id"=>intval(I('session.school_id')));
		}elseif($ginfo){
			$school_id = array('id'=>array('not in',$ginfo));
		}else{
			$school_id = array();
		}
		$count = $this->teaminfos_model->where($school_id)->count();
		$page = $this->page($count, 20);
		$teaminfos = $this->teaminfos_model
		->where($school_id)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$this->assign("teaminfos",$teaminfos);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}
	function addteam_post(){
		if(IS_POST){
			if(I("get.gid") && I("post.ids")){
				$ids = I("post.ids");
				$gid = I("get.gid");
				foreach($ids as$k=>$id){
					$gteam[$k]['game_id'] = $gid;
					$gteam[$k]['team_id'] = $id;
					$gteam[$k]['created'] = date("Y-m-d H:i:s");
				}
				if ($this->gameteamlinks_model->addAll($gteam)){
					$teammembers = $this->teammembers_model
					->where(array("team_id"=>array('in',I("post.ids"))))
					->select();
					foreach($teammembers as$k=>$teams){
						$members[$k]['game_id'] = I("get.gid");
						$members[$k]['team_id'] = $teams['team_id'];
						$members[$k]['related_userid'] = $teams['related_userid'];
						$members[$k]['pos_text'] = $teams['pos_text'];
						$members[$k]['play_number'] = $teams['play_number'];
						$members[$k]['status'] = 300;
						$members[$k]['created'] = date("Y-m-d H:i:s");
					}
					$this->gameteamplayerlinks_model->addAll($members);
					$num = $this->gameteamlinks_model->where(array('game_id'=>$gid))->count();
					$this->gameinfos_model->where(array("id"=>$gid))->setField('team_count',$num);
					$this->success("加入成功！",U("Event/team",array("gid"=>$gid)));
				} else {
					$this->error("加入失败！");
				}
			}
		}else{
			$this->display();
		}
	}
	function deleteteam(){
		if(I("get.tid")&&I("get.gid")){
			if ($this->gameteamlinks_model->where(array("team_id"=>I("get.tid"),'game_id'=>I("get.gid")))->delete()!==false){
					$this->gameteamplayerlinks_model->where(array("team_id"=>I("get.tid"),'game_id'=>I("get.gid")))->delete();
					$num = $this->gameteamlinks_model->where(array('game_id'=>I("get.gid")))->count();
					$this->gameinfos_model->where(array("id"=>I("get.gid")))->setField('team_count',$num);
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	function teammember(){
		$count = $this->gameteamplayerlinks_model->where(array("team_id"=>I("get.tid"),'game_id'=>I("get.gid")))->count();
		$page = $this->page($count, 20);
		$gameteamplayerlinks = $this->gameteamplayerlinks_model
		->where(array("team_id"=>I("get.tid"),'game_id'=>I("get.gid")))
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		if($gameteamplayerlinks){
			foreach($gameteamplayerlinks as$k=>$gtpls){
				$user_id[$k] = $gtpls['related_userid'];
			}
			$users = $this->users_model->where(array('id'=>array('in',$user_id)))->select();
		}
		
		$teaminfos = $this->teaminfos_model->where(array("id"=>I("get.tid")))->find();
		$this->assign("gameteamplayerlinks",$gameteamplayerlinks);
		$this->assign("users",$users);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}
    public function tm_cancel() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst1 = $this->gameteamplayerlinks_model->where("id=$id")->setField('status','200');
    		if ($rst1) {
    			$this->success("取消报名成功！");
    		} else {
    			$this->error('取消报名失败！');
    		}
    	} else {
			$this->error($this->gameteamplayerlinks_model->getError());
    	}
    }
    public function tm_confirm() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst1 = $this->gameteamplayerlinks_model->where("id=$id")->setField('status','300');
    		if ($rst1) {
    			$this->success("报名成功！");
    		} else {
    			$this->error('报名失败！');
    		}
    	} else {
			$this->error($this->gameteamplayerlinks_model->getError());
    	}
    }
    public function tm_delete() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst1 = $this->gameteamplayerlinks_model->where("id=$id")->setField('status','100');
    		if ($rst1) {
    			$this->success("删除报名成功！");
    		} else {
    			$this->error('删除报名失败！');
    		}
    	} else {
			$this->error($this->gameteamplayerlinks_model->getError());
    	}
    }
    public function tm_restore() {
        $id=intval(I("get.id"));
    	if ($id) {
    		$rst1 = $this->gameteamplayerlinks_model->where("id=$id")->setField('status','200');
    		if ($rst1) {
    			$this->success("恢复报名成功！");
    		} else {
    			$this->error('恢复报名失败！');
    		}
    	} else {
			$this->error($this->gameteamplayerlinks_model->getError());
    	}
    }
	function addmember(){
		$gameteamplayerlinks = $this->gameteamplayerlinks_model
		->where(array("team_id"=>I("get.tid"),'game_id'=>I("get.gid")))
		->select();
		if($gameteamplayerlinks){
			foreach($gameteamplayerlinks as$k=>$gtpls){
				$user_id[$k] = $gtpls['related_userid'];
			}
			$count = $this->teammembers_model->where(array("team_id"=>array('in',I("get.tid")),'related_userid'=>array('not in',$user_id)))->count();
			$page = $this->page($count, 20);
			$teammembers = $this->teammembers_model
			->where(array("team_id"=>array('in',I("get.tid")),'related_userid'=>array('not in',$user_id)))
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			$this->assign("page", $page->show('Admin'));
		}else{
			$count = $this->teammembers_model->where(array("team_id"=>array('in',I("get.tid"))))->count();
			$page = $this->page($count, 20);
			$teammembers = $this->teammembers_model
			->where(array("team_id"=>array('in',I("get.tid"))))
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
			$this->assign("page", $page->show('Admin'));
		}
		if($teammembers){
			foreach($teammembers as$k=>$tmembers){
				$userid[$k] = $tmembers['related_userid'];
			}
			$users = $this->users_model->where(array('id'=>array('in',$userid)))->select();
		}
		$teaminfos = $this->teaminfos_model->where(array("id"=>I("get.tid")))->find();
		$this->assign("teammembers",$teammembers);
		$this->assign("users",$users);
		$this->assign("teaminfos",$teaminfos);
		$this->display();
	}
	
	function addmember_post(){
		if(IS_POST){
			if(I("post.ids")){
				$ids = I("post.ids");
				$gid = I("get.gid");
				$tid = I("get.tid");
					$teammembers = $this->teammembers_model
					->where(array("id"=>array('in',I("post.ids"))))
					->select();
					foreach($teammembers as$k=>$teams){
						$members[$k]['game_id'] = $gid;
						$members[$k]['team_id'] = $tid;
						$members[$k]['related_userid'] = $teams['related_userid'];
						$members[$k]['pos_text'] = $teams['pos_text'];
						$members[$k]['play_number'] = $teams['play_number'];
						$members[$k]['status'] = 300;
						$members[$k]['created'] = date("Y-m-d H:i:s");
					}
				if ($this->gameteamplayerlinks_model->addAll($members)){
					$this->success("加入成功！",U("Event/teammember",array("tid"=>$tid,"gid"=>$gid)));
				} else {
					$this->error("加入失败！");
				}
			}
		}else{
			$this->display();
		}
	}
}