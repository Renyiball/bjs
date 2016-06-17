<?php
/*********************************
	作者：wzxaini9@vip.qq.com
	时间：2016-01-20
	描述：后台首页
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class MainController extends AdminbaseController {
	
	function _initialize() {
	}
    public function index(){
    	//服务器信息
    	if(I('session.packet_id') == 1){
	    	$mysql= mysql_get_server_info();
	    	$mysql=empty($mysql)?"未知":$mysql;
	    	$info = array(
	    			'操作系统' => PHP_OS,
	    			'运行环境' => $_SERVER["SERVER_SOFTWARE"],
	    			'PHP运行方式' => php_sapi_name(),
	    			'MYSQL版本' =>$mysql,
	    			'程序版本' => SIMPLEWIND_CMF_VERSION,
	    			'上传附件限制' => ini_get('upload_max_filesize'),
	    			'执行时间限制' => ini_get('max_execution_time') . "秒",
	    			'剩余空间' => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M',
	    	);
	    	$this->assign('server_info', $info);
		}
    	$this->display();
    }
}