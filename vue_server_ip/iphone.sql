SET NAMES UTF8;
DROP DATABASE IF EXISTS ip;
#创建数据ip
CREATE DATABASE ip CHARSET=UTF8;
#1:进入库  ip
USE ip;
#2:创建表 ip_news
#技巧1:库名;表名;列表;全英文小写字母
CREATE TABLE ip_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  ctime DATETIME,
  point INT,
  img_url VARCHAR(255),
  content VARCHAR(255) 
);
INSERT INTO ip_news VALUES(1,'又闹乌龙:三星用iPhone发布Note 9宣传广告_荔枝网新闻',now(),0,
"http://127.0.0.1:3333/img/1.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道，在刚刚过去的这个周末，同样的情况发生了。这一次，三星使用 iPhone 版推特发布了 Galaxy Note 9 的宣传广告。三星的尼日利亚推特账号分享了一条宣传三星 Galaxy Note 9 的 SuperAMOLED 显示屏的推文。

　　这条推文最先被 YouTube 播主 Marques Brownlee 发现。而在 Marques Brownlee 发现之后，三星不仅删除了这条推文，而且删除了整个三星尼日利亚推特账户。目前，@SamsungMobileNG 这个账号已经找不到了。
本月早些时候，三星沙特账户分享了一条类似的推文，也是使用iPhone版 推特发布的。值得注意的是，iPhone XS Max 6.5 英寸的 OLED 显示屏通常被认为比 Galaxy Note 9 更好，这让这条推文显得更加尴尬。");
INSERT INTO ip_news VALUES(2,'大一新生精心伪装 用手机模型调包7部iphone_新闻频道_中华网',now(),0,
"http://127.0.0.1:3333/img/2.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道，在刚刚过去的这个周末，同样的情况发生了。这一次，三星使用 iPhone 版推特发布了 Galaxy Note 9 的宣传广告。三星的尼日利亚推特账号分享了一条宣传三星 Galaxy Note 9 的 SuperAMOLED 显示屏的推文。

　　这条推文最先被 YouTube 播主 Marques Brownlee 发现。而在 Marques Brownlee 发现之后，三星不仅删除了这条推文，而且删除了整个三星尼日利亚推特账户。目前，@SamsungMobileNG 这个账号已经找不到了。
本月早些时候，三星沙特账户分享了一条类似的推文，也是使用iPhone版 推特发布的。值得注意的是，iPhone XS Max 6.5 英寸的 OLED 显示屏通常被认为比 Galaxy Note 9 更好，这让这条推文显得更加尴尬。");
INSERT INTO ip_news VALUES(3,'大一新生精心伪装 用手机模型调包7部iphone_新闻频道_中华网',now(),0,
"http://127.0.0.1:3333/img/3.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道，在刚刚过去的这个周末，同样的情况发生了。这一次，三星使用 iPhone 版推特发布了 Galaxy Note 9 的宣传广告。三星的尼日利亚推特账号分享了一条宣传三星 Galaxy Note 9 的 SuperAMOLED 显示屏的推文。

　　这条推文最先被 YouTube 播主 Marques Brownlee 发现。而在 Marques Brownlee 发现之后，三星不仅删除了这条推文，而且删除了整个三星尼日利亚推特账户。目前，@SamsungMobileNG 这个账号已经找不到了。
本月早些时候，三星沙特账户分享了一条类似的推文，也是使用iPhone版 推特发布的。值得注意的是，iPhone XS Max 6.5 英寸的 OLED 显示屏通常被认为比 Galaxy Note 9 更好，这让这条推文显得更加尴尬。");
INSERT INTO ip_news VALUES(4,'高仿“苹果手机”以假乱真 男子街边兜售致路人屡屡上当..._新浪新闻',now(),0,
"http://127.0.0.1:3333/img/4.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");

INSERT INTO ip_news VALUES(5,'担心iPhone需求疲软 苹果目标股价再次被下调_新闻中心_中国网',now(),0,
"http://127.0.0.1:3333/img/5.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");
INSERT INTO ip_news VALUES(6,'担心iPhone需求疲软 苹果目标股价再次被下调_新闻中心_中国网',now(),0,
"http://127.0.0.1:3333/img/6.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");
INSERT INTO ip_news VALUES(7,'担心iPhone需求疲软 苹果目标股价再次被下调_新闻中心_中国网',now(),0,
"http://127.0.0.1:3333/img/7.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");
INSERT INTO ip_news VALUES(8,'担心iPhone需求疲软 苹果目标股价再次被下调_新闻中心_中国网',now(),0,
"http://127.0.0.1:3333/img/8.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");
INSERT INTO ip_news VALUES(9,'担心iPhone需求疲软 苹果目标股价再次被下调_新闻中心_中国网',now(),0,
"http://127.0.0.1:3333/img/9.jpg","此前有不少关于苹果竞争对手使用 iPhone 在社交网络上发布自家产品广告的报道");


#货币 小数计算误差
#价格 购物车合计 
#double DECIMAL(10,2)
#严格   将货币转换分单位  1.99 -> 199
#显示  1.99
#3:添加20条记录
#4:查询

#1:创建评论表 39
#   表名 几列 列名
#   ip_comment
#   id        INT        评论编号
#   nid       INT        评论所属新闻编号
#   user_name VARCHAR(25)评论人名称
#   ctime     DATETIME   时间
#   content   VARCHAR(120)内容

USE ip;
CREATE TABLE ip_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid INT,
  user_name VARCHAR(25),
  ctime DATETIME,
  content VARCHAR(120)
);
#2:添加15条
INSERT INTO ip_comment VALUES(null,1,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,1,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,1,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,1,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,1,'划分',now(),'115');
INSERT INTO ip_comment VALUES(null,1,'挺好听',now(),'116');
INSERT INTO ip_comment VALUES(null,1,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,1,'我去额',now(),'支持国产');
INSERT INTO ip_comment VALUES(null,1,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,1,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,1,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,1,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,1,'划分',now(),'115');
INSERT INTO ip_comment VALUES(null,1,'挺好听',now(),'116');
INSERT INTO ip_comment VALUES(null,1,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,1,'我去额',now(),'支持国产');

INSERT INTO ip_comment VALUES(null,2,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,2,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,2,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,2,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,2,'划分',now(),'225');
INSERT INTO ip_comment VALUES(null,2,'挺好听',now(),'226');
INSERT INTO ip_comment VALUES(null,2,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,2,'我去额',now(),'支持国产');
INSERT INTO ip_comment VALUES(null,2,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,2,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,2,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,2,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,2,'划分',now(),'225');
INSERT INTO ip_comment VALUES(null,2,'挺好听',now(),'226');
INSERT INTO ip_comment VALUES(null,2,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,2,'我去额',now(),'支持国产');

INSERT INTO ip_comment VALUES(null,3,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,3,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,3,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,3,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,3,'划分',now(),'335');
INSERT INTO ip_comment VALUES(null,3,'挺好听',now(),'336');
INSERT INTO ip_comment VALUES(null,3,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,3,'我去额',now(),'支持国产');
INSERT INTO ip_comment VALUES(null,3,'的地方',now(),'666');
INSERT INTO ip_comment VALUES(null,3,'刚发的',now(),'真的吗');
INSERT INTO ip_comment VALUES(null,3,'个梵蒂冈',now(),'不会吧');
INSERT INTO ip_comment VALUES(null,3,'规范规定',now(),'我反对');
INSERT INTO ip_comment VALUES(null,3,'划分',now(),'335');
INSERT INTO ip_comment VALUES(null,3,'挺好听',now(),'336');
INSERT INTO ip_comment VALUES(null,3,'就一会',now(),'我从不用苹果');
INSERT INTO ip_comment VALUES(null,3,'我去额',now(),'支持国产');

#用户登录
CREATE TABLE ip_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25) NOT NULL DEFAULT '',
  upwd  VARCHAR(32) NOT NULL DEFAULT ''
);
INSERT INTO ip_login VALUES(null,'dd',md5('123'));
INSERT INTO ip_login VALUES(null,'tom',md5('123'));
INSERT INTO ip_login VALUES(null,'jerry',md5('123'));



#购物车
CREATE TABLE ip_shoppingcart_item(
  Iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  product_id INT,
  count VARCHAR(50),
  is_checked tinyint(1)
);

INSERT INTO ip_shoppingcart_item VALUES(1,1,1,1,1);
INSERT INTO ip_shoppingcart_item VALUES(2,2,2,1,1);
INSERT INTO ip_shoppingcart_item VALUES(3,3,3,1,0);
INSERT INTO ip_shoppingcart_item VALUES(4,4,4,56,1);
INSERT INTO ip_shoppingcart_item VALUES(5,5,5,1,0);


/* 商品详情*/
DROP TABLE IF EXISTS `ip_laptop`;
CREATE TABLE `ip_laptop` (
  `lid` int(11) NOT NULL auto_increment,
  `family_id` int(11) default NULL,
  `title` varchar(128) default NULL,
  `subtitle` varchar(128) default NULL,
  `price` decimal(10,2) default NULL,
  `promise` varchar(64) default NULL,
  `spec` varchar(64) default NULL,
  `lname` varchar(32) default NULL,
  `color` varchar(32) default NULL,
  `img` varchar(80) default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;


INSERT INTO `ip_laptop` VALUES ('1', '1', 'iPhone X 智能手机 A1865', '前置+后置摄像头 1200万像素双镜头', '6988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','白色','http://127.0.0.1:3333/img/shop/1.png');
INSERT INTO `ip_laptop` VALUES ('2', '2', 'iPhone X 智能手机 A2865', '前置+后置摄像头 1200万像素双镜头', '6988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','黑色','http://127.0.0.1:3333/img/shop/2.png');
INSERT INTO `ip_laptop` VALUES ('3', '3', 'iPhone X 智能手机 A3865', '前置+后置摄像头 1200万像素双镜头', '8988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','蓝色','http://127.0.0.1:3333/img/shop/3.png');
INSERT INTO `ip_laptop` VALUES ('4', '4', 'iPhone X 智能手机 A4865', '前置+后置摄像头 1200万像素双镜头', '8988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','黄色','http://127.0.0.1:3333/img/shop/4.png');
INSERT INTO `ip_laptop` VALUES ('5', '5', 'iPhone X 智能手机 A5865', '前置+后置摄像头 1200万像素双镜头', '9988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','红色','http://127.0.0.1:3333/img/shop/5.png');
INSERT INTO `ip_laptop` VALUES ('6', '1', 'iPhone X 智能手机 A1865', '前置+后置摄像头 1200万像素双镜头', '9988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','白色','http://127.0.0.1:3333/img/shop/1.png');
INSERT INTO `ip_laptop` VALUES ('7', '2', 'iPhone X 智能手机 A2865', '前置+后置摄像头 1200万像素双镜头', '10988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','黑色','http://127.0.0.1:3333/img/shop/2.png');
INSERT INTO `ip_laptop` VALUES ('8', '3', 'iPhone X 智能手机 A3865', '前置+后置摄像头 1200万像素双镜头', '10988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','蓝色','http://127.0.0.1:3333/img/shop/3.png');
INSERT INTO `ip_laptop` VALUES ('9', '4', 'iPhone X 智能手机 A4865', '前置+后置摄像头 1200万像素双镜头', '11988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','黄色','http://127.0.0.1:3333/img/shop/4.png');
INSERT INTO `ip_laptop` VALUES ('10', '5', 'iPhone X 智能手机 A5865', '前置+后置摄像头 1200万像素双镜头', '11988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '64GB/256GB', 'iPhone X 智能手机','红色','http://127.0.0.1:3333/img/shop/5.png');
