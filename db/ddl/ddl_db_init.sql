-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-03-02 14:54:32
-- 服务器版本： 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dixin`
--
CREATE DATABASE IF NOT EXISTS `dixin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dixin`;
-- --------------------------------------------------------

--
-- 表的结构 `acttion`, 操作日志表
--

CREATE TABLE IF NOT EXISTS `acttion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `act_time` datetime NOT NULL COMMENT '操作时间',
  `user_id` int(11) NOT NULL COMMENT '操作人员',
  `action` tinyint(4) NOT NULL COMMENT '动作',
  `object_type` tinyint(4) NOT NULL COMMENT '被操作对象类型',
  `object_id` int(11) NOT NULL COMMENT '对象ID',
  `info` varchar(1024) NOT NULL COMMENT '操作描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `area`, 地区表
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '地区名称',
  `pid` int(11) NOT NULL DEFAULT '-1' COMMENT '父节点ID',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `assignment`,转让表
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_id` int(11) NOT NULL COMMENT '转让用户',
  `assign_date` date NOT NULL COMMENT '转让日期',
  `amount` double NOT NULL COMMENT '转让金额',
  `product_id` int(11) NOT NULL COMMENT '转让产品',
  `pay_type` int(11) NOT NULL COMMENT '付息方式',
  `assign_type` int(11) NOT NULL COMMENT '转让条件',
  `contactor` varchar(32) NOT NULL COMMENT '联系人',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `call_logs`，电话联系记录
--

CREATE TABLE IF NOT EXISTS `call_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `call_time` datetime NOT NULL COMMENT '联系日期时间',
  `call_from` int(11) NOT NULL COMMENT '来电用户',
  `call_to` int(11) NOT NULL COMMENT '去电用户',
  `msg` varchar(1024) NOT NULL COMMENT '通话信息',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `call_time` (`call_time`,`call_from`,`call_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `catogry` ，分类表
--

CREATE TABLE IF NOT EXISTS `catogry` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '产品分类名称',
  `type` tinyint(4) NOT NULL COMMENT '分类类型，根据字典表',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `catogry`,预先设置的分类
--

INSERT INTO `catogry` (`id`, `name`, `type`) VALUES
(0, '后台超级管理员', 1),
(1, '游客', 1),
(10, '注册用户', 1),
(20, '认证用户', 1),
(25, '后台用户', 1),
(31, '债券', 2),
(32, '银行理财', 2),
(33, '基金', 2),
(34, '券商理财', 2),
(35, '信托', 2),
(36, '资管', 2),
(42, '固定收益', 3),
(43, '浮动收益', 3),
(44, '添加', 5),
(45, '删除', 5),
(46, '更新', 5),
(47, '产品表', 6),
(48, '用户表', 6),
(49, '金融市场', 7),
(50, '公益', 7),
(51, '金融机构', 7),
(52, '房地产', 7),
(53, '工商企业', 7),
(54, '基础设施', 7),
(55, '实业企业', 7),
(56, '保障房', 7),
(57, '酒店类', 7),
(58, '其它', 7),
(59, '暂停', 8),
(60, '在售', 8),
(61, '预约', 8),
(62, '售罄', 8),
(63, '年', 10),
(64, '月', 10),
(65, '日', 10),
(66, '自然季度付息', 9),
(67, '自然半年度付息', 9),
(68, '自然年度付息', 9),
(69, '季度付息', 9),
(70, '半年度付息', 9),
(71, '年度付息', 9),
(72, '到期还本付息', 9),
(73, '其他付息方式', 9),
(74, '浮动收益类产品', 4),
(75, '固定收益类产品', 4),
(76, '其他', 4),
(77, '货币型', 7),
(78, '债券型', 7),
(79, '股票型', 7),
(80, '私募股权', 7),
(81, '定向增发', 7),
(82, '海外市场', 7),
(83, '量化对冲', 7),
(84, '指数型', 7),
(85, '新三版', 7),
(86, '结构型', 7),
(87, '混合型', 7),
(100, '银行', 11),
(101, '证券', 11),
(102, '保险', 11),
(103, '信托', 11);

-- --------------------------------------------------------

--
-- 表的结构 `dict`
--

CREATE TABLE IF NOT EXISTS `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '产品分类名称 ',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dict`
--

INSERT INTO `dict` (`id`, `name`) VALUES
(1, '用户权限分类'),
(2, '产品分类'),
(3, '收益分类'),
(4, '留言问题分类'),
(5, '操作分类'),
(6, '操作对象分类'),
(7, '资金投向'),
(8, '产品状态'),
(9, '利益分配方式'),
(10, '期限单位分类'),
(11, '金融机构分类');

-- --------------------------------------------------------

--
-- 表的结构 `financial_institution`，金融机构表
--

CREATE TABLE IF NOT EXISTS `financial_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '机构名称',
  `tel` varchar(16) NOT NULL COMMENT '联系电话',
  `info` text NOT NULL COMMENT '简介',
  `catogry_id` int(11) NOT NULL COMMENT '金融机构类别',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `financial_institution`
--

INSERT INTO `financial_institution` (`id`, `name`, `tel`, `info`, `catogry_id`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
(1, '中信证券股份有限公司', '010-6083603', '中信证券股份有限公司（以下简称“中信证券”或“公司”），于1995年10月25日在北京成立。2002年12月13日，经中国证券监督管理委员会核准，中信证券向社会公开发行4亿股普通A股股票，2003年1月6日在上海证券交易所挂牌上市交易，股票简称“中信证券”，股票代码"600030"。 2011年10月6日在香港联合交易所上市交易，股票代码为"6030"。', 101, 0, '2015-05-03 11:18:06', 0, '2015-05-03 11:18:06');

-- --------------------------------------------------------

--
-- 表的结构 `financial_manager`，专属金融经理表
--

CREATE TABLE IF NOT EXISTS `financial_manager` (
  `id` int(11) NOT NULL COMMENT '内部唯一ID',
  `fm_name` varchar(32) NOT NULL COMMENT '财务经理姓名',
  `info` text NOT NULL COMMENT '专属财务经理介绍',
  `title` varchar(64) NOT NULL COMMENT '职务',
  `education` varchar(64) NOT NULL COMMENT '学历',
  `certificate` varchar(32) NOT NULL COMMENT '证书编号',
  `institution_id` int(11) NOT NULL COMMENT '所属金融机构',
  `tel` varchar(16) NOT NULL COMMENT '电话',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `financial_manager`
--

INSERT INTO `financial_manager` (`id`, `fm_name`, `info`, `title`, `education`, `certificate`, `institution_id`, `tel`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES
(0, '李东伟', '详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介详细简介', '财务经理', '大学本科', '88888888888888', 1, '18888888888', 0, '2015-05-03 10:00:00', 0, '2015-05-03 12:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `message`，留言信息表
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `msg_id` int(11) NOT NULL COMMENT '维护留言ID',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `msg_time` datetime NOT NULL COMMENT '留言日期',
  `catogry_id` int(11) NOT NULL COMMENT '问题类别',
  `msg` varchar(1024) NOT NULL COMMENT '留言',
  `last_msg_id` int(11)  NOT NULL COMMENT '最后留言ID',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `permission`,权限表
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_id` int(11) NOT NULL COMMENT ' 用户id',
  `permission` int(11) NOT NULL COMMENT '用户权限',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product`，产品信息表
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部ID,唯一',
  `code` varchar(64) NOT NULL COMMENT '产品代码',
  `name` varchar(128) NOT NULL COMMENT '产品名称',
  `release_date` datetime NOT NULL COMMENT '发行时间,精确到分钟',
  `end_date` datetime NOT NULL COMMENT '销售截止日期',
  `b_delay` tinyint(1) NOT NULL COMMENT '产品是否延期',
  `delay_condition` text COMMENT '延期条件',
  `delay_term` int(11) NOT NULL COMMENT '延期期限',
  `delay_term_unit` tinyint(4) NOT NULL COMMENT '延期期限单位',
  `term` int(11) NOT NULL COMMENT '期限',
  `term_unit` tinyint(4) NOT NULL COMMENT '期限显示单位',
  `append_term` int(11) DEFAULT NULL COMMENT '续存期限',
  `append_term_unit` tinyint(4) DEFAULT NULL COMMENT '续存期限单位',
  `part_a` int(11) NOT NULL COMMENT 'A类份额',
  `rate_a` float NOT NULL COMMENT 'A类年华收益率',
  `part_b` int(11) NOT NULL COMMENT 'B类份额',
  `rate_b` float NOT NULL COMMENT 'B类年华收益率',
  `part_c` int(11) NOT NULL COMMENT 'C类份额',
  `rate_c` float NOT NULL COMMENT 'C类年华收益率',
  `part_d` int(11) NOT NULL COMMENT 'D类份额',
  `rate_d` float NOT NULL COMMENT 'D类收益率',
  `amount` double NOT NULL COMMENT '产品规模',
  `min_amount` double NOT NULL COMMENT '投资起点',
  `append_amount` double NOT NULL COMMENT '投资起点递增金额',
  `pay_type` int(11) NOT NULL COMMENT '利益分配方式',
  `pay_type_info` varchar(256) NOT NULL COMMENT '其他分配方式，在此以文字保存',
  `ad_file` varchar(256) NOT NULL COMMENT '产品推荐单页下载文件',
  `guide_file` varchar(256) NOT NULL COMMENT '定向客户认购指南文件',
  `star` int(1) NOT NULL COMMENT '推荐指数',
  `catogry_id` int(11) NOT NULL COMMENT '产品类别',
  `profit_id` int(11) NOT NULL COMMENT '收益类型',
  `bonus_type` int(11) NOT NULL COMMENT '分红方式',
  `direction` int(11) NOT NULL COMMENT '投资方向',
  `buy_fee` varchar(256) DEFAULT NULL COMMENT '产品认购费',
  `close_term` int(11) NOT NULL DEFAULT '0' COMMENT '封闭期限',
  `close_term_unit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '封闭期限单位，年月日',
  `fund_manager` varchar(64) DEFAULT NULL COMMENT '基金经理姓名',
  `fund_manager_url` varchar(256) DEFAULT NULL COMMENT '基金经理介绍的网页链接',
  `manage_fee` float NOT NULL DEFAULT '0' COMMENT '管理费',
  `open_day` varchar(256) DEFAULT NULL COMMENT '开放日',
  `bonus` varchar(256) DEFAULT NULL COMMENT '业绩提成',
  `sell_fee` varchar(256) DEFAULT NULL COMMENT '退出费用',
  `info` text NOT NULL COMMENT '资管要素HTML文件',
  `view_num` int(11) NOT NULL COMMENT '查看次数',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`name`),
  KEY `catogry_id` (`catogry_id`),
  KEY `direction` (`direction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `purchase`,产品购买信息表
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_id` int(11) NOT NULL COMMENT '购买用户',
  `buy_date` date NOT NULL COMMENT '购买日期',
  `product_id` int(11) NOT NULL COMMENT '购买产品',
  `volume` int(11) DEFAULT NULL COMMENT '购买份额',
  `amount` int(11) NOT NULL COMMENT '购买金额',
  `institution_id` int(11) DEFAULT '0' COMMENT '营销机构',
  `pnl` double NOT NULL DEFAULT '0' COMMENT '浮动收益',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `reservation`,产品预约信息表
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_id` int(11) NOT NULL COMMENT '预约用户',
  `reserve_date` date NOT NULL COMMENT '预约日期',
  `product_id` int(11) NOT NULL COMMENT '预约产品',
  `tel` varchar(16) NOT NULL COMMENT '预约手机号码',
  `amount` double NOT NULL COMMENT '预约金额',
  `msg` varchar(1024) NOT NULL COMMENT '预约留言',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `risk_assessment`，风险评测表
--

CREATE TABLE IF NOT EXISTS `risk_assessment` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `option1` int(11) NOT NULL COMMENT '问题1',
  `option2` int(11) NOT NULL COMMENT '问题2',
  `option3` int(11) NOT NULL COMMENT '问题3',
  `option4` int(11) NOT NULL COMMENT '问题4',
  `option5` int(11) NOT NULL COMMENT '问题5',
  `option6` int(11) NOT NULL COMMENT '问题6',
  `option7` int(11) NOT NULL COMMENT '问题7',
  `option8` int(11) NOT NULL COMMENT '问题8',
  `option9` int(11) NOT NULL COMMENT '问题9',
  PRIMARY KEY (`id`),
   KEY `user_id` (`user_id`),
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `grade` int(11) NOT NULL COMMENT '总分'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='风险评测表';


-- --------------------------------------------------------
--
-- 表的结构 `user`，用户表
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `user_name` varchar(64) COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `user_type` int(11) NOT NULL COMMENT '是客户还是后台管理用户',
  `enabled` tinyint(1) NOT NULL COMMENT '是否有效',
  `reg_date` date NOT NULL COMMENT '注册日期',
  `name` varchar(64) COMMENT '姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号',
  `area_id` int(11) COMMENT '地区ID',
  `address` varchar(256) COMMENT '地址',
  `zip_code` varchar(32) COMMENT '邮编',
  `qq` varchar(32) COMMENT 'QQ号码',
  `id_card` varchar(128) COMMENT '身份证照片',
  `account` varchar(64) COMMENT '资金账号',
  `institution_id` int(11) COMMENT '证券公司',
  `start_date` date COMMENT '认证开始日期',
  `term` int(11) COMMENT '期限',
  `auth_type` int(11) COMMENT '认证类别',
  `fm_id` int(11) NOT NULL COMMENT '财务经理ID',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fm_id` (`fm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 初始化超管用户
--

insert into `user`(user_name, password, user_type, enabled, reg_date, mobile, create_user, create_time, update_user, update_time) values('root', PASSWORD('ourdixn521'), 0, 0, SYSDATE(), 0, 0, SYSDATE(), 0, SYSDATE());
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
