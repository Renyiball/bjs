-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-03-28 09:21:07
-- Vol : 1
DROP TABLE IF EXISTS `t_auth_access`;
CREATE TABLE `t_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/vsteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/addteam_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/addteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/deleteteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/grade/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/grade/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/grade/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/index','admin_url');
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
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/member/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/password_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/password','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/user/userinfo','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/vsteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/addteam_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/addteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/deleteteam','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/move','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/team','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/edit_post','admin_url');
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
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/userinfo_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/event/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/move','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/team','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/rules/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/default2/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/grade/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/member/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/member/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/setting/clearcache','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/user/userinfo_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('5','admin/setting/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/event/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/rules/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/rules/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/rules/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/rules/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/rules/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/default2/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/grade/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/grade/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/grade/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/grade/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/grade/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/school/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/member/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/member/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/member/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/default1/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/add_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/ban','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/cancelban','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/add','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/delete','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','user/indexadmin/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/clearcache','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/password','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/password_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/member/index','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/setting/password_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/setting/password','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/user/userinfo_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/userinfo','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/user/userinfo','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/setting/default','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/edit','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/games/edit_post','admin_url');
INSERT INTO t_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('4','admin/games/edit_post','admin_url');
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
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('212','10','Admin','Rules','index','','1','1','章程管理','','','2');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('213','10','Admin','Event','index','','1','1','赛事信息','','','1');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('214','5','Admin','School','index','','1','1','学校管理','','','1');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('215','5','Admin','Grade','index','','1','1','班级管理','','','2');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','0','Admin','default2','index','','1','1','赛事管理','futbol-o','','40');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('217','10','Admin','Games','index','','1','1','赛程管理','','','3');
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
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('241','213','Admin','Event','team','','1','0','赛事球队','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('242','213','Admin','Event','addteam','','1','0','添加球队','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('243','242','Admin','Event','addteam_post','','1','0','提交添加','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('244','241','Admin','Event','move','','1','0','球队分组','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('245','237','Admin','Games','vsteam','','1','0','添加比赛','','','0');
INSERT INTO t_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('246','241','Admin','Event','deleteteam','','1','0','删除球队','','','0');
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
INSERT INTO t_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"\\u73ed\\u7ea7\\u8d5b\",\"site_host\":\"http:\\/\\/m1.banjisai.com\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.admin\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u73ed\\u7ea7\\u8d5b\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"urlmode\":\"2\",\"html_suffix\":\"html\",\"comment_time_interval\":0}','1');
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
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('1','10');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('3','9');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('3','7');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('1','2');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('3','3');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('4','4');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('5','5');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('4','11');
INSERT INTO t_role_user ( `role_id`, `user_id` ) VALUES  ('4','12');
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
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('1','2','税务局小学联赛赛规','2016-01-28 10:01:14','2016-03-19 13:27:48','<pre id=\"best-content-121667608\" accuse=\"aContent\" class=\"best-text mb-10\" style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: arial, &#39;courier new&#39;, courier, 宋体, monospace, &#39;Microsoft YaHei&#39;; white-space: pre-wrap; word-wrap: break-word; font-size: 14px; color: rgb(51, 51, 51); line-height: 24px; background-color: rgb(243, 255, 236);\">比赛规则：比赛在长约45米、宽约28米的场地上（即萍中新篮球场）进行。两端的防守区长度为11米，中场区长度为23米，场地中央设一开球点，球门宽3米，高2米，比赛使用4号球；比赛双方各出场5名球员，不设守门员，每队每场替补队员人数和人次不限，可轮换休息；全场比赛时间为50分钟，上、下半场各25分钟，中间休息10分钟；比赛无越位限制，角球和任意球可直接射门得分，队员被红牌罚下，5分钟后可继续参加比赛。其他规则与大场足球相同。</pre><p><br/></p>','1');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('5','5','16年春季联赛','2016-03-25 19:06:13','2016-03-26 15:14:05','<p style=\"text-align: left;\">比赛第一，友谊第二，16年春季联赛邀求每班派一个队伍参加.</p>','2');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('6','7','赛事A赛规','2016-03-26 14:37:29','2016-03-26 14:40:51','<h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">场地面积</h3><p>比赛场地必须是长方形，边线的长度必须长于球门线的长度。</p><p>长度：<span style=\"font-weight: 700;\">90-120</span>米</p><p>宽度：<span style=\"font-weight: 700;\">45-90</span>米</p><p>国际比赛</p><p>长度：<span style=\"font-weight: 700;\">100-11</span><span style=\"font-weight: 700;\">0</span>米</p><p>宽度：<span style=\"font-weight: 700;\">64-75</span>米</p><p>世界杯采用的长度是105米，宽度是68米</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_2\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_2\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"画线\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">画线</h3><p>比赛场地是用线来标明的，这些线作为场内各个区域的边界线，包含在各个区域之内。</p><p>两条较长的边界线叫边线，两条较短的线叫端线。</p><p>所有线的宽度不超过12厘米（5英寸）。</p><p>比赛场地被中线划分为两个半场。</p><p>在场地中线的中点处做一个中心标记，以距中心标记9.15米（10码）为半径画一个圆圈。</p><p>在场地每个角上各竖一根不低于1.5米（5英尺）的平顶旗杆，上系小旗一面。</p><p>在中线的两端、边线以外不少于1米（1码）处，也可以放置旗杆。</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_3\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_3\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"球门区\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">球门区</h3><p>球门区在场地的两端， 规定如下：</p><p>从距球门柱内侧5.50米（6码）处，画两条垂直于球门线的线。这些线伸向比赛场地内5.50米（6码），与一条平行于球门线的线相连接。由这些线和球门线组成的区域范围是球门区。</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_4\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_4\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"罚球区\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">罚球区</h3><p>罚球区在场地的两端，规定如下：</p><p>从距每个球门柱内侧16.5米（18码）处，画两条垂直于球门线的线，这些线伸向比赛场地内16.5(18码）米，与一条平行于球门线的线相连接。由这些线和球门线组成的区域范围是罚球区。</p><p>在每个罚球区内距球门柱之间等距离的中点11米（12码）处设置一个罚球点。在罚球区外，以距每个罚球点9.15米（10码）为半径画一段弧。</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_5\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_5\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"角球区\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">角球区</h3><p>在比赛场地内，以距每个角旗杆1米（1码）为半径画一个四分之一圆，弧内地区叫<span style=\"font-weight: 700;\">角球区</span>。</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_6\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_6\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"球门\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">球门</h3><p>球门必须放置在每条球门线的中央。</p><p>它们由两根距角旗杆等距离的垂直的柱子和连接其顶部的水平的横梁组成。</p><p>两根柱子之间的距离是7.32米（8码），从横梁的下沿至地面的距离是2.44米（8英尺）。</p><p>两根球门柱和横梁具有不超过12厘米(5英寸）的相同的宽度与厚度。球门线与球门柱和横梁的宽度是相同的。球门网可以系在球门及球门后面的地上，并要适当地撑起以不影响守门员。</p><p>球门柱和横梁必须是白色的。</p><p><span style=\"font-weight: 700;\">安全性：</span>球门必须是牢固地固定在地上，如果符合这个要求才可使用移动球门。</p><p><span style=\"font-weight: 700;\">注：</span>球网允许用大麻、黄麻或尼龙制成。尼龙绳可以用，但不得比大麻或黄麻绳细。</p><p><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"1_7\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"sub326547_1_7\"></a><a style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\" name=\"国际足球理事会决议\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">国际足球理事会决议</h3><p><span style=\"font-weight: 700;\">决议一</span></p><p>如果横梁移位或折断，应停止比赛直至修好复位。如果不可能修复，则中止比赛。不允许用绳子替代横梁。如果横梁可以修复，应在停止比赛时球所在的地点以坠球方式重新开始比赛。</p><p><span style=\"font-weight: 700;\">决议二</span></p><p>球门柱及横梁必须用木材、金属或被批准的其他材料制成。其形状可为正方形、长方形、圆形或椭圆形，并不得对队员构成危害。</p><p><span style=\"font-weight: 700;\">决议三</span></p><p>从球队进入比赛场地至上半场结束离场，下半场重新进入比赛场地至比赛结束，任何商业广告，不管是实物的还是图文的，都不允许出现在比赛场地和场地设备上（包括球门网和球门网内的地面）。特别是在球门、球门网、角旗杆或角旗上不得有广告出现，也不得安装任何附属设备（如摄像机、麦克风等）。</p><p><span style=\"font-weight: 700;\">决议四</span></p><p>在比赛场地外的地面技术区域内和距边线1米范围内，不允许有任何形式的广告出现。</p><p>另外，在球门线和球门网之间的区域内也不允许有广告出现。</p><p><span style=\"font-weight: 700;\">决议五</span></p><p>如同决议三所述，在比赛期间，国际足球联合会、洲际联合会、国家协会、联盟、俱乐部或其他团体的代表性标志或图案的复制品，不管是实物的还是图文的，都禁止出现在比赛场地和场地设备上（包括球门网和球门网内的地面）。</p><p><span style=\"font-weight: 700;\">决议六</span></p><p>在比赛场地外，距角球弧9.15米（10码）且垂直于球门线处做一个标记，以保证在踢角球时守方队员能遵守规定的距离。</p>','3');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('2','1','足球联赛','2016-01-28 10:08:10','2016-03-18 21:10:13','<p>一、球员&nbsp;</p><p>1. 一场比赛应由两队参加，每队上场球员不可多于5人，其中必须有一人是守门员。&nbsp;</p><p>2. 在比赛时，替换球员的次数没有限制。一名已经替换出场的球员，可以再进场替换另一名球员。&nbsp;</p><p>3. 当球在比赛中或在死球时都可以替换球员。替换球员的规定如下： 4. 球员离开球场，必须由自己球队的换人区离开。&nbsp;</p><p>5. 球员进入球场，也须由自己球队的换人区进入，但是应等到离场球员完全越过边线时，才可进场。&nbsp;</p><p>6. 换人球员无论是否上场比赛，都应服从裁判的判决及管辖。&nbsp;</p><p>7. 当换人球员进入球场时，即完成替换。此时，换人球员成为比赛球员，被换人球员即失去比赛球员身份。&nbsp;</p><p>8. 队员不得使用或佩戴可能危及自己及其他队员的装备或任何物件，包括各种珠宝饰物。 二、守门员&nbsp;</p><p>1. 守门员可以穿长裤。&nbsp;</p><p>2. 每名守门员的服装颜色必须有别于其他队员和裁判员。如果场上队员替换了守门员，则要在该队员穿的守门员球衣背后标上原来的号码。&nbsp;</p><p>三、罚犯规与不正当行为&nbsp;</p><p>（一）裁判员认为，如果队员草率地、鲁莽地或使用过分的力量在双方进行争抢或对方队员控制球时实施铲抢，被视为严重犯规，判给对方直接任决球，可根据犯规严重情况给予黄牌警告或罚出场。这条规则是和11人制规则最大的区别，说明五人制足球对于不论从各方向进行的铲球只要动作过大、力量过分都进行判罚。原则上不允许铲抢。(当对手没有控制球的时候，铲球不是犯规。如果裁判员认为当对手已经控制了球，而这时队员采取了严重犯规的行为进行抢截，犯规队员则应被罚令出场。)&nbsp;</p><p>下列情况将被判罚犯规与不正当行为： 直接任意球：&nbsp;</p><p>&nbsp; &nbsp; 如裁判员认为，如果队员草率地、鲁莽地或使用过分的力量违反下列六种犯规中的任何一种，将判给对方踢直接任意球： 1. 踢或企图踢对方队员； 2. 绊摔或企图绊摔对方队员； 3. 跳向对方队员； 4. 冲撞对方队员；&nbsp;</p><p>5. 打或企图打对方队员； 6. 推对方队员；</p><p><br/></p>','1');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('3','3','比赛规则','2016-01-28 10:20:09','2016-03-19 13:27:21','<pre id=\"best-content-121667608\" accuse=\"aContent\" class=\"best-text mb-10\" style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: arial, &#39;courier new&#39;, courier, 宋体, monospace, &#39;Microsoft YaHei&#39;; white-space: pre-wrap; word-wrap: break-word; font-size: 14px; color: rgb(51, 51, 51); line-height: 24px; background-color: rgb(243, 255, 236);\">比赛规则：比赛在长约45米、宽约28米的场地上（即萍中新篮球场）进行。两端的防守区长度为11米，中场区长度为23米，场地中央设一开球点，球门宽3米，高2米，比赛使用4号球；比赛双方各出场5名球员，不设守门员，每队每场替补队员人数和人次不限，可轮换休息；全场比赛时间为50分钟，上、下半场各25分钟，中间休息10分钟；比赛无越位限制，角球和任意球可直接射门得分，队员被红牌罚下，5分钟后可继续参加比赛。其他规则与大场足球相同。</pre><p><br/></p>','1');
INSERT INTO t_rules ( `id`, `game_id`, `rule_title`, `rule_date`, `rule_modify`, `rule_content`, `rule_userid` ) VALUES  ('4','','哈三小一年级联赛赛规','2016-02-19 09:34:24','2016-02-19 09:34:24','<p>测试赛规</p>','1');
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
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('1','admin','33d88f7fc05521232f297a57a5a743894a0e4a801fc3ddef','大BOSS','admin@admin.admin','','','1','1957-01-03','哈哈哈','106.2.204.146','2016-03-21 18:45:12','2016-01-21 09:04:43','0','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('2','wzxaini9','33d88f7fc055e43b060da6d25fdf7cba5f9938f1679cddef','来到后台','ad@mi.n','http://localhost','56e921783c6c4.jpg','1','2016-01-11','君甚吊、家翁造？','106.2.204.146','2016-03-28 09:20:33','2000-01-01 00:00:00','0','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('3','test1','33d88f7fc0555a105e8b9d40e1329780d62ea2265d8addef','校长','te@st.1','','','0','','','106.2.204.146','2016-03-26 15:59:10','2000-01-01 00:00:00','1','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('4','test2','33d88f7fc055ad0234829205b9033196ba818f7a872bddef','体育老师','te@st.2','','','0','','','192.168.0.17','2016-02-16 18:31:06','2000-01-01 00:00:00','3','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('5','test3','33d88f7fc0558ad8757baa8564dc136c1e07507f4a98ddef','某班主任','te@st.3','','','0','','','0.0.0.0','2016-01-28 14:40:46','2000-01-01 00:00:00','2','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('7','hsx02','33d88f7fc05516626edba3ae6a38b15d7c20db158c3bddef','哈三小校内管理员','hdfksd@sfjsda.sdfsd','','','0','','','106.2.204.146','2016-03-26 10:51:30','2000-01-01 00:00:00','9','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('8','hsx03','33d88f7fc055e10adc3949ba59abbe56e057f20f883eddef','hsx','123@sd.sdf','','','0','','','0.0.0.0','2016-02-19 12:33:36','2000-01-01 00:00:00','9','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('9','hasanzhong','33d88f7fc055e10adc3949ba59abbe56e057f20f883eddef','哈三中李校长','123@123.com','','','0','','','','2000-01-01 00:00:00','2000-01-01 00:00:00','8','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('10','masteradmin','33d88f7fc05568647587269a42be1cc77c408947572dddef','超级管理员','123@1213.com','','','0','','','123.125.196.125','2016-03-25 10:57:07','2000-01-01 00:00:00','0','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('11','hsx04','33d88f7fc05516626edba3ae6a38b15d7c20db158c3bddef','哈三小体育部','123@123222.com','','','0','','','','2000-01-01 00:00:00','2000-01-01 00:00:00','9','1','0','1');
INSERT INTO t_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `school_id`, `user_status`, `score`, `user_type` ) VALUES  ('12','hsx05','33d88f7fc05516626edba3ae6a38b15d7c20db158c3bddef','哈三小体育部','','','','0','','','','2000-01-01 00:00:00','2000-01-01 00:00:00','9','1','0','1');
