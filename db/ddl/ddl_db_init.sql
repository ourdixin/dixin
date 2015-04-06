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
(1, '游客', 1),
(10, '注册用户', 1),
(20, '认证用户', 1),
(25, '后台用户', 1),
(0, '后台超级管理员', 1),
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
(48, '用户表', 6);

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
(6, '操作对象分类');

-- --------------------------------------------------------

--
-- 表的结构 `financial_institution`，金融机构表
--

CREATE TABLE IF NOT EXISTS `financial_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部唯一ID',
  `name` varchar(64) NOT NULL COMMENT '机构名称',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  `info` varchar(256) NOT NULL COMMENT '简介',
  `catogry_id` int(11) NOT NULL COMMENT '金融机构类别',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `financial_manager`，专属金融经理表
--

CREATE TABLE IF NOT EXISTS `financial_manager` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `info` varchar(256) NOT NULL COMMENT '专属财务经理介绍',
  `title` varchar(64) NOT NULL COMMENT '职务',
  `education` varchar(64) NOT NULL COMMENT '学历',
  `certificate` varchar(32) NOT NULL COMMENT '证书编号',
  `institution_id` int(11) NOT NULL COMMENT '所属金融机构',
  `tel` varchar(11) NOT NULL COMMENT '电话',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `release_date` date NOT NULL COMMENT '发行时间',
  `term` int(11) NOT NULL COMMENT '期限',
  `part_a` int(11) NOT NULL COMMENT 'A类份额',
  `rate_a` float NOT NULL COMMENT 'A类年华收益率',
  `part_b` int(11) NOT NULL COMMENT 'B类份额',
  `rate_b` float NOT NULL COMMENT 'B类年华收益率',
  `part_c` int(11) NOT NULL COMMENT 'C类份额',
  `rate_c` float NOT NULL COMMENT 'C类年华收益率',
  `amount` double NOT NULL COMMENT '产品规模',
  `min_amount` double NOT NULL COMMENT '投资起点',
  `pay_type` int(11) NOT NULL COMMENT '利益分配方式',
  `ad_file` varchar(256) NOT NULL COMMENT '产品推荐单页下载文件',
  `guide_file` varchar(256) NOT NULL COMMENT '定向客户认购指南文件',
  `state` int(2) NOT NULL COMMENT '状态',
  `star` int(1) NOT NULL COMMENT '推荐指数',
  `catogry_id` int(11) NOT NULL COMMENT '产品类别',
  `profit_id` int(11) NOT NULL COMMENT '收益类型',
  `bonus_type` int(11) NOT NULL COMMENT '分红方式',
  `info` varchar(256) NOT NULL COMMENT '资管要素HTML文件',
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
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
  `user_id` int(11) NOT NULL COMMENT '购买用户',
  `buy_date` date NOT NULL COMMENT '购买日期',
  `product_id` int(11) NOT NULL COMMENT '购买产品',
  `volume` int(11) NOT NULL COMMENT '购买数量',
  `amount` int(11) NOT NULL COMMENT '购买金额',
  `institution_id` int(11) NOT NULL COMMENT '营销机构',
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
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
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
  `create_user` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 初始化超管用户
--

insert into `user`(user_name, password, user_type, enabled, reg_date, mobile, create_user, create_time, update_user, update_time) values('root', PASSWORD('ourdixn521'), 0, 0, SYSDATE(), 0, 0, SYSDATE(), 0, SYSDATE());
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
