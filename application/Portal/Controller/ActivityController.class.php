<?php
/**
 * 活动
 */
namespace Portal\Controller;
use Common\Controller\HomeBaseController;
class ActivityController extends HomeBaseController {
    public function index() {
    	$id=intval(I("get.id"));
    	$posts_model= M("Posts");
    	$posts=$posts_model->where("id=$id")->find();
    	$posts_model->save(array("id"=>$id,"post_hits"=>array("exp","post_hits+1")));
		$this->assign("posts",$posts);
    	$tplname=sp_get_apphome_tpl($tplname, "activity");
    	$this->display(":$tplname");
    }
}
