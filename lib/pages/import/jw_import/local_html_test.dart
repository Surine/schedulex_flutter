/// 本地测试
///

String html = """
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0067)http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action -->
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://jwnew.cqust.edu.cn/eams/static/themes/default/images/login/titlePic.png" type="image/x-icon">
<title></title>
  
    <script type="text/javascript" src="parse.js"></script>
    <script type="text/javascript" src="jquery-3.6.0.min.js"></script>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="content-style-type" content="text/css">
  <meta http-equiv="content-script-type" content="text/javascript">
  <script type="text/javascript" src="./courseTableForStd!courseTable.action_files/jquery,jquery.ui.core.js.下载"></script>
  <script type="text/javascript" src="./courseTableForStd!courseTable.action_files/jquery-form,jquery-history,jquery-colorbox,jquery-chosen.js.下载"></script>
  <script type="text/javascript" src="./courseTableForStd!courseTable.action_files/jquery.struts2,jquery.ui.struts2.js.下载"></script>
  <script type="text/javascript" src="./courseTableForStd!courseTable.action_files/beangle,beangle-ui.js.下载"></script>
  <script type="text/javascript">var App = {contextPath:"/eams"};jQuery(document).ready(function () {jQuery.struts2_jquery.version="3.6.1";beangle.contextPath=App.contextPath;jQuery.scriptPath = App.contextPath+"/static/";jQuery.struts2_jquerySuffix = "";jQuery.ajaxSettings.traditional = true;jQuery.ajaxSetup ({cache: false});});</script>
  <script type="text/javascript" src="./courseTableForStd!courseTable.action_files/WdatePicker-4.72.js.下载"></script><link href="./courseTableForStd!courseTable.action_files/WdatePicker.css" rel="stylesheet" type="text/css">
  <link id="jquery_theme_link" rel="stylesheet" href="./courseTableForStd!courseTable.action_files/jquery-ui_cqust.css" type="text/css">
  <link id="beangle_theme_link" href="./courseTableForStd!courseTable.action_files/beangle-ui,colorbox,chosen.css" rel="stylesheet" type="text/css">
<link href="./courseTableForStd!courseTable.action_files/home.css" rel="stylesheet" type="text/css">
<script src="./courseTableForStd!courseTable.action_files/jscroll.js.下载" type="text/javascript"></script>
<script src="./courseTableForStd!courseTable.action_files/jquery.cookie.js.下载" type="text/javascript"></script>

<style>
#_menu_folder {
	height:100%;
	width:100%;
	background-color:rgba(0, 0, 0, 0.2);
	cursor:pointer;
	position:relative;
}
#_menu_folder:hover {
	height:100%;
	width:100%;
	background-color:rgba(222, 222, 222, 1);
}
.arrow-right {
        width: 0;
        height: 0;
        border-top: 6px solid transparent;
        border-bottom: 6px solid transparent;
        border-left: 6px solid rgba(0, 0, 0, 0.6);
		top:50%;
		position:absolute;
}
.arrow-left {
        width: 0;
        height: 0;
        border-top: 6px solid transparent;
        border-bottom: 6px solid transparent; 
        border-right:6px solid rgba(0, 0, 0, 0.6);
		top:50%;
		position:absolute;
}
.color_theme_selector {display:inline-block;width:10px;height:10px;margin-right:2px;}
</style>

<body style="">


				
<div class="banner">
	<div>
		<div class="banner_area">
			<table cellpadding="0" cellspacing="0" class="button_box_1">
				<tbody><tr>
					<td width="25"></td>
					<td width="90">
						<a href="javascript:void(0)" class="a3" onclick="editAccount()">我的账号</a>&nbsp;&nbsp;
					</td>
					<td width="90">
						<a href="http://jwnew.cqust.edu.cn/eams/home!welcome.action" onclick="return bg.Go(this,&#39;main&#39;)" class="a3">返回首页</a>&nbsp;&nbsp;
					</td>
					<td>
						<a href="http://jwnew.cqust.edu.cn/eams/logout.action" target="_top" class="a3">退出</a>
					</td>
				</tr>
			</tbody></table>
		</div>
		<div class="banner_area">
<form id="form11754836551" name="form11754836551" action="http://jwnew.cqust.edu.cn/eams/home.action" method="post">

					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#FFFFFF" id="color_theme_selector_FFFFFF" class="color_theme_selector" style="background-color:#FFFFFF;" title="白色"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#FAF9DE" id="color_theme_selector_FAF9DE" class="color_theme_selector" style="background-color:#FAF9DE;" title="杏仁黄"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#FFF2DE" id="color_theme_selector_FFF2DE" class="color_theme_selector" style="background-color:#FFF2DE;" title="秋叶褐"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#FDE6E0" id="color_theme_selector_FDE6E0" class="color_theme_selector" style="background-color:#FDE6E0;" title="胭脂红"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#E3EDCD" id="color_theme_selector_E3EDCD" class="color_theme_selector" style="background-color:#E3EDCD;" title="青草绿"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#DCE2F1" id="color_theme_selector_DCE2F1" class="color_theme_selector" style="background-color:#DCE2F1;" title="海天蓝"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#E9EBFE" id="color_theme_selector_E9EBFE" class="color_theme_selector" style="background-color:#E9EBFE;" title="葛巾紫"></a>
					<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!courseTable.action#color_theme_#EAEAEF" id="color_theme_selector_EAEAEF" class="color_theme_selector" style="background-color:#EAEAEF;" title="极光灰"></a>
				
				<a href="http://jwnew.cqust.edu.cn/eams/security/my.action" target="_blank" title="查看登录记录" style="color:#ffffff">姓名(学号)</a>&nbsp;&nbsp;
					<span style="padding:0 2px;color:#FFF;font-weight:blod;">学生</span>
					<input type="hidden" name="security.userCategoryId" value="1" style="width:70px">

</form>
		</div>
	</div>
	<br><br>
	<div style="float:right;display:block;clear:both;">
		<ul class="nav_box" id="nav_box">
		</ul>
	</div>
</div>
<script>
	jQuery('.nav_box li').each(function(index, li) {
		jQuery(this).focus(function(e) {
			jQuery(this).blur();
		});
		jQuery(this).click(function(e) {
			jQuery('li', jQuery(this).parent()).each(function(index, li) {
				jQuery(this).removeClass('current');
			});
			jQuery(this).addClass('current');
		});
	});

	jQuery(function() {
		jQuery('#color_theme_selector_FFFFFF').click(function() {
			jQuery(document.body).css('background-color', '#FFFFFF');
			jQuery.cookie('_body_color_theme', '#FFFFFF', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_FAF9DE').click(function() {
			jQuery(document.body).css('background-color', '#FAF9DE');
			jQuery.cookie('_body_color_theme', '#FAF9DE', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_FFF2DE').click(function() {
			jQuery(document.body).css('background-color', '#FFF2DE');
			jQuery.cookie('_body_color_theme', '#FFF2DE', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_FDE6E0').click(function() {
			jQuery(document.body).css('background-color', '#FDE6E0');
			jQuery.cookie('_body_color_theme', '#FDE6E0', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_E3EDCD').click(function() {
			jQuery(document.body).css('background-color', '#E3EDCD');
			jQuery.cookie('_body_color_theme', '#E3EDCD', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_DCE2F1').click(function() {
			jQuery(document.body).css('background-color', '#DCE2F1');
			jQuery.cookie('_body_color_theme', '#DCE2F1', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_E9EBFE').click(function() {
			jQuery(document.body).css('background-color', '#E9EBFE');
			jQuery.cookie('_body_color_theme', '#E9EBFE', { expires: 30, path: '/' });
		});
		jQuery('#color_theme_selector_EAEAEF').click(function() {
			jQuery(document.body).css('background-color', '#EAEAEF');
			jQuery.cookie('_body_color_theme', '#EAEAEF', { expires: 30, path: '/' });
		});
		if(jQuery.cookie('_body_color_theme')) {
			var color = jQuery.cookie('_body_color_theme')
			jQuery(document.body).css('background-color', color);
		}
	});
</script>

<table id="mainTable" style="width:100%;height:95%;clear:both;float:left;">
	<tbody><tr>
	   <td style="height:100%;width:10%" id="leftTD" valign="top">
<div id="menu_panel" class="ajax_container">
<script>
	jQuery("ul.menu li a.p_1").click(function() {
		jQuery("ul.menu li.current").removeClass('current');
		jQuery(this).parent('li').addClass('current');
	});
</script>
<script src="./courseTableForStd!courseTable.action_files/menu.js.下载" type="text/javascript"></script>

<ul class="menu collapsible">
     
     <li style="margin:0px;" class="expand"> 
     <a class="first_menu" href="javascript:void(0)">注册服务</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/studentSemesterRegist.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">学期注册</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdGuardian.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">监护人信息</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="javascript:void(0)">学业服务</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/evaluateStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">课程结业评教</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdPreSelect.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">预选报名</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/credit/settle/std-semester-credit-settle.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">学期学分结算</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdTextbookOrderLine.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">教材选购</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/textEvaluateStudent.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">日常评教</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdChangeMajorApply.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">转专业申请</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdOtherExamSignUp.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">校外考试报名</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/studChangeEdu.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">结业后重修考试报名</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="javascript:void(0)">选课服务</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/evaluateStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">课程结业评教</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/courseTableOfClassForStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">全校班级课表</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/scheduleSearchForTeaStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">全校课表</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的课表</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/myPlan.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的计划</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/myPlanCompl.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的计划完成情况</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/sharePlanSearch.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">公共培养方案</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/majorPlanSearch.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">专业培养方案</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdElectCourse.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">选课/重修</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu active" href="javascript:void(0)">查询服务</a><ul class="acitem" style="display: block;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdDetail.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的学籍</a></li>
       			<li class="current"><a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的课表</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/teachingPlanSearchForStu.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的授课计划</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdExamTable.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的考试</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/teach/grade/course/person.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的成绩</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdPreSelectResult.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的预选查询</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/stdElectLog.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的选课日志</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="javascript:void(0)">学分认定与转换</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/std-apply-achievement.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">成果申报</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/my-achievement.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的成果信息</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/std-credit-aut-search.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">学分认定查询</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/personalCourse.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">学分转换</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="javascript:void(0)">导师制管理</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/tutor/student/manage.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">我的信息</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/tutor/student/std-evaluat-teacher.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">学生评导</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/tutor/student/student-growth-manual.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">导学手册</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/tutor/student/tutor-search-for-std.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">导师信息查询</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="javascript:void(0)">系统服务</a><ul class="acitem" style="display: none;"><div class="scroll_box">
       			<li><a href="http://jwnew.cqust.edu.cn/eams/surveyResult.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">问卷调查</a></li>
       			<li><a href="http://jwnew.cqust.edu.cn/eams/systemMessage.action" onclick="return bg.Go(this,&#39;main&#39;)" class="p_1">站内消息</a></li>
  </div></ul></li>
</ul>
</div>
<script>bg.ready(function(){bg.Go('/eams/home!submenus.action?menu.id=','menu_panel', 'false')});</script>
	   </td>
	   <td style="height:100%;width:8px">
	   		<!-- 折叠菜单栏的bar -->
			<div id="_menu_folder"><div id="_menu_folder_tri" class="arrow-left"></div></div>
	   </td>
	   <td id="rightTD" valign="top">
<div id="main" class="ajax_container">
<div id="toolbar20098117401" class="toolbar notprint"><div class="toolbar-title"><span class="toolbar-icon action-info"></span><strong>我的课表</strong></div><div class="toolbar-items" id="toolbar20098117401_items"></div><div class="toolbar-msg" id="toolbar20098117401_msg" style="display: none;"></div><div class="toolbar-line"><img height="1" width="100%" align="top" src="./courseTableForStd!courseTable.action_files/keyline.png"></div></div>
<script type="text/javascript">
  bar = bg.ui.toolbar("toolbar20098117401",'我的课表');
  
  bar.addHr();
</script><div style="background: url(&#39;/eams/static/images/semesterBarBg.png&#39;) repeat-x scroll 50% 50% #DEEDF7;border: 1px solid #AED0EA;color: #222222;font-weight: bold;height:28px;">

<form id="courseTableForm" name="courseTableForm" action="http://jwnew.cqust.edu.cn/eams/courseTableForStd.action" method="post" target="">

<div style="margin-left:4px;margin-top:2px;float:left;line-height:22px;height:22px;">
		<input type="hidden" name="ignoreHead" value="1">
	<label for="courseTableType" class="title">课表类型:</label>
	<select id="courseTableType" name="setting.kind" onchange="searchTable()" style="width:120px">
		<option value="std">学生课表</option>
		<option value="class">班级课表</option> 
	</select>
	|
	<label for="startWeek" class="title">选择教学周:</label>
	<select id="startWeek" name="startWeek" onchange="searchTable()">
    	<option value="1">第1周</option><option value="2">第2周</option><option value="3">第3周</option><option value="4">第4周</option><option value="5">第5周</option><option value="6">第6周</option><option value="7">第7周</option><option value="8">第8周</option><option value="9">第9周</option><option value="10">第10周</option><option value="11">第11周</option><option value="12">第12周</option><option value="13">第13周</option><option value="14">第14周</option><option value="15">第15周</option><option value="16">第16周</option><option value="17">第17周</option><option value="18">第18周</option><option value="19">第19周</option><option value="20">第20周</option>
    </select>
    |

</div>
<div style="margin-left:10px;margin-top:2px;float:left;line-height:18px;height:22px;">
<label for="semesterBar20098117401" style="display: none;">项目:</label>
<select id="semesterBar20098117401" name="project.id" style="display: none;">	<option value="1" selected="">本科教学</option>
</select>
	<label for="semesterBar20098117401Semester" class="title">学年学期:</label>
	<input id="semesterBar20098117401Semester" class="calendar-text calendar-text-state-default" title="学年学期" type="text" value="" readonly="true">
	<div class="calendar-bar" tabindex="-1" style="display: none;">
		<input id="semesterCalendar_target" type="hidden" name="semester.id" value="261">
		<a name="prev" href="javascript:void(0)" style="display:none"><img src="./courseTableForStd!courseTable.action_files/semesterCalendar_prev.gif"></a>
		<input id="semesterCalendar_year" class="calendar-bar-input" type="text" index="5" value="" maxlength="4" size="4" readonly="true" style="display:none"><span style="display:none">学年</span>
		<a name="next" href="javascript:void(0)" style="display:none"><img src="./courseTableForStd!courseTable.action_files/semesterCalendar_next.gif"></a>
		
		<a name="prev" href="javascript:void(0)" style="display:none"><img src="./courseTableForStd!courseTable.action_files/semesterCalendar_prev.gif"></a>
		<input id="semesterCalendar_term" class="calendar-bar-input" type="text" index="0" value="" size="4" readonly="true" style="display:none"><span style="display:none">学期</span>
		<a name="next" href="javascript:void(0)" style="display:none"><img src="./courseTableForStd!courseTable.action_files/semesterCalendar_next.gif"></a>
		<a href="javascript:void(0)" id="allSemester" style="display:none"></a>
		
		<table id="semesterCalendar_yearTb" class="semesterCalendar_yearTb" style="border-right: 0px none;">
			<tbody><tr><td class="calendar-bar-td-blankBorder" index="0">2014-2015</td><td class="calendar-bar-td-blankBorder" index="1">2015-2016</td><td class="calendar-bar-td-blankBorder" index="2">2016-2017</td></tr><tr><td class="calendar-bar-td-blankBorder" index="3">2017-2018</td><td class="calendar-bar-td-blankBorder" index="4">2018-2019</td><td class="ui-state-active" index="5">2019-2020</td></tr><tr><td class="calendar-bar-td-blankBorder" index="6">2020-2021</td><td class="calendar-bar-td-blankBorder" index="7">2021-2022</td><td class="calendar-bar-td-blankBorder" index="8">2022-2023</td></tr></tbody>
		</table>
		<!-- 两个table之间的空div用来解决IE6 下莫名其妙重复渲染最后一个学年td中的文字的bug-->
		<div></div>
		<table id="semesterCalendar_termTb" class="semesterCalendar_termTb" style="border-left: 1px solid rgb(221, 221, 221);"><tbody><tr><td index="0" val="261" class="ui-state-active"><span>1</span>学期</td></tr><tr><td index="1" val="301" class="calendar-bar-td-blankBorder"><span>2</span>学期</td></tr><tr><td index="2" val="341" class="calendar-bar-td-blankBorder"><span>2学期小</span>学期</td></tr></tbody></table>
	</div>
	<script type="text/javascript">
		if(jQuery.struts2_jquery.scriptCache["/scripts/semesterCalendar.js?s2j="+jQuery.struts2_jquery.version]){
			jQuery("#semesterBar20098117401Semester").semesterCalendar({empty:"false",onChange:"",value:"325"},"searchTable()");
		}else{
			jQuery.struts2_jquery.require("/scripts/semesterCalendar.js",function(){
				jQuery("#semesterBar20098117401Semester").semesterCalendar({empty:"false",onChange:"",value:"325"},"searchTable()");
			},'/eams/static');
		}

	</script>
<script type="text/javascript">
		jQuery("#semesterBar20098117401").val(jQuery.post("/eams/dataQuery.action",{dataType:"projectId"}));
		jQuery("#semesterBar20098117401").hide();
		jQuery("#semesterBar20098117401").prev().hide();
		var semesterBar20098117401res = jQuery.post("/eams/dataQuery.action",{entityId:""},function(){
			if(semesterBar20098117401res.status==200){
				jQuery("#semesterBar20098117401").empty();
				if(semesterBar20098117401res.responseText!=""){
					jQuery("#semesterBar20098117401").append(semesterBar20098117401res.responseText);
				}
			}
		},"text");
	jQuery("#semesterBar20098117401").change(function(){
		jQuery.post("/eams/dataQuery!changeProjectId.action",{projectId:this.value},function(){
			jQuery("#semesterBar20098117401Semester")[0].getSemesters(jQuery("#semesterBar20098117401Semester"),{empty:"false",value:"325"},"searchTable()");
		},"text");
	});
</script>
<input type="submit" value="切换学期" onclick="searchTable();return false;">
</div>

<input name="ids" value="604199" type="hidden"></form>
</div><table class="indexpanel">
	<tbody><tr>
		<td class="index_content">
<div id="contentDiv" class="ajax_container">
 
<script language="JavaScript" type="text/JavaScript" src="./courseTableForStd!courseTable.action_files/TaskActivity.js.下载"></script> 
<script language="JavaScript">
	function fillTable(table,weeks,units,tableIndex){
	
   	   for(var i=0;i<weeks;i++){
	 	    for(var j=0;j<units-1;j++){
	 	        var index =units*i+j;
	 	        var preTd=jQuery("#TD"+index+"_"+tableIndex);
	 	        var nextTd=jQuery("#TD"+(index+1)+"_"+tableIndex);
	 	        while(table.marshalContents[index]!=null&&table.marshalContents[index+1]!=null&&table.marshalContents[index]==table.marshalContents[index+1]){
	 	            nextTd.remove();
	 	            var spanNumber = 1;
	 	            if(preTd.prop("rowSpan")) spanNumber = new Number(preTd.prop("rowSpan"))
	 	            spanNumber++;
	 	            preTd.prop("rowSpan",spanNumber);
	 	            j++;
	 	            if(j>=units-1){
	 	                break;
	 	            }
	 	            index=index+1;
	 	            nextTd=jQuery("#TD"+(index+1)+"_"+tableIndex);
	 	        }
	 	    }
 	    }
 	    
 	   		for(var k = 0; k < table.unitCounts; k++){
			var td=document.getElementById("TD" + k + "_" + tableIndex);
			if(td != null && table.marshalContents[k] != null) { 
				td.innerHTML = table.marshalContents[k];
				td.style.backgroundColor="#94aef3";
				td.className = "infoTitle";
				
				// 查找冲突 table.activities是什么，可以查看TaskActivity.js和courseTableContent_script.ftl
				var activitiesInCell = table.activities[k];
				if(detectCollisionInCell(activitiesInCell)) {
					td.style.backgroundColor="red";
				}
				td.className="infoTitle";
				td.title=table.marshalContents[k].replace(/<br>/g,";");
			}
		}
   	}
function detectCollisionInCell(activitiesInCell) {
	if(activitiesInCell.length <=1)
		return false;
	//单元格的课程集合[courseId(seqNo)->true]
	var cellCourseIds=new Object();
	var mergedValidWeeks = activitiesInCell[0].vaildWeeks.split("");
	//登记第一个课程
	cellCourseIds[ activitiesInCell[0].courseName]=true;
	for(var z = 1; z < activitiesInCell.length; z++) {		
		var detectCollision = false;
		var tValidWeeks = activitiesInCell[z].vaildWeeks.split("");
		if(mergedValidWeeks.length != tValidWeeks.length) {
			alert('mergedValidWeeks.length != tValidWeeks.length');
			return;
		}
		for(var x = 0; x < mergedValidWeeks.length; x++) {	//53代表53周
			var m = new Number(mergedValidWeeks[x]);
			var t = new Number(tValidWeeks[x]);
			if(m + t <= 1) {
				mergedValidWeeks[x] = m + t;
			}
			else {
				//如果已经是登记过的，则不算冲突
			    if(!cellCourseIds[activitiesInCell[z].courseName]){
  					return true;	//发现冲突
  				}
  			}
  		}
  		//登记该课程
  		cellCourseIds[activitiesInCell[z].courseName]=true;
	}
	return false;
}
</script>
   		<pre>课表格式说明：教师姓名 课程名称(序号) (第n周-第m周,教室)</pre>
   		<br>
   		已安排时间的任务列表
		<table width="100%" id="manualArrangeCourseTable" align="center" class="gridtable" style="text-align:center">
			<thead>
			<tr>
		    	<th style="background-color:#DEEDF7;" height="10px" width="100px">节次/周次
		    	</th><th style="background-color:#DEEDF7;">
		        	<font size="2px">星期一</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期二</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期三</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期四</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期五</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期六</font>
				</th>
		    	<th style="background-color:#DEEDF7;">
		        	<font size="2px">星期日</font>
				</th>
			</tr>
			</thead>
			<tbody><tr>
			    <td style="background-color:#EEFF00">
		    		<font size="2px"> 第一节</font><br>
		    		08:30-09:15
				</td>
		   		<td id="TD0_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="王开容 大学英语Ⅰ(3WY1004B.83);(4-17,博学楼E204)">王开容 大学英语Ⅰ(3WY1004B.83)<br>(4-17,博学楼E204)</td>
		   		<td id="TD12_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD24_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="张正萍 高等数学（理工）Ⅰ(3SL1030C.18);(4-17,博学楼E214)">张正萍 高等数学（理工）Ⅰ(3SL1030C.18)<br>(4-17,博学楼E214)</td>
		   		<td id="TD36_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD48_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="王开容 大学英语Ⅰ(3WY1004B.83);(14-17,博学楼E401)">王开容 大学英语Ⅰ(3WY1004B.83)<br>(14-17,博学楼E401)</td>
		   		<td id="TD60_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD72_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#EEFF00">
		    		<font size="2px"> 第二节</font><br>
		    		09:25-10:10
				</td>
		   		
		   		<td id="TD13_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		
		   		<td id="TD37_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		
		   		<td id="TD61_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD73_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#EEFF00">
		    		<font size="2px"> 第三节</font><br>
		    		10:30-11:15
				</td>
		   		<td id="TD2_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="张正萍 高等数学（理工）Ⅰ(3SL1030C.18);(4-17,博学楼E214)">张正萍 高等数学（理工）Ⅰ(3SL1030C.18)<br>(4-17,博学楼E214)</td>
		   		<td id="TD14_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="邸永江 材料工程导论(3YJ1348A.01);(7-14,教学主楼D501)">邸永江 材料工程导论(3YJ1348A.01)<br>(7-14,教学主楼D501)</td>
		   		<td id="TD26_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="王开容 大学英语Ⅰ(3WY1004B.83);(4-17,博学楼E204)">王开容 大学英语Ⅰ(3WY1004B.83)<br>(4-17,博学楼E204)</td>
		   		<td id="TD38_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="徐涛,董晓欢 军事理论(3XG1003A.14);(11-15,教学主楼B504)">徐涛,董晓欢 军事理论(3XG1003A.14)<br>(11,教学主楼B504)</td>
		   		<td id="TD50_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="张正萍 高等数学（理工）Ⅰ(3SL1030C.18);(4-15,博学楼E214)">张正萍 高等数学（理工）Ⅰ(3SL1030C.18)<br>(4-15,博学楼E214)</td>
		   		<td id="TD62_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD74_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#EEFF00">
		    		<font size="2px"> 第四节</font><br>
		    		11:25-12:10
				</td>
		   		
		   		
		   		
		   		
		   		
		   		<td id="TD63_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD75_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#33BB00">
		    		<font size="2px"> 第五节</font><br>
		    		14:00-14:45
				</td>
		   		<td id="TD4_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="王小兵,曾瑜 思想道德修养与法律基础(3FM1124A.05);(4 6-16,教学主楼A112)">王小兵,曾瑜 思想道德修养与法律基础(3FM1124A.05)<br>(4 6-16,教学主楼A112)</td>
		   		<td id="TD16_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="徐涛,董晓欢 军事理论(3XG1003A.14);(11-15,教学主楼C301)">徐涛,董晓欢 军事理论(3XG1003A.14)<br>(11-15,教学主楼C301)</td>
		   		<td id="TD28_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD40_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="彭凌 形势与政策I(3FM1125A.14);(14-17,教学主楼C307)">彭凌 形势与政策I(3FM1125A.14)<br>(14-17,教学主楼C307)</td>
		   		<td id="TD52_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="徐显秋 高级办公自动化(3DX1231A.08);(4-15)">徐显秋 高级办公自动化(3DX1231A.08)<br>(4-15)</td>
                <td id="TD64_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="谭仁兵 数学物理方法(3SL1122A.01);(18,教学主楼C205);李娟 毛泽东思想和中国特色社会主义理论体系概论Ⅰ(3FM1123A.11);(1-3 5-16,教学主楼C303)">谭仁兵 数学物理方法(3SL1122A.01)<br>(1 5 18,教学主楼C205)<br>李娟 毛泽东思想和中国特色社会主义理论体系概论Ⅰ(3FM1123A.11)<br>(1-3 5-16,教学主楼C303)</td>		   		<td id="TD76_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#33BB00">
		    		<font size="2px"> 第六节</font><br>
		    		14:55-15:40
				</td>
		   		
		   		
		   		<td id="TD29_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		
		   		
		   		<td id="TD65_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD77_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#33BB00">
		    		<font size="2px"> 第七节</font><br>
		    		16:00-16:45
				</td>
		   		<td id="TD6_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="徐显秋 高级办公自动化(3DX1231A.08);(4-15)">徐显秋 高级办公自动化(3DX1231A.08)<br>(4-15)</td>
		   		<td id="TD18_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="彭云 体育（乒乓球）Ⅰ(3TY1006A.14);(4-19,T003风雨球场乒乓球场)">彭云 体育（乒乓球）Ⅰ(3TY1006A.14)<br>(4-19,T003风雨球场乒乓球场)</td>
		   		<td id="TD30_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD42_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="王小兵,曾瑜 思想道德修养与法律基础(3FM1124A.05);(4 6-16,教学主楼A112)">王小兵,曾瑜 思想道德修养与法律基础(3FM1124A.05)<br>(4 6-16,教学主楼A112)</td>
		   		<td id="TD54_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD66_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD78_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:#33BB00">
		    		<font size="2px"> 第八节</font><br>
		    		16:55-17:40
				</td>
		   		
		   		
		   		<td id="TD31_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		
		   		<td id="TD55_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD67_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD79_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:pink">
		    		<font size="2px"> 第九节</font><br>
		    		18:00-18:45
				</td>
		   		<td id="TD8_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD20_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD32_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD44_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD56_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD68_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD80_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:pink">
		    		<font size="2px"> 第十节</font><br>
		    		18:55-19:40
				</td>
		   		<td id="TD9_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD21_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD33_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD45_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD57_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD69_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD81_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:pink">
		    		<font size="2px"> 第十一节</font><br>
		    		20:00-20:45
				</td>
		   		<td id="TD10_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="蔡萍 工程制图B(3JX1036B.08);(6-17,博学楼E412)">蔡萍 工程制图B(3JX1036B.08)<br>(6-17,博学楼E412)</td>
		   		<td id="TD22_0" style="background-color: rgb(148, 174, 243); font-size: 12px;" rowspan="2" class="infoTitle" title="蔡萍 工程制图B(3JX1036B.08);(6-17,博学楼E412)">蔡萍 工程制图B(3JX1036B.08)<br>(6-17,博学楼E412)</td>
		   		<td id="TD34_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD46_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD58_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD70_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD82_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
			<tr>
			    <td style="background-color:pink">
		    		<font size="2px"> 第十二节</font><br>
		    		20:55-21:40
				</td>
		   		
		   		
		   		<td id="TD35_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD47_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD59_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD71_0" style="backGround-Color:#ffffff;font-size:12px"></td>
		   		<td id="TD83_0" style="backGround-Color:#ffffff;font-size:12px"></td>
			</tr>
		</tbody></table> 
<script language="JavaScript">
	// function CourseTable in TaskActivity.js
	var table0 = new CourseTable(2019,84);
	var unitCount = 12;
	var index=0;
	var activity=null;
			activity = new TaskActivity("2557,2218","徐涛,董晓欢","62155(3XG1003A.14)","军事理论(3XG1003A.14)","1527","教学主楼B504","00000000000111110000000000000000000000000000000000000");
			index =3*unitCount+2;
			table0.activities[index][table0.activities[index].length]=activity;
			index =3*unitCount+3;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("2557,2218","徐涛,董晓欢","62155(3XG1003A.14)","军事理论(3XG1003A.14)","1542","教学主楼C301","00000000000111110000000000000000000000000000000000000");
			index =1*unitCount+4;
			table0.activities[index][table0.activities[index].length]=activity;
			index =1*unitCount+5;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1800","彭云","62114(3TY1006A.14)","体育（乒乓球）Ⅰ(3TY1006A.14)","1863","T003风雨球场乒乓球场","00001111111111111111000000000000000000000000000000000");
			index =1*unitCount+6;
			table0.activities[index][table0.activities[index].length]=activity;
			index =1*unitCount+7;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1611,1277","王小兵,曾瑜","61576(3FM1124A.05)","思想道德修养与法律基础(3FM1124A.05)","1438","教学主楼A112","00001011111111111000000000000000000000000000000000000");
			index =3*unitCount+6;
			table0.activities[index][table0.activities[index].length]=activity;
			index =3*unitCount+7;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1611,1277","王小兵,曾瑜","61576(3FM1124A.05)","思想道德修养与法律基础(3FM1124A.05)","1438","教学主楼A112","00001011111111111000000000000000000000000000000000000");
			index =0*unitCount+4;
			table0.activities[index][table0.activities[index].length]=activity;
			index =0*unitCount+5;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1835","彭凌","61577(3FM1125A.14)","形势与政策I(3FM1125A.14)","1548","教学主楼C307","00000000000000111100000000000000000000000000000000000");
			index =3*unitCount+4;
			table0.activities[index][table0.activities[index].length]=activity;
			index =3*unitCount+5;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1374","徐显秋","61844(3DX1231A.08)","高级办公自动化(3DX1231A.08)","","","00001111111111110000000000000000000000000000000000000");
			index =4*unitCount+4;
			table0.activities[index][table0.activities[index].length]=activity;
			index =4*unitCount+5;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1374","徐显秋","61844(3DX1231A.08)","高级办公自动化(3DX1231A.08)","","","00001111111111110000000000000000000000000000000000000");
			index =0*unitCount+6;
			table0.activities[index][table0.activities[index].length]=activity;
			index =0*unitCount+7;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1413","蔡萍","60782(3JX1036B.08)","工程制图B(3JX1036B.08)","1616","博学楼E412","00000011111111111100000000000000000000000000000000000");
			index =1*unitCount+10;
			table0.activities[index][table0.activities[index].length]=activity;
			index =1*unitCount+11;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1413","蔡萍","60782(3JX1036B.08)","工程制图B(3JX1036B.08)","1616","博学楼E412","00000011111111111100000000000000000000000000000000000");
			index =0*unitCount+10;
			table0.activities[index][table0.activities[index].length]=activity;
			index =0*unitCount+11;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1204","王开容","60065(3WY1004B.83)","大学英语Ⅰ(3WY1004B.83)","1584","博学楼E204","00001111111111111100000000000000000000000000000000000");
			index =2*unitCount+2;
			table0.activities[index][table0.activities[index].length]=activity;
			index =2*unitCount+3;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1204","王开容","60065(3WY1004B.83)","大学英语Ⅰ(3WY1004B.83)","1584","博学楼E204","00001111111111111100000000000000000000000000000000000");
			index =0*unitCount+0;
			table0.activities[index][table0.activities[index].length]=activity;
			index =0*unitCount+1;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1204","王开容","60065(3WY1004B.83)","大学英语Ⅰ(3WY1004B.83)","1610","博学楼E401","00000000000000111100000000000000000000000000000000000");
			index =4*unitCount+0;
			table0.activities[index][table0.activities[index].length]=activity;
			index =4*unitCount+1;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1490","邸永江","62350(3YJ1348A.01)","材料工程导论(3YJ1348A.01)","1578","教学主楼D501","00000001111111100000000000000000000000000000000000000");
			index =1*unitCount+2;
			table0.activities[index][table0.activities[index].length]=activity;
			index =1*unitCount+3;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1470","张正萍","60208(3SL1030C.18)","高等数学（理工）Ⅰ(3SL1030C.18)","1593","博学楼E214","00001111111111111100000000000000000000000000000000000");
			index =2*unitCount+0;
			table0.activities[index][table0.activities[index].length]=activity;
			index =2*unitCount+1;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1470","张正萍","60208(3SL1030C.18)","高等数学（理工）Ⅰ(3SL1030C.18)","1593","博学楼E214","00001111111111111100000000000000000000000000000000000");
			index =0*unitCount+2;
			table0.activities[index][table0.activities[index].length]=activity;
			index =0*unitCount+3;
			table0.activities[index][table0.activities[index].length]=activity;
			activity = new TaskActivity("1470","张正萍","60208(3SL1030C.18)","高等数学（理工）Ⅰ(3SL1030C.18)","1593","博学楼E214","00001111111111110000000000000000000000000000000000000");
			index =4*unitCount+2;
			table0.activities[index][table0.activities[index].length]=activity;
			index =4*unitCount+3;
			table0.activities[index][table0.activities[index].length]=activity;
	table0.marshalTable(2,1,19);
	fillTable(table0,7,12,0);
</script>
   		    <br>

<span>未安排时间任务列表</span>
<div class="grid">


<table id="grid12042826911" class="gridtable">
<thead class="gridhead">


<tr>
<th width="4%">序号</th>
<th width="12%">课程序号</th>
<th width="15%">课程名称</th>
<th width="4%">学分</th>
<th>教学班</th>
<th width="15%">教师</th>
<th width="10%">起止周</th>
<th width="10%">备注</th>
</tr>

</thead>

<tbody id="grid12042826911_data"><tr class="griddata-even">		<td>1</td>
<td>			<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221355" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3XG1003A.14</a>
</td><td>军事理论</td><td>1</td><td>班级:班级A/B/C</td><td>徐涛 董晓欢</td>		<td>11-15</td>
<td>      			
      			<br>
      			
      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>2</td>
<td>			<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=222004" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3XG1007A.84</a>
</td><td>军事训练</td><td>1</td><td>班级:班级A/B/C</td><td>范保艳</td>		<td>2-3</td>
<td>      		<br>
      		
</td></tr></tbody>
</table>
</div>
<script type="text/javascript">
  var clearCheckbox_grid12042826911 = function() {
    jQuery("#grid12042826911").find(".box:checkbox").removeProp("checked");
    jQuery("#grid12042826911").find(".gridselect-top :checkbox").removeProp("checked");
    return true;
  }
  
  page_grid12042826911 = bg.page("/eams/courseTableForStd!courseTable.action","");
  {
    var _paramstring = 'ignoreHead=1&setting.kind=std&startWeek=1&project.id=1&semester.id=261&ids=604199';
    var _params = _paramstring.split('&');
    for (var i = 0; i < _params.length; i++) {
      _params[i] = decodeURIComponent(_params[i]);
    }
    _paramstring = _params.join('&');
    page_grid12042826911.target("",'grid12042826911').action("/eams/courseTableForStd!courseTable.action").addParams(_paramstring).orderBy("null");
  }
  bg.ui.grid.init('grid12042826911',page_grid12042826911);
</script>
<br>
<span>所有任务列表</span>
<div class="grid">


<table id="grid12042826912" class="gridtable">
<thead class="gridhead">


<tr>
<th width="4%">序号</th>
<th width="12%">课程序号</th>
<th width="15%">课程名称</th>
<th width="4%">学分</th>
<th>教学班</th>
<th width="15%">教师</th>
<th width="10%">起止周</th>
<th width="10%">备注</th>
</tr>

</thead>

<tbody id="grid12042826912_data"><tr class="griddata-even">		<td>1</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221362" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3DX1231A.08</a>
</td><td>高级办公自动化</td><td>3</td><td>班级:班级A/B/C</td><td>徐显秋</td>		<td>4-16</td>
<td>      			
      			<br>
      			
      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>2</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221363" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3FM1124A.05</a>
</td><td>思想道德修养与法律基础</td><td>3</td><td>班级:班级A/B/C</td><td>王小兵 曾瑜</td>		<td>4-6双,7-16</td>
<td>      			
      			<br>
      			
      		<br>
      		六个班排4天，尽量排紧凑些 ，尽量不排1、2节和11、12节
</td></tr><tr class="griddata-even">		<td>3</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221357" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3FM1125A.14</a>
</td><td>形势与政策I</td><td>0.25</td><td>班级:班级A/B/C</td><td>彭凌</td>		<td>14-17</td>
<td>      			
      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>4</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221359" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3JX1036B.08</a>
</td><td>工程制图B</td><td>3</td><td>班级:班级A/B/C</td><td>蔡萍</td>		<td>6-17</td>
<td>      			
      			<br>
      			
      		<br>
      		E栋多媒体
</td></tr><tr class="griddata-even">		<td>5</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=223085" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3SL1030C.18</a>
</td><td>高等数学（理工）Ⅰ</td><td>5</td><td>班级:班级A/B/C</td><td>张正萍</td>		<td>4-17</td>
<td>      			
      			<br>
      			
      			<br>
      			
      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>6</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=222525" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3TY1006A.14</a>
</td><td>体育（乒乓球）Ⅰ</td><td>1</td><td>班级:班级A/B/C</td><td>彭云</td>		<td>4-19</td>
<td>      			
      		<br>
      		周二78
</td></tr><tr class="griddata-even">		<td>7</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=225638" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3WY1004B.83</a>
</td><td>大学英语Ⅰ</td><td>4</td><td>班级:班级A/B/C</td><td>王开容</td>		<td>4-17</td>
<td>      			
      			<br>
      			
      			<br>
      			
      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>8</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221355" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3XG1003A.14</a>
</td><td>军事理论</td><td>1</td><td>班级:班级A/B/C</td><td>徐涛 董晓欢</td>		<td>11-15</td>
<td>      			
      			<br>
      			
      		<br>
      		
</td></tr><tr class="griddata-even">		<td>9</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=222004" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3XG1007A.84</a>
</td><td>军事训练</td><td>1</td><td>班级:班级A/B/C</td><td>范保艳</td>		<td>2-3</td>
<td>      		<br>
      		
</td></tr><tr class="griddata-odd">		<td>10</td>
<td>		<a href="http://jwnew.cqust.edu.cn/eams/courseTableForStd!taskTable.action?lesson.id=221346" onclick="return bg.Go(this,null)" title="点击显示单个教学任务具体安排">3YJ1348A.01</a>
</td><td>材料工程导论</td><td>1</td><td>班级:班级A/B/C</td><td>邸永江</td>		<td>7-14</td>
<td>      			
      		<br>
      		
</td></tr></tbody>
</table>
</div>
<script type="text/javascript">
  var clearCheckbox_grid12042826912 = function() {
    jQuery("#grid12042826912").find(".box:checkbox").removeProp("checked");
    jQuery("#grid12042826912").find(".gridselect-top :checkbox").removeProp("checked");
    return true;
  }
  
  page_grid12042826912 = bg.page("/eams/courseTableForStd!courseTable.action","");
  {
    var _paramstring = 'ignoreHead=1&setting.kind=std&startWeek=1&project.id=1&semester.id=261&ids=604199';
    var _params = _paramstring.split('&');
    for (var i = 0; i < _params.length; i++) {
      _params[i] = decodeURIComponent(_params[i]);
    }
    _paramstring = _params.join('&');
    page_grid12042826912.target("",'grid12042826912').action("/eams/courseTableForStd!courseTable.action").addParams(_paramstring).orderBy("null");
  }
  bg.ui.grid.init('grid12042826912',page_grid12042826912);
</script>
   		    
   		<br>
</div>

		</td>
	</tr>
</tbody></table>
<script language="JavaScript">
	var form = document.courseTableForm;
   	function searchTable(){
   		if(jQuery("#courseTableType").val()=="std"){
   			bg.form.addInput(form,"ids","604199");
   		}else{
   			bg.form.addInput(form,"ids","5529");
   		}
       	bg.form.submit(form,"courseTableForStd!courseTable.action","contentDiv");
   	}
   	
	function confirmCourseTable(){
		if(confirm("课表是否确认无误?")){
			form.target="main";
			bg.form.addInput(form,"courseTableCheckId","")
      		bg.form.submit(form,"courseTableForStd!confirmCourseTable.action");
      		form.target="contentDiv";
      	}
	}
 </script>
</div>
<script>bg.ready(function(){bg.Go('/eams/home!welcome.action','main', 'false')});</script>
	   </td>
	</tr>
</tbody></table>

<script type="text/javascript">
	function editAccount(){
        window.open("/eams/security/my.action");
	}
	jQuery(function() {
		jQuery('#_menu_folder_tri').addClass('arrow-left');
		jQuery('#_menu_folder').click(function() {
			jQuery('#leftTD').toggle(200);
			var jq_tri = jQuery('#_menu_folder_tri');
			if(jq_tri.hasClass('arrow-left')) {
				jq_tri.removeClass('arrow-left');
				jq_tri.addClass('arrow-right');
			} else {
				jq_tri.removeClass('arrow-right');
				jq_tri.addClass('arrow-left');
			}
		});
	});
	
</script>



<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div></div><div id="messageZone" style="position: absolute; z-index: 1000; top: 0px; right: 0px; width: 55px; height: 20px; background: rgb(249, 237, 190); padding: 2px; visibility: hidden;">Loading...</div><div id="_my97DP" style="position: absolute; top: -1970px; left: -1970px;"><iframe style="width: 186px; height: 198px;" src="./courseTableForStd!courseTable.action_files/My97DatePicker.html" frameborder="0" border="0" scrolling="no"></iframe></div></body></html>
""";
