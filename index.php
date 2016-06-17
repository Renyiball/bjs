<?php

/**
 * 项目入口文件
 * Some rights reserved：www.simplewind.net
 */
if (ini_get('magic_quotes_gpc')) {
	function stripslashesRecursive(array $array){
		foreach ($array as $k => $v) {
			if (is_string($v)){
				$array[$k] = stripslashes($v);
			} else if (is_array($v)){
				$array[$k] = stripslashesRecursive($v);
			}
		}
		return $array;
	}
	$_GET = stripslashesRecursive($_GET);
	$_POST = stripslashesRecursive($_POST);
}
//开启调试模式
define("APP_DEBUG", true);
//网站当前路径
define('SITE_PATH', dirname(__FILE__)."/");
//项目路径，不可更改
define('APP_PATH', SITE_PATH . 'application/');
//项目相对路径，不可更改
define('SPAPP_PATH',   SITE_PATH.'simplewind/');
//
define('SPAPP',   './application/');
//项目资源目录，不可更改
define('SPSTATIC',   SITE_PATH.'statics/');
//定义缓存存放路径
define("RUNTIME_PATH", SITE_PATH . "/data/runtime/");
//静态缓存目录
define("HTML_PATH", SITE_PATH . "/data/runtime/Html/");
//版本号
define("SIMPLEWIND_CMF_VERSION", 'X2.0');
//图像-上传专用
define('update_img','../school/app/webroot/');
//本地显示图片
//define('webroot_url','http://127.0.0.1/school/app/webroot/');
//接口专用
define('webroot_url','http://192.168.0.200/school/');
define('JPUSH',   SPAPP.'JPush/Controller/');

define("THINKCMF_CORE_TAGLIBS", 'cx,Common\Lib\Taglib\TagLibSpadmin,Common\Lib\Taglib\TagLibHome');

//载入框架核心文件
require SPAPP_PATH.'Core/ThinkPHP.php';
