/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 17/12/2021 17:35:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机数码');
INSERT INTO `category` VALUES ('2', '电脑办公');
INSERT INTO `category` VALUES ('3', '家具家居');
INSERT INTO `category` VALUES ('4', '鞋靴箱包');
INSERT INTO `category` VALUES ('5', '图书音像');
INSERT INTO `category` VALUES ('6', '母婴孕婴');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_0001`(`pid`) USING BTREE,
  INDEX `fk_0002`(`oid`) USING BTREE,
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('0f1e2f2b-b043-4534-8574-dafebd479aad', 1, 1299, '1', '36724cb8-d3e5-4ddc-b768-64242331919c');
INSERT INTO `orderitem` VALUES ('2033b043-37ea-411d-b211-fe7eb8cb9fd6', 1, 5499, '41', 'bb28749a-4681-47bb-9fb7-55fb5f368980');
INSERT INTO `orderitem` VALUES ('2a61cfef-8621-409f-a101-1faaeee1c520', 1, 3299, '37', '36724cb8-d3e5-4ddc-b768-64242331919c');
INSERT INTO `orderitem` VALUES ('38b415c4-9313-4f5c-b5a7-31d688931a7d', 1, 2298, '11', 'e32d6434-3f75-4599-a6c2-9db0ec50fef3');
INSERT INTO `orderitem` VALUES ('3c08b1a8-f3f7-43e9-a0d9-0fedd4bf79b9', 1, 5999, '42', 'dd2904df-184d-4b64-841e-6d9e871affc5');
INSERT INTO `orderitem` VALUES ('4f9f15ab-3a33-4191-add7-8c5fe1628fc7', 1, 2298, '11', '16f39d50-c126-408d-bd94-a1150b7df0a7');
INSERT INTO `orderitem` VALUES ('70d963bd-6be7-465b-afa4-19174e6da5fe', 1, 1799, '6', '36724cb8-d3e5-4ddc-b768-64242331919c');
INSERT INTO `orderitem` VALUES ('8a8eac9b-43e0-486c-89a0-ec78e4b50c8a', 6, 15594, '10', '541fb4b9-0cd7-4f01-81f0-99a1c30bf63e');
INSERT INTO `orderitem` VALUES ('8de23507-52c7-4e67-974b-91b36bfedae4', 1, 5499, '41', '16f39d50-c126-408d-bd94-a1150b7df0a7');
INSERT INTO `orderitem` VALUES ('9e7c71c7-a8fa-4a2c-8946-4df278f66978', 1, 2699, '2', '54798af8-fbea-4daf-9766-33cb907d869e');
INSERT INTO `orderitem` VALUES ('a96543b3-5ca1-43f1-ad39-c69509e3fef8', 10, 48990, '47', '36724cb8-d3e5-4ddc-b768-64242331919c');
INSERT INTO `orderitem` VALUES ('aeccee46-f40c-4c27-bc29-bbd20ae852d8', 1, 2599, '10', '2aefa9a6-b212-46b4-a982-170f1a3237ae');
INSERT INTO `orderitem` VALUES ('b0addb7d-baed-440f-87f1-615894446d75', 1, 2599, '10', 'b55d156c-3442-4f9e-bcf8-00d12dd56da3');
INSERT INTO `orderitem` VALUES ('b43adb68-e649-44b1-9f2c-9e7788748d98', 1, 1699, '23', 'e32d6434-3f75-4599-a6c2-9db0ec50fef3');
INSERT INTO `orderitem` VALUES ('bfe2ae3d-d56c-41d5-b966-44483e3efdcc', 1, 2499, '13', '541fb4b9-0cd7-4f01-81f0-99a1c30bf63e');
INSERT INTO `orderitem` VALUES ('d99d3518-aff7-40f9-bfd4-81715984f8e4', 1, 2599, '10', 'e32d6434-3f75-4599-a6c2-9db0ec50fef3');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('16f39d50-c126-408d-bd94-a1150b7df0a7', '2021-12-17 15:16:59', 7797, 0, '广州', '张三', '15600000000', '858cfec2-8832-4a0c-9afb-e050baff924b');
INSERT INTO `orders` VALUES ('2aefa9a6-b212-46b4-a982-170f1a3237ae', '2020-10-10 22:57:37', 2599, 0, '3333', '3333', '3333', '1c3366f5-a892-492c-ad15-33875d4bf8f7');
INSERT INTO `orders` VALUES ('36724cb8-d3e5-4ddc-b768-64242331919c', '2020-10-10 23:12:55', 55387, 0, '55555', '5555', '55555', 'a178bc00-d68c-45ce-bf42-e0de926083f2');
INSERT INTO `orders` VALUES ('541fb4b9-0cd7-4f01-81f0-99a1c30bf63e', '2019-11-24 23:21:24', 18093, 0, '1231231', '1231', '12312', 'e38c5e16-3de8-4578-a9ab-251d6196b10b');
INSERT INTO `orders` VALUES ('54798af8-fbea-4daf-9766-33cb907d869e', '2019-11-24 23:16:22', 2699, 0, '123312', '12321', '123123', 'e38c5e16-3de8-4578-a9ab-251d6196b10b');
INSERT INTO `orders` VALUES ('b55d156c-3442-4f9e-bcf8-00d12dd56da3', '2020-07-14 18:23:41', 2599, 0, '11', '111', '11', 'f55b7d3a352a4f0782c910b2c70f1ea4');
INSERT INTO `orders` VALUES ('bb28749a-4681-47bb-9fb7-55fb5f368980', '2021-12-17 15:16:18', 5499, 0, '广州', '张三', '15600000000', '858cfec2-8832-4a0c-9afb-e050baff924b');
INSERT INTO `orders` VALUES ('dd2904df-184d-4b64-841e-6d9e871affc5', '2019-12-09 11:08:44', 5999, 0, 'gfggg', '田艳梅', '123123', '00a70fad-8640-4255-8b90-b39d4b4586da');
INSERT INTO `orders` VALUES ('e32d6434-3f75-4599-a6c2-9db0ec50fef3', '2019-11-11 19:33:03', 6596, 0, '123', '23', '11123', '8550fa15-a9fa-4b0f-9027-2493f1ce1cc1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `pimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdate` date NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pflag` int(11) NULL DEFAULT NULL,
  `cid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `sfk_0001`(`cid`) USING BTREE,
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小米 4c 标准版', 1399, 1299, 'products/1/c_0001.jpg', '2015-11-02', 1, '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', 0, '1');
INSERT INTO `product` VALUES ('10', '华为 Ascend Mate7', 2699, 2599, 'products/1/c_0010.jpg', '2015-11-02', 1, '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', 0, '1');
INSERT INTO `product` VALUES ('11', 'vivo X5Pro', 2399, 2298, 'products/1/c_0014.jpg', '2015-11-02', 1, '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', 0, '1');
INSERT INTO `product` VALUES ('12', '努比亚（nubia）My 布拉格', 1899, 1799, 'products/1/c_0013.jpg', '2015-11-02', 0, '努比亚（nubia）My 布拉格 银白 移动联通4G手机 双卡双待【嗨11，下单立减100】金属机身，快速充电！布拉格相机全新体验！', 0, '1');
INSERT INTO `product` VALUES ('13', '华为 麦芒4', 2599, 2499, 'products/1/c_0012.jpg', '2015-11-02', 1, '华为 麦芒4 晨曦金 全网通版4G手机 双卡双待金属机身 2.5D弧面屏 指纹解锁 光学防抖', 0, '1');
INSERT INTO `product` VALUES ('14', 'vivo X5M', 1899, 1799, 'products/1/c_0011.jpg', '2015-11-02', 0, 'vivo X5M 移动4G手机 双卡双待 香槟金【购机送蓝牙耳机+蓝牙自拍杆】5.0英寸大屏显示·八核双卡双待·Hi-Fi移动KTV', 0, '1');
INSERT INTO `product` VALUES ('15', 'Apple iPhone 6 (A1586)', 4399, 4288, 'products/1/c_0015.jpg', '2015-11-02', 1, 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', 0, '1');
INSERT INTO `product` VALUES ('16', '华为 HUAWEI Mate S 臻享版', 4200, 4087, 'products/1/c_0016.jpg', '2015-11-03', 0, '华为 HUAWEI Mate S 臻享版 手机 极昼金 移动联通双4G(高配)满星评价即返30元话费啦；买就送电源+清水套+创意手机支架；优雅弧屏，mate7升级版', 0, '1');
INSERT INTO `product` VALUES ('17', '索尼(SONY) E6533 Z3+', 4099, 3999, 'products/1/c_0017.jpg', '2015-11-02', 0, '索尼(SONY) E6533 Z3+ 双卡双4G手机 防水防尘 涧湖绿索尼z3专业防水 2070万像素 移动联通双4G', 0, '1');
INSERT INTO `product` VALUES ('18', 'HTC One M9+', 3599, 3499, 'products/1/c_0018.jpg', '2015-11-02', 0, 'HTC One M9+（M9pw） 金银汇 移动联通双4G手机5.2英寸，8核CPU，指纹识别，UltraPixel超像素前置相机+2000万/200万后置双镜头相机！降价特卖，惊喜不断！', 0, '1');
INSERT INTO `product` VALUES ('19', 'HTC Desire 826d 32G 臻珠白', 1599, 1469, 'products/1/c_0020.jpg', '2015-11-02', 1, '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', 0, '1');
INSERT INTO `product` VALUES ('2', '中兴 AXON', 2899, 2699, 'products/1/c_0002.jpg', '2015-11-05', 1, '中兴 AXON 天机 mini 压力屏版 B2015 华尔金 移动联通电信4G 双卡双待', 0, '1');
INSERT INTO `product` VALUES ('20', '小米 红米2A 增强版 白色', 649, 549, 'products/1/c_0019.jpg', '2015-11-02', 0, '新增至2GB 内存+16GB容量！4G双卡双待，联芯 4 核 1.5GHz 处理器！', 0, '1');
INSERT INTO `product` VALUES ('21', '魅族 魅蓝note2 16GB 白色', 1099, 999, 'products/1/c_0021.jpg', '2015-11-02', 0, '现货速抢，抢完即止！5.5英寸1080P分辨率屏幕，64位八核1.3GHz处理器，1300万像素摄像头，双色温双闪光灯！', 0, '1');
INSERT INTO `product` VALUES ('22', '三星 Galaxy S5 (G9008W) 闪耀白', 2099, 1999, 'products/1/c_0022.jpg', '2015-11-02', 1, '5.1英寸全高清炫丽屏，2.5GHz四核处理器，1600万像素', 0, '1');
INSERT INTO `product` VALUES ('23', 'sonim XP7700 4G手机', 1799, 1699, 'products/1/c_0023.jpg', '2015-11-09', 1, '三防智能手机 移动/联通双4G 安全 黑黄色 双4G美国军工IP69 30天长待机 3米防水防摔 北斗', 0, '1');
INSERT INTO `product` VALUES ('24', '努比亚（nubia）Z9精英版 金色', 3988, 3888, 'products/1/c_0024.jpg', '2015-11-02', 1, '移动联通电信4G手机 双卡双待真正的无边框！金色尊贵版！4GB+64GB大内存！', 0, '1');
INSERT INTO `product` VALUES ('25', 'Apple iPhone 6 Plus (A1524) 16GB 金色', 5188, 4988, 'products/1/c_0025.jpg', '2015-11-02', 0, 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', 0, '1');
INSERT INTO `product` VALUES ('26', 'Apple iPhone 6s (A1700) 64G 玫瑰金色', 6388, 6088, 'products/1/c_0026.jpg', '2015-11-02', 0, 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', 0, '1');
INSERT INTO `product` VALUES ('27', '三星 Galaxy Note5（N9200）32G版', 5588, 5388, 'products/1/c_0027.jpg', '2015-11-02', 0, '旗舰机型！5.7英寸大屏，4+32G内存！不一样的SPen更优化的浮窗指令！赠无线充电板！', 0, '1');
INSERT INTO `product` VALUES ('28', '三星 Galaxy S6 Edge+（G9280）32G版 铂光金', 5999, 5888, 'products/1/c_0028.jpg', '2015-11-02', 0, '赠移动电源+自拍杆+三星OTG金属U盘+无线充电器+透明保护壳', 0, '1');
INSERT INTO `product` VALUES ('29', 'LG G4（H818）陶瓷白 国际版', 3018, 2978, 'products/1/c_0029.jpg', '2015-11-02', 0, '李敏镐代言，F1.8大光圈1600万后置摄像头，5.5英寸2K屏，3G+32G内存，LG年度旗舰机！', 0, '1');
INSERT INTO `product` VALUES ('3', '华为荣耀6', 1599, 1499, 'products/1/c_0003.jpg', '2015-11-02', 0, '荣耀 6 (H60-L01) 3GB内存标准版 黑色 移动4G手机', 0, '1');
INSERT INTO `product` VALUES ('30', '微软(Microsoft) Lumia 640 LTE DS (RM-1113)', 1099, 999, 'products/1/c_0030.jpg', '2015-11-02', 0, '微软首款双网双卡双4G手机，5.0英寸高清大屏，双网双卡双4G！', 0, '1');
INSERT INTO `product` VALUES ('31', '宏碁（acer）ATC705-N50 台式电脑', 2399, 2299, 'products/1/c_0031.jpg', '2015-11-02', 0, '爆款直降，满千减百，品质宏碁，特惠来袭，何必苦等11.11，早买早便宜！', 0, '2');
INSERT INTO `product` VALUES ('32', 'Apple MacBook Air MJVE2CH/A 13.3英寸', 6788, 6688, 'products/1/c_0032.jpg', '2015-11-02', 0, '宽屏笔记本电脑 128GB 闪存', 0, '2');
INSERT INTO `product` VALUES ('33', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)', 4399, 4199, 'products/1/c_0033.jpg', '2015-11-02', 0, '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', 0, '2');
INSERT INTO `product` VALUES ('34', '联想（Lenovo）小新V3000经典版', 4599, 4499, 'products/1/c_0034.jpg', '2015-11-02', 0, '14英寸超薄笔记本电脑（i7-5500U 4G 500G+8G SSHD 2G独显 全高清屏）黑色满1000減100，狂减！火力全开，横扫3天！', 0, '2');
INSERT INTO `product` VALUES ('35', '华硕（ASUS）经典系列R557LI', 3799, 3699, 'products/1/c_0035.jpg', '2015-11-02', 0, '15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', 0, '2');
INSERT INTO `product` VALUES ('36', '华硕（ASUS）X450J', 4599, 4399, 'products/1/c_0036.jpg', '2015-11-02', 0, '14英寸笔记本电脑 （i5-4200H 4G 1TB GT940M 2G独显 蓝牙4.0 D刻 Win8.1 黑色）', 0, '2');
INSERT INTO `product` VALUES ('37', '戴尔（DELL）灵越 飞匣3000系列', 3399, 3299, 'products/1/c_0037.jpg', '2015-11-03', 0, ' Ins14C-4528B 14英寸笔记本（i5-5200U 4G 500G GT820M 2G独显 Win8）黑', 0, '2');
INSERT INTO `product` VALUES ('38', '惠普(HP)WASD 暗影精灵', 5699, 5499, 'products/1/c_0038.jpg', '2015-11-02', 0, '15.6英寸游戏笔记本电脑(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G独显 Win10)', 0, '2');
INSERT INTO `product` VALUES ('39', 'Apple 配备 Retina 显示屏的 MacBook', 11299, 10288, 'products/1/c_0039.jpg', '2015-11-02', 0, 'Pro MF840CH/A 13.3英寸宽屏笔记本电脑 256GB 闪存', 0, '2');
INSERT INTO `product` VALUES ('4', '联想 P1', 2199, 1999, 'products/1/c_0004.jpg', '2015-11-02', 0, '联想 P1 16G 伯爵金 移动联通4G手机充电5分钟，通话3小时！科技源于超越！品质源于沉淀！5000mAh大电池！高端商务佳配！', 0, '1');
INSERT INTO `product` VALUES ('40', '机械革命（MECHREVO）MR X6S-M', 6799, 6599, 'products/1/c_0040.jpg', '2015-11-02', 0, '15.6英寸游戏本(I7-4710MQ 8G 64GSSD+1T GTX960M 2G独显 IPS屏 WIN7)黑色', 0, '2');
INSERT INTO `product` VALUES ('41', '神舟（HASEE） 战神K660D-i7D2', 5699, 5499, 'products/1/c_0041.jpg', '2015-11-02', 0, '15.6英寸游戏本(i7-4710MQ 8G 1TB GTX960M 2G独显 1080P)黑色', 0, '2');
INSERT INTO `product` VALUES ('42', '微星（MSI）GE62 2QC-264XCN', 6199, 5999, 'products/1/c_0042.jpg', '2015-11-02', 0, '15.6英寸游戏笔记本电脑（i5-4210H 8G 1T GTX960MG DDR5 2G 背光键盘）黑色', 0, '2');
INSERT INTO `product` VALUES ('43', '雷神（ThundeRobot）G150S', 5699, 5499, 'products/1/c_0043.jpg', '2015-11-02', 0, '15.6英寸游戏本 ( i7-4710MQ 4G 500G GTX950M 2G独显 包无亮点全高清屏) 金', 0, '2');
INSERT INTO `product` VALUES ('44', '惠普（HP）轻薄系列 HP', 3199, 3099, 'products/1/c_0044.jpg', '2015-11-02', 0, '15-r239TX 15.6英寸笔记本电脑（i5-5200U 4G 500G GT820M 2G独显 win8.1）金属灰', 0, '2');
INSERT INTO `product` VALUES ('45', '未来人类（Terrans Force）T5', 10999, 9899, 'products/1/c_0045.jpg', '2015-11-02', 0, '15.6英寸游戏本（i7-5700HQ 16G 120G固态+1TB GTX970M 3G GDDR5独显）黑', 0, '2');
INSERT INTO `product` VALUES ('46', '戴尔（DELL）Vostro 3800-R6308 台式电脑', 3299, 3199, 'products/1/c_0046.jpg', '2015-11-02', 0, '（i3-4170 4G 500G DVD 三年上门服务 Win7）黑', 0, '2');
INSERT INTO `product` VALUES ('47', '联想（Lenovo）H3050 台式电脑', 5099, 4899, 'products/1/c_0047.jpg', '2015-11-11', 0, '（i5-4460 4G 500G GT720 1G独显 DVD 千兆网卡 Win10）23英寸', 0, '2');
INSERT INTO `product` VALUES ('48', 'Apple iPad mini 2 ME279CH/A', 2088, 1888, 'products/1/c_0048.jpg', '2015-11-02', 0, '（配备 Retina 显示屏 7.9英寸 16G WLAN 机型 银色）', 0, '2');
INSERT INTO `product` VALUES ('49', '小米（MI）7.9英寸平板', 1399, 1299, 'products/1/c_0049.jpg', '2015-11-02', 0, 'WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视网膜屏 800W）白色', 0, '2');
INSERT INTO `product` VALUES ('5', '摩托罗拉 moto x（x+1）', 1799, 1699, 'products/1/c_0005.jpg', '2015-11-01', 0, '摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 全网通4G手机11月11天！MOTO X震撼特惠来袭！1699元！带你玩转黑科技！天然材质，原生流畅系统！', 0, '1');
INSERT INTO `product` VALUES ('50', 'Apple iPad Air 2 MGLW2CH/A', 2399, 2299, 'products/1/c_0050.jpg', '2015-11-12', 0, '（9.7英寸 16G WLAN 机型 银色）', 0, '2');
INSERT INTO `product` VALUES ('6', '魅族 MX5 16GB 银黑色', 1899, 1799, 'products/1/c_0006.jpg', '2015-11-02', 0, '魅族 MX5 16GB 银黑色 移动联通双4G手机 双卡双待送原厂钢化膜+保护壳+耳机！5.5英寸大屏幕，3G运行内存，2070万+500万像素摄像头！长期省才是真的省！', 0, '1');
INSERT INTO `product` VALUES ('7', '三星 Galaxy On7', 1499, 1398, 'products/1/c_0007.jpg', '2015-11-14', 0, '三星 Galaxy On7（G6000）昂小七 金色 全网通4G手机 双卡双待新品火爆抢购中！京东尊享千元良机！5.5英寸高清大屏！1300+500W像素！评价赢30元话费券！', 0, '1');
INSERT INTO `product` VALUES ('8', 'NUU NU5', 1288, 1190, 'products/1/c_0008.jpg', '2015-11-02', 0, 'NUU NU5 16GB 移动联通双4G智能手机 双卡双待 晒单有礼 晨光金香港品牌 2.5D弧度前后钢化玻璃 随机附赠手机套+钢化贴膜 晒单送移动电源+蓝牙耳机', 0, '1');
INSERT INTO `product` VALUES ('9', '乐视（Letv）乐1pro（X800）', 2399, 2299, 'products/1/c_0009.jpg', '2015-11-02', 0, '乐视（Letv）乐1pro（X800）64GB 金色 移动联通4G手机 双卡双待乐视生态UI+5.5英寸2K屏+高通8核处理器+4GB运行内存+64GB存储+1300万摄像头！', 0, '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('00a70fad-8640-4255-8b90-b39d4b4586da', 'tym', '123456', '田艳梅', '1039319058@qq.com', '123123', '2019-01-31', '女', 1, '4fe4a236-6b6d-405b-aef6-bc6a44608dc9');
INSERT INTO `user` VALUES ('11eacf5b-5f20-4c60-88dc-9ccd2fe05d07', 'htht', '111111', '1111', '2285016799@qq.com', '111', '2019-11-22', '男', 0, '1e854536-87ec-42d4-8b7e-a05532bc7f19');
INSERT INTO `user` VALUES ('1c3366f5-a892-492c-ad15-33875d4bf8f7', '123456', '123456', '123456', '2285016799@qq.com', '11111', '2020-10-01', '男', 1, '17a5811a-c21c-4be1-b41c-46ce995c3aa5');
INSERT INTO `user` VALUES ('373eb242933b4f5ca3bd43503c34668b', 'ccc', 'ccc', 'aaa', 'bbb@store.com', '15723689921', '2015-11-04', '男', 0, '9782f3e837ff422b9aee8b6381ccf927bdd9d2ced10d48f4ba4b9f187edf7738');
INSERT INTO `user` VALUES ('3c0a57e9-7512-4fe6-97eb-317ac568559b', '111111111111', '2222', '2222', '2285016799@qq.com', '222222', '2020-10-09', '男', 0, '3acf5b12-af68-4b58-86b9-e8eccfb82b4f');
INSERT INTO `user` VALUES ('3ca76a75e4f64db2bacd0974acc7c897', 'bb', 'bb', '张三', 'bbb@store.com', '15723689921', '1990-02-01', '男', 0, '1258e96181a9457987928954825189000bae305094a042d6bd9d2d35674684e6');
INSERT INTO `user` VALUES ('48118e3f-5df8-4ade-b419-e9387d6db8a5', '111', 'www', '111', '2285016799@qq.com', '111111', '2020-07-09', '男', 0, '3419596f-bcd0-4638-8ae3-4410cc81a6c6');
INSERT INTO `user` VALUES ('53af1ccd-c475-41cd-9639-0a9dfae9afdc', 'admin', 'admin', '管理员', '1569962464@qq.com', '13598561284', '2018-01-20', '女', 0, '75e00c56-aad0-462d-94e1-1afc98a817a8');
INSERT INTO `user` VALUES ('62145f6e66ea4f5cbe7b6f6b954917d3', 'cc', 'cc', '张三', 'bbb@store.com', '15723689921', '2015-11-03', '男', 0, '19f100aa81184c03951c4b840a725b6a98097aa1106a4a38ba1c29f1a496c231');
INSERT INTO `user` VALUES ('7f90cf3f-4cdd-4c76-8d8b-2b5a254852bc', '11111', '111111', '111', '11111@qq.com', '111111', '2020-07-16', '男', 0, 'e75b108a-050b-4941-bacd-4097fc46129d');
INSERT INTO `user` VALUES ('7f962d75-6272-41c1-b0e2-3767d5b0d35f', 'admin', 'admin', '管理员', '1569962464@qq.com', '13598561284', '2017-03-16', '女', 1, '510196f2-c344-4cef-be1c-8147ee4e6046');
INSERT INTO `user` VALUES ('8550fa15-a9fa-4b0f-9027-2493f1ce1cc1', 'hththt', '123456', '黄通', '2285016799@qq.com', '1111111', '2019-11-06', '男', 1, '75876ba0-9b0a-4e56-82bc-eb11a7597028');
INSERT INTO `user` VALUES ('858cfec2-8832-4a0c-9afb-e050baff924b', 'ZhangSan', '123456', '张三', '1569962464@qq.com', '15600000000', '2021-12-01', '男', 1, '1c16b8c7-5560-4719-a42e-bfbc7c4b35e3');
INSERT INTO `user` VALUES ('8663057a-c5f0-40c6-b8ec-9d8c764e4477', '11111', '111111', '111', '11111@qq.com', '111111', '2020-07-16', '男', 0, 'ee417fa1-baff-4f0d-9062-9e745d482095');
INSERT INTO `user` VALUES ('86f35f19-a33c-4ea6-a8ac-9c9b02ba23db', '111', '111', '111', '2285016799@qq.com', '111111', '2020-07-09', '男', 0, 'ec36ab84-08be-4899-9c8a-e07cebe8540f');
INSERT INTO `user` VALUES ('8972c165-a482-4cd7-ba39-ef18f5cfb123', '111', '222', '111', '2285016799@qq.com', '111111', '2020-07-09', '男', 0, 'ff43246c-fca2-4c18-a49d-5ad986953144');
INSERT INTO `user` VALUES ('a178bc00-d68c-45ce-bf42-e0de926083f2', '888888', '888888', '888888', '2285016799@qq.com', '888888', '2020-10-01', '男', 1, '82d57318-a478-4209-b3c9-90758bd640a5');
INSERT INTO `user` VALUES ('aab5586e-7f4f-46e8-a8e7-dee04a56287c', '111', '333', '111', '2285016799@qq.com', '111111', '2020-07-09', '男', 0, '14351232-25be-4dcf-b3c6-74a480c9cd21');
INSERT INTO `user` VALUES ('c95b15a864334adab3d5bb6604c6e1fc', 'bbb', 'bbb', '老王', 'bbb@store.com', '15712344823', '2000-02-01', '男', 0, '71a3a933353347a4bcacff699e6baa9c950a02f6b84e4f6fb8404ca06febfd6f');
INSERT INTO `user` VALUES ('cba25533-9798-490a-ba3d-337bc9bb32e4', '111', '2222', '111', '2285016799@qq.com', '111111', '2020-07-09', '男', 0, 'f3bb3737-1b15-4c48-8c69-222e0e22be8a');
INSERT INTO `user` VALUES ('e38c5e16-3de8-4578-a9ab-251d6196b10b', 'zl', '111111', '这里', '1039319058@qq.com', '1111111111', '2019-11-29', '男', 1, '4b66896a-f4ed-45ba-a5d2-e27eb09576e4');
INSERT INTO `user` VALUES ('e9cd862c-449b-442f-a7e7-9b3672c594a6', '333', '333', '333', '1014697293@qq.com', '333', NULL, '男', 0, 'bb5bbd6c-c923-4df8-8b59-d2e8089d8f7f');
INSERT INTO `user` VALUES ('f20b7d3d-cf29-4bd4-ac20-820f7a40c7fc', '11111', '111111', '111', '11111@qq.com', '111111', '2020-07-16', '男', 0, 'e24b92d8-e042-4685-8579-f1eab1cb0611');
INSERT INTO `user` VALUES ('f55b7d3a352a4f0782c910b2c70f1ea4', 'aaa', 'aaa', '小王', 'aaa@store.com', '15712344823', '2000-02-01', '男', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
