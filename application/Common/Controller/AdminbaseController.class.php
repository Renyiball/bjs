<?php

/**
 * 后台Controller
 */
//定义是后台
namespace Common\Controller;
use Common\Controller\AppframeController;

class AdminbaseController extends AppframeController {
	
	public function __construct() {
		$admintpl_path=C("SP_ADMIN_TMPL_PATH").C("SP_ADMIN_DEFAULT_THEME")."/";
		C("TMPL_ACTION_SUCCESS",$admintpl_path.C("SP_ADMIN_TMPL_ACTION_SUCCESS"));
		C("TMPL_ACTION_ERROR",$admintpl_path.C("SP_ADMIN_TMPL_ACTION_ERROR"));
		parent::__construct();
		$time=time();
		$this->assign("js_debug",APP_DEBUG?"?v=$time":"");
		$array_log = array(__SELF__,get_current_admin_id(),date('y-m-d H:i:s'),get_client_ip());
		$filename="data/journal/".date('Y-m-d').".log";
		$file_hwnd=fopen($filename,"a+");
		fwrite($file_hwnd,serialize($array_log)."\r\n"); //输入序列化的数据
		fclose($file_hwnd);
	}

    function _initialize(){
       parent::_initialize();
    	if(isset($_SESSION['ADMIN_ID'])){
    		$users_obj= M("Users");
    		$id=$_SESSION['ADMIN_ID'];
    		$user=$users_obj->where("id=$id")->find();
    		if(!$this->check_access($id)){
    			$this->error("您没有访问权限！");
    			exit();
    		}
    		$this->assign("admin",$user);
    	}else{
    		//$this->error("您还没有登录！",U("admin/public/login"));
    		if(IS_AJAX){
    			$this->error("您还没有登录！",U("admin/public/login"));
    		}else{
    			header("Location:".U("admin/public/login"));
    			exit();
    		}
    		
    	}
    }

    /**
     * 消息提示
     * @param type $message
     * @param type $jumpUrl
     * @param type $ajax 
     */
    public function success($message = '', $jumpUrl = '', $ajax = false) {
        parent::success($message, $jumpUrl, $ajax);
    }

    /**
     * 模板显示
     * @param type $templateFile 指定要调用的模板文件
     * @param type $charset 输出编码
     * @param type $contentType 输出类型
     * @param string $content 输出内容
     * 此方法作用在于实现后台模板直接存放在各自项目目录下。例如Admin项目的后台模板，直接存放在Admin/Tpl/目录下
     */
    public function display($templateFile = '', $charset = '', $contentType = '', $content = '', $prefix = '') {
        parent::display($this->parseTemplate($templateFile), $charset, $contentType);
    }
    
    /**
     * 获取输出页面内容
     * 调用内置的模板引擎fetch方法，
     * @access protected
     * @param string $templateFile 指定要调用的模板文件
     * 默认为空 由系统自动定位模板文件
     * @param string $content 模板输出内容
     * @param string $prefix 模板缓存前缀*
     * @return string
     */
    public function fetch($templateFile='',$content='',$prefix=''){
        $templateFile = empty($content)?$this->parseTemplate($templateFile):'';
		return parent::fetch($templateFile,$content,$prefix);
    }
    
    /**
     * 自动定位模板文件
     * @access protected
     * @param string $template 模板文件规则
     * @return string
     */
    public function parseTemplate($template='') {
    	$tmpl_path=C("SP_ADMIN_TMPL_PATH");
    	define("SP_TMPL_PATH", $tmpl_path);
		// 获取当前主题名称
		$theme      =    C('SP_ADMIN_DEFAULT_THEME');
		
		if(is_file($template)) {
			// 获取当前主题的模版路径
			define('THEME_PATH',   $tmpl_path.$theme."/");
			return $template;
		}
		$depr       =   C('TMPL_FILE_DEPR');
		$template   =   str_replace(':', $depr, $template);
		
		// 获取当前模块
		$module   =  MODULE_NAME."/";
		if(strpos($template,'@')){ // 跨模块调用模版文件
			list($module,$template)  =   explode('@',$template);
		}
		// 获取当前主题的模版路径
		define('THEME_PATH',   $tmpl_path.$theme."/");
		
		// 分析模板文件规则
		if('' == $template) {
			// 如果模板文件名为空 按照默认规则定位
			$template = CONTROLLER_NAME . $depr . ACTION_NAME;
		}elseif(false === strpos($template, '/')){
			$template = CONTROLLER_NAME . $depr . $template;
		}
		
		C("TMPL_PARSE_STRING.__TMPL__",__ROOT__."/".THEME_PATH);
		
		C('SP_VIEW_PATH',$tmpl_path);
		C('DEFAULT_THEME',$theme);
		define("SP_CURRENT_THEME", $theme);
		
		$file = sp_add_template_file_suffix(THEME_PATH.$module.$template);
		$file= str_replace("//",'/',$file);
		if(!file_exists_case($file)) E(L('_TEMPLATE_NOT_EXIST_').':'.$file);
		return $file;
    }


    /**
     * 初始化后台菜单
     */
    public function initMenu() {
        $Menu = F("Menu");
        if (!$Menu) {
            $Menu=D("Common/Menu")->menu_cache();
        }
        return $Menu;
    }

    /**
     *  排序 排序字段为listorders数组 POST 排序字段为：listorder
     */
    protected function _listorders($model) {
        if (!is_object($model)) {
            return false;
        }
        $pk = $model->getPk(); //获取主键名称
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $model->where(array($pk => $key))->save($data);
        }
        return true;
    }

    protected function page($Total_Size = 1, $Page_Size = 0, $Current_Page = 1, $listRows = 6, $PageParam = '', $PageLink = '', $Static = FALSE) {
        import('Page');
        if ($Page_Size == 0) {
            $Page_Size = C("PAGE_LISTROWS");
        }
        if (empty($PageParam)) {
            $PageParam = C("VAR_PAGE");
        }
        $Page = new \Page($Total_Size, $Page_Size, $Current_Page, $listRows, $PageParam, $PageLink, $Static);
        $Page->SetPager('Admin', '{first}{prev}&nbsp;{liststart}{list}{listend}&nbsp;{next}{last}', array("listlong" => "9", "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "下一页", "list" => "*", "disabledclass" => ""));
        return $Page;
    }

    private function check_access($uid){
    	
    	//如果用户角色是1，则无需判断
    	if($uid == 1){
    		return true;
    	}
    	if(MODULE_NAME.CONTROLLER_NAME.ACTION_NAME!="AdminIndexindex"){
    		return sp_auth_check($uid);
    	}else{
    		return true;
    	}
    }
	/*
	* $img_path 被压缩的图片的路径
	* $thumb_w 压缩的宽
	* $save_path 压缩后图片的存储路径
	* $is_del 是否删除原文件，默认删除
	*/
	public function thumb_img($img_path, $thumb_w, $save_path, $is_del = false){
		$image = new \Think\Image(); 
		$image->open($img_path);
		$width = $image->width(); // 返回图片的宽度
		if($width > $thumb_w){
			$width = $width/$thumb_w; //取得图片的长宽比
			$height = $image->height();
			$thumb_h = ceil($height/$width);
		}
		//如果文件路径不存在则创建
		$save_path_info = pathinfo($save_path);
		if(!is_dir($save_path_info['dirname'])){
			mkdir ($save_path_info['dirname'], 0777);
		}
		$type = (microtime(true)*10000).'.'.$image->type($img_path);
		$image->thumb($thumb_w, $thumb_h)->save($save_path.$type);
		if($is_del) @unlink($img_path); //删除源文件
		return $type;
	}
	/**
 * 数字转换为中文
 * @param  string|integer|float  $num  目标数字
 * @param  integer $mode 模式[true:金额（默认）,false:普通数字表示]
 * @param  boolean $sim 使用小写（默认）
 * @return string
 */
	function number2chinese($num,$mode = true,$sim = true){
	    if(!is_numeric($num)) return '含有非数字非小数点字符！';
	    $char    = $sim ? array('十','一','二','三','四','五','六','七','八','九')
	                : array('拾','壹','贰','叁','肆','伍','陆','柒','捌','玖');
	    $unit    = $sim ? array('','十','百','千','','万','亿','兆')             
	                : array('','拾','佰','仟','','萬','億','兆');
	   //$retval  = $mode ? '元':'点';
	 
	    //小数部分
	    if(strpos($num, '.')){
	        list($num,$dec) = explode('.', $num);
	        $dec = strval(round($dec,2));
	        if($mode){
	            $retval .= "{$char[$dec['0']]}角{$char[$dec['1']]}分";
	        }else{
	            for($i = 0,$c = strlen($dec);$i < $c;$i++) {
	                $retval .= $char[$dec[$i]];
	            }
	        }
	    }
	    //整数部分
	    $str = $mode ? strrev(intval($num)) : strrev($num);
	    for($i = 0,$c = strlen($str);$i < $c;$i++) {
	        $out[$i] = $char[$str[$i]];
	        if($mode){
	            $out[$i] .= $str[$i] != '0'? $unit[$i%4] : '';
	            if($i>1 and $str[$i]+$str[$i-1] == 0){
	                $out[$i] = '';
	            }
	            if($i%4 == 0){
	                $out[$i] .= $unit[4+floor($i/4)];
	            }
	        }
	    }
	    $retval = join('',array_reverse($out)) . $retval;
	    return $retval;
	}
}