<admintpl file="header" />
</head>
<body class="J_scroll_fixed">
	<div class="wrap J_check_wrap">
		<ul class="nav nav-tabs">
			<li><a href="{:U('ApplyInfos/index')}">添加</a></li>
			<li  class="active"><a href="#">修改</a></li>
		</ul>
<style type="text/css">
.radio, .checkbox {
width: 60px;
float: left;
}
</style>
<form name="myform" id="myform" action="{:U('ApplyInfos/edit_post')}" method="post" class="form-horizontal J_ajaxForm" enctype="multipart/form-data">
<div class="col-auto">
	<div class="table_full">
	  <table class="table table-bordered" style="width: 1200px">
	   <tr>
	      <th width="100px;">姓名</th>
	      <td width="240px;"  ><input type="text" id="name" name="applicant_name" class="input input_hd J_title_color" style="width: 110px" value="{$infos.applicant_name}" /><span id="name_sp"></span></td>
		  <th width="100px;">手机号</th>
	      <td width="240px;"><input type="text" id="tel" name="telphone" class="input input_hd J_title_color" style="width: 110px" value="{$infos.telphone}"/><span id="tel_sp" ></span></td> 
	      <td colspan="2">
	      <input type="hidden" name="id" value="{$infos.id}">
	    </tr>
	    <tr>
	      <th>性别</th>
	      <td >
            <span class="switch_list cc">
            <if condition="$infos.gendar eq 1">
				<label class="radio"><input type="radio" name="gendar" value="1" checked><span>男</span></label>
				<label class="radio"><input type="radio" name="gendar" value="2"><span>女</span></label>
			<else />
				<label class="radio"><input type="radio" name="gendar" value="1"><span>男</span></label>
				<label class="radio"><input type="radio" name="gendar" value="2" checked><span>女</span></label>
			</if>
		 	</span>
	      </td>


	      <th>身高</th>
	      <td>
				<select id="height" class="normal_select" style="width: 100px;" name="height">
					<option value="150">150cm</option>
					<option value="155">155cm</option>
					<option value="160">160cm</option>
					<option value="165">165cm</option>
					<option value="170">170cm</option>
					<option value="175">175cm</option>
					<option value="180">180cm</option>
					<option value="185">185cm</option>
					<option value="190">190cm</option>
					<option value="195">195cm</option>
					<option value="200">200cm</option>
		       
				</select>
	      </td>
	     
	        <th>体重</th>
	      <td>
				<select id="weight" class="normal_select" style="width: 100px;" name="weight">
					<option value="60">60Kg</option>
					<option value="65">65Kg</option>
					<option value="70">70Kg</option>
					<option value="75">75Kg</option>
					<option value="80">80Kg</option>
					<option value="85">85Kg</option>
					<option value="90">90Kg</option>
					<option value="95">95Kg</option>
					<option value="100">100Kg</option>
				</select>
	      </td> 
	      <td>&nbsp;</td>
	    </tr>
	   
	  </table>


	</div>
</div>

<div class="form-actions">
	<input type="submit" class="btn btn-primary btn_submit " value="更新">
	
</div>
<script src="__ROOT__/statics/js/common.js"></script>
<script src="__ROOT__/statics/js/jquery.js"></script>
	<script>
		
		//传输数据
		$("#add").live("click",function(){

			var name 	=  $("#name").val();
			alert(name)
			var tel 	=  $("#tel").val();
			var height  =  $("#height").val();
			var weight  =  $("#weight").val();
			var sex     =  $("input[name=sex]").val();
			alert(sex);

			$.ajax({  
			   type: "POST",  
			   url: "{:U('ApplyInfos/add_post')}",  
			   data: {"applicant_name":name,"gendar":sex,"height":height,"telphone":tel,"weight":weight},  
			   success: function(msg){  
			     
			     $('#list').html(msg);
			   }  
			}); 
		})


	</script>