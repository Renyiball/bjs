<?php
/*********************************
    作者：wzxaini9@vip.qq.com
    时间：2016-03-31
    描述：服装管理
**********************************/
namespace Admin\Controller;
use Common\Controller\AdminbaseController;

class ApplyInfosController extends AdminbaseController {
    protected   $Applyinfos_model; 
    protected   $AppStatus_model;          
    function _initialize() {
        parent::_initialize();
        $this->Applyinfos_model = M("Applyinfos","*");
        $this->AppStatus_model  = M("Apply_status","*");
        $this->SchoolInfos_model  = M("Schoolinfos","*");
    }

    /**
     *首页展示
     */
    public function index(){
       
        if($_SESSION['school_id']){
            $sid = array('school_id' => $_SESSION['school_id']);
        }else {
            $sid = array('school_id > 0');
        }
        
        $status = $this->AppStatus_model->where($sid)->find();
        if($_SESSION['school_id']>0 && ($status['status'] == 100 || $status['status'] == '')){

           

        }else if ($_SESSION['school_id']>0 && $status['status'] == 200){

          $message = "<p><font color='red'>".您的申请已经提交，等待客服人员处理."</font></p>"; 

        }else if ($_SESSION['school_id']>0 && $status['status'] == 300){

          $message = "<p><font color='red'>".您的申请已经备货，等待发送."</font></p>"; 

        }else if ($_SESSION['school_id']>0 && $status['status'] == 400){

          $message = "<p><font color='red'>".您的申请已经发送，流程结束."</font></p>"; 
        }

        $infos = $this->Applyinfos_model->where($sid)->select();
        $this->assign('infos',$infos);
        $this->assign("message", $message);
        $this->assign('status',$status['status']);
        $this->display();       
    }

     /**
     *添加数据
     */
    public function add_post(){
      $_POST['school_id'] = $_SESSION['school_id'];
      $status = $this->AppStatus_model->where(array('school_id' => $_SESSION['school_id']))->find();
      //总条数
      $countNum = $this->Applyinfos_model->where(array('school_id' => $_SESSION['school_id']))->count();
      $count = $this->AppStatus_model->where('school_id='.$_SESSION['school_id'])->getField("max_count");
      if($count!=""){
          if( $countNum<=$count-1){
              $res   = $this->Applyinfos_model->add(I("post."));
              $infos = $this->Applyinfos_model->where(array('school_id' => $_SESSION['school_id']))->select();
              $this->assign('infos',$infos);
              $this->assign('status',$status['status']);
              $this->display();  
          } else {
            
                echo "<script>alert('只能添加".$count."条数据');window.history.go(0)</script>";
          }
      }else{
          if( $countNum<=9){
              $res   = $this->Applyinfos_model->add(I("post."));
              $infos = $this->Applyinfos_model->where(array('school_id' => $_SESSION['school_id']))->select();
              $this->assign('infos',$infos);
              $this->assign('status',$status['status']);
              $this->display();  
          } else {
            
                echo "<script>alert('只能添加10条数据');window.history.go(0)</script>";
          }
      }
      
    }

    /**
     *修改页面
     */
      public function edit(){
       
        $infos = $this->Applyinfos_model->where(array("id" => I("get.id")))->find();
        $this->assign('infos',$infos);
        $this->display();       
    }


    /**
     *修改数据
     */
    function edit_post(){
       
        
        if ($this->Applyinfos_model->where(array("id"=>intval(I("post.id"))))->save($_POST)){
            $this->success("修改成功！",U('ApplyInfos/index'));
        } else {
            $this->error("修改失败！");
        }       
    }

    /**
     * 提交申请
     */
    function commit_order(){
        $data['school_id'] = $_SESSION['school_id'];
        $data['status']    = 200;
        $data['max_count'] = 10;
        $rtn = $this->AppStatus_model->where("school_id=".$_SESSION['school_id'])->find();
        if(empty($rtn)){
            $res = $this->AppStatus_model->add($data);
            if($res){
                echo 1;//提交成功
            }
        }else{
            $rts = $this->AppStatus_model->where("school_id=".$_SESSION['school_id'])->save($data);
            if($rts){
                echo 2;//修改成功
            }
        }
    }

     /**
     * 管理员查看
     */
    function admin_sel(){
      $sid = I('get.sid');
      $school_name = $this->SchoolInfos_model->where("id=".$sid)->getField("school_name");
      $infos  = $this->Applyinfos_model->where(array('school_id' => $sid))->select();
      $status = $this->AppStatus_model->where(array('school_id'  => $sid))->find();
        //判断
        if(empty($_SESSION['school_id']) && ($status['status'] == 100 || $status['status'] == '')){

          $message = "<p><font color='red'>".您查看的申请尚未提交，请等待提交后再做处理."</font></p>";

        }else if(empty($_SESSION['school_id']) && $status['status'] == 200){

          $message = "<p><font color='red'>".您查看的申请已经提交，请尽快备货."</font></p>";  

        }else if(empty($_SESSION['school_id']) && $status['status'] == 300){

          $message = "<p><font color='red'>".您查看的申请已经备货完毕，请尽快完成发送."</font></p>";  

        }else if(empty($_SESSION['school_id']) && $status['status'] == 400){

          $message = "<p><font color='red'>".您查看的申请已经发货，流程结束."</font></p>";  
        }else if(!empty($sid) && ($status['status'] == 100 || $status['status'] == '')){

          $message = "<p><font color='red'>".您还未添加申请，请前去“服装订单”菜单进行申请."</font></p>";
          $str = "<p><font color='red'>".您还未添加申请，请前去“服装订单”菜单进行申请."</font></p>";

        }else if(!empty($sid) && $status['status'] == 200){

          $message = "<p><font color='red'>".您的申请已经提交，等待客服人员处理."</font></p>";  

        }else if(!empty($sid) && $status['status'] == 300){

          $message =  "<p><font color='red'>".您的申请已经备货，等待发送."</font></p>"; 
                      
        }else if(!empty($sid) && $status['status'] == 400){

          $message = "<p><font color='red'>".您查看的申请已经发货，流程结束."</font></p>";  
        }
      $this->assign('infos',$infos);
      $this->assign('sid',$sid);
      $this->assign('status',$status['status']);
      $this->assign("message", $message);
      $this->assign("str", $str);
      $this->assign("school_name", $school_name);
      $this->display('index');  
    }

    /**
     * 修改状态
     */
    function save_status(){

      $data['status']   = I('post.status');
      $res = $this->AppStatus_model->where(array('school_id' => I('post.sid') ))->save($data);
      if($res){
        echo 1;//修改成功
      }
    }
  
}