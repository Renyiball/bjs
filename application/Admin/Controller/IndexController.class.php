<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-20
	描述：后台框架
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class IndexController extends AdminbaseController {
	
	
	function _initialize() {
		parent::_initialize();
		$this->initMenu();
	}
    //后台框架首页
    public function index() {
        $this->assign("SUBMENU_CONFIG", json_encode(D("Common/Menu")->menu_json()));
       	$this->display();
        
    }

    

}

