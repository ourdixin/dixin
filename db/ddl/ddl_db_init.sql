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
-- 表的结构 `area`, 地区表
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '地区名称',
  `pid` int(11) NOT NULL DEFAULT '-1' COMMENT '父节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `assignment`,转让表
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `userid` int(11) NOT NULL COMMENT '转让用户',
  `assigndate` date NOT NULL COMMENT '转让日期',
  `amount` double NOT NULL COMMENT '转让金额',
  `productid` int(11) NOT NULL COMMENT '转让产品',
  `paytype` int(11) NOT NULL COMMENT '付息方式',
  `assigntype` int(11) NOT NULL COMMENT '转让条件',
  `contactor` varchar(32) NOT NULL COMMENT '联系人',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `calllogs`，电话联系记录
--

CREATE TABLE IF NOT EXISTS `calllogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `calltime` datetime NOT NULL COMMENT '联系日期时间',
  `callfrom` int(11) NOT NULL COMMENT '来电用户',
  `callto` int(11) NOT NULL COMMENT '去电用户',
  `msg` varchar(1024) NOT NULL COMMENT '通话信息',
  PRIMARY KEY (`id`),
  KEY `datetime` (`calltime`,`callfrom`,`callto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `catogry` ，分类表
--

CREATE TABLE IF NOT EXISTS `catogry` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '产品分类名称',
  `type` tinyint(4) NOT NULL COMMENT '分类类型，根据字典表',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `catogry`,预先设置的分类
--

INSERT INTO `catogry` (`id`, `name`, `type`) VALUES
(1, '游客', 1),
(10, '注册用户', 1),
(20, '认证用户', 1),
(25, '后台用户', 1),
(30, '后台超级管理员', 1),
(31, '债券', 2),
(32, '银行理财', 2),
(33, '基金', 2),
(34, '券商理财', 2),
(35, '信托', 2),
(36, '资管', 2),
(42, '固定收益', 3),
(43, '浮动收益', 3);

-- --------------------------------------------------------

--
-- 表的结构 `dict`
--

CREATE TABLE IF NOT EXISTS `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '产品分类名称 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dict`
--

INSERT INTO `dict` (`id`, `name`) VALUES
(1, '用户权限分类'),
(2, '产品分类'),
(3, '收益分类'),
(4, '留言问题分类');

-- --------------------------------------------------------

--
-- 表的结构 `financialinstitution`，金融机构表
--

CREATE TABLE IF NOT EXISTS `financialinstitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '机构名称',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  `info` varchar(256) NOT NULL COMMENT '简介',
  `catogryid` int(11) NOT NULL COMMENT '金融机构类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `financialmanager`，专属金融经理表
--

CREATE TABLE IF NOT EXISTS `financialmanager` (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `info` varchar(256) NOT NULL COMMENT '专属财务经理介绍',
  `title` varchar(64) NOT NULL COMMENT '职务',
  `education` varchar(64) NOT NULL COMMENT '学历',
  `certificate` varchar(32) NOT NULL COMMENT '证书编号',
  `fiid` int(11) NOT NULL COMMENT '所属金融机构',
  `tel` varchar(11) NOT NULL COMMENT '电话',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `message`，留言信息表
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `msgid` int(11) NOT NULL COMMENT '维护留言ID',
  `userid` int(11) NOT NULL COMMENT '用户',
  `msgtime` datetime NOT NULL COMMENT '留言日期',
  `catogryid` int(11) NOT NULL COMMENT '问题类别',
  `msg` varchar(1024) NOT NULL COMMENT '留言',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `permission`,权限表
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `permission` int(11) NOT NULL COMMENT '权限id',
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
  `release_date` date NOT NULL COMMENT '发行时间',
  `term` int(11) NOT NULL COMMENT '期限',
  `part_a` int(11) NOT NULL COMMENT 'A类份额',
  `rate_a` float NOT NULL COMMENT 'A类年华收益率',
  `part_b` int(11) NOT NULL COMMENT 'B类份额',
  `rate_b` float NOT NULL COMMENT 'B类年华收益率',
  `part_c` int(11) NOT NULL COMMENT 'C类份额',
  `rate_c` float NOT NULL COMMENT 'C类年华收益率',
  `amount` double NOT NULL COMMENT '产品规模',
  `mina_mount` double NOT NULL COMMENT '投资起点',
  `pay_type` int(11) NOT NULL COMMENT '利益分配方式',
  `ad_file` varchar(256) NOT NULL COMMENT '产品推荐单页下载文件',
  `guide_file` varchar(256) NOT NULL COMMENT '定向客户认购指南文件',
  `state` int(2) NOT NULL COMMENT '状态',
  `star` int(1) NOT NULL COMMENT '推荐指数',
  `catogry_id` int(11) NOT NULL COMMENT '产品类别',
  `profit_id` int(11) NOT NULL COMMENT '收益类型',
  `bonus_type` int(11) NOT NULL COMMENT '分红方式',
  `info` varchar(256) NOT NULL COMMENT '资管要素HTML文件',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`name`),
  KEY `catogry_id` (`catogry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `purchase`,产品购买信息表
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `userid` int(11) NOT NULL COMMENT '购买用户',
  `buydate` date NOT NULL COMMENT '购买日期',
  `productid` int(11) NOT NULL COMMENT '购买产品',
  `volume` int(11) NOT NULL COMMENT '购买数量',
  `amount` int(11) NOT NULL COMMENT '购买金额',
  `fiid` int(11) NOT NULL COMMENT '营销机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `reservation`,产品预约信息表
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `userid` int(11) NOT NULL COMMENT '预约用户',
  `reservedate` date NOT NULL COMMENT '预约日期',
  `productid` int(11) NOT NULL COMMENT '预约产品',
  `amount` double NOT NULL COMMENT '预约金额',
  `msg` varchar(1024) NOT NULL COMMENT '预约留言',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`，用户表
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `type` int(11) NOT NULL COMMENT '是客户还是后台管理用户',
  `enabled` tinyint(1) NOT NULL COMMENT '是否有效',
  `regdate` date NOT NULL COMMENT '注册日期',
  `name` int(11) NOT NULL COMMENT '姓名',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `areaid` int(11) NOT NULL COMMENT '地区ID',
  `address` varchar(256) NOT NULL COMMENT '地址',
  `zipcode` varchar(32) NOT NULL COMMENT '邮编',
  `QQ` varchar(32) NOT NULL COMMENT 'QQ号码',
  `idcard` varchar(128) NOT NULL COMMENT '身份证照片',
  `account` varchar(64) NOT NULL COMMENT '资金账号',
  `fiid` int(11) NOT NULL COMMENT '证券公司',
  `startdate` date NOT NULL COMMENT '认证开始日期',
  `term` int(11) NOT NULL COMMENT '期限',
  `authtype` int(11) NOT NULL COMMENT '认证类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
