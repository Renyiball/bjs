-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-03-03 16:48:51
-- Vol : 1
DROP TABLE IF EXISTS `t_auth_access`;
CREATE TABLE `t_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/password_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/password','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/event/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/event/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/event/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/event/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/rules/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/rules/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/rules/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/rules/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/rules/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/default2/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/grade/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/grade/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/grade/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/grade/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/grade/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/school/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/school/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/school/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/school/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/school/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/member/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/member/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/member/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/ban','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/cancelban','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/clearcache','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','user/indexadmin/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/site_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/site','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/password_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/password','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/userinfo_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/userinfo','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/update/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/journal/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/import','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/del_backup','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/user/userinfo_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/user/userinfo','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/update/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/journal/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/extension/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/download','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/index_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/backup/restore','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/extension/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/event/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/games/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/games/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/games/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/games/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/games/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/default2/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/edit_post','admin_url');
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Extension','default','','0','1','扩展工具','cloud','','90');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','1','Admin','Backup','restore','','1','1','备份管理','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','6','Admin','Backup','index','','1','0','数据备份','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','6','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','6','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','6','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','0','Admin','Menu','index','','1','1','后台菜单','list','','20');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','2','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','7','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','2','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','2','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','8','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','2','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','2','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','3','Admin','User','userinfo','','1','1','个人信息','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','9','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','9','Admin','Setting','password','','1','0','修改密码','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','3','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','3','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','0','User','Indexadmin','default','','1','1','管理组','key','','10');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','4','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','0','删除角色','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','0','添加角色','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','4','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('162','1','Admin','Journal','index','','1','1','操作日志','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('163','1','Admin','Update','index','','1','1','更新日志','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','0','Admin','default1','index','','1','1','院校球队','sitemap','','30');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('166','5','Admin','Member','index','','1','1','球员管理','','','3');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('212','10','Admin','Rules','index','','1','1','比赛规则','','','2');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('213','10','Admin','Event','index','','1','1','赛事信息','','','1');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('214','5','Admin','School','index','','1','1','学校管理','','','1');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('215','5','Admin','Grade','index','','1','1','班级管理','','','2');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','0','Admin','default2','index','','1','1','赛事管理','futbol-o','','40');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('217','10','Admin','Games','index','','1','1','比赛管理','','','3');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('219','214','Admin','School','add','','1','0','添加学校','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('220','214','Admin','School','edit','','1','0','修改学校','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('221','219','Admin','School','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('222','220','Admin','School','edit_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('223','215','Admin','Grade','add','','1','0','添加班级','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('224','215','Admin','Grade','edit','','1','0','修改班级','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('225','223','Admin','Grade','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('226','224','Admin','Grade','edit_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('227','166','Admin','Member','edit','','1','0','修改球员','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('228','227','Admin','Member','edit_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('229','213','Admin','Event','add','','1','0','添加赛事','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('230','213','Admin','Event','edit','','1','0','修改赛事','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('231','229','Admin','Event','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('232','230','Admin','Event','edit_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('233','212','Admin','Rules','add','','1','0','添加赛规','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('234','212','Admin','Rules','edit','','1','0','修改赛规','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('235','233','Admin','Rules','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('236','234','Admin','Rules','edit_post','','1','0','提交修改','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('237','217','Admin','Games','add','','1','0','添加比赛','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('238','217','Admin','Games','edit','','1','0','修改比赛','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('239','237','Admin','Games','add_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('240','238','Admin','Games','edit_post','','1','0','提交修改','','','0');
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO t_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"\\u73ed\\u7ea7\\u8d5b\",\"site_host\":\"http:\\/\\/127.0.0.1\\/bjs_server\\/\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"html_cache_on\":\"1\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.admin\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u73ed\\u7ea7\\u8d5b\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"urlmode\":\"2\",\"html_suffix\":\"html\",\"comment_time_interval\":0}','1');
INSERT INTO t_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('3','cmf_settings','{\"storage\":{\"type\":\"Local\",\"Qiniu\":{\"accessKey\":\"\",\"secrectKey\":\"\",\"domain\":\"\",\"bucket\":\"\"}},\"banned_usernames\":\"\"}','1');
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
INSERT INTO t_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('2','普通管理员','0','1','后台专用','1453340659','1453949446','0');
INSERT INTO t_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('3','校内管理员','','1','管理学校信息','1453896785','1456900288','0');
INSERT INTO t_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('4','体育老师','','1','管理球队信息','1453896814','1456900305','0');
INSERT INTO t_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('5','班主任','','1','管理绑定班级球员信息，此分类后台数据已经绑定为班主任。不得修改','1453896821','1456900402','0');
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('4','8');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('3','3');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('4','4');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('5','7');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('1','2');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('5','3');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('5','4');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('5','5');
DROP TABLE IF EXISTS `t_rules`;
CREATE TABLE `t_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(20) DEFAULT NULL,
  `rule_title` varchar(255) DEFAULT NULL,
  `rule_date` datetime DEFAULT NULL,
  `rule_modify` datetime DEFAULT NULL,
  `rule_content` text,
  `rule_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('1','2','在规矩的轨道上奋力奔跑--我局组织开展廉政主题演讲比赛 ','2016-01-28 10:01:14','2016-01-28 10:07:10','<p>&nbsp; &nbsp; &nbsp; &nbsp; 11月12日，我局组织开展了以“如何做人、如何履职、如何用权”为主题的演讲比赛。市局纪检组副组长、监察室主任张臣林应邀出席，局领导班子成员和全体党员、入党积极分子共132人参加了活动。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
比赛中，11位青年税官围绕做人、履职、用权的主题，结合自己的从税经历，在学习反思和总结归纳的基础上，为大家奉献了一份以廉洁为经纬的精神大餐。纪检组长陈光俊代表局党组作了总结发言，他强调，开展演讲活动是思想政治工作的有效形式，既能对演讲者起到敲警钟、促成长的作用，又能对其他干部起到潜移默化、以文化人的作用。各部门负责人平时要加强内部管理，引导干部自觉遵守政治纪律和政治规矩，不碰底线，不踏雷区，在岗尽责，踏实履职。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
赛后，市局纪检组副组长、监察室主任张臣林对本次活动进行了点评，他充分肯定了我局党组履行“两个责任”和党风廉政建设的做法和成效，并对党员和入党积极分子提出“善学习、讲政治、守规矩、知敬畏”的具体要求，希望大家像演讲主题一样，做好人、履行好职责、用好手中的权力。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
一直以来，我局党组高度重视党风廉政建设，坚持将“两个责任”扛在肩上，落实到行动上。组织开展廉政演讲比赛，是我局贯彻“三严三实”教育实践活动的一个延伸，反映了局党组构建廉政教育“大宣教”格局的新思路。我局将通过加强机关廉政文化建设，不断推进党的建设、干部队伍建设和党风廉政建设,百尺竿头、更进一步，为税收中心工作保驾护航。 &nbsp;</p><p><br/></p>','2');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('2','1','足球联赛','2016-01-28 10:08:10','2016-01-28 10:08:10','<p>欧洲足球五大联赛，是指欧洲的<a target=\"_blank\" href=\"http://baike.baidu.com/view/1267693.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">足球联赛</a>中影响力以及竞技水平排名前五的联赛，即<a target=\"_blank\" href=\"http://baike.baidu.com/view/85998.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">英格兰足球超级联赛</a>（ the English Premier League）、<a target=\"_blank\" href=\"http://baike.baidu.com/view/93806.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">意大利足球甲级联赛</a>（Italian Serie A）、<a target=\"_blank\" href=\"http://baike.baidu.com/view/93710.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">德国足球甲级联赛</a>（ German Bundesliga ）、<a target=\"_blank\" href=\"http://baike.baidu.com/view/81359.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">西班牙足球甲级联赛</a>（Spanish La Liga）、<a target=\"_blank\" href=\"http://baike.baidu.com/view/475914.htm\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">法国足球甲级联赛</a>（French Ligue 1）。这些联赛代表着世界足坛最顶尖的足球水平，吸引了众多球星加盟，是世界足球发展的风向标。</p><p>2013-2014赛季，欧洲五大联赛的年收入首次突破百亿大关，达到113亿欧元，而欧洲足球联赛的整体收入也突破了200亿欧元。</p><p><br/></p>','2');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('3','3','跳啊跳啊跳','2016-01-28 10:20:09','2016-01-28 10:20:09','<p style=\"text-align: center;\"><img src=\"http://localhost/bjs_server/data/upload/ueditor/20160128/56a97a9ecf52a.png\" title=\"blob.png\" alt=\"blob.png\"/></p><p style=\"text-align: center;\">jump</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.999600410461426px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">据北京地铁微博消息，今天上午9点11分，地铁1号线玉泉路站下行（开往苹果园方向）一名乘客进入运营轨道正线，列车紧急制动，车站工作人员采取接触轨停电措施进行处理。目前1号线相关换乘车站均已采取限流措施。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.999600410461426px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">大燕网综合北京地铁微博和北京人不知道的北京事儿微博报道</p><p><br/></p>','2');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('4','5','哈三小一年级联赛赛规','2016-02-19 09:34:24','2016-02-19 09:34:24','<p>测试赛规</p>','1');
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；t_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `school_id` int(11) NOT NULL COMMENT '所属学校ID',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('1','admin','33d88f7fc05521232f297a57a5a743894a0e4a801fc3ddef','大BOSS','admin@admin.admin','','','1','1957-01-03','哈哈哈','106.2.204.146','2016-03-01 14:00:22','2016-01-21 09:04:43','0','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('2','wzxaini9','33d88f7fc055e43b060da6d25fdf7cba5f9938f1679cddef','爸爸来到后台','ad@mi.n','http://localhost','img/Users/2016/01/14539532381308.jpeg','1','2016-01-11','君甚吊、家翁造？','106.2.204.146','2016-03-03 16:09:58','2000-01-01 00:00:00','0','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('3','test1','33d88f7fc0555a105e8b9d40e1329780d62ea2265d8addef','校长','te@st.1','','','0','','','127.0.0.1','2016-02-17 09:26:20','2000-01-01 00:00:00','1','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('4','test2','33d88f7fc055ad0234829205b9033196ba818f7a872bddef','体育老师','te@st.2','','','0','','','192.168.0.17','2016-02-16 18:31:06','2000-01-01 00:00:00','3','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('5','test3','33d88f7fc0558ad8757baa8564dc136c1e07507f4a98ddef','某班主任','te@st.3','','','0','','','0.0.0.0','2016-01-28 14:40:46','2000-01-01 00:00:00','2','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('7','hsx02','33d88f7fc055e10adc3949ba59abbe56e057f20f883eddef','修泽湖','hdfksd@sfjsda.sdfsd','','','0','','','0.0.0.0','2016-02-19 11:58:47','2000-01-01 00:00:00','9','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('8','hsx03','33d88f7fc055e10adc3949ba59abbe56e057f20f883eddef','hsx','123@sd.sdf','','','0','','','0.0.0.0','2016-02-19 12:33:36','2000-01-01 00:00:00','9','1','0','1');
