<?php
/**
 * 文章内页
 */
namespace Portal\Controller;
use Common\Controller\HomeBaseController;
class ArticleController extends HomeBaseController {
    //文章内页
    public function index() {
    	$id=intval($_GET['id']);
    	$rules_model= M("Rules");
    	$rules=$rules_model->where("id=$id")->find();
		$this->assign("rules",$rules);
    	$tplname=sp_get_apphome_tpl($tplname, "article");
    	$this->display(":$tplname");
    }
}
