CREATE TABLE "#__assets"
(
  "id" BIGINT IDENTITY(START WITH 34),
  "parent_id" INTEGER DEFAULT 0,
  "lft" INTEGER DEFAULT 0,
  "rgt" INTEGER DEFAULT 0,
  "level" BIGINT DEFAULT 0,
  "name" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT N'',
  "rules" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(1,0,1,414,0,'root.1','Root Asset','{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(2,1,1,2,1,'com_admin','com_admin','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(3,1,3,6,1,'com_banners','com_banners','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(4,1,7,8,1,'com_cache','com_cache','{"core.admin":{"7":1},"core.manage":{"7":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(5,1,9,10,1,'com_checkin','com_checkin','{"core.admin":{"7":1},"core.manage":{"7":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(6,1,11,12,1,'com_config','com_config','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(7,1,13,16,1,'com_contact','com_contact','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(8,1,17,20,1,'com_content','com_content','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":"","core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(9,1,21,22,1,'com_cpanel','com_cpanel','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(10,1,23,24,1,'com_installer','com_installer','{"core.admin":{"7":1},"core.manage":{"7":1},"core.delete":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(11,1,25,26,1,'com_languages','com_languages','{"core.admin":{"7":1},"core.manage":"","core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(12,1,27,28,1,'com_login','com_login','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(13,1,29,30,1,'com_mailto','com_mailto','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(14,1,31,32,1,'com_massmail','com_massmail','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(15,1,33,34,1,'com_media','com_media','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(16,1,35,36,1,'com_menus','com_menus','{"core.admin":{"7":1},"core.manage":"","core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(17,1,37,38,1,'com_messages','com_messages','{"core.admin":{"7":1},"core.manage":{"7":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(18,1,39,40,1,'com_modules','com_modules','{"core.admin":{"7":1},"core.manage":"","core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(19,1,41,44,1,'com_newsfeeds','com_newsfeeds','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(20,1,45,46,1,'com_plugins','com_plugins','{"core.admin":{"7":1},"core.manage":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(21,1,47,48,1,'com_redirect','com_redirect','{"core.admin":{"7":1},"core.manage":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(22,1,49,50,1,'com_search','com_search','{"core.admin":{"7":1},"core.manage":{"6":1}}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(23,1,51,52,1,'com_templates','com_templates','{"core.admin":{"7":1},"core.manage":"","core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(24,1,53,54,1,'com_users','com_users','{"core.admin":{"7":1},"core.manage":"","core.create":"","core.delete":"","core.edit":"","core.edit.own":{"6":1},"core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(25,1,55,58,1,'com_weblinks','com_weblinks','{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":"","core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(26,1,59,60,1,'com_wrapper','com_wrapper','{}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(27,8,18,19,2,'com_content.category.2','Uncategorised','{"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(28,3,4,5,2,'com_banners.category.3','Uncategorised','{"core.create":"","core.delete":"","core.edit":"","core.edit.state":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(29,7,14,15,2,'com_contact.category.4','Uncategorised','{"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(30,19,42,43,2,'com_newsfeeds.category.5','Uncategorised','{"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(31,25,56,57,2,'com_weblinks.category.6','Uncategorised','{"core.create":"","core.delete":"","core.edit":"","core.edit.state":"","core.edit.own":""}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(32,24,54,55,1,'com_users.notes.category.7','Uncategorised','{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}');

INSERT INTO #__assets(id,parent_id,lft,rgt,level,name,title,rules)
VALUES(33,1,63,64,1,'com_finder','com_finder','{"core.admin":{"7":1},"core.manage":{"6":1}}');

CREATE TABLE "#__associations"
(
  "context" NVARCHAR DEFAULT N'',
  "id" NVARCHAR DEFAULT N'',
  "key" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("context", "id")
);

CREATE TABLE "#__template_styles"
(
  "id" BIGINT IDENTITY(START WITH 7),
  "template" NVARCHAR DEFAULT N'',
  "client_id" SMALLINT DEFAULT 0,
  "home" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT N'',
  "params" LONG VARBINARY DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__template_styles(id,template,client_id,home,title,params)
VALUES(2,'bluestork',1,'1','Bluestork - Default','{"useRoundedCorners":"1","showSiteName":"0"}');

INSERT INTO #__template_styles(id,template,client_id,home,title,params)
VALUES(3,'atomic',0,'0','Atomic - Default','{}');

INSERT INTO #__template_styles(id,template,client_id,home,title,params)
VALUES(4,'beez_20',0,'1','Beez2 - Default','{"wrapperSmall":"53","wrapperLarge":"72","logo":"images/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}');

INSERT INTO #__template_styles(id,template,client_id,home,title,params)
VALUES(5,'hathor',1,'0','Hathor - Default','{"showSiteName":"0","colourChoice":"","boldText":"0"}');

INSERT INTO #__template_styles(id,template,client_id,home,title,params)
VALUES(6,'beez5',0,'0','Beez5 - Default','{"wrapperSmall":"53","wrapperLarge":"72","logo":"images/sampledata/fruitshop/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}');


CREATE TABLE "#__session"
(
  "session_id" NVARCHAR DEFAULT N'',
  "client_id" SMALLINT DEFAULT 0,
  "guest" SMALLINT DEFAULT 1,
  "time" NVARCHAR DEFAULT N'',
  "data" LONG VARBINARY DEFAULT NULL,
  "userid" INTEGER DEFAULT 0,
  "username" NVARCHAR DEFAULT N'',
  "usertype" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("session_id")
);

CREATE TABLE "#__schemas"
(
  "extension_id" INTEGER DEFAULT 0,
  "version_id" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("extension_id", "version_id")
);

CREATE TABLE "#__overrider"
(
  "id" INTEGER IDENTITY(START WITH 1),
  "constant" NVARCHAR DEFAULT N'',
  "string" NVARCHAR DEFAULT N'',
  "file" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__redirect_links"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "old_url" NVARCHAR DEFAULT N'',
  "new_url" NVARCHAR DEFAULT N'',
  "referer" NVARCHAR DEFAULT N'',
  "comment" NVARCHAR DEFAULT N'',
  "published" SMALLINT DEFAULT 0,
  "created_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__newsfeeds"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "catid" INTEGER DEFAULT 0,
  "name" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "link" NVARCHAR DEFAULT N'',
  "filename" NVARCHAR DEFAULT NULL,
  "published" SMALLINT DEFAULT 0,
  "numarticles" BIGINT DEFAULT 1,
  "cache_time" BIGINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "ordering" INTEGER DEFAULT 0,
  "rtl" SMALLINT DEFAULT 0,
  "access" INTEGER DEFAULT 0,
  "language" NVARCHAR DEFAULT N'',
  "params" LONG VARBINARY NOT NULL,
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_by" BIGINT DEFAULT 0,
  "created_by_alias" NVARCHAR DEFAULT N'',
  "modified" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_by" BIGINT DEFAULT 0,
  "metakey" LONG NVARCHAR NOT NULL,
  "metadesc" LONG NVARCHAR NOT NULL,
  "metadata" LONG NVARCHAR NOT NULL,
  "xreference" NVARCHAR DEFAULT N'',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__modules_menu"
(
  "moduleid" INTEGER DEFAULT 0,
  "menuid" INTEGER DEFAULT 0,
  PRIMARY KEY ("moduleid", "menuid")
);

INSERT INTO #__modules_menu(moduleid,menuid) VALUES(1,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(2,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(3,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(4,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(6,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(7,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(8,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(9,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(10,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(12,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(13,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(14,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(15,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(16,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(17,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(79,0);
INSERT INTO #__modules_menu(moduleid,menuid) VALUES(85,0);

CREATE TABLE "#__modules"
(
  "id" INTEGER IDENTITY(START WITH 100),
  "title" NVARCHAR DEFAULT N'',
  "note" NVARCHAR DEFAULT N'',
  "content" NVARCHAR DEFAULT N'',
  "ordering" INTEGER DEFAULT 0,
  "position" NVARCHAR DEFAULT N'',
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "published" SMALLINT DEFAULT 0,
  "module" NVARCHAR DEFAULT NULL,
  "access" INTEGER DEFAULT 0,
  "showtitle" SMALLINT DEFAULT 1,
  "params" LONG VARBINARY NOT NULL,
  "client_id" SMALLINT DEFAULT 0,
  "language" NCHAR(7) NOT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(1,'Main Menu','','',1,'position-7',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_menu',1,1,'{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}',0,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(2,'Login','','',1,'login',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_login',1,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(3,'Popular Articles','','',3,'cpanel',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_popular',3,1,'{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(4,'Recently Added Articles','','',4,'cpanel',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_latest',3,1,'{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(8,'Toolbar','','',1,'toolbar',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_toolbar',3,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(9,'Quick Icons','','',1,'icon',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_quickicon',3,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(10,'Logged-in Users','','',2,'cpanel',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_logged',3,1,'{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(12,'Admin Menu','','',1,'menu',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_menu',3,1,'{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(13,'Admin Submenu','','',1,'submenu',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_submenu',3,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(14,'User Status','','',2,'status',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_status',3,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(15,'Title','','',1,'title',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_title',3,1,'',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(16,'Login Form','','',7,'position-7',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_login',1,1,'{"greeting":"1","name":"0"}',0,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(17,'Breadcrumbs','','',1,'position-2',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),1,'mod_breadcrumbs',1,1,'{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}',0,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(79,'Multilanguage status','','',1,'status',0,stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),stringdate('0001-01-01 00:00:00'),0,'mod_multilangstatus',3,1,'{"layout":"_:default","moduleclass_sfx":"","cache":"0"}',1,'*');

INSERT INTO #__modules(id,title,note,content,ordering,position,checked_out,checked_out_time,publish_up,publish_down,published,"module","access",showtitle,params,client_id,"language")
VALUES(86, N'Joomla Version', N'', N'', 1, N'footer', 0, stringdate('0001-01-01 00:00:00'), stringdate('0001-01-01 00:00:00'), stringdate('0001-01-01 00:00:00'), 1, N'mod_version', 3, 1, N'{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, N'*');

CREATE TABLE "#__messages"
(
  "message_id" BIGINT IDENTITY(START WITH 1),
  "user_id_from" BIGINT DEFAULT 0,
  "user_id_to" BIGINT DEFAULT 0,
  "folder_id" SMALLINT DEFAULT 0,
  "date_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "state" SMALLINT DEFAULT 0,
  "priority" SMALLINT DEFAULT 0,
  "subject" NVARCHAR DEFAULT N'',
  "message" LONG NVARCHAR NOT NULL,
  PRIMARY KEY ("message_id")
);

CREATE TABLE "#__messages_cfg"
(
  "user_id" BIGINT DEFAULT 0,
  "cfg_name" NVARCHAR DEFAULT N'',
  "cfg_value" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("user_id", "cfg_name")
);

CREATE TABLE "#__menu_types"
(
  "id" BIGINT IDENTITY(START WITH 2),
  "menutype" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__menu_types (id, menutype, title, description)
VALUES(1, N'mainmenu', N'Main Menu', N'The main menu for the site');

CREATE TABLE "#__menu"
(
  "id" INTEGER IDENTITY(START WITH 102),
  "menutype" NVARCHAR NOT NULL,
  "title" NVARCHAR NOT NULL,
  "alias" NVARCHAR NOT NULL,
  "note" NVARCHAR DEFAULT N'',
  "path" NVARCHAR DEFAULT N'',
  "link" NVARCHAR NOT NULL,
  "type" NVARCHAR NOT NULL,
  "published" SMALLINT DEFAULT 0,
  "parent_id" BIGINT DEFAULT 1,
  "level" BIGINT DEFAULT 0,
  "component_id" BIGINT DEFAULT 0,
  "ordering" INTEGER DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "browserNav" SMALLINT DEFAULT 0,
  "access" INTEGER DEFAULT 0,
  "img" NVARCHAR DEFAULT N'',
  "template_style_id" BIGINT DEFAULT 0,
  "params" LONG VARBINARY DEFAULT N'',
  "lft" INTEGER DEFAULT 0,
  "rgt" INTEGER DEFAULT 0,
  "home" SMALLINT DEFAULT 0,
  "language" NCHAR(7) DEFAULT N'',
  "client_id" SMALLINT DEFAULT 0,
  PRIMARY KEY ("id")
);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(1, N'', N'Menu_Item_Root', N'root', N'', N'', N'', N'', 1, 0, 0, 0, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'', 0, N'', 0, 43, 0, N'*', 0);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(2, N'menu', N'com_banners', N'Banners', N'', N'Banners', N'index.php?option=com_banners', N'component', 0, 1, 1, 4, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:banners', 0, N'', 1, 10, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(3, N'menu', N'com_banners', N'Banners', N'', N'Banners/Banners', N'index.php?option=com_banners', N'component', 0, 2, 2, 4, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:banners', 0, N'', 2, 3, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(4, N'menu', N'com_banners_categories', N'Categories', N'', N'Banners/Categories', N'index.php?option=com_categories&extension=com_banners', N'component', 0, 2, 2, 6, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:banners-cat', 0, N'', 4, 5, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(5, N'menu', N'com_banners_clients', N'Clients', N'', N'Banners/Clients', N'index.php?option=com_banners&view=clients', N'component', 0, 2, 2, 4, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:banners-clients', 0, N'', 6, 7, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(6, N'menu', N'com_banners_tracks', N'Tracks', N'', N'Banners/Tracks', N'index.php?option=com_banners&view=tracks', N'component', 0, 2, 2, 4, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:banners-tracks', 0, N'', 8, 9, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(7, N'menu', N'com_contact', N'Contacts', N'', N'Contacts', N'index.php?option=com_contact', N'component', 0, 1, 1, 8, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:contact', 0, N'', 11, 16, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(8, N'menu', N'com_contact', N'Contacts', N'', N'Contacts/Contacts', N'index.php?option=com_contact', N'component', 0, 7, 2, 8, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:contact', 0, N'', 12, 13, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(9, N'menu', N'com_contact_categories', N'Categories', N'', N'Contacts/Categories', N'index.php?option=com_categories&extension=com_contact', N'component', 0, 7, 2, 6, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:contact-cat', 0, N'', 14, 15, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(10, N'menu', N'com_messages', N'Messaging', N'', N'Messaging', N'index.php?option=com_messages', N'component', 0, 1, 1, 15, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:messages', 0, N'', 17, 22, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(11, N'menu', N'com_messages_add', N'New Private Message', N'', N'Messaging/New Private Message', N'index.php?option=com_messages&task=message.add', N'component', 0, 10, 2, 15, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:messages-add', 0, N'', 18, 19, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(12, N'menu', N'com_messages_read', N'Read Private Message', N'', N'Messaging/Read Private Message', N'index.php?option=com_messages', N'component', 0, 10, 2, 15, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:messages-read', 0, N'', 20, 21, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(13, N'menu', N'com_newsfeeds', N'News Feeds', N'', N'News Feeds', N'index.php?option=com_newsfeeds', N'component', 0, 1, 1, 17, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:newsfeeds', 0, N'', 23, 28, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(14, N'menu', N'com_newsfeeds_feeds', N'Feeds', N'', N'News Feeds/Feeds', N'index.php?option=com_newsfeeds', N'component', 0, 13, 2, 17, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:newsfeeds', 0, N'', 24, 25, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(15, N'menu', N'com_newsfeeds_categories', N'Categories', N'', N'News Feeds/Categories', N'index.php?option=com_categories&extension=com_newsfeeds', N'component', 0, 13, 2, 6, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:newsfeeds-cat', 0, N'', 26, 27, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(16, N'menu', N'com_redirect', N'Redirect', N'', N'Redirect', N'index.php?option=com_redirect', N'component', 0, 1, 1, 24, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:redirect', 0, N'', 41, 42, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(17, N'menu', N'com_search', N'Basic Search', N'', N'Basic Search', N'index.php?option=com_search', N'component', 0, 1, 1, 19, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:search', 0, N'', 33, 34, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(18, N'menu', N'com_weblinks', N'Weblinks', N'', N'Weblinks', N'index.php?option=com_weblinks', N'component', 0, 1, 1, 21, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:weblinks', 0, N'', 35, 40, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(19, N'menu', N'com_weblinks_links', N'Links', N'', N'Weblinks/Links', N'index.php?option=com_weblinks', N'component', 0, 18, 2, 21, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:weblinks', 0, N'', 36, 37, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(20, N'menu', N'com_weblinks_categories', N'Categories', N'', N'Weblinks/Categories', N'index.php?option=com_categories&extension=com_weblinks', N'component', 0, 18, 2, 6, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:weblinks-cat', 0, N'', 38, 39, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(21, N'menu', N'com_finder', N'Smart Search', N'', N'Smart Search', N'index.php?option=com_finder', N'component', 0, 1, 1, 27, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 0, N'class:finder', 0, N'', 31, 32, 0, N'*', 1);

INSERT INTO #__menu ("id", "menutype", "title", "alias", "note", "path", "link", "type", "published", "parent_id", "level", "component_id", "ordering", "checked_out", "checked_out_time", "browserNav", "access", "img", "template_style_id", "params", "lft", "rgt", "home", "language", "client_id")
VALUES(101, N'mainmenu', N'Home', N'home', N'', N'home', N'index.php?option=com_content&view=featured', N'component', 1, 1, 1, 22, 0, 0, stringdate('0001-01-01 00:00:00'), 0, 1, N'', 0, N'{"featured_categories":[""],"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 1, N'*', 0);

CREATE TABLE "#__languages"
(
  "lang_id" BIGINT IDENTITY(START WITH 2),
  "lang_code" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT N'',
  "title_native" NVARCHAR DEFAULT N'',
  "sef" NVARCHAR DEFAULT N'',
  "image" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  "metakey" NVARCHAR DEFAULT N'',
  "metadesc" NVARCHAR DEFAULT N'',
  "published" INTEGER DEFAULT 0,
  "ordering" INTEGER DEFAULT 0,
  "sitename" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("lang_id")
);

INSERT INTO #__languages(lang_id,lang_code,title,title_native,sef,image,description,metakey,metadesc,published,ordering,sitename)
VALUES(1,'en-GB','English (UK)','English (UK)','en','en','','','',1,1,'');

CREATE TABLE "#__extensions"
(
  "extension_id" INTEGER IDENTITY(START WITH 1000),
  "name" NVARCHAR NOT NULL,
  "type" NVARCHAR NOT NULL,
  "element" NVARCHAR NOT NULL,
  "folder" NVARCHAR NOT NULL,
  "client_id" SMALLINT DEFAULT 0,
  "enabled" SMALLINT DEFAULT 1,
  "access" INTEGER DEFAULT 1,
  "protected" SMALLINT DEFAULT 0,
  "manifest_cache" LONG VARBINARY NOT NULL,
  "params" LONG VARBINARY NOT NULL,
  "custom_data" LONG VARBINARY DEFAULT '',
  "system_data" LONG VARBINARY DEFAULT '',
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "ordering" INTEGER DEFAULT 0,
  "state" INTEGER DEFAULT 0,
  PRIMARY KEY ("extension_id")
);

-- TODO: Update from mysql version
INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(1,'com_mailto','component','com_mailto','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(2,'com_wrapper','component','com_wrapper','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(3,'com_admin','component','com_admin','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(4,'com_banners','component','com_banners','',1,1,1,0,'','{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(5,'com_cache','component','com_cache','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(6,'com_categories','component','com_categories','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(7,'com_checkin','component','com_checkin','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(8,'com_contact','component','com_contact','',1,1,1,0,'','{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(10,'com_installer','component','com_installer','',1,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(11,'com_languages','component','com_languages','',1,1,1,1,'','{"administrator":"en-GB","site":"en-GB"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(12,'com_login','component','com_login','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(13,'com_media','component','com_media','',1,1,0,1,'','{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip","upload_mime_illegal":"text/html","enable_flash":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(14,'com_menus','component','com_menus','',1,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(15,'com_messages','component','com_messages','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(16,'com_modules','component','com_modules','',1,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'','{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(18,'com_plugins','component','com_plugins','',1,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(19,'com_search','component','com_search','',1,1,1,1,'','{"enabled":"0","show_date":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(20,'com_templates','component','com_templates','',1,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(21,'com_weblinks','component','com_weblinks','',1,1,1,0,'','{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(22,'com_content','component','com_content','',1,1,0,1,'{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}','{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(23,'com_config','component','com_config','',1,1,0,1,'{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}','{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(24,'com_redirect','component','com_redirect','',1,1,0,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(25,'com_users','component','com_users','',1,1,0,1,'','{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(27,'com_finder','component','com_finder','',1,1,0,0,'','{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"porter_en"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(100,'PHPMailer','library','phpmailer','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(101,'SimplePie','library','simplepie','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(102,'phputf8','library','phputf8','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(103,'Joomla! Web Application Framework','library','joomla','',0,1,1,0,'a:11:{s:6:"legacy";b:0;s:4:"name";s:33:"Joomla! Web Application Framework";s:4:"type";s:7:"library";s:12:"creationDate";s:4:"2008";s:6:"author";s:6:"Joomla";s:9:"copyright";s:67:"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.";s:11:"authorEmail";s:16:"admin@joomla.org";s:9:"authorUrl";s:21:"http://www.joomla.org";s:7:"version";s:5:"1.6.0";s:11:"description";s:90:"The Joomla! Web Application Framework is the Core of the Joomla! Content Management System";s:5:"group";s:0:"";}','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(203,'mod_banners','module','mod_banners','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(205,'mod_custom','module','mod_custom','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(206,'mod_feed','module','mod_feed','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(207,'mod_footer','module','mod_footer','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(208,'mod_login','module','mod_login','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(209,'mod_menu','module','mod_menu','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(211,'mod_random_image','module','mod_random_image','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(212,'mod_related_items','module','mod_related_items','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(213,'mod_search','module','mod_search','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(214,'mod_stats','module','mod_stats','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(216,'mod_users_latest','module','mod_users_latest','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(217,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(220,'mod_articles_category','module','mod_articles_category','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(222,'mod_languages','module','mod_languages','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(223,'mod_finder','module','mod_finder','',0,1,0,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(300,'mod_custom','module','mod_custom','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(301,'mod_feed','module','mod_feed','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(302,'mod_latest','module','mod_latest','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(303,'mod_logged','module','mod_logged','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(304,'mod_login','module','mod_login','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(305,'mod_menu','module','mod_menu','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(306,'mod_online','module','mod_online','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(307,'mod_popular','module','mod_popular','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(309,'mod_status','module','mod_status','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(310,'mod_submenu','module','mod_submenu','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(311,'mod_title','module','mod_title','',1,1,1,0,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.1","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}','{"cache":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'','{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'','{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}','','',0,stringdate('0001-01-01 00:00:00'),3,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(403,'plg_authentication_openid','plugin','openid','authentication',0,0,1,0,'','{"usermode":"2","phishing-resistant":"0","multi-factor":"0","multi-factor-physical":"0"}','','',0,stringdate('0001-01-01 00:00:00'),4,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'','{"mode":"1"}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(405,'plg_content_geshi','plugin','geshi','content',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}','{"style":"xhtml"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,1,'','{"title":"1","multipage_toc":"1","showall":"1"}','','',0,stringdate('0001-01-01 00:00:00'),4,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,1,'','{"position":"1"}','','',0,stringdate('0001-01-01 00:00:00'),5,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(409,'plg_content_vote','plugin','vote','content',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),6,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'','{"linenumbers":"0","tabmode":"indent"}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,1,'','{"mode":"1","skin":"0","compressed":"0","cleanup_startup":"0","cleanup_save":"2","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","safari":"0","custom_plugin":"","custom_button":""}','','',0,stringdate('0001-01-01 00:00:00'),3,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),3,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),4,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(417,'plg_search_categories','plugin','categories','search',0,1,1,0,'','{"search_limit":"50","search_content":"1","search_archived":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'','{"search_limit":"50","search_content":"1","search_archived":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(419,'plg_search_content','plugin','content','search',0,1,1,0,'','{"search_limit":"50","search_content":"1","search_archived":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'','{"search_limit":"50","search_content":"1","search_archived":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(421,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'','{"search_limit":"50","search_content":"1","search_archived":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(423,'plg_system_p3p','plugin','p3p','system',0,1,1,1,'','{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'','{"browsercache":"0","cachetime":"15"}','','',0,stringdate('0001-01-01 00:00:00'),3,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(425,'plg_system_debug','plugin','debug','system',0,1,1,0,'','{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}','','',0,stringdate('0001-01-01 00:00:00'),4,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(426,'plg_system_log','plugin','log','system',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),5,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(427,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),6,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),7,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(429,'plg_system_sef','plugin','sef','system',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),8,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),9,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,1,'','{"autowebpage":"","category":"26","autopublish":"0"}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'','{"autoregister":"1"}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(433,'plg_user_profile','plugin','profile','user',0,0,1,1,'','{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),10,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,1,1,0,'{}','{"public_key":"","private_key":"","theme":"clean"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),7,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),2,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(444,'plg_finder_content','plugin','content','finder',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),3,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),4,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(446,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'','{}','','',0,stringdate('0001-01-01 00:00:00'),5,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(447,'System - Windows Azure','plugin','plg_azure','system',0,0,1,0,'','{"protocol":"=http\12"}','','',0,stringdate('0001-01-01 00:00:00'),1,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(500,'atomic','template','atomic','',0,1,1,0,'a:11:{s:6:"legacy";b:0;s:4:"name";s:6:"atomic";s:4:"type";s:8:"template";s:12:"creationDate";s:8:"10/10/09";s:6:"author";s:12:"Joomla! Project";s:9:"copyright";s:72:"Copyright (C) 2005 - 2010 Open Source Matters, Inc. All rights reserved.";s:11:"authorEmail";s:25:"contact@kontentdesign.com";s:9:"authorUrl";s:28:"http://www.kontentdesign.com";s:7:"version";s:5:"1.6.0";s:11:"description";s:26:"TPL_ATOMIC_XML_DESCRIPTION";s:5:"group";s:0:"";}','{}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(502,'bluestork','template','bluestork','',1,1,1,0,'{"legacy":false,"name":"bluestork","type":"template","creationDate":"07/02/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http://www.joomla.org","version":"1.6.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}','{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(503,'beez_20','template','beez_20','',0,1,1,0,'a:11:{s:6:"legacy";b:0;s:4:"name";s:7:"beez_20";s:4:"type";s:8:"template";s:12:"creationDate";s:16:"25 November 2009";s:6:"author";s:12:"Angie Radtke";s:9:"copyright";s:72:"Copyright (C) 2005 - 2010 Open Source Matters, Inc. All rights reserved.";s:11:"authorEmail";s:23:"a.radtke@derauftritt.de";s:9:"authorUrl";s:26:"http://www.der-auftritt.de";s:7:"version";s:5:"1.6.0";s:11:"description";s:25:"TPL_BEEZ2_XML_DESCRIPTION";s:5:"group";s:0:"";}','{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(504,'hathor','template','hathor','',1,1,1,0,'a:11:{s:6:"legacy";b:0;s:4:"name";s:6:"hathor";s:4:"type";s:8:"template";s:12:"creationDate";s:8:"May 2010";s:6:"author";s:11:"Andrea Tarr";s:9:"copyright";s:72:"Copyright (C) 2005 - 2010 Open Source Matters, Inc. All rights reserved.";s:11:"authorEmail";s:25:"hathor@tarrconsulting.com";s:9:"authorUrl";s:29:"http://www.tarrconsulting.com";s:7:"version";s:5:"1.6.0";s:11:"description";s:26:"TPL_HATHOR_XML_DESCRIPTION";s:5:"group";s:0:"";}','{"showSiteName":"0","colourChoice":"0","boldText":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(505,'beez5','template','beez5','',0,1,1,0,'a:11:{s:6:"legacy";b:0;s:4:"name";s:5:"beez5";s:4:"type";s:8:"template";s:12:"creationDate";s:11:"21 May 2010";s:6:"author";s:12:"Angie Radtke";s:9:"copyright";s:72:"Copyright (C) 2005 - 2010 Open Source Matters, Inc. All rights reserved.";s:11:"authorEmail";s:23:"a.radtke@derauftritt.de";s:9:"authorUrl";s:26:"http://www.der-auftritt.de";s:7:"version";s:5:"1.6.0";s:11:"description";s:25:"TPL_BEEZ5_XML_DESCRIPTION";s:5:"group";s:0:"";}','{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(600,'English (United Kingdom)','language','en-GB','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(601,'English (United Kingdom)','language','en-GB','',1,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(700,'Joomla! CMS','file','joomla','',0,1,1,1,'{"legacy":false,"name":"files_joomla","type":"file","creationDate":"December 2011","author":"Joomla!","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.2","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}','','','',0,stringdate('0001-01-01 00:00:00'),0,0);

INSERT INTO #__extensions(extension_id,name,type,element,folder,client_id,enabled,"access",protected,manifest_cache,params,custom_data,system_data,checked_out,checked_out_time,ordering,state)
VALUES(800,'joomla','package','pkg_joomla','',0,1,1,1,'','','','',0,stringdate('0001-01-01 00:00:00'),0,0);
-- Table #__extensions 125 rows output.

CREATE TABLE "#__finder_types"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "title" NVARCHAR NOT NULL,
  "mime" NVARCHAR NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "#__finder_tokens_aggregate"
(
  "term_id" BIGINT DEFAULT 0,
  "map_suffix" CHAR NOT NULL,
  "term" NVARCHAR NOT NULL,
  "stem" NVARCHAR NOT NULL,
  "common" SMALLINT DEFAULT 0,
  "phrase" SMALLINT DEFAULT 0,
  "term_weight" REAL NOT NULL,
  "context" SMALLINT DEFAULT 2,
  "context_weight" REAL NOT NULL,
  "total_weight" REAL NOT NULL
);

CREATE TABLE "#__finder_tokens"
(
  "term" NVARCHAR NOT NULL,
  "stem" NVARCHAR NOT NULL,
  "common" SMALLINT DEFAULT 0,
  "phrase" SMALLINT DEFAULT 0,
  "weight" REAL DEFAULT 1,
  "context" SMALLINT DEFAULT 2
);

CREATE TABLE "#__finder_terms_common"
(
  "term" NVARCHAR DEFAULT N'',
  "language" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("term")
);

INSERT INTO #__finder_terms_common(term,"language") VALUES('a','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('about','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ad','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('after','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ago','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ai','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('all','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('am','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('are','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('are\47t','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('as','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('at','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ay','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('be','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('but','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('by','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ew','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('for','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('from','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('get','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('go','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('how','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('i','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('if','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('is','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('is\47t','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('it','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ito','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('its','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('me','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('more','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('most','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('must','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('my','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('o','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oc','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oce','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oe','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('of','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('off','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ofte','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('old','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oli','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oly','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('or','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ot','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('oth','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('other','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('othig','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('our','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('ours','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('out','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('over','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('page','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('she','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('should','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('small','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('so','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('some','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('tha','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('thak','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('that','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('the','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('their','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('theirs','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('them','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('there','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('these','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('they','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('this','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('those','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('thus','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('time','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('times','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('to','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('too','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('true','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('uder','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('up','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('upo','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('use','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('user','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('users','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('util','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('veri','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('versio','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('very','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('via','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('was','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('wat','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('way','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('were','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('what','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('whe','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('where','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('whi','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('which','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('who','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('whom','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('whose','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('why','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('wide','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('will','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('with','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('withi','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('without','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('would','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('yes','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('yet','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('you','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('your','e');
INSERT INTO #__finder_terms_common(term,"language") VALUES('yours','e');

CREATE TABLE "#__finder_terms"
(
  "term_id" BIGINT IDENTITY(START WITH 1),
  "term" NVARCHAR DEFAULT N'',
  "stem" NVARCHAR DEFAULT N'',
  "common" SMALLINT DEFAULT 0,
  "phrase" SMALLINT DEFAULT 0,
  "weight" REAL,
  "soundex" NVARCHAR DEFAULT N'',
  "links" INTEGER DEFAULT 0,
  PRIMARY KEY ("term_id")
);

CREATE TABLE "#__finder_taxonomy_map"
(
  "link_id" BIGINT DEFAULT 0,
  "node_id" BIGINT DEFAULT 0,
  PRIMARY KEY ("link_id", "node_id")
);

CREATE TABLE "#__finder_taxonomy"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "parent_id" BIGINT DEFAULT 0,
  "title" NVARCHAR NOT NULL,
  "state" SMALLINT DEFAULT 1,
  "access" SMALLINT DEFAULT 0,
  "ordering" SMALLINT DEFAULT 0,
  PRIMARY KEY ("id")
);

CREATE TABLE "#__finder_links_termsf"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_termse"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_termsd"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_termsc"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_termsb"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_termsa"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms9"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms8"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms7"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms6"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms5"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms4"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms3"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms2"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms1"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links_terms0"
(
  "link_id" BIGINT DEFAULT 0,
  "term_id" BIGINT DEFAULT 0,
  "weight" REAL,
  PRIMARY KEY ("link_id", "term_id")
);

CREATE TABLE "#__finder_links"
(
  "link_id" BIGINT IDENTITY(START WITH 1),
  "url" NVARCHAR DEFAULT N'',
  "route" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT NULL,
  "description" NVARCHAR DEFAULT NULL,
  "indexdate" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "md5sum" NVARCHAR DEFAULT NULL,
  "published" SMALLINT DEFAULT 1,
  "state" INTEGER DEFAULT 1,
  "access" INTEGER DEFAULT 0,
  "language" NVARCHAR DEFAULT N'',
  "publish_start_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_end_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "start_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "end_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "list_price" DOUBLE PRECISION,
  "sale_price" DOUBLE PRECISION,
  "type_id" INTEGER DEFAULT 0,
  "object" VARBINARY,
  PRIMARY KEY ("link_id")
);

CREATE TABLE "#__finder_filters"
(
  "filter_id" BIGINT IDENTITY(START WITH 1),
  "title" NVARCHAR NOT NULL,
  "alias" NVARCHAR NOT NULL,
  "state" SMALLINT DEFAULT 1,
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_by" BIGINT DEFAULT 0,
  "created_by_alias" NVARCHAR DEFAULT N'',
  "modified" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_by" BIGINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "map_count" BIGINT DEFAULT 0,
  "data" NVARCHAR DEFAULT N'',
  "params" LONG VARBINARY DEFAULT N'',
  PRIMARY KEY ("filter_id")
);

CREATE TABLE "#__core_log_searches"
(
  "search_term" NVARCHAR DEFAULT N'',
  "hits" BIGINT
);

CREATE TABLE "#__content_rating"
(
  "content_id" INTEGER DEFAULT 0,
  "rating_sum" BIGINT DEFAULT 0,
  "rating_count" BIGINT DEFAULT 0,
  "lastip" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("content_id")
);

CREATE TABLE "#__content_frontpage"
(
  "content_id" INTEGER DEFAULT 0,
  "ordering" INTEGER DEFAULT 0,
  PRIMARY KEY ("content_id")
);

CREATE TABLE "#__content"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "asset_id" BIGINT DEFAULT 0,
  "title" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "title_alias" NVARCHAR DEFAULT N'',
  "introtext" LONG NVARCHAR NOT NULL,
  "fulltext" LONG NVARCHAR NOT NULL,
  "state" SMALLINT DEFAULT 0,
  "sectionid" BIGINT DEFAULT 0,
  "mask" BIGINT DEFAULT 0,
  "catid" BIGINT DEFAULT 0,
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_by" BIGINT DEFAULT 0,
  "created_by_alias" NVARCHAR DEFAULT N'',
  "modified" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_by" BIGINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "images" LONG NVARCHAR NOT NULL,
  "urls" LONG NVARCHAR NOT NULL,
  "attribs" LONG NVARCHAR NOT NULL,
  "version" INTEGER DEFAULT 1,
  "parentid" BIGINT DEFAULT 0,
  "ordering" INTEGER DEFAULT 0,
  "metakey" LONG NVARCHAR NOT NULL,
  "metadesc" LONG NVARCHAR NOT NULL,
  "access" BIGINT DEFAULT 0,
  "hits" BIGINT DEFAULT 0,
  "metadata" LONG NVARCHAR NOT NULL,
  "featured" SMALLINT DEFAULT 0,
  "language" NCHAR(7) NOT NULL,
  "xreference" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__contact_details"
(
  "id" INTEGER IDENTITY(START WITH 1),
  "name" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "con_position" NVARCHAR DEFAULT NULL,
  "address" NVARCHAR DEFAULT NULL,
  "suburb" NVARCHAR DEFAULT NULL,
  "state" NVARCHAR DEFAULT NULL,
  "country" NVARCHAR DEFAULT NULL,
  "postcode" NVARCHAR DEFAULT NULL,
  "telephone" NVARCHAR DEFAULT NULL,
  "fax" NVARCHAR DEFAULT NULL,
  "misc" NVARCHAR DEFAULT NULL,
  "image" NVARCHAR DEFAULT NULL,
  "imagepos" NVARCHAR DEFAULT NULL,
  "email_to" NVARCHAR DEFAULT NULL,
  "default_con" SMALLINT DEFAULT 0,
  "published" SMALLINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "ordering" INTEGER DEFAULT 0,
  "params" LONG VARBINARY DEFAULT N'',
  "user_id" INTEGER DEFAULT 0,
  "catid" INTEGER DEFAULT 0,
  "access" INTEGER DEFAULT 0,
  "mobile" NVARCHAR DEFAULT N'',
  "webpage" NVARCHAR DEFAULT N'',
  "sortname1" NVARCHAR DEFAULT N'',
  "sortname2" NVARCHAR DEFAULT N'',
  "sortname3" NVARCHAR DEFAULT N'',
  "language" NVARCHAR DEFAULT N'',
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_by" BIGINT DEFAULT 0,
  "created_by_alias" NVARCHAR DEFAULT N'',
  "modified" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_by" BIGINT DEFAULT 0,
  "metakey" NVARCHAR DEFAULT N'',
  "metadesc" NVARCHAR DEFAULT N'',
  "metadata" NVARCHAR DEFAULT N'',
  "featured" SMALLINT DEFAULT 0,
  "xreference" NVARCHAR DEFAULT N'',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__categories"
(
  "id" INTEGER IDENTITY(START WITH 7),
  "asset_id" BIGINT DEFAULT 0,
  "parent_id" BIGINT DEFAULT 0,
  "lft" INTEGER DEFAULT 0,
  "rgt" INTEGER DEFAULT 0,
  "level" BIGINT DEFAULT 0,
  "path" NVARCHAR DEFAULT N'',
  "extension" NVARCHAR DEFAULT N'',
  "title" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "note" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  "published" SMALLINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "access" INTEGER DEFAULT 0,
  "params" VARBINARY DEFAULT N'',
  "metadesc" NVARCHAR DEFAULT N'',
  "metakey" NVARCHAR DEFAULT N'',
  "metadata" NVARCHAR DEFAULT N'',
  "created_user_id" BIGINT DEFAULT 0,
  "created_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_user_id" BIGINT DEFAULT 0,
  "modified_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "hits" BIGINT DEFAULT 0,
  "language" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(1,0,0,0,11,0,'','system','ROOT','root','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{}','','','',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{"target":"","image":""}','','','{"page_title":"","author":"","robots":""}',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{"target":"","image":"","foobar":""}','','','{"page_title":"","author":"","robots":""}',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{"target":"","image":""}','','','{"page_title":"","author":"","robots":""}',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{"target":"","image":""}','','','{"page_title":"","author":"","robots":""}',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

INSERT INTO #__categories(id,asset_id,parent_id,lft,rgt,level,path,extension,title,alias,note,description,published,checked_out,checked_out_time,"access",params,metadesc,metakey,metadata,created_user_id,created_time,modified_user_id,modified_time,hits,"language") 
VALUES(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,stringdate('0001-01-01 00:00:00'),1,'{"target":"","image":""}','','','{"page_title":"","author":"","robots":""}',0,stringdate('0001-01-01 00:00:00'),0,stringdate('0001-01-01 00:00:00'),0,'*');

CREATE TABLE "#__banners"
(
  "id" INTEGER IDENTITY(START WITH 1),
  "cid" INTEGER DEFAULT 0,
  "type" INTEGER DEFAULT 0,
  "name" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "imptotal" INTEGER DEFAULT 0,
  "impmade" INTEGER DEFAULT 0,
  "clicks" INTEGER DEFAULT 0,
  "clickurl" NVARCHAR DEFAULT N'',
  "state" SMALLINT DEFAULT 0,
  "catid" BIGINT DEFAULT 0,
  "description" NVARCHAR DEFAULT N'',
  "custombannercode" NVARCHAR DEFAULT N'',
  "sticky" SMALLINT DEFAULT 0,
  "ordering" INTEGER DEFAULT 0,
  "metakey" NVARCHAR DEFAULT N'',
  "params" LONG VARBINARY DEFAULT N'',
  "own_prefix" SMALLINT DEFAULT 0,
  "metakey_prefix" NVARCHAR DEFAULT N'',
  "purchase_type" SMALLINT DEFAULT 0,
  "track_clicks" SMALLINT DEFAULT 0,
  "track_impressions" SMALLINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "reset" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "language" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__banner_tracks"
(
  "track_date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "track_type" BIGINT DEFAULT 0,
  "banner_id" BIGINT DEFAULT 0,
  "count" BIGINT DEFAULT 0,
  PRIMARY KEY ("track_date", "track_type", "banner_id")
);

CREATE TABLE "#__user_notes"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "user_id" BIGINT DEFAULT 0,
  "catid" BIGINT DEFAULT 0,
  "subject" NVARCHAR DEFAULT N'',
  "body" NVARCHAR DEFAULT N'',
  "state" SMALLINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_user_id" BIGINT DEFAULT 0,
  "created_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_user_id" BIGINT DEFAULT 0,
  "modified_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "review_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__banner_clients"
(
  "id" INTEGER IDENTITY(START WITH 1),
  "name" NVARCHAR DEFAULT N'',
  "contact" NVARCHAR DEFAULT N'',
  "email" NVARCHAR DEFAULT N'',
  "extrainfo" NVARCHAR DEFAULT N'',
  "state" SMALLINT DEFAULT 0,
  "checked_out" BIGINT DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "metakey" NVARCHAR DEFAULT N'',
  "own_prefix" SMALLINT DEFAULT 0,
  "metakey_prefix" NVARCHAR DEFAULT N'',
  "purchase_type" SMALLINT DEFAULT 0,
  "track_clicks" SMALLINT DEFAULT 0,
  "track_impressions" SMALLINT DEFAULT 0,
  PRIMARY KEY ("id")
);

CREATE TABLE "#__user_profiles"
(
  "user_id" INTEGER DEFAULT 0,
  "profile_key" NVARCHAR DEFAULT N'',
  "profile_value" NVARCHAR DEFAULT N'',
  "ordering" INTEGER DEFAULT 0,
  PRIMARY KEY ("user_id", "profile_key")
);

CREATE TABLE "#__user_usergroup_map"
(
  "user_id" BIGINT DEFAULT 0,
  "group_id" BIGINT DEFAULT 0,
  PRIMARY KEY ("user_id", "group_id")
);

CREATE TABLE "#__users"
(
  "id" INTEGER IDENTITY(START WITH 1),
  "name" NVARCHAR DEFAULT N'',
  "username" NVARCHAR DEFAULT N'',
  "email" NVARCHAR DEFAULT N'',
  "password" NVARCHAR DEFAULT N'',
  "usertype" NVARCHAR DEFAULT N'',
  "block" SMALLINT DEFAULT 0,
  "sendEmail" SMALLINT DEFAULT 0,
  "registerDate" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "lastvisitDate" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "activation" NVARCHAR DEFAULT N'',
  "params" LONG VARBINARY NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "#__updates"
(
  "update_id" INTEGER IDENTITY(START WITH 1),
  "update_site_id" INTEGER DEFAULT 0,
  "extension_id" INTEGER DEFAULT 0,
  "cateryid" INTEGER DEFAULT 0,
  "name" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  "element" NVARCHAR DEFAULT N'',
  "type" NVARCHAR DEFAULT N'',
  "folder" NVARCHAR DEFAULT N'',
  "client_id" SMALLINT DEFAULT 0,
  "version" NVARCHAR DEFAULT N'',
  "data" NVARCHAR DEFAULT N'',
  "detailsurl" NVARCHAR DEFAULT N'',
  "infourl" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("update_id")
);

CREATE TABLE "#__update_sites_extensions"
(
  "update_site_id" INTEGER DEFAULT 0,
  "extension_id" INTEGER DEFAULT 0,
  PRIMARY KEY ("update_site_id", "extension_id")
);

INSERT INTO #__update_sites_extensions(update_site_id,extension_id) VALUES(1,700);
INSERT INTO #__update_sites_extensions(update_site_id,extension_id) VALUES(2,700);

CREATE TABLE "#__update_sites"
(
  "update_site_id" INTEGER IDENTITY(START WITH 3),
  "name" NVARCHAR DEFAULT N'',
  "type" NVARCHAR DEFAULT N'',
  "location" NVARCHAR DEFAULT N'',
  "enabled" INTEGER DEFAULT 0,
  "last_check_timestamp" INTEGER DEFAULT 0,
  PRIMARY KEY ("update_site_id")
);

INSERT INTO #__update_sites(update_site_id,name,type,location,enabled,last_check_timestamp)
VALUES(1,'Joomla Core','collection','http://update.joomla.org/core/list.xml',1,0);

INSERT INTO #__update_sites(update_site_id,name,type,location,enabled,last_check_timestamp)
VALUES(2,'Joomla Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,0);

CREATE TABLE "#__update_categories"
(
  "cateryid" INTEGER IDENTITY(START WITH 1),
  "name" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  "parent" INTEGER DEFAULT 0,
  "updatesite" INTEGER DEFAULT 0,
  PRIMARY KEY ("cateryid")
);

CREATE TABLE "#__viewlevels"
(
  "id" BIGINT IDENTITY(START WITH 4),
  "title" NVARCHAR DEFAULT N'',
  "ordering" INTEGER DEFAULT 0,
  "rules" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__viewlevels(id,title,ordering,rules)
VALUES(1, N'Public', 0, N'[1]');

INSERT INTO #__viewlevels(id,title,ordering,rules)
VALUES(2, N'Registered', 1, N'[6,2,8]');

INSERT INTO #__viewlevels(id,title,ordering,rules)
VALUES(3, N'Special', 2, N'[6,3,8]');

CREATE TABLE "#__weblinks"
(
  "id" BIGINT IDENTITY(START WITH 1),
  "catid" INTEGER DEFAULT 0,
  "sid" INTEGER DEFAULT 0,
  "title" NVARCHAR DEFAULT N'',
  "alias" NVARCHAR DEFAULT N'',
  "url" NVARCHAR DEFAULT N'',
  "description" NVARCHAR DEFAULT N'',
  "date" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "hits" INTEGER DEFAULT 0,
  "state" SMALLINT DEFAULT 0,
  "checked_out" INTEGER DEFAULT 0,
  "checked_out_time" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "ordering" INTEGER DEFAULT 0,
  "archived" SMALLINT DEFAULT 0,
  "approved" SMALLINT DEFAULT 1,
  "access" INTEGER DEFAULT 1,
  "params" LONG VARBINARY NOT NULL,
  "language" NCHAR(7) DEFAULT N'',
  "created" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "created_by" BIGINT DEFAULT 0,
  "created_by_alias" NVARCHAR DEFAULT N'',
  "modified" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "modified_by" BIGINT DEFAULT 0,
  "metakey" NVARCHAR DEFAULT N'',
  "metadesc" NVARCHAR DEFAULT N'',
  "metadata" NVARCHAR DEFAULT N'',
  "featured" SMALLINT DEFAULT 0,
  "xreference" NVARCHAR DEFAULT N'',
  "publish_up" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  "publish_down" DATETIME NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY ("id")
);

CREATE TABLE "#__usergroups"
(
  "id" BIGINT IDENTITY(START WITH 9),
  "parent_id" BIGINT DEFAULT 0,
  "lft" BIGINT DEFAULT 0,
  "rgt" BIGINT DEFAULT 0,
  "title" NVARCHAR DEFAULT N'',
  PRIMARY KEY ("id")
);

INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(1,0,1,20,'Public');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(2,1,6,17,'Registered');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(3,2,7,14,'Author');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(4,3,8,11,'Editor');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(5,4,9,10,'Publisher');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(6,1,2,5,'Manager');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(7,6,3,4,'Administrator');
INSERT INTO #__usergroups(id,parent_id,lft,rgt,title) VALUES(8,1,18,19,'Super Users')

