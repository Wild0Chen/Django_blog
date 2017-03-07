-- MySQL dump 10.13  Distrib 5.7.13, for osx10.10 (x86_64)
--
-- Host: localhost    Database: ver214
-- ------------------------------------------------------
-- Server version	5.7.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add article',7,'add_article'),(20,'Can change article',7,'change_article'),(21,'Can delete article',7,'delete_article'),(22,'Can add category',8,'add_category'),(23,'Can change category',8,'change_category'),(24,'Can delete category',8,'delete_category'),(25,'Can add tag',9,'add_tag'),(26,'Can change tag',9,'change_tag'),(27,'Can delete tag',9,'delete_tag'),(28,'Can add blog comment',10,'add_blogcomment'),(29,'Can change blog comment',10,'change_blogcomment'),(30,'Can delete blog comment',10,'delete_blogcomment'),(31,'Can add blog comment2',11,'add_blogcomment2'),(32,'Can change blog comment2',11,'change_blogcomment2'),(33,'Can delete blog comment2',11,'delete_blogcomment2'),(34,'Can add ficx',12,'add_ficx'),(35,'Can change ficx',12,'change_ficx'),(36,'Can delete ficx',12,'delete_ficx');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$3eNmIcklmLQp$1Ben/26AUtM+BunHBuonLm5qZzSQ8z9DPIYpF+IHiEw=','2017-02-14 16:19:56.537587',1,'jafo','','','sdf@q.com',1,1,'2017-02-14 16:03:57.886759');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `body` longtext NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `last_modified_time` datetime(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `abstract` varchar(54) DEFAULT NULL,
  `views` int(10) unsigned NOT NULL,
  `likes` int(10) unsigned NOT NULL,
  `topped` tinyint(1) NOT NULL,
  `category_id` int(11),
  PRIMARY KEY (`id`),
  KEY `blog_article_b583a629` (`category_id`),
  CONSTRAINT `blog_article_category_id_45371416e1252d6d_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'文章1','做一下 benchmark 就不会这样说了。 这裏是我在我的机器上跑的几次数据: Markdown: 47.7091s Markdown2...\r\n更多关于markdown2的问题>>\r\nzhidao.baidu.com/link?... \r\n - 百度快照 - 评价\r\nsublime text下markdown的配置_百度文库\r\n2015年11月22日 - 输入Markdown Preview回车 输入Markdown editing回车 Markdown Editing效果 3.2 preview 设置快捷键 如果我们想要直接在浏览器中预览效果的话,可以自...\r\nwenku.baidu.com/link?u... \r\n - 百度快照 - 评价\r\npython-markdown2 1.0.1.17','2017-02-14 16:22:04.466107','2017-02-14 16:22:04.466188','p','',0,0,0,1),(2,'文章2','\r\n\r\n    ormsf 5 小时前提问 \r\n\r\n如何解决linux下面中文输入法不跟随？\r\n\r\n    linuxjetbrainsjavapythonvim \r\n\r\n0\r\n得票\r\n1\r\n回答\r\n126\r\n浏览\r\n\r\n    S1ngS1ng 4 天前回答 \r\n\r\nVim如何设置syntastic插件使用python3解释器？\r\n\r\n    linuxvimpythonubuntu \r\n\r\n0\r\n得票\r\n4\r\n解决\r\n161\r\n浏览\r\n\r\n    csm 5 天前回答 \r\n\r\n如何在Vim实现go to definition？\r\n\r\n    linuxpythonvim \r\n\r\n0\r\n得票\r\n4\r\n解决\r\n455\r\n浏览\r\n\r\n    1\r\n    fizz 2月4日回答 \r\n\r\nvim 如何简化 频繁使用的命令\r\n\r\n    vim \r\n\r\n0\r\n得票\r\n2\r\n解决\r\n275\r\n浏览\r\n\r\n    S1ngS1ng 2月2日回答 \r\n\r\nvim 去掉\'_\'字符的高亮\r\n\r\n    vim \r\n\r\n0\r\n得票\r\n2\r\n回答\r\n306\r\n浏览\r\n\r\n    S1ngS1ng 2月1日回答 \r\n\r\nvim安装了jshint插件之后不能用，设置插件运行路径时出现~符号，我用win系统的，要怎么改呢？\r\n\r\n    vimscriptvim插件vimrcvim \r\n\r\n0\r\n得票\r\n2\r\n解决\r\n206\r\n浏览\r\n\r\n    S1ngS1ng 2月1日回答 \r\n\r\n如何在Vim中优雅删除末尾的空白字符以及粘贴代码？\r\n\r\n    vimlinux正则表达式python \r\n\r\n0\r\n得票\r\n10\r\n解决\r\n642\r\n浏览\r\n\r\n    c1zel 1月25日回答 \r\n\r\n有没有什么函数给数字加0和去掉0\r\n\r\n    yiivimjavascriptlinuxphp \r\n\r\n0\r\n得票\r\n3\r\n回答\r\n424\r\n浏览\r\n\r\n    zhanglue 1月25日回答 ','2017-02-14 16:22:04.467260','2017-02-14 16:22:04.467320','p','',0,0,0,1),(3,'文章2','\r\nmac下PyCharm导入第三方包 - zk673820543的专栏 - 博客频道 - ...\r\n2016年8月31日 - 目录视图 摘要视图 订阅2017直通软考,拿证无忧 程序员简历优化指南! 程序员1月书讯 云端应用征文大赛,秀绝招,赢无人机! mac下PyCharm导入第三方包 ...\r\nblog.csdn.net/zk673820... \r\n - 百度快照\r\n为您推荐：pycharm使用教程mac pippycharm 导入本地包mac python 升级\r\npycharm快捷键、常用设置、包管理 - 简书\r\n2015年7月30日 - pycharm快捷键、常用设置、包管理pycharmLearningtips学习技巧/pythoncharm/help/tipoftheday:AspecialvariantoftheCodeCompletionfeatureinvoked...\r\nwww.jianshu.com/p/e59f... \r\n - 百度快照 - 51条评价\r\nMac系统从零开始安装pycharm编程环境_百度经验\r\n2015年8月29日 - 解决安装pycharm可能遇到的各种问题。百度经验:jingyan.baidu.com 工具/原料 最新版本Mac OS百度经验:jingyan.baidu.com 方法/步骤 1 先把你的Mac OS更新到最新...\r\njingyan.baidu.com/arti... \r\n - 百度快照\r\nMac下面解决PYTHONPATH配置的方法 - 磨石斋 - 博客频道 - CSDN.NET\r\n2015年11月17日 - 问题起因:MacPort安装的Python包在/opt目录里面,和系统安装的Python包不在一起,...在pycharm的interpreter设置里面可以给interpreter添加root路径,进...\r\nblog.csdn.net/dipolar/... \r\n - 百度快照 - 1702条评价\r\nmac pycharm 怎么选择新版本python解释器?_百度知道','2017-02-14 16:22:04.468677','2017-02-15 14:45:56.270138','p','',0,0,0,1),(4,'2文章1','\r\n\r\n  最近对Python有兴趣，在网上搜了《八天深入理解python》视频教程，由于用的mac，不用安装python，感觉瞬间开发环境就已经具备了，然后连个ipython都没装上，ps：还是只刚入手mac的菜鸟。\r\n       在终端，使用：sudo pip install ipython\r\n[plain] view plain copy\r\nprint?在CODE上查看代码片派生到我的代码片\r\n\r\n    Exception:  \r\n    Traceback (most recent call last):  \r\n      File \"/Library/Python/2.7/site-packages/pip-8.1.2-py2.7.egg/pip/basecommand.py\", line 215, in main  \r\n        status = self.run(options, args)  \r\n      File \"/Library/Python/2.7/site-packages/pip-8.1.2-py2.7.egg/pip/commands/install.py\", line 317, in run  \r\n        prefix=options.prefix_path,  \r\n      File \"/Library/Python/2.7/site-packages/pip-8.1.2-py2.7.egg/pip/req/req','2017-02-14 16:23:21.466022','2017-02-14 16:23:21.466081','p','',0,0,0,2),(5,'2文章2','\r\n\r\n如果是端口映射的话，用虚拟服务器，在里面设定：\r\n服务名称看你设置什么\r\n外部端口（从外部访问用什么端口，可以跟内网端口相同）\r\n内部端口：对应到内网服务器的端口，如100-101\r\n应用协议，不知道全选（UDP/TCP）\r\n内部服务器IP：192.168.1.10\r\n启用规则\r\n\r\n\r\n外网访问的话，如果是使用静态公网IP的话，就直接用IP地址+端口号来访问。如果是动态的话，需要用域名解析功能（如DDNS） ','2017-02-14 16:23:21.469237','2017-02-14 16:23:21.469301','p','',0,0,0,2),(6,'2文章3',' 348\r\n浏览\r\n\r\n    丶开开Humps 1月11日回答 \r\n\r\n以php为例，如何用vim快速产生注释？\r\n\r\n    phpvim \r\n\r\n0\r\n得票\r\n2\r\n回答\r\n241\r\n浏览\r\n\r\n    TangZhiXiong 1月11日回答 \r\n\r\n如何删除vim中不可见乱码字符？\r\n\r\n    vimpython \r\n\r\n0\r\n得票\r\n1\r\n解决\r\n155\r\n浏览\r\n\r\n    RdouTyping 1月9日回答 \r\n\r\nGCC编译指定路径问题\r\n\r\n    vimc++c \r\n\r\n0\r\n得票\r\n1\r\n解决\r\n171\r\n浏览\r\n\r\n    adam 1月6日回答 \r\n\r\n最近在学vimscript，怎样让gvim在vimscript文件修改之后自动载入文件？\r\n\r\n    vim插件vimscriptvimrcvim \r\n\r\n0\r\n得票\r\n2\r\n回答\r\n236\r\n浏览\r\n\r\n    hiberabyss 1月4日回答 \r\n\r\nvim如何解决中文字体显示异常？\r\n\r\n    linuxvim \r\n\r\n','2017-02-14 16:23:21.470460','2017-02-14 16:23:21.470524','p','',0,0,0,2),(7,'3文章1','相关搜索\r\nmarkdown 编辑器		markdownpad2扩展语法		markdown软件\r\nmarkdownpad2扩展		2016markdown软件		markdownpad\r\nmarkdownpad2表格代码		amrkdownpadkey		markdownpad2注册码\r\n12345678910下一页> ','2017-02-14 16:25:02.455244','2017-02-14 16:25:02.455292','p','',0,0,0,3),(8,'3文章2',' - zhonggaorong的专栏 - ...\r\n2016年12月9日 - 目录视图 摘要视图 订阅 CSDN学院招募微信小程序讲师啦 程序员简历优化指南! ...Python学习之mac下PyCharm导入第三方包 标签: Python第三方库PyCharm...\r\nblog.csdn.net/zhonggao... \r\n - 百度快照 - 1702条评价\r\npycharm快捷键及一些常用设置 - 系统其他栏目 - 红黑联盟\r\n2014年10月9日 - 在PyCharm /opt/pycharm-3.4.1/help目录下可以找到...2. Alt + Enter: 自动添加包 3. 对于常用的快捷...360n4s耳机设置问题 文章 推荐 · 在苹果MAC O...\r\nwww.2cto.com/os/201410... \r\n - 百度快照 - 127条评价\r\npycharm Python console 路径设置的问题? - PyCharm - 知乎\r\n2016年8月16日 - pycharm Python console 路径设置的问题?小弟刚学python 然后我发现为什么python console 不能导入我想导入的模块(我想导入自己写的hello模块...)我不...\r\nwww.zhihu.com/question... \r\n - 百度快照 - 1335条评价\r\npycharm快捷键及一些常用设置 - 爱程序网\r\n2014年11月7日 - pycharm快捷键及一些常用设置,有需要的朋友可以参考下。Alt+Enter自动添加包Ctrl+tSVN更新Ctrl+kSVN提交Ctrl+/注释(取消注释)选择的行Ctrl+Shift\r\nwww.aichengxu.com/view... \r\n - 百度快照 - 评价\r\n','2017-02-14 16:25:02.456113','2017-02-14 16:25:02.456143','d','',0,0,0,3),(9,'3文章3','resident Xi Jinping on Monday told leading officials to practice strict self-discipline and eliminate special privileges.\r\n\r\nXi made the remarks when addressing the opening session of a workshop on the Sixth Plenary Session of the 18th Communist Party of China (CPC) Central Committee. The workshop at the Party School of the CPC Central Committee was attended by senior provincial and ministerial officials.\r\n\r\nThe opening session was presided over by Premier Li Keqiang. Other leaders including Zhang Dejiang, Yu Zhengsheng, Liu Yunshan, Wang Qishan and Zhang Gaoli were also present.\r\n\r\nXi, who is also general secretary of the CPC Central Committee and chairman of the Central Military Commission, said implementing the decisions of the plenum would have far-reaching and profound significance for both the Party and socialism with Chinese characteristics.\r\n\r\nXi urged leading cadres to \"build a fence\" against special privileges to prevent themselves and those around them from abusing power.\r\n\r\nLeading officials should use their power \"impartially, cautiously and legally,\" Xi said in his speech.\r\n\r\nThe CPC Central Committee held the workshop to help senior provincial and ministerial officials understand two documents, one on the norms of political life within the Party in the new era, and a regulation on intra-Party supervision, which were approved by last year\'s plenum.\r\n\r\n\"Leading officials should strengthen their political capability, firm their political ideals, uphold political direction, be steadfast in their stance and strictly observe political rules,\" Xi said, stressing they should enrich their political experience and match their political capability with the positions they were holding.\r\n\r\nXi said upholding the authority of the CPC Central Committee with strict observance of orders and rules was related to the future and fate of the Party and the nation as well as the fundamental interests of all people across the nation.\r\n\r\nXi called on all Party members to become more aware of the need to uphold political integrity, keep in mind the bigger picture, follow the CPC as the core of the Chinese leadership, and act consistently with CPC Central Committee policy.\r\n\r\nSafeguarding the authority of the CPC Central Committee and the centralized and unified leadership chimed with democratic centralism, Xi stressed.','2017-02-14 16:25:02.456839','2017-02-14 16:25:02.456902','p','',0,0,0,3),(10,'1','1','2017-02-15 05:47:04.267167','2017-02-15 05:47:04.267243','p','',0,0,0,4),(11,'2','1','2017-02-15 05:47:04.268128','2017-02-15 05:47:04.268155','p','',0,0,0,4),(12,'3','1','2017-02-15 05:47:04.268983','2017-02-15 05:47:04.269037','p','',0,0,0,4),(13,'4','1','2017-02-15 05:47:04.269883','2017-02-15 05:47:04.269910','p','',0,0,0,4),(14,'5','1','2017-02-15 05:47:04.270473','2017-02-15 05:47:04.270511','p','',0,0,0,4),(15,'6','6','2017-02-15 05:47:04.271197','2017-02-15 05:47:04.271230','p','',0,0,0,4),(16,'7','d','2017-02-15 05:47:04.271940','2017-02-15 05:47:04.271979','p','',0,0,0,4),(17,'8','8','2017-02-15 05:47:04.272679','2017-02-15 05:47:04.272710','p','',0,0,0,4),(18,'9','9','2017-02-15 05:47:04.273299','2017-02-15 05:47:04.273330','p','',0,0,0,4),(19,'0','0','2017-02-15 05:47:04.273944','2017-02-15 05:47:04.273970','p','',0,0,0,4),(20,'1t','1','2017-02-15 05:49:17.517286','2017-02-15 05:49:17.517329','p','',0,0,0,5),(21,'t2','1','2017-02-15 05:49:17.518225','2017-02-15 05:49:17.518265','p','',0,0,0,5),(22,'t3','t','2017-02-15 05:49:17.519029','2017-02-15 05:49:17.519064','p','',0,0,0,5),(23,'t4t','t','2017-02-15 05:49:17.519785','2017-02-15 05:49:17.519829','p','',0,0,0,5),(24,'t5','t','2017-02-15 05:49:17.520835','2017-02-15 05:49:17.520893','p','',0,0,0,5),(25,'t6','6','2017-02-15 05:49:17.521861','2017-02-15 05:49:17.521888','p','',0,0,0,5),(26,'t7','t','2017-02-15 05:49:17.522457','2017-02-15 05:49:17.522483','p','',0,0,0,5),(27,'t8','8','2017-02-15 05:49:17.523124','2017-02-15 05:49:17.523159','p','',0,0,0,5),(28,'t9','u','2017-02-15 05:49:17.523859','2017-02-15 05:49:17.523887','p','',0,0,0,5),(29,'t0','t','2017-02-15 05:49:17.524414','2017-02-15 05:49:17.524442','p','',0,0,0,5),(30,'1','```python\r\nclass ArticleDetailView(DetailView):\r\n    model = Article\r\n    template_name = \'blog/detail.html\'\r\n    context_object_name = \'article\'\r\n    pk_url_kwarg = \'article_id\'  \r\n\r\n    def get_object(self):\r\n        obj = super(ArticleDetailView, self).get_object()\r\n        obj.body = markdown2.markdown(obj.body, extras=[\'fenced-code-blocks\'], )\r\n        return obj\r\n```','2017-02-15 09:57:55.271491','2017-02-15 14:45:56.250284','p','',0,0,0,1);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_44f63623647e57b3_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_4147c6466c017843_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_44f63623647e57b3_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (2,3,1),(1,30,1);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogcomment`
--

DROP TABLE IF EXISTS `blog_blogcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `create_tim` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogcomment_article_id_1238e194ff709475_fk_blog_article_id` (`article_id`),
  CONSTRAINT `blog_blogcomment_article_id_1238e194ff709475_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogcomment`
--

LOCK TABLES `blog_blogcomment` WRITE;
/*!40000 ALTER TABLE `blog_blogcomment` DISABLE KEYS */;
INSERT INTO `blog_blogcomment` VALUES (6,'f','ff','s','2017-02-16 07:34:52.457221',3),(7,'fsd','sadfasdf','asdf','2017-02-16 07:35:46.308303',3),(8,'f','ds','f','2017-02-17 14:15:24.043775',4),(9,'hh','hg','hghghg','2017-02-17 14:17:53.525186',4),(10,'hh','hg','hghghg','2017-02-17 14:20:19.048622',4),(11,'hh','hg','hghghg','2017-02-17 14:20:36.296144',4),(12,'asdfsdf','dd','dsfd','2017-02-17 14:44:29.711488',4),(13,'rrr','rrrr','r          rfrr','2017-02-18 17:27:20.102127',3);
/*!40000 ALTER TABLE `blog_blogcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogcomment2`
--

DROP TABLE IF EXISTS `blog_blogcomment2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogcomment2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `create_tim` datetime(6) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogcomme_comment_id_59a4734b3ab81f9_fk_blog_blogcomment_id` (`comment_id`),
  CONSTRAINT `blog_blogcomme_comment_id_59a4734b3ab81f9_fk_blog_blogcomment_id` FOREIGN KEY (`comment_id`) REFERENCES `blog_blogcomment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogcomment2`
--

LOCK TABLES `blog_blogcomment2` WRITE;
/*!40000 ALTER TABLE `blog_blogcomment2` DISABLE KEYS */;
INSERT INTO `blog_blogcomment2` VALUES (1,'fasdfas','2017-02-19 02:58:11.363773',NULL),(2,'fff','2017-02-19 02:58:43.286139',NULL);
/*!40000 ALTER TABLE `blog_blogcomment2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_modified_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'分类1','2017-02-14 16:22:04.463701','2017-02-15 14:45:56.238637'),(2,'分类2','2017-02-14 16:23:21.463251','2017-02-14 16:23:21.463333'),(3,'分类3','2017-02-14 16:25:02.451808','2017-02-14 16:25:02.451847'),(4,'tme1','2017-02-15 05:47:04.264249','2017-02-15 05:47:04.264302'),(5,'tmp2','2017-02-15 05:49:17.515336','2017-02-15 05:49:17.515378');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_ficx`
--

DROP TABLE IF EXISTS `blog_ficx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_ficx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filex` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_ficx`
--

LOCK TABLES `blog_ficx` WRITE;
/*!40000 ALTER TABLE `blog_ficx` DISABLE KEYS */;
INSERT INTO `blog_ficx` VALUES (1,'./123.png'),(2,'./123_GLgl0ME.png'),(3,'./123_P8viVhE.png'),(4,'./123_hiZWLLP.png');
/*!40000 ALTER TABLE `blog_ficx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'中文','2017-02-15 13:08:24.940478','2017-02-15 13:08:24.940536'),(2,'python','2017-02-15 13:09:00.033618','2017-02-15 13:09:00.033660'),(3,'c','2017-02-15 13:09:06.640498','2017-02-15 13:09:06.640538'),(4,'c++','2017-02-15 13:09:12.727663','2017-02-15 13:09:12.727731'),(5,'Java','2017-02-15 13:09:20.794430','2017-02-15 13:09:20.794471'),(6,'JavaScript','2017-02-15 13:09:31.520742','2017-02-15 13:09:31.520781'),(7,'PHP','2017-02-15 13:09:48.266388','2017-02-15 13:09:48.266430');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-14 16:22:04.470723','1','分类1',1,'',8,1),(2,'2017-02-14 16:23:21.472154','2','分类2',1,'',8,1),(3,'2017-02-14 16:25:02.458201','3','分类3',1,'',8,1),(4,'2017-02-15 05:47:04.274656','4','tme1',1,'',8,1),(5,'2017-02-15 05:49:17.525176','5','tmp2',1,'',8,1),(6,'2017-02-15 09:57:55.273994','1','分类1',2,'Added article \"1\".',8,1),(7,'2017-02-15 10:44:17.944999','1','分类1',2,'Changed body for article \"1\".',8,1),(8,'2017-02-15 10:47:36.485183','1','分类1',2,'Changed body for article \"1\".',8,1),(9,'2017-02-15 10:51:02.456545','1','分类1',2,'Changed body for article \"1\".',8,1),(10,'2017-02-15 10:57:09.805464','1','分类1',2,'Changed body for article \"1\".',8,1),(11,'2017-02-15 11:06:27.179041','1','分类1',2,'Changed body for article \"1\".',8,1),(12,'2017-02-15 13:08:24.941537','1','中文',1,'',9,1),(13,'2017-02-15 13:09:00.034733','2','python',1,'',9,1),(14,'2017-02-15 13:09:06.641327','3','c',1,'',9,1),(15,'2017-02-15 13:09:12.731837','4','c++',1,'',9,1),(16,'2017-02-15 13:09:20.795553','5','Java',1,'',9,1),(17,'2017-02-15 13:09:31.521747','6','JavaScript',1,'',9,1),(18,'2017-02-15 13:09:48.267118','7','PHP',1,'',9,1),(19,'2017-02-15 14:45:56.324635','1','分类1',2,'Changed tags for article \"1\". Changed tags for article \"文章2\".',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','article'),(10,'blog','blogcomment'),(11,'blog','blogcomment2'),(8,'blog','category'),(12,'blog','ficx'),(9,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-14 15:09:03.406892'),(2,'auth','0001_initial','2017-02-14 15:09:03.641515'),(3,'admin','0001_initial','2017-02-14 15:09:03.697984'),(4,'contenttypes','0002_remove_content_type_name','2017-02-14 15:09:03.803182'),(5,'auth','0002_alter_permission_name_max_length','2017-02-14 15:09:03.839496'),(6,'auth','0003_alter_user_email_max_length','2017-02-14 15:09:03.873902'),(7,'auth','0004_alter_user_username_opts','2017-02-14 15:09:03.895008'),(8,'auth','0005_alter_user_last_login_null','2017-02-14 15:09:03.927751'),(9,'auth','0006_require_contenttypes_0002','2017-02-14 15:09:03.930082'),(10,'blog','0001_initial','2017-02-14 15:09:04.019818'),(11,'sessions','0001_initial','2017-02-14 15:09:04.047319'),(12,'blog','0002_auto_20170214_1514','2017-02-14 15:14:28.674125'),(13,'blog','0003_auto_20170215_1305','2017-02-15 13:05:53.065497'),(14,'blog','0004_articlemanage','2017-02-15 13:21:50.663478'),(15,'blog','0005_delete_articlemanage','2017-02-15 13:23:09.963515'),(16,'blog','0006_blogcomment','2017-02-16 05:56:47.697204'),(17,'blog','0007_blogcomment2','2017-02-19 02:49:06.131767'),(18,'blog','0008_ficx','2017-02-24 14:12:28.196427');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1ogm4spq0xz98jo4zgwwjk6dwuk06t5y','M2U4YmQ0N2YwZmY0YmQyZGNjYzYwODc1ZDViYTA0NDBjMWY2NGQwYzp7fQ==','2017-03-02 08:12:09.996396'),('2ziwillhl43ka63ufxaed3ljl0g9s2l7','ZmQ0YTA1OWU1MDRmZmRkMWM3YzVmZGIzZGJjM2M3ZmU0YjEwNmNhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiYTVhZjBjZDcxM2NiNjhlMmMzM2U3YWI0OTE2ZmE5MDJjN2M3ZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-28 16:19:56.539936'),('qof6y3slm9d4ton2zv9lufuylx981sso','ZmQ0YTA1OWU1MDRmZmRkMWM3YzVmZGIzZGJjM2M3ZmU0YjEwNmNhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiYTVhZjBjZDcxM2NiNjhlMmMzM2U3YWI0OTE2ZmE5MDJjN2M3ZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-28 16:03:59.985222');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-06 18:18:57
