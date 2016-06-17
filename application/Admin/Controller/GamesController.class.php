<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-02-16
	描述：比赛管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class GamesController extends AdminbaseController {
	protected	$matchinfos_model,
				$teaminfos_model,
				$gameinfos_model,
				$schoolinfos_model,
				$gameteamlinks_model,
				$gameteamplayerlinks_model,
				$playerscores_model,
				$users_model,
				$teammembers_model;
	function _initialize() {
		parent::_initialize();
		$this->matchinfos_model = M("Matchinfos","*");
		$this->teaminfos_model = M("Teaminfos","*");
		$this->gameinfos_model = M("Gameinfos","*");
		$this->schoolinfos_model = M("Schoolinfos","*");
		$this->gameteamlinks_model = M("Gameteamlinks","*");
		$this->gameteamplayerlinks_model = M("Gameteamplayerlinks","*");
		$this->playerscores_model = M("Playerscores","*");
		$this->users_model = M("Users","*");
		$this->teammembers_model = M("Teammembers","*");
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
	public function match_groups(){
		$group  = array(
						array("id"=>"G01",	"name"=> "小组赛"),
						array("id"=>"G02",	"name"=> "淘汰赛"),
						array("id"=>"G03",	"name"=> "1⁄16决赛"),
						array("id"=>"G04",	"name"=> "1⁄14决赛"),
						array("id"=>"G05",	"name"=> "1⁄12决赛"),
						array("id"=>"G06",	"name"=> "1⁄10决赛"),
						array("id"=>"G07",	"name"=> "1⁄8决赛"),
						array("id"=>"G08",	"name"=> "1⁄6决赛"),
						array("id"=>"G09",	"name"=> "1⁄4决赛"),
						array("id"=>"G10",	"name"=> "半决赛"),
						array("id"=>"G11",	"name"=> "决赛"),
						array("id"=>"G12",	"name"=> "补赛")
					);
		return $group;
	}
	public function index(){
		if(I('get.gid')){
			$sid = array('game_id'=>intval(I('get.gid')));
		}else{
			if(I('session.school_id')){
				$gameinfos = $this->gameinfos_model
				->where(array("school_id"=>intval(I('session.school_id'))))
				->select();
			}elseif(!I('session.school_id') && I('session.packet_id')>2){
				$gameinfos = array("id = 0");
			}else{
				$gameinfos = $this->gameinfos_model->select();
			}
			if($gameinfos){
				foreach($gameinfos as$k => $team){
					$sid[$k] = $team['id'];
				}
				$sid = array('game_id'=>array("in",array_merge(array_unique($sid))));
			}else{
				$sid = array('game_id = 0');
			}
		}
		$count=$this->matchinfos_model->where($sid)->count();
		$page = $this->page($count, 20);
		$matchinfos = $this->matchinfos_model
		->where($sid)
		->order("id DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		if($matchinfos){
			$i=0;
			foreach($matchinfos as$match){
				
				$teamid[$i]=$match['teamid1'];
				$i++;
				$teamid[$i]=$match['teamid2'];
				$i++;
			}
			$teaminfos = $this->teaminfos_model
			->where(array('id'=>array('in',array_merge(array_unique($teamid)))))
			->select();
		}
		$gameinfos = $this->gameinfos_model->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign("fpost",I("get."));
		$this->assign("matchinfos",$matchinfos);
		$this->assign("teaminfos",$teaminfos);
		$this->assign("gameinfos",$gameinfos);
		$this->display();		
	}
	function add() {
		if(I('session.school_id') && !I('get.gid')){
			$sid = intval(I('session.school_id'));
			$gameinfos = $this->gameinfos_model
			->where(array("school_id"=>$sid))
			->select();
			if($gameinfos){
				foreach($gameinfos as $k=>$info){$gid[$k] = $info['id'];}
				$gameteamlinks = $this->gameteamlinks_model->where(array("game_id"=>array("in",$gid)))->select();
			}
		}elseif(I('get.gid')){
			$gid = intval(I('get.gid'));
			$gameinfos = $this->gameinfos_model
			->where(array("id"=>$gid))
			->select();
			$gameteamlinks = $this->gameteamlinks_model->where(array("game_id"=>$gid))->select();
		}elseif(!I('session.school_id') && I('session.packet_id')>2){
			$gameinfos = $gameteamlinks;
		}else{
			$gameinfos = $this->gameinfos_model->select();
			$gameteamlinks = $this->gameteamlinks_model->select();
		}
		$groups = $this->match_groups();
		$this->assign("gameinfos",$gameinfos);
		$this->assign("gameteamlinks",$gameteamlinks);
		$this->assign("groups",$groups);
		$this->display();
	}
	function vsteam(){
		if(I("post.") || I("get.")){
			if(I("post.")){
				if(!I("post.game_id")||!I("post.cur_group")||!I("post.match_group")){
					$this->error("请填写数据");
				}
				$game_id = I("post.game_id");
				$cur_group = I("post.cur_group");
				$match_group = I("post.match_group");
				$this->assign("fpost",I("post."));
			}
			if(I("get.")){
				if(!I("get.game_id")||!I("get.cur_group")||!I("get.match_group")){
					$this->error("请填写数据");
				}
				$game_id = I("get.game_id");
				$cur_group = I("get.cur_group");
				$match_group = I("get.match_group");
				$this->assign("fpost",I("get."));
			}
			$gameinfos = $this->gameinfos_model->where(array("id"=>$game_id))->find();
			$gameteamlinks = $this->gameteamlinks_model->where(array("game_id"=>$game_id,"cur_group"=>$cur_group))->select();
			foreach($gameteamlinks as $k=>$links){
				$teamid[$k] = $links['team_id'];
			}
			$teaminfos = $this->teaminfos_model->where(array("id"=>array("in",$teamid)))->select();
			$groups = $this->match_groups();
			$this->assign("gameinfos",$gameinfos);
			$this->assign("teaminfos",$teaminfos);
			$this->assign("groups",$groups);
		}else{
			$this->error("无效访问");
		}
			$this->display();
	}
	function add_post(){
		if(IS_POST){
			if(!I("post.teamid1")||!I("post.teamid2")){
				$this->error("请填写数据");
			}
			if($this->matchinfos_model->where($_POST)->find()){
				$this->error("本场比赛已存在");
			}
			$_POST['status']=140;
			$_POST['created'] = date("Y-m-d H:i:s");
			$_POST['userid'] = get_current_admin_id();
			$mtype = $this->matchinfos_model->add($_POST);
			if ($mtype){
				$teamid[0]=I("post.teamid1");
				$teamid[1]=I("post.teamid2");
				$teammembers=$this->teammembers_model
				->where(array('team_id'=>array('in',$teamid)))
				->select();
				if($teammembers){
					foreach($teammembers as$k=>$members){
						$userid[$k]=$members['related_userid'];
					}
					$userid = implode(",", $userid);
					$mdhi=str_replace('-','月',str_replace(' ','日',substr(I("post.matchdatetime"),5,13)));
					$content = "你的班级将在".$mdhi."进行".I("post.game_name").I("post.cur_group").I("post.matchdesc");
					$push = localhost_url."index.php?g=api&m=Jpush&a=index&uid=$userid&pform=0&mid=1&mtype=$mtype&content=$content";
					$this->push_url($push);
					$this->success("添加成功，已推送！",U("Games/vsteam",array("game_id"=>I("post.game_id"),"match_group"=>I("post.match_group"),"cur_group"=>I("post.cur_group"))));
				}else{
					$this->success("添加成功！",U("Games/vsteam",array("game_id"=>I("post.game_id"),"match_group"=>I("post.match_group"),"cur_group"=>I("post.cur_group"))));
				}
			} else {
				$this->error("添加失败！");
			}		
		}
	}
	function edit() {
		$matchinfos = $this->matchinfos_model
		->where(array("id"=>intval(I("get.id"))))
		->find();
		$gameinfos = $this->gameinfos_model->where(array("id"=>$matchinfos['game_id']))->find();
		$teamid1 = $this->teaminfos_model->where(array("id"=>$matchinfos['teamid1']))->find();
		$teamid2 = $this->teaminfos_model->where(array("id"=>$matchinfos['teamid2']))->find();
		$this->assign("gameinfos",$gameinfos);
		$this->assign("teamid1",$teamid1);
		$this->assign("teamid2",$teamid2);
		$this->assign("matchinfos",$matchinfos);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			if(I("post.matchdatetime") < date('Y-m-d H:i:s')){
				if(I("post.score1")=='' || I("post.score2")==''){
					$this->error("请填写比分");
				}
			}
			if(I("post.score1")!='' && I("post.score2")!=''){
				$_POST['status']=160;
				$teamid[0]=I("post.teamid1");
				$teamid[1]=I("post.teamid2");
				$teammembers=$this->teammembers_model
				->where(array('team_id'=>array('in',$teamid)))
				->select();
			}
			$_POST['created'] = date("Y-m-d H:i:s");
			$_POST['userid'] = get_current_admin_id();
			if ($this->matchinfos_model->save($_POST)){
				if($teammembers){
					foreach($teammembers as$k=>$members){
						$userid[$k]=$members['related_userid'];
					}
					$userid = implode(",", $userid);
					$mtype = I("post.id");
					$score = I("post.score1").":".I("post.score2");
					$mdhi=str_replace('-','月',str_replace(' ','日',substr(I("post.matchdatetime"),5,11)));
					$content = "你的班级在".$mdhi."的".I("post.matchdesc")."结果已经更新比分".$score;
					$push = localhost_url."index.php?g=api&m=Jpush&a=index&uid=$userid&pform=0&mid=1&mtype=$mtype&content=$content";
					$this->push_url($push);
					$this->success("修改成功,已推送！",U('Games/index'));
				}else{
					$this->success("修改成功！",U('Games/index'));
				}
			} else {
				$this->error("修改失败！");
			}
		}
	}
	function delete(){
		$id=  intval(I("get.id"));
		if($id){
			if ($this->matchinfos_model->where(array('id'=>$id))->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		} else {
			$this->error($this->matchinfos_model->getError());
    	}
	}
	function update() {
		$id=  intval(I("get.id"));
		$matchinfos = $this->matchinfos_model->where(array('id'=>$id))->find();
		$teamid[0]=$matchinfos['teamid1'];
		$teamid[1]=$matchinfos['teamid2'];
		$teaminfos = $this->teaminfos_model
		->where(array('id'=>array('in',$teamid)))
		->select();
		$gameteamplayerlinks = $this->gameteamplayerlinks_model
		->where(array('game_id'=>$matchinfos['game_id'],'team_id'=>array('in',$teamid),'status'=>300))
		->select();
		if($gameteamplayerlinks){
			foreach($gameteamplayerlinks as$k=>$links){
				$userid[$k] = $links['related_userid'];
			}
			$users = $this->users_model
			->where(array('id'=>array('in',$userid)))
			->select();
		}
		$count = $this->playerscores_model
		->where(array('match_id'=>$id))
		->count();
		$page = $this->page($count, 10);
		$playerscores = $this->playerscores_model
		->where(array('match_id'=>$id))
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$this->assign("teaminfos",$teaminfos);
		$this->assign("gameteamplayerlinks",$gameteamplayerlinks);
		$this->assign("users",$users);
		$this->assign("playerscores",$playerscores);
		$this->assign("game_id",$matchinfos['game_id']);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}
	function update_post() {
		if(!I("post.goals") && !I("post.red_card") && !I("post.yellow_card")&& !I("post.assistant")){ $this->error("不能提交空数据");}
		if(I("post.goals") > 99 || I("post.assistant") > 99 || I("post.red_card") > 9 || I("post.yellow_card") > 9){ $this->error("你不要骗我");}
		if($this->playerscores_model->where(array('match_id'=>I("post.match_id"),'gtp_id'=>I("post.gtp_id")))->find()){
			$this->error("此人本场信息已存在");
		}
		$matchinfos = $this->matchinfos_model
		->where(array("id"=>I("post.match_id")))
		->find();
		$team_id = I("post.team_id");
		if($matchinfos['teamid1'] == $team_id){
			$score = $matchinfos['score1'];
		}
		if($matchinfos['teamid2'] == $team_id){
			$score = $matchinfos['score2'];
		}
		if($score < I("post.goals")){
			$this->error("请核对进球数");
		}
		$gtplinks = $this->gameteamplayerlinks_model
		->where(array('game_id'=>I("post.game_id"),'team_id'=>$team_id))
		->select();
		foreach($gtplinks as$k=>$gtpl){
			$userid[$k] = $gtpl['related_userid'];
		}
		$playerscores = $this->playerscores_model
		->field("sum(goals)")
		->where(array('match_id'=>I("post.match_id"),'related_userid'=>array('in',$userid)))
		->select();
		$sumgoals = $playerscores[0]['sum(goals)'];
		if($score < $sumgoals || $score < $sumgoals+I("post.goals")){
			$this->error("请核对进球数");
		}
		$gameteamplayerlinks = $this->gameteamplayerlinks_model
		->where(array('id'=>I("post.gtp_id")))
		->find();
		$_POST['related_userid'] = $gameteamplayerlinks['related_userid'];
		$_POST['created'] = date("Y-m-d H:i:s");
		$_POST['userid'] = get_current_admin_id();
		if($this->playerscores_model->add($_POST)){
			$this->success("录入成功！");
		} else {
			$this->error("录入失败！");
		}
	}
	function update_delete() {
		$id=  intval(I("get.id"));
		if($id){
			if ($this->playerscores_model->where(array('id'=>$id))->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		} else {
			$this->error($this->playerscores_model->getError());
    	}
	}
	function update_edit() {
		$playerscore = $this->playerscores_model->where(array('id'=>I("get.id")))->find();
		$user = $this->users_model
		->where(array('id'=>$playerscore['related_userid']))
		->find();
		$this->assign("playerscore",$playerscore);
		$this->assign("user",$user);
		$this->display();
	}
	function update_edit_post() {
		if(!I("post.goals") && !I("post.red_card") && !I("post.yellow_card")&& !I("post.assistant")){ $this->error("不能提交空数据");}
		if(I("post.goals") > 99 || I("post.assistant") > 99 || I("post.red_card") > 9 || I("post.yellow_card") > 9){ $this->error("你不要骗我");}
		$this->error(json_encode($_POST));
		$_POST['created'] = date("Y-m-d H:i:s");
		if($this->playerscores_model->where(array('id'=>I("post.id")))->save($_POST)){
			$this->success("修改成功！",U('Games/update',array('id'=>I("post.match_id"))));
		} else {
			$this->error("修改失败！");
		}
	}
}