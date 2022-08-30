/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50532
 Source Host           : localhost:3306
 Source Schema         : schoolmusic

 Target Server Type    : MySQL
 Target Server Version : 50532
 File Encoding         : 65001

 Date: 22/04/2022 16:30:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '歌曲id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '收藏的类型(0：歌曲，1：歌单）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '歌单id',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 1, 2, 0, '2022-02-07 20:31:28', NULL, 1);
INSERT INTO `collect` VALUES (3, 3, 2, 0, '2022-02-07 20:31:41', NULL, 1);
INSERT INTO `collect` VALUES (4, 1, 3, 0, '2022-03-22 23:30:01', NULL, 1);
INSERT INTO `collect` VALUES (5, 1, 4, 0, '2022-03-27 23:22:30', NULL, 1);
INSERT INTO `collect` VALUES (6, 1, 7, 0, '2022-03-27 23:22:46', NULL, 1);
INSERT INTO `collect` VALUES (7, 1, 9, 0, '2022-03-27 23:23:02', NULL, 1);
INSERT INTO `collect` VALUES (8, 1, 10, 0, '2022-03-27 23:44:01', NULL, 1);
INSERT INTO `collect` VALUES (9, 1, 11, 0, '2022-03-27 23:44:12', NULL, 1);
INSERT INTO `collect` VALUES (10, 1, 12, 0, '2022-03-27 23:44:22', NULL, 1);
INSERT INTO `collect` VALUES (11, 5, 7, 0, '2022-04-10 12:54:01', NULL, 1);
INSERT INTO `collect` VALUES (12, 5, 3, 0, '2022-04-10 12:57:02', NULL, 1);
INSERT INTO `collect` VALUES (13, 1, 13, 0, '2022-04-11 04:01:39', NULL, 1);
INSERT INTO `collect` VALUES (18, 11, 2, 1, '2022-04-20 00:09:24', NULL, 0);
INSERT INTO `collect` VALUES (19, 11, 9, 0, '2022-04-20 00:09:52', NULL, 1);
INSERT INTO `collect` VALUES (20, 11, 13, 0, '2022-04-20 00:10:24', NULL, 0);
INSERT INTO `collect` VALUES (21, 13, 2, 0, '2022-04-20 18:21:11', NULL, 1);
INSERT INTO `collect` VALUES (22, 13, 7, 0, '2022-04-20 18:33:17', NULL, 1);
INSERT INTO `collect` VALUES (23, 13, 9, 0, '2022-04-20 18:52:51', NULL, 1);
INSERT INTO `collect` VALUES (24, 11, 10, 0, '2022-04-20 20:50:33', NULL, 1);
INSERT INTO `collect` VALUES (25, 11, 22, 0, '2022-04-20 21:18:53', NULL, 1);
INSERT INTO `collect` VALUES (26, 11, 7, 0, '2022-04-20 22:07:27', NULL, 1);
INSERT INTO `collect` VALUES (27, 12, 28, 0, '2022-04-21 00:42:41', NULL, 1);
INSERT INTO `collect` VALUES (28, 12, 16, 0, '2022-04-21 00:54:43', NULL, 1);
INSERT INTO `collect` VALUES (29, 12, 20, 0, '2022-04-21 00:54:47', NULL, 1);
INSERT INTO `collect` VALUES (30, 12, 18, 0, '2022-04-21 00:54:50', NULL, 1);
INSERT INTO `collect` VALUES (31, 12, 13, 0, '2022-04-21 00:54:53', NULL, 1);
INSERT INTO `collect` VALUES (32, 12, 7, 0, '2022-04-21 00:54:57', NULL, 1);
INSERT INTO `collect` VALUES (33, 12, 23, 0, '2022-04-21 00:55:02', NULL, 1);
INSERT INTO `collect` VALUES (34, 12, 17, 0, '2022-04-21 00:55:08', NULL, 1);
INSERT INTO `collect` VALUES (35, 12, 26, 0, '2022-04-21 00:55:11', NULL, 1);
INSERT INTO `collect` VALUES (36, 10, 34, 0, '2022-04-21 01:09:01', NULL, 1);
INSERT INTO `collect` VALUES (37, 10, 32, 0, '2022-04-21 01:09:06', NULL, 1);
INSERT INTO `collect` VALUES (38, 10, 30, 0, '2022-04-21 01:09:09', NULL, 1);
INSERT INTO `collect` VALUES (39, 10, 28, 0, '2022-04-21 01:09:11', NULL, 1);
INSERT INTO `collect` VALUES (40, 10, 10, 0, '2022-04-21 01:09:16', NULL, 1);
INSERT INTO `collect` VALUES (41, 10, 16, 0, '2022-04-21 01:09:18', NULL, 1);
INSERT INTO `collect` VALUES (42, 9, 38, 0, '2022-04-21 01:26:49', NULL, 1);
INSERT INTO `collect` VALUES (43, 9, 37, 0, '2022-04-21 01:27:22', NULL, 1);
INSERT INTO `collect` VALUES (44, 9, 36, 0, '2022-04-21 01:27:28', NULL, 1);
INSERT INTO `collect` VALUES (45, 9, 32, 0, '2022-04-21 01:29:53', NULL, 1);
INSERT INTO `collect` VALUES (46, 9, 30, 0, '2022-04-21 01:30:35', NULL, 1);
INSERT INTO `collect` VALUES (47, 9, 16, 0, '2022-04-21 01:30:40', NULL, 1);
INSERT INTO `collect` VALUES (48, 9, 20, 0, '2022-04-21 01:30:44', NULL, 1);
INSERT INTO `collect` VALUES (49, 9, 18, 0, '2022-04-21 01:30:50', NULL, 1);
INSERT INTO `collect` VALUES (50, 9, 15, 0, '2022-04-21 01:31:02', NULL, 1);
INSERT INTO `collect` VALUES (51, 9, 7, 0, '2022-04-21 01:31:08', NULL, 1);
INSERT INTO `collect` VALUES (52, 9, 23, 0, '2022-04-21 01:31:18', NULL, 1);
INSERT INTO `collect` VALUES (53, 5, 40, 0, '2022-04-21 01:37:13', NULL, 1);
INSERT INTO `collect` VALUES (54, 5, 39, 0, '2022-04-21 01:37:16', NULL, 1);
INSERT INTO `collect` VALUES (55, 5, 36, 0, '2022-04-21 01:37:20', NULL, 1);
INSERT INTO `collect` VALUES (56, 5, 32, 0, '2022-04-21 01:37:23', NULL, 1);
INSERT INTO `collect` VALUES (57, 5, 29, 0, '2022-04-21 01:37:26', NULL, 1);
INSERT INTO `collect` VALUES (58, 5, 26, 0, '2022-04-21 01:37:33', NULL, 1);
INSERT INTO `collect` VALUES (59, 5, 10, 0, '2022-04-21 01:37:36', NULL, 1);
INSERT INTO `collect` VALUES (60, 5, 17, 0, '2022-04-21 01:37:39', NULL, 1);
INSERT INTO `collect` VALUES (61, 5, 20, 0, '2022-04-21 01:37:42', NULL, 1);
INSERT INTO `collect` VALUES (62, 6, 42, 0, '2022-04-21 01:48:59', NULL, 1);
INSERT INTO `collect` VALUES (63, 6, 41, 0, '2022-04-21 01:49:05', NULL, 1);
INSERT INTO `collect` VALUES (64, 6, 43, 0, '2022-04-21 01:49:10', NULL, 1);
INSERT INTO `collect` VALUES (65, 6, 38, 0, '2022-04-21 01:49:13', NULL, 1);
INSERT INTO `collect` VALUES (66, 6, 35, 0, '2022-04-21 01:49:16', NULL, 1);
INSERT INTO `collect` VALUES (67, 6, 31, 0, '2022-04-21 01:49:26', NULL, 1);
INSERT INTO `collect` VALUES (68, 6, 30, 0, '2022-04-21 01:49:30', NULL, 1);
INSERT INTO `collect` VALUES (69, 6, 27, 0, '2022-04-21 01:49:35', NULL, 1);
INSERT INTO `collect` VALUES (70, 6, 10, 0, '2022-04-21 01:49:37', NULL, 1);
INSERT INTO `collect` VALUES (71, 6, 17, 0, '2022-04-21 01:49:40', NULL, 1);
INSERT INTO `collect` VALUES (72, 3, 10, 0, '2022-04-21 09:40:47', NULL, 1);
INSERT INTO `collect` VALUES (73, 3, 44, 0, '2022-04-21 09:43:01', NULL, 1);
INSERT INTO `collect` VALUES (74, 3, 42, 0, '2022-04-21 09:43:06', NULL, 1);
INSERT INTO `collect` VALUES (75, 3, 39, 0, '2022-04-21 09:43:09', NULL, 1);
INSERT INTO `collect` VALUES (76, 8, 45, 0, '2022-04-21 11:40:16', NULL, 1);
INSERT INTO `collect` VALUES (77, 8, 44, 0, '2022-04-21 11:40:23', NULL, 1);
INSERT INTO `collect` VALUES (78, 8, 37, 0, '2022-04-21 11:43:08', NULL, 1);
INSERT INTO `collect` VALUES (79, 8, 32, 0, '2022-04-21 11:43:10', NULL, 1);
INSERT INTO `collect` VALUES (80, 8, 28, 0, '2022-04-21 11:43:13', NULL, 1);
INSERT INTO `collect` VALUES (81, 8, 27, 0, '2022-04-21 11:43:15', NULL, 1);
INSERT INTO `collect` VALUES (82, 8, 10, 0, '2022-04-21 11:43:17', NULL, 1);
INSERT INTO `collect` VALUES (83, 8, 16, 0, '2022-04-21 11:43:20', NULL, 1);
INSERT INTO `collect` VALUES (84, 8, 20, 0, '2022-04-21 11:43:22', NULL, 1);
INSERT INTO `collect` VALUES (85, 8, 3, 0, '2022-04-21 11:43:25', NULL, 1);
INSERT INTO `collect` VALUES (86, 8, 15, 0, '2022-04-21 11:43:28', NULL, 1);
INSERT INTO `collect` VALUES (87, 8, 2, 0, '2022-04-21 11:43:31', NULL, 1);
INSERT INTO `collect` VALUES (88, 8, 23, 0, '2022-04-21 11:43:38', NULL, 1);
INSERT INTO `collect` VALUES (89, 4, 48, 0, '2022-04-21 12:04:01', NULL, 1);
INSERT INTO `collect` VALUES (90, 4, 47, 0, '2022-04-21 12:04:07', NULL, 1);
INSERT INTO `collect` VALUES (91, 4, 46, 0, '2022-04-21 12:04:10', NULL, 1);
INSERT INTO `collect` VALUES (92, 4, 44, 0, '2022-04-21 12:04:14', NULL, 1);
INSERT INTO `collect` VALUES (93, 4, 40, 0, '2022-04-21 12:04:18', NULL, 1);
INSERT INTO `collect` VALUES (94, 4, 35, 0, '2022-04-21 12:04:20', NULL, 1);
INSERT INTO `collect` VALUES (95, 4, 31, 0, '2022-04-21 12:04:23', NULL, 1);
INSERT INTO `collect` VALUES (96, 4, 27, 0, '2022-04-21 12:04:26', NULL, 1);
INSERT INTO `collect` VALUES (97, 4, 16, 0, '2022-04-21 12:04:29', NULL, 1);
INSERT INTO `collect` VALUES (98, 4, 20, 0, '2022-04-21 12:04:31', NULL, 1);
INSERT INTO `collect` VALUES (99, 4, 3, 0, '2022-04-21 12:04:35', NULL, 1);
INSERT INTO `collect` VALUES (100, 4, 15, 0, '2022-04-21 12:04:37', NULL, 1);
INSERT INTO `collect` VALUES (101, 4, 9, 0, '2022-04-21 12:04:40', NULL, 1);
INSERT INTO `collect` VALUES (102, 4, 4, 0, '2022-04-21 12:04:43', NULL, 1);
INSERT INTO `collect` VALUES (103, 4, 22, 0, '2022-04-21 12:04:45', NULL, 0);
INSERT INTO `collect` VALUES (104, 4, 23, 0, '2022-04-21 12:04:48', NULL, 1);
INSERT INTO `collect` VALUES (105, 7, 50, 0, '2022-04-21 14:41:30', NULL, 1);
INSERT INTO `collect` VALUES (106, 7, 51, 0, '2022-04-21 14:41:33', NULL, 1);
INSERT INTO `collect` VALUES (107, 7, 49, 0, '2022-04-21 14:41:37', NULL, 1);
INSERT INTO `collect` VALUES (108, 7, 46, 0, '2022-04-21 14:41:40', NULL, 1);
INSERT INTO `collect` VALUES (109, 7, 42, 0, '2022-04-21 14:41:42', NULL, 1);
INSERT INTO `collect` VALUES (110, 7, 40, 0, '2022-04-21 14:41:45', NULL, 1);
INSERT INTO `collect` VALUES (111, 7, 38, 0, '2022-04-21 14:41:48', NULL, 1);
INSERT INTO `collect` VALUES (112, 7, 36, 0, '2022-04-21 14:41:51', NULL, 1);
INSERT INTO `collect` VALUES (113, 7, 33, 0, '2022-04-21 14:41:54', NULL, 1);
INSERT INTO `collect` VALUES (114, 7, 29, 0, '2022-04-21 14:41:56', NULL, 1);
INSERT INTO `collect` VALUES (115, 7, 25, 0, '2022-04-21 14:41:59', NULL, 1);
INSERT INTO `collect` VALUES (116, 7, 17, 0, '2022-04-21 14:42:01', NULL, 1);
INSERT INTO `collect` VALUES (117, 7, 3, 0, '2022-04-21 14:42:04', NULL, 1);
INSERT INTO `collect` VALUES (118, 7, 14, 0, '2022-04-21 14:42:06', NULL, 1);
INSERT INTO `collect` VALUES (119, 7, 7, 0, '2022-04-21 14:42:10', NULL, 1);
INSERT INTO `collect` VALUES (120, 7, 23, 0, '2022-04-21 14:42:13', NULL, 1);
INSERT INTO `collect` VALUES (121, 11, 51, 0, '2022-04-21 18:43:46', NULL, 1);
INSERT INTO `collect` VALUES (122, 4, 21, 0, '2022-04-21 21:11:36', NULL, 1);
INSERT INTO `collect` VALUES (123, 4, 50, 0, '2022-04-22 14:11:03', NULL, 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `song_id` int(11) NOT NULL COMMENT '歌曲id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '评论类型（0：歌曲，1：歌单）',
  `up` int(11) NULL DEFAULT NULL COMMENT '评论点赞次数',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '歌单id',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 4, 2, '哈哈哈，原谅我不厚道的笑了！', '2022-02-07 21:06:34', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (3, 1, 2, '嗯，真好听！！！', '2022-02-07 21:13:27', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (4, 5, 2, '真不错', '2022-03-14 22:16:06', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (5, 1, 2, '挺好', '2022-03-14 22:16:42', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (6, 3, 2, '感动了!', '2022-03-31 00:55:19', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (7, 6, 2, '放弃很容易，但坚持一定很酷', '2022-04-01 00:09:23', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (8, 13, 2, '好听好听', '2022-04-08 16:16:57', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (9, 11, 4, '秀啊，哥！', '2022-04-08 18:22:44', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (10, 13, 4, '余音绕梁啊！', '2022-04-18 19:10:34', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (11, 13, 15, '愿得一人心，白首不分离。记得在上大学的时候，跟舍友们一起单曲循环这首歌，憧憬着美好的未来，为何那时的想法会那么单纯。。今天再拿出来听，多了份安静，心中不再波涛汹涌（从校服到婚纱的恋爱何尝不是每个人的心愿，但又有多少人能一直走下去）', '2022-04-20 18:30:41', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (12, 13, 7, '一个王子爱上一个公主，公主告诉他，如果他愿意连续100个晚上守在她的阳台下，她就接受他。于是王子照做了，他等了一天，两天，三天……直到第九十九天，王子离开了。有人问王子，为什么不再坚持最后一天？\n王子的答案很简单——爱情不能只是一个人的付出。我用99天证明爱，用第100天证明尊严。', '2022-04-20 18:33:03', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (13, 6, 17, '音乐和旋律里包含的故事，是给予彼此灵魂的伴侣，希望我和音乐可以陪伴你记录生活中点滴的回忆。\n2021年11月25日', '2022-04-21 01:52:16', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (14, 6, 41, '“我们提着过去，走入人群”', '2022-04-21 01:53:09', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (15, 6, 38, '我的诗句里没有你 却句句是你', '2022-04-21 01:59:40', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (16, 6, 35, '你说好久了，屋子都没人住\n我总有办法打断你的叮嘱\n多数是不耐烦，少数是想哭 我总说自己要减轻你的辛苦\n要自己去闯自己的路\n以为自己足够光彩夺目\n却被你一眼看穿艰辛苦楚 传说上帝无法亲力亲为所有守护\n派仙女下凡，做人间的公主\n从此，\n一切美好，在柴米油盐中驻足', '2022-04-21 02:00:19', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (17, 7, 50, '一旬败给年少轻狂的理想\n二旬败给青涩无知的爱情\n三旬败给沧桑寂寥的现实', '2022-04-21 15:07:22', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (18, 7, 51, '现在的电影到最后拼的不就是主题曲么，一首好歌电影成功一半', '2022-04-21 15:12:58', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (19, 7, 46, '我下铺姓刁，也是个自由的鸟，自己给自己放了两个多星期的假了', '2022-04-21 15:13:40', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (20, 7, 42, '小舞轻伤，唐三战斗力增幅30%\n小舞受伤较重，唐三战斗力增幅50%\n小舞重伤，唐三战斗力增幅70%\n小舞昏迷，唐三战斗力增幅90%\n小舞死亡，唐三战斗力开挂\n五怪：这局稳了\n大师：下手轻点\n对手：爸爸饶命\n事实证明，小舞是辅助系魂师', '2022-04-21 15:23:17', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (21, 7, 38, '听了好久了，这歌下面都没有评论，该不会这是系统为我一个人录的音乐吧 这么想着，我居然被感动哭了', '2022-04-21 15:43:47', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (22, 7, 40, '“像被子里的舒服，又像风捉摸不住”不是屁是什么？', '2022-04-21 15:44:49', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (23, 7, 33, '写歌的人假正经\n听歌的人最无情\n人要是矫情起来 听什么都像在唱自己', '2022-04-21 15:46:08', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (24, 7, 36, '借我你的手吧，我用余生来还。\n找一块地，一起种豆南山。\n风雨无所谓，有你在就是世外桃源。', '2022-04-21 15:46:47', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (25, 7, 25, '失恋了听总是那么有味道', '2022-04-21 15:55:18', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (26, 7, 29, '有多少人的父亲是像歌词里一样，不善于表达，肢体接触的很少，单车上抱住的那一刻觉得就是那么安心。拉不下面子去抱他，，，，', '2022-04-21 15:56:27', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (27, 7, 17, '不行啊！这歌也太让人快乐了！洗澡的时候我直接扭成龙卷风！！！', '2022-04-21 15:57:22', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (28, 7, 3, '我多么想和你见一面，在街角的咖啡店。。。', '2022-04-21 15:58:50', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (29, 7, 14, '北凉铁骑甲天下 大雪龙骑雄北凉', '2022-04-21 15:59:26', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (30, 7, 23, '越怕失去越会失去', '2022-04-21 16:01:01', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (31, 7, 49, '“生活从无到有虽然一路颠簸坎坷，但好在身边始终有一人不离不弃。不管生活再苦再累，只要想到他，心里总是溢满幸福感。', '2022-04-21 16:01:39', 0, 8, NULL, 1);
INSERT INTO `comment` VALUES (32, 10, 51, '像经历了一场120分钟的电影 又像开车走了一段很长的路', '2022-04-21 16:18:26', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (33, 13, 51, '太爱了 所以我总说的轻描淡写 我怕她们瞧不起我.', '2022-04-21 16:19:19', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (34, 1, 51, '遗憾会有，但不要违背了自己的心意.', '2022-04-21 16:19:45', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (35, 11, 51, '你问我 为什么顽固而专一', '2022-04-21 16:20:20', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (36, 12, 51, '会有释怀你的那一天吗', '2022-04-21 16:21:02', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (37, 9, 51, '一点都不善良 从来没有原谅过谁 说原谅只不过是让自己看起来大方一点', '2022-04-21 16:21:40', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (38, 5, 51, '没办法 天生傲骨 学不会低头 难过到极致也不会挽留一句 即使错过 也不会放弃理智 太理智总会少很多快乐 我只希望 一直自由 一直快乐 遇到或遇不到顺其自然吧', '2022-04-21 16:22:16', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (39, 6, 51, '还没遇到 也很难遇到', '2022-04-21 16:22:52', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (40, 8, 51, '放过彼此', '2022-04-21 16:24:03', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (41, 4, 51, '大家都看别人的故事 自己的那', '2022-04-21 16:25:40', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (42, 4, 50, '人生会有很多挫折，怎么都会过来的，但不能让挫折改变你的人生哲学，不能让挫折改变你对待这个世界的方式。对人柔软，对事刚强。你可以一文不名，但是你不能没有内心的坚持！', '2022-04-21 16:26:18', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (43, 8, 50, '曾经18岁时的理想现在还记得嘛。各位', '2022-04-21 16:26:56', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (44, 6, 50, '水果店老板也在播放着 赵雷的《理想》\n跟着节奏切着水果，一边是理想，一边现实。\n是啊，你的理想今年又你几岁。', '2022-04-21 16:27:24', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (45, 12, 50, '道阻且长，艰难险阻，但我们最终都会上岸', '2022-04-21 16:29:11', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (46, 11, 50, '考研成功上岸，( •̀ ω •́ )y', '2022-04-21 16:30:06', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (47, 1, 50, '理想与现实差了十万八千里。我鞭长莫及，却也马不停蹄', '2022-04-21 16:30:34', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (48, 13, 50, '理想与现实差了十万八千里。我鞭长莫及，却也马不停蹄', '2022-04-21 16:31:03', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (49, 10, 50, '理想今年你几岁，你总是诱惑着年轻的朋友', '2022-04-21 16:31:29', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (50, 10, 49, '吃饭听睡觉听打王者听洗澡听', '2022-04-21 16:32:18', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (51, 13, 49, '这个夏天只想和你待在一起发呆唉', '2022-04-21 16:32:39', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (52, 1, 49, '“这个被风吹过的夏天，我们会一直陪着你”所有人准备 一 起 唱 风吹过～', '2022-04-21 16:33:01', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (53, 11, 49, '“普吉岛的夏天永不停歇，我爱的少年永远热恋”', '2022-04-21 16:33:20', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (54, 12, 49, '我一听这个歌心情莫名的好', '2022-04-21 16:34:34', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (55, 9, 49, '太好听了！在这个夏天想恋爱的感觉', '2022-04-21 16:35:07', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (56, 5, 49, '风很温柔 花很浪漫 你很特别 我很喜欢．', '2022-04-21 16:35:43', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (57, 6, 49, '旋律不错，歌声不错', '2022-04-21 16:36:12', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (58, 8, 50, '我也希望 一定要足够惊艳 为了自己为了爱自己的人', '2022-04-21 16:36:34', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (59, 8, 49, '我也希望 一定要足够惊艳 为了自己为了爱自己的人', '2022-04-21 16:36:43', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (60, 4, 50, '这首歌 有2021年夏天的味道', '2022-04-21 16:37:13', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (61, 10, 48, '第一次听就单曲循环', '2022-04-21 16:39:02', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (62, 1, 48, '听这首歌时，我仿佛看到了那个人在对面向我招手', '2022-04-21 16:39:21', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (63, 12, 48, '青春又醉倒在 籍籍无名的怀', '2022-04-21 16:39:40', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (64, 9, 48, '没有人喜欢孤独 只是害怕失望罢了', '2022-04-21 16:40:03', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (65, 6, 48, '一旬追逐放肆不羁的梦想\n二旬期待音符一响 在身旁的你眉眼就笑\n三旬想肆意拨弦不作诗 笔尖一落 便能表达自己 和让你明白我的心情', '2022-04-21 16:40:19', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (66, 8, 48, '上岸吧 祝你也祝我', '2022-04-21 16:41:00', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (67, 4, 50, '所有的事儿因为有了期限才显得珍贵，永远是不值得珍贵的，因为永远是产生于一瞬间的，我最喜欢的是每天晚上留给自己抽烟听歌吹风的时间，让我活在不孤不独里，终于安静了……', '2022-04-21 16:41:46', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (68, 4, 47, '因为一首歌怀念一座城。曾经的天府广场武侯祠锦里杜甫草堂青羊宫春熙路宽窄巷子昭觉寺文殊院都成了回忆。', '2022-04-21 16:42:36', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (69, 6, 47, '喜欢成都的阴晴不定的天气和小雨绵绵\n喜欢成都喜欢随处可见的火锅店和小吃\n喜欢每月可以去小酒馆听livehouse现场\n大三了快要毕业了也许以后会离开成都\n没在成都听一场雷子的演唱会总感觉不完美\n所以我们11.5号成都见 在成都听《成都》', '2022-04-21 16:42:58', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (70, 12, 47, '因为李志爱上南京，因为赵雷爱上成都，路上的人，总把他乡当故乡，那就和解吧，那就歌唱吧，总之，你我都要好好的活着，愿你我走更多的路，听更多的歌，成为一个有用的人。', '2022-04-21 16:43:20', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (71, 1, 47, '前奏好好听[多多大哭]', '2022-04-21 16:43:37', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (72, 13, 47, '成都真的是一座生活节奏很慢的城市啊', '2022-04-21 16:44:29', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (73, 10, 47, '分别真的都在九月吗？\n自古多情伤离别，更那堪冷落清秋节', '2022-04-21 16:46:15', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (74, 13, 46, '赵雷版本的阿刁是旁人的叙说，对于故人或者说生活的一种感叹，娓娓道来煽动人心！张韶涵版就像是自我的叙说，即便命运多舛但永不放弃，从尘埃里开出花来！直击心脏的同时带给人坚强与希望！！！！两个版本都非常好，很喜欢！！歌词特别好！！', '2022-04-21 16:49:06', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (75, 11, 46, '一把吉他走遍大江南北，尝尽酸甜苦辣，把真诚勇敢带给世间，没有为赋新词强说愁的感觉，有的是故事的感动。', '2022-04-21 16:49:35', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (76, 12, 46, '也许我们都一样 我们总想活成什么样.... 但生活总是让我们应该怎么', '2022-04-21 16:50:22', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (77, 6, 46, '最好听一句是咿呀咿呀咦哟', '2022-04-21 16:50:51', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (78, 4, 46, '当赵雷唱到命运多舛，痴迷淡然这句的时候鸡皮疙瘩立刻起来了。只有作者才可以给阿刁最美的灵魂吧。', '2022-04-21 16:51:33', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (79, 1, 45, '神仙唱歌吧！！！！\n神仙音域跨度！！！！\n神仙转音！！！！！！！\n神仙真假音转换！！！！！！\n神细腻的感情投注！！！！！！！\n对不起我是一个没有感情的吹峰机！！！！！', '2022-04-21 16:52:43', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (80, 9, 48, '你也是孤独的女孩呢\n你也喜欢深夜听歌\n你的烦心事总会少一点的\n你等的人也总会出现\n你总会变的很优秀\n你看，起风了呢', '2022-04-21 16:53:12', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (81, 9, 45, '你也是孤独的女孩呢\n你也喜欢深夜听歌\n你的烦心事总会少一点的\n你等的人也总会出现\n你总会变的很优秀\n你看，起风了呢', '2022-04-21 16:53:47', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (82, 8, 45, '你是怀念18年的夏天 还是18年的那个人?', '2022-04-21 16:58:10', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (83, 12, 45, '“谁说学不了微风”\n“秋风推开紧闭的门扉”\n“我此刻的样子见风仍然是风”\n“无论什么世界 东风藏在眉心”\n“如何能够找到一阵大风完全把我吹向你的来路”', '2022-04-21 16:58:57', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (84, 10, 44, '所爱之不欢， 所念之山海，山海皆可平，可爱意皆过客', '2022-04-21 16:59:44', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (85, 11, 44, '惟愿一人之欢喜，怎念彼岸之花开，花开时不见叶子，叶子盛放时却不见花朵！你是我唯一的选择，也是我唯一的遗憾！', '2022-04-21 17:03:49', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (86, 9, 44, '每次听到这首歌就能想起2019年的冬天', '2022-04-21 17:04:08', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (87, 8, 44, '感谢你曾来过、很高兴认识你，就算你是个过客', '2022-04-21 17:04:47', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (88, 4, 43, '高中开始就一直在听 现在大学都即将毕业了 感觉有种特殊的回忆留在脑海里挥之不去', '2022-04-21 17:05:59', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (89, 6, 43, '那会儿正读高中，忙高考忙复习，每天累的跟狗是的，每天唯一放松的机会就是偷偷带着耳机.小星星不知道单曲了多少日子，陪了我一整个小青春♡等着那个喜欢的人', '2022-04-21 17:06:24', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (90, 12, 43, '其实每个人的心里，都有一颗小星星。', '2022-04-21 17:06:53', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (91, 11, 43, '喜欢落日余晖照亮黄昏\n你在身旁\n时光短且长', '2022-04-21 17:07:22', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (92, 13, 43, '“承认不勇敢，你能不能别离开？”\n嘴硬心软，这样的话只在心里念', '2022-04-21 17:08:14', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (93, 10, 42, '他唱的空城真的好好听', '2022-04-21 17:09:46', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (94, 11, 42, '第一二首歌衔接的真自然，后面的相比就有点突兀，但是就算这样，也是真的很好了', '2022-04-21 17:10:35', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (95, 5, 42, '在寝室放的时候 打游戏的室友听到说了句：好听诶。那个时候的自豪感是填满我心的时候', '2022-04-21 17:11:02', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (96, 8, 42, '一个和弦串起六首风格迥异的歌曲！毫无违和并且十分抓耳！音色和技巧都超绝！', '2022-04-21 17:11:37', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (97, 4, 41, '有没有这样一首歌\n能让你瞬间回到2018年的初冬\n那时刚刚上高三 紧张又充满希望\n没有冲刺阶段的高压\n每天却也满满当当\n讲台上有传道受业解惑的老师\n身边有一起努力且傻乐的朋友\n还有房东的猫\n还有云烟诚雨\n还有你', '2022-04-21 17:12:38', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (98, 8, 41, '“生活会有望穿秋水的等待，也会有始料不及的惊喜。”', '2022-04-21 17:12:56', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (99, 9, 41, '往事如云烟，沿途皆是风景。\n韶华易逝去，等有缘人相聚。', '2022-04-21 17:13:35', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (100, 1, 41, '这一路漫无目的的眺望，总能看到某人像你过去的影子。伴随着铃声，着急忙慌的朝着某个特定的方向跑去…就这样一直跑了三年，曾想着快点，再给我快点，还有几十天就跑完了，到了那个时候，“我”就自由了。没想到我现在会如此强烈的想要再“跑”那么一次。\n好想，好想…\n改变这时间，不变这空间。', '2022-04-21 17:14:12', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (101, 13, 41, '若青春都已风轻云淡\n就连记忆也烟消云散\n那么清醒时无意识的低吟和酣梦时的呓语\n是否能代表我对你的思念\n如果思念可以跨越距离\n往昔不可留\n未来不能就\n我想要的只是再见你一面', '2022-04-21 17:14:33', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (102, 10, 40, '经历了夏天的酷暑，冬天的严寒，才懂得春天的温暖。\n经历了别离才懂得团圆。\n失去过才懂得珍惜，而失去了的再也回不来了。', '2022-04-21 17:15:48', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (103, 9, 40, '想表达感情，又不太敢直接。想靠近一点，又怕打乱我们的轨迹。你像风一样，我试着抓住你，却被冷风扇了几下。\n我想像情歌那样，我们会拥有欢快甜甜地爱情，你走之后，现在却天天循环失恋歌曲。到现在我还不知道你穿的是红色高跟鞋还是灰姑凉的水晶鞋..', '2022-04-21 17:16:05', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (104, 6, 40, '吉他和架子鼓的完美配合，贝斯节奏把控，还有管弦乐配合旋律，曲子真的不错旋律流畅优美，又不乏情感宣泄，流行摇滚的魅力，尽管我是一名男士，我也爱上了你的红色高跟鞋', '2022-04-21 17:16:27', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (105, 4, 41, '温暖而又慵懒的声线，听来只觉得很舒服。歌词扣人心弦，旋律轻快。经过百遍的单曲循环之后非但未觉得半分厌乏，反倒更加喜欢。像是一杯茶，在细细品茗之后才能回味出那一份经久不散唇舌间的清甜。单曲循环佳品。', '2022-04-21 17:16:40', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (106, 4, 40, '温暖而又慵懒的声线，听来只觉得很舒服。歌词扣人心弦，旋律轻快。经过百遍的单曲循环之后非但未觉得半分厌乏，反倒更加喜欢。像是一杯茶，在细细品茗之后才能回味出那一份经久不散唇舌间的清甜。单曲循环佳品。', '2022-04-21 17:16:49', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (107, 10, 39, '回不去了 请你忘了我在夜晚的流过的眼泪和没有意义的长篇大论 ——也许 你也根本记不得了。', '2022-04-21 17:18:01', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (108, 13, 39, '这首歌，真的写到心坎里！明明彼此还是爱，却硬是要错过。', '2022-04-21 17:18:22', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (109, 11, 39, '杰伦:我当时也没想到这首歌适用的这么广泛', '2022-04-21 17:18:45', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (110, 4, 39, '别的男歌手的失恋情歌，永远是女方怎么怎么作无理取闹，周董的失联却是一直在谴责自己“是我不对，你不过要人陪”“你算什么男人”。', '2022-04-21 17:19:07', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (111, 8, 38, '高中还是18年啊 歌词没有写青春 可是句句又是青春 这么一路走来 感谢在学校的小伙伴与老师呀', '2022-04-21 17:20:36', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (112, 5, 38, '其实这首歌歌词没有写的多好 唱得也没有多么惊艳 但是就是充满了普普通通却干干净净的少年感 就好像你高中班上那几个男生毕业那天唱的那样 一开口都是就是你的整个青春的心酸和欢喜', '2022-04-21 17:21:15', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (113, 13, 38, '七月的风，八月的雨，卑微的我喜欢遥远的你\n你还未来，怎敢老去，未来的我和你奉陪到底\n你若同意，我一定去，可你并不在意我的出席\n你的过去，无法参与，但我还是，很喜欢你。', '2022-04-21 17:21:40', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (114, 10, 37, '终是旭凤成了魔，锦觅才知爱为何；终是锦觅散了魂，旭凤方知从未恨。 凤凰花开两季，一季缘来，一季缘散。', '2022-04-21 17:22:38', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (115, 11, 37, '凤凰花开两季，一季缘来，一季缘散，缘来缘去终会散，花开花败总归尘。——旭凤', '2022-04-21 17:23:02', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (116, 6, 37, '这歌儿咋么听我都浑身发麻，尤其是高潮！可能是我看过剧的原因吧', '2022-04-21 17:23:31', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (117, 4, 37, '好爱凤凰，好心疼小鱼仙倌。感觉沉到剧里出不来了，看到润玉就莫名心疼。', '2022-04-21 17:24:00', 0, 0, NULL, 1);
INSERT INTO `comment` VALUES (118, 4, 36, '总有一缕风，凝聚一生情。\n总有一场梦，梦醉伴余生！', '2022-04-21 17:24:36', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (119, 5, 36, '被这风吹散的说 他爱的不深\n被这雨淋湿的人说 她不会冷 这句词最令我扎心 可一句一个画面 入心入肺', '2022-04-21 17:24:54', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (120, 12, 36, '明日之子其他人的歌说实话一首都没听。只听毛不易。有木有和我一样的', '2022-04-21 17:25:35', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (121, 13, 36, '男不听七友\n女不听钟无艳\n悲伤不听陈奕迅\n年少不听李宗盛\n分手不听薛之谦\n夜深不听毛不易 ​\n听不懂的人 真幸运', '2022-04-21 17:26:20', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (122, 1, 35, '这首翻唱，这个男声是真的不错', '2022-04-21 17:27:38', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (123, 9, 35, '毛不易的这首《一荤一素》是写给他妈妈的，很有感情且很丰富很感人。听着听着我也不由得想起我的爷爷。', '2022-04-21 17:28:18', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (124, 4, 34, '像我这样优秀的人，本该灿烂过一生。小时候呢总觉得将来一定会拥有与众不同的人生，可长大后才发现原来我拼尽全力也只是一个普通人，却不甘心这样碌碌无为的过一生，歌里用了很多次来形容我们一路走来的心路历程。“迷茫，寻找，碌碌无为，孤单却不甘平凡还有点傻”像我这样莫名其妙的人会不会也有人心痛。毛不易猝不及防的写出了大家内心深处的渴望。', '2022-04-21 17:29:24', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (125, 5, 34, '听不懂这首歌真的很好，听懂的只能说明经历了太多，告别了单纯，有太多无奈和伤感。只能说我这种碌碌无为.庸俗.装深沉的人太多太多，不是不够努力聪明，只是有点莫名其妙，心疼的人太少。总是在寻找那个平凡却又不平凡的人.事和生活。', '2022-04-21 17:29:57', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (126, 12, 34, '留得上一秒幸，不知下一秒命。', '2022-04-21 17:30:17', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (127, 10, 33, '当一个人，突然间闯进你的生活，又突然的消失，会是什么感觉？', '2022-04-21 17:31:10', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (128, 1, 33, '每当听到这首歌，就会想起那年夏天我和她在体育课上的操场不断练习着阴天快乐，可惜如今物是人非', '2022-04-21 17:31:33', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (129, 4, 33, '想起曾在教室的角落一人分一支耳机听陈奕迅，播到这首歌的时候天气正阴沉，你却转头笑对我说阴天快乐。那时莫名的感动差点让我掉泪。和歌词多像——“我一抬头，就看见你，那个酒窝”。如今我们渐行渐远好久不联系，可我仍不能忘记那个午后少年的笑容，是阴天里最耀眼阳光。', '2022-04-21 17:32:05', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (130, 9, 33, '不要在喝醉时联系任何人\n不要在深夜做任何决定矫情的话\n要尽量憋在心里\n天亮了你会庆幸当时没有说出口', '2022-04-21 17:32:29', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (131, 11, 32, '年年岁岁花相似，岁岁年年人不同', '2022-04-21 17:34:03', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (132, 11, 32, '年轻时候看过安东尼的这本书，叫 不二 系列。沉迷其中不能自拔，给别人写信都喜欢用那种不加标点的格式，那段时间过的很不开心，就靠文字慰藉。现在拍成电影了，我也看了，依然如他的文字那样，平淡的叙事风格，可是生活不就是如此，平淡且平凡的大多数们。', '2022-04-21 17:34:22', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (133, 10, 32, '你陪我度过了青春里那最好的几年，我的心却陪着离开的你走了半生。', '2022-04-21 17:34:49', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (134, 5, 32, '用歌声诠释我们的人生，用歌声记录我们的青春，用歌声感动我们的世界，用歌声点亮我们的未来!', '2022-04-21 17:36:31', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (135, 9, 31, '十年浮夸终成孤独患者，明年今日相约富士山下', '2022-04-21 17:38:05', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (136, 12, 31, '淹没在这个成千上万人的大城中，我觉得得到了真正的自由：一种独来独往，无人理会的自由。', '2022-04-21 17:38:52', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (137, 10, 31, '十年之前，你不属于我。十年之后，你不认识我。十年之前，死生契阔。十年之后，终为过客。日日念，月月盼，年年忆。仓促之间，白驹过隙，时光荏苒。我不想以朋友的方式认识你，我想以陌生人的方式重新认识你。我想再等十年，静候归期。', '2022-04-21 17:47:37', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (138, 10, 30, '“我把秘密告诉了太阳\n阳光照亮了每个角落”', '2022-04-21 17:48:15', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (139, 1, 30, '东京之旅...终究是一早比一世遥远，我的圆满', '2022-04-21 17:48:40', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (140, 9, 30, '你喜欢一个人，就像喜欢富士山。你可以看到它，但是不能搬走它', '2022-04-21 17:49:24', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (141, 8, 30, '十年浮夸终成孤独患者，明年今日相约富士山。', '2022-04-21 17:49:49', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (142, 5, 29, '我的个子早已越过了他的肩，他甘愿留在苦寒的冬天，把我推向他也很向往的春天', '2022-04-21 17:50:31', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (143, 11, 29, '周杰伦是青春，陈奕迅才是人生', '2022-04-21 17:51:05', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (144, 10, 29, '“难离难舍想抱紧些，茫茫人生好似荒野”陈奕迅的《单车》，我下午循环了一个小时的歌，走出寝室时那么巧校园广播就放了；抬头低头几次，窗外的树林合着阳光明着就暗了，我在啃医学这本书，要考试了。', '2022-04-21 17:51:36', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (145, 4, 28, '谁说站在光里的才算是英雄 向那些默默无闻的英雄致敬', '2022-04-21 17:52:40', 0, 7, NULL, 1);
INSERT INTO `comment` VALUES (146, 6, 28, '据统计每年都有超过40位英雄（消防员）为了救人牺牲了自己的生命，致敬英雄！！！', '2022-04-21 17:53:34', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (147, 9, 28, '孤勇者由唐恬作词，这个女孩带着伤痛在呐喊着啊！那些千千万万与癌症对峙的平凡人！在此向你们的不屈，不哭，争抢命运的孤勇致敬！', '2022-04-21 17:54:02', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (148, 13, 28, '最爱的歌手演唱了我最爱的游戏的中文主题曲 太好听了吧 真的爱了爱了', '2022-04-21 17:54:39', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (149, 12, 27, '一个重感情的女人一般都很固执，她可以爱你很久很久，也可以等你很久很久，但是如果有一天，她一旦选择了离开，那一定是比很久很久还要久', '2022-04-21 17:56:02', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (150, 1, 27, '你的独角兽真的很好听！', '2022-04-21 17:56:22', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (151, 4, 27, '谁的人生不是在演独角戏，其余的配角，走走停停，回首历程，一个人一场戏。', '2022-04-21 17:56:43', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (152, 10, 27, '不在乎你的人，会拿你当风，不主动，不热情，更不想把你心疼，你再付出，你再给予，照样对你无动于衷，你再期待，你再等待，也是难以把ta感动，也许你的世界，ta是唯一一个，可是ta的世界，从不缺你一个，爱你的人，会为你不顾一切，不爱你的人，会不顾你的一切……', '2022-04-21 17:57:06', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (153, 10, 26, '我个人觉得这首歌很开放 就是一种向往自由的感觉 同时也象征这青春.', '2022-04-21 17:57:39', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (154, 13, 26, '听到高潮部分，感觉自己要登基了！哈哈哈', '2022-04-21 17:57:57', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (155, 11, 26, '希望该死的疫情早早过去，让我们红尘作伴，活的潇潇洒洒', '2022-04-21 17:58:41', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (156, 5, 25, '本人的记事本里酸甜苦辣样样都有，万备聚全', '2022-04-21 17:59:26', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (157, 6, 25, '目之所及，皆是回忆，\n心中所想，皆是过往。', '2022-04-21 17:59:45', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (158, 8, 25, '真正的记事本不是用笔记的，是用心', '2022-04-21 18:00:28', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (159, 11, 10, '美人鱼隔一段时间火一次永远猜不到下一次火的是哪一首', '2022-04-21 18:01:18', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (160, 9, 10, '属于文艺复兴了这波是，跨越18年的文艺复兴', '2022-04-21 18:01:47', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (161, 5, 10, '高三宿舍一熄灯，舍友戴上耳机，吼一句你们就是我的美人鱼，然后边写作业边唱，每次我们都会大笑，然后敲她的床板叫她唱小声点。哈哈现在觉得她好可爱。', '2022-04-21 18:02:14', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (162, 13, 10, '喜欢这首歌是从小学开始的，那时觉得旋律特别好，初中时慢慢懵懵懂懂，第一次唱歌比赛用这首歌向初恋表白，感谢JJ的美人鱼陪我度过懵懵懂懂的青春。', '2022-04-21 18:02:46', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (163, 10, 16, '这世界那么多人，\n生而平凡的我们。\n多幸运，曾经在有一个人那里，\n得到过彻底的无限的最高的承认\n——你就是全世界最好的！\n多不幸，身旁这么多人，\n唯独没有过这样的我们……', '2022-04-21 18:05:48', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (164, 1, 16, '怎么就听哭了呢 我明明是个故事之外的人', '2022-04-21 18:06:52', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (165, 6, 16, '晚风中闪过 几帧从前啊\n飞驰中旋转 已不见了吗\n远光中走来 你一身晴朗\n身旁那么多人 可世界不声不响', '2022-04-21 18:07:22', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (166, 4, 17, '听着这歌就想起来了优菈的舞蹈，劳伦斯家族的传承需要我', '2022-04-21 18:08:31', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (167, 11, 17, '这歌确实不错啊，经典的母带感加上略显轻佻的男声，配合上刘志佳的女王音，整首歌给人一种在舞会上纵情跳舞的感觉，不得不说真的很带感', '2022-04-21 18:09:26', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (168, 13, 19, '听！我们的歌\n从过去到现在，有人走，有人来，但很庆幸你还唱我还在。明天过后里有我的青春有我的年少也有着最美好的爱恋。身边那个肆无忌惮喜欢的人走了，但总会有另一个人走来，正好趁着这次老歌翻唱，向过去的我们，说句再见，向未来的我们，说声你好。', '2022-04-21 18:10:23', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (169, 10, 19, '山明和水秀都不及你一眼回眸', '2022-04-21 18:11:00', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (170, 9, 19, '山明和水秀都不及你一眼回眸', '2022-04-21 18:11:21', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (171, 5, 20, '我们就像两条相交直线，曾经有过一个交点，之后只会渐行渐远.', '2022-04-21 18:12:09', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (172, 6, 20, '请不要埋头走得那么专心，回过头来看看吧，我就在你的身后，小心地踏着你的脚印。', '2022-04-21 18:12:52', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (173, 11, 20, '生命有终点，缘分有尽头，但爱不会消亡，轮回转折中，不同的你我会再相遇，纵使结局或喜或悲，但还能够重新拥有，就不愧用尽一切去爱，不怕失去后孤寂余生。真爱还会让你我重逢，我会像曾经你爱我那样爱你，而且更爱你，护你周全，这是平行时空的信仰，也是漫长宿命里的交换余生。', '2022-04-21 18:13:32', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (174, 10, 21, '中国底气，大写的传奇。苍山覆雪，待写壮丽，共同愿望，连接我和你。诗书古曲，万卷成了集，寥寥数笔，震撼这天地……”', '2022-04-21 18:14:25', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (175, 13, 21, '我一声龙啸凌云志，热血燃冬扶摇起！期待冬奥', '2022-04-21 18:14:41', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (176, 1, 21, '这曲风太好听了，最爱的冬奥歌曲了！ 张杰一开口就回到了中国风回到了大开大合的神州凌云之志！', '2022-04-21 18:15:11', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (177, 12, 21, '杰哥不愧是献给国家的歌手，太棒了，昨天循环完年轻人，今天就要到雪龙吟了', '2022-04-21 18:15:59', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (178, 5, 21, '这歌真的太洗脑了，张杰的声音一出来，就有一种很亢奋的感觉，能瞬间抓住你所有的注意力。转过来就是一段快节奏的rpa增加了丰富性，不至于因为突然低音让人走神，你以为rap完了后面一段肯定会失色。\n但是后面这段真的太绝绝子了，我竟然最爱的是这一段，“万里山河 都在画里，金石铭刻 盛世的崛起，春秋竹简 泛黄入了泥 …”低声吟唱加上鼓点的节奏，诗意盎然的词句，让你突然从现代的喧嚣转入到了万里山河，千秋万代的气韵。', '2022-04-21 18:16:24', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (179, 6, 21, '不吹，这是我目前听到的冬奥歌里最好听的一首，大气有魄力，这才能展现我们大国风采', '2022-04-21 18:16:48', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (180, 8, 21, '龙：我国古代传说中的神异动物，身体长，有鳞，有角，有脚，能走，能飞，能游泳，能兴云降雨。\n风从虎，云从龙；\n画龙点睛，飞龙乘云；\n潜龙勿用，见龙在田；\n困龙入海，骄凤升天！', '2022-04-21 18:17:44', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (181, 4, 21, '何其有幸，生于华夏。\n以青春之名，描绘清澈挚爱。\n以炙热灵魂，书写红色华章。\n亚洲雄狮已然苏醒，\n东方巨龙踏云腾飞。\n四大文明古国唯我泱泱华夏经久不衰于历史长河，五千年澎湃传说塑造当今繁荣盛世。\n愿我泱泱神州，盛世无疆，永远屹立于世界民族之林', '2022-04-21 18:18:34', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (182, 4, 18, '怀念的无非是那段回不去的日子', '2022-04-21 18:19:32', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (183, 5, 18, '永远爱着那个十六岁的少年，他眼里的星星全落进我梦里。', '2022-04-21 18:19:43', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (184, 12, 18, '我在写下这段话的时候，耳边的是孙燕姿的《我怀念的》，我怀念的是无话不说，我怀念的是一起做梦，我怀念的是争吵以后还是想要爱你的冲动。但是你知道，有些人是不能活在回忆里的，比如我。谢谢你的知遇之恩，我会活得很好，希望你也一样。', '2022-04-21 18:20:00', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (185, 10, 18, '我怀念的 那个夏天 那个男孩 真情实感', '2022-04-21 18:20:24', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (186, 10, 3, '一句好久不见，其实就是深深的想念。和你在一起的每一天都是美好的一天，和你生活在一起的每一个片段都是向往的生活。你若在我身边，我一定抱紧你。只是不知，你何时能再出现在我身边。会不会和我顺畅地坐着聊聊天，不再去说从前，只是寒暄，对你说一句，好久不见。这首歌的歌词写得太好了。这首歌不仅唱进耳朵里，更是唱进了你的心里。也许这首歌唱的故事里，有你。', '2022-04-21 18:20:50', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (187, 11, 3, '我仍不确定未来我们是否还会有交集，但我希望再次见面时我已经可以接纳自己，至少要比现在有进步，可以故作大方地跟你说一句嗨，好久不见。', '2022-04-21 18:21:22', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (188, 6, 3, '走过熟悉的街角，可惜已没有你，不再有嬉笑玩弄，也没有了悲伤的哭泣，没有了我们，只剩下一个人穿梭在车水马龙之间，没有很快乐，也没有不快乐。', '2022-04-21 18:21:40', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (189, 4, 11, '我爱夏天的夜晚一个人走在湖畔，戴着耳机，播放着这首歌，邂逅着温柔的晚风，深处心灵的无人之地。', '2022-04-21 18:22:48', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (190, 6, 11, '半生风雨半身寒，一杯浊酒敬流年。回首过往半生路，七分酸苦三分甜，日出东方催人醒，不及晚霞懂我心，此别再无相见日，终是一人度春秋！！！', '2022-04-21 18:23:03', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (191, 11, 15, '愿得一人心，夕阳伴黄昏。', '2022-04-21 18:23:43', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (192, 10, 15, '我的妈 这是我学会的第一首流行歌曲 是我妈给我听的 好几年没有听这个歌了 早上上学的时候广播里突然有播到 DNA动了 放学就来找这首歌了', '2022-04-21 18:24:04', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (193, 10, 13, '林俊杰用音乐串联起社会的正能量，旨在宣扬爱与感恩。整首歌音调较高，小提琴和钢琴的伴奏更显悠扬。这首歌是《和自己对话》这张专辑的主打歌，是用人头录音方式进行录音的，记得要用耳机听哦！我家林林真的是一直用心在做音乐，请大家支持。', '2022-04-21 18:25:10', 0, 4, NULL, 1);
INSERT INTO `comment` VALUES (194, 11, 13, '梦为努力浇了水，爱在背后往前推。谢谢你，JJ。不管发生什么，想起你和你的歌，都让我的心暖暖的。', '2022-04-21 18:25:32', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (195, 12, 13, '在忙碌的日程中，林俊杰突然意识到自己一直在为梦想打拼，把所有的精力都献给了工作，有时没有调整好心态而演变成恶性循环，在不知不觉中变得很负面，于是他写下了这首《不为谁而作的歌》，希望通过音乐聆听自己内心的独白，找回自己，同时将心中的感谢诉诸歌曲，献给生命中曾向他伸出援手的人。', '2022-04-21 18:25:56', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (196, 8, 14, '唱的是天下，却句句都是她', '2022-04-21 18:27:06', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (197, 9, 14, '一曲天下，思绪回到古代征战前战士对青梅竹马的一句话，“待我衣锦还乡，便来娶你”', '2022-04-21 18:27:54', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (198, 4, 9, '没关系只要你肯回头望，会发现我一直都在。', '2022-04-21 18:29:18', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (199, 9, 9, '一听这首歌，忍不住潸然泪下，为了那只丢失的猫猫，那是我们对他永不失联的爱', '2022-04-21 18:29:34', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (200, 1, 9, '有些路只能一个人走，当你一个人熬过了所有的难过，也就没那么想和谁在一起了 ， 陌生人，愿你心宽如海，放得下过往，也装的下未来', '2022-04-21 18:30:32', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (201, 1, 7, '总有一天漫漫长夜里有人陪你说话，晚灯不灭有人等你回家 ——《那些你很冒险的梦》', '2022-04-21 18:30:55', 0, 7, NULL, 1);
INSERT INTO `comment` VALUES (202, 9, 7, '逆夏光年，风吹着两片落叶去冒险。身为渺小，但愿陪你在黑暗中摸索。就算伤痕累累，烟消云散，也要护你一世。就算我化作清风，也会在你身旁环绕。你喜欢冒险，而我却喜欢陪着你冒险。', '2022-04-21 18:31:28', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (203, 4, 22, '“你就像出现在我黑白世界里的彩虹，却又转瞬消失.”', '2022-04-21 18:36:45', 0, 5, NULL, 1);
INSERT INTO `comment` VALUES (204, 1, 22, '学美术不过一年，我却妄想画一道彩虹给你。我以为山水工笔画刻得出你，素描色彩能勾勒出你，油彩能绘得出你。却发现画得出的，我学过的，包括我，刚好都不是你想要的。', '2022-04-21 18:37:12', 0, 2, NULL, 1);
INSERT INTO `comment` VALUES (205, 4, 23, '音乐不分年龄，经典没有代沟!\n我们00后真的真的也很爱经典的老歌!', '2022-04-21 18:38:04', 0, 6, NULL, 1);
INSERT INTO `comment` VALUES (206, 11, 23, '或许一个男人最无奈的事，就是在最无能为力的年纪遇到了最想照顾一辈子的姑娘吧。甜，再见了，勿念。', '2022-04-21 18:38:43', 0, 3, NULL, 1);
INSERT INTO `comment` VALUES (207, 3, 51, '真不错\n', '2022-04-22 11:28:44', 0, 1, NULL, 0);
INSERT INTO `comment` VALUES (208, 3, 50, '这首歌 有2021年夏天的味道', '2022-04-22 11:30:06', 0, 1, NULL, 1);
INSERT INTO `comment` VALUES (209, 3, 51, '哎呀呀', '2022-04-22 11:56:56', 0, 0, NULL, 0);
INSERT INTO `comment` VALUES (210, 3, 51, 'good', '2022-04-22 11:57:53', 0, 0, NULL, 1);

-- ----------------------------
-- Table structure for like_comment
-- ----------------------------
DROP TABLE IF EXISTS `like_comment`;
CREATE TABLE `like_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_id` int(11) NOT NULL COMMENT '评论id',
  `state` tinyint(4) NOT NULL COMMENT '状态(1存在，0已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论点赞表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of like_comment
-- ----------------------------
INSERT INTO `like_comment` VALUES (1, 1, 1, 1);
INSERT INTO `like_comment` VALUES (3, 1, 3, 1);
INSERT INTO `like_comment` VALUES (6, 1, 10, 1);
INSERT INTO `like_comment` VALUES (7, 1, 7, 1);
INSERT INTO `like_comment` VALUES (8, 1, 9, 1);
INSERT INTO `like_comment` VALUES (9, 13, 11, 1);
INSERT INTO `like_comment` VALUES (10, 13, 12, 1);
INSERT INTO `like_comment` VALUES (11, 7, 17, 1);
INSERT INTO `like_comment` VALUES (12, 7, 18, 1);
INSERT INTO `like_comment` VALUES (13, 7, 15, 1);
INSERT INTO `like_comment` VALUES (14, 7, 13, 1);
INSERT INTO `like_comment` VALUES (15, 7, 12, 1);
INSERT INTO `like_comment` VALUES (16, 10, 18, 1);
INSERT INTO `like_comment` VALUES (17, 13, 18, 1);
INSERT INTO `like_comment` VALUES (18, 13, 32, 1);
INSERT INTO `like_comment` VALUES (19, 1, 32, 1);
INSERT INTO `like_comment` VALUES (20, 1, 33, 1);
INSERT INTO `like_comment` VALUES (21, 11, 34, 1);
INSERT INTO `like_comment` VALUES (22, 11, 33, 1);
INSERT INTO `like_comment` VALUES (23, 11, 18, 1);
INSERT INTO `like_comment` VALUES (24, 12, 36, 1);
INSERT INTO `like_comment` VALUES (25, 12, 18, 1);
INSERT INTO `like_comment` VALUES (26, 12, 33, 1);
INSERT INTO `like_comment` VALUES (27, 8, 40, 1);
INSERT INTO `like_comment` VALUES (28, 8, 38, 1);
INSERT INTO `like_comment` VALUES (29, 8, 36, 1);
INSERT INTO `like_comment` VALUES (30, 8, 33, 1);
INSERT INTO `like_comment` VALUES (31, 8, 18, 1);
INSERT INTO `like_comment` VALUES (32, 6, 32, 1);
INSERT INTO `like_comment` VALUES (33, 6, 34, 1);
INSERT INTO `like_comment` VALUES (34, 6, 35, 1);
INSERT INTO `like_comment` VALUES (35, 5, 35, 1);
INSERT INTO `like_comment` VALUES (36, 5, 18, 1);
INSERT INTO `like_comment` VALUES (37, 9, 18, 1);
INSERT INTO `like_comment` VALUES (38, 9, 34, 1);
INSERT INTO `like_comment` VALUES (39, 4, 18, 1);
INSERT INTO `like_comment` VALUES (40, 4, 17, 1);
INSERT INTO `like_comment` VALUES (41, 8, 17, 1);
INSERT INTO `like_comment` VALUES (42, 8, 42, 1);
INSERT INTO `like_comment` VALUES (43, 8, 43, 1);
INSERT INTO `like_comment` VALUES (44, 6, 43, 1);
INSERT INTO `like_comment` VALUES (45, 6, 42, 1);
INSERT INTO `like_comment` VALUES (46, 6, 44, 1);
INSERT INTO `like_comment` VALUES (47, 5, 17, 1);
INSERT INTO `like_comment` VALUES (48, 5, 43, 1);
INSERT INTO `like_comment` VALUES (49, 5, 42, 1);
INSERT INTO `like_comment` VALUES (50, 1, 46, 1);
INSERT INTO `like_comment` VALUES (51, 1, 44, 1);
INSERT INTO `like_comment` VALUES (52, 1, 42, 1);
INSERT INTO `like_comment` VALUES (53, 1, 17, 1);
INSERT INTO `like_comment` VALUES (54, 13, 47, 1);
INSERT INTO `like_comment` VALUES (55, 13, 46, 1);
INSERT INTO `like_comment` VALUES (56, 13, 43, 1);
INSERT INTO `like_comment` VALUES (57, 10, 17, 1);
INSERT INTO `like_comment` VALUES (58, 10, 45, 1);
INSERT INTO `like_comment` VALUES (59, 10, 44, 1);
INSERT INTO `like_comment` VALUES (60, 10, 42, 1);
INSERT INTO `like_comment` VALUES (61, 10, 31, 1);
INSERT INTO `like_comment` VALUES (62, 13, 31, 1);
INSERT INTO `like_comment` VALUES (63, 1, 51, 1);
INSERT INTO `like_comment` VALUES (64, 1, 31, 1);
INSERT INTO `like_comment` VALUES (65, 11, 52, 1);
INSERT INTO `like_comment` VALUES (66, 11, 50, 1);
INSERT INTO `like_comment` VALUES (67, 11, 31, 1);
INSERT INTO `like_comment` VALUES (68, 12, 31, 1);
INSERT INTO `like_comment` VALUES (69, 12, 51, 1);
INSERT INTO `like_comment` VALUES (70, 12, 52, 1);
INSERT INTO `like_comment` VALUES (71, 12, 53, 1);
INSERT INTO `like_comment` VALUES (72, 9, 55, 1);
INSERT INTO `like_comment` VALUES (73, 9, 54, 1);
INSERT INTO `like_comment` VALUES (74, 9, 51, 1);
INSERT INTO `like_comment` VALUES (75, 9, 31, 1);
INSERT INTO `like_comment` VALUES (76, 5, 31, 1);
INSERT INTO `like_comment` VALUES (77, 5, 51, 1);
INSERT INTO `like_comment` VALUES (78, 5, 52, 1);
INSERT INTO `like_comment` VALUES (79, 5, 55, 1);
INSERT INTO `like_comment` VALUES (80, 6, 31, 1);
INSERT INTO `like_comment` VALUES (81, 6, 56, 1);
INSERT INTO `like_comment` VALUES (82, 6, 57, 1);
INSERT INTO `like_comment` VALUES (83, 6, 54, 1);
INSERT INTO `like_comment` VALUES (84, 8, 59, 1);
INSERT INTO `like_comment` VALUES (85, 1, 61, 1);
INSERT INTO `like_comment` VALUES (86, 12, 63, 1);
INSERT INTO `like_comment` VALUES (87, 6, 64, 1);
INSERT INTO `like_comment` VALUES (88, 6, 62, 1);
INSERT INTO `like_comment` VALUES (89, 6, 65, 1);
INSERT INTO `like_comment` VALUES (90, 8, 61, 1);
INSERT INTO `like_comment` VALUES (91, 8, 63, 1);
INSERT INTO `like_comment` VALUES (92, 8, 64, 1);
INSERT INTO `like_comment` VALUES (93, 8, 65, 1);
INSERT INTO `like_comment` VALUES (94, 8, 68, 1);
INSERT INTO `like_comment` VALUES (95, 12, 69, 1);
INSERT INTO `like_comment` VALUES (96, 12, 68, 1);
INSERT INTO `like_comment` VALUES (97, 12, 70, 1);
INSERT INTO `like_comment` VALUES (98, 13, 68, 1);
INSERT INTO `like_comment` VALUES (99, 13, 71, 1);
INSERT INTO `like_comment` VALUES (100, 13, 72, 1);
INSERT INTO `like_comment` VALUES (101, 13, 70, 1);
INSERT INTO `like_comment` VALUES (102, 13, 74, 1);
INSERT INTO `like_comment` VALUES (103, 11, 74, 1);
INSERT INTO `like_comment` VALUES (104, 11, 75, 1);
INSERT INTO `like_comment` VALUES (105, 6, 76, 1);
INSERT INTO `like_comment` VALUES (106, 6, 74, 1);
INSERT INTO `like_comment` VALUES (107, 6, 75, 1);
INSERT INTO `like_comment` VALUES (108, 4, 78, 1);
INSERT INTO `like_comment` VALUES (109, 4, 75, 1);
INSERT INTO `like_comment` VALUES (110, 9, 85, 1);
INSERT INTO `like_comment` VALUES (111, 9, 84, 1);
INSERT INTO `like_comment` VALUES (112, 8, 87, 1);
INSERT INTO `like_comment` VALUES (113, 8, 85, 1);
INSERT INTO `like_comment` VALUES (114, 4, 88, 1);
INSERT INTO `like_comment` VALUES (115, 6, 89, 1);
INSERT INTO `like_comment` VALUES (116, 6, 88, 1);
INSERT INTO `like_comment` VALUES (117, 12, 88, 1);
INSERT INTO `like_comment` VALUES (118, 12, 89, 1);
INSERT INTO `like_comment` VALUES (119, 10, 93, 1);
INSERT INTO `like_comment` VALUES (120, 4, 97, 1);
INSERT INTO `like_comment` VALUES (121, 8, 97, 1);
INSERT INTO `like_comment` VALUES (122, 8, 98, 1);
INSERT INTO `like_comment` VALUES (123, 8, 14, 1);
INSERT INTO `like_comment` VALUES (124, 9, 97, 1);
INSERT INTO `like_comment` VALUES (125, 9, 98, 1);
INSERT INTO `like_comment` VALUES (126, 13, 100, 1);
INSERT INTO `like_comment` VALUES (127, 13, 99, 1);
INSERT INTO `like_comment` VALUES (128, 13, 98, 1);
INSERT INTO `like_comment` VALUES (129, 13, 97, 1);
INSERT INTO `like_comment` VALUES (130, 13, 101, 1);
INSERT INTO `like_comment` VALUES (131, 10, 102, 1);
INSERT INTO `like_comment` VALUES (132, 4, 98, 1);
INSERT INTO `like_comment` VALUES (133, 4, 103, 1);
INSERT INTO `like_comment` VALUES (134, 4, 106, 1);
INSERT INTO `like_comment` VALUES (135, 4, 22, 1);
INSERT INTO `like_comment` VALUES (136, 5, 103, 1);
INSERT INTO `like_comment` VALUES (137, 5, 104, 1);
INSERT INTO `like_comment` VALUES (138, 5, 98, 1);
INSERT INTO `like_comment` VALUES (139, 5, 97, 1);
INSERT INTO `like_comment` VALUES (140, 11, 97, 1);
INSERT INTO `like_comment` VALUES (141, 11, 103, 1);
INSERT INTO `like_comment` VALUES (142, 11, 102, 1);
INSERT INTO `like_comment` VALUES (143, 13, 108, 1);
INSERT INTO `like_comment` VALUES (144, 8, 109, 1);
INSERT INTO `like_comment` VALUES (145, 8, 107, 1);
INSERT INTO `like_comment` VALUES (146, 8, 15, 1);
INSERT INTO `like_comment` VALUES (147, 8, 21, 1);
INSERT INTO `like_comment` VALUES (148, 13, 21, 1);
INSERT INTO `like_comment` VALUES (149, 13, 15, 1);
INSERT INTO `like_comment` VALUES (150, 13, 112, 1);
INSERT INTO `like_comment` VALUES (151, 11, 114, 1);
INSERT INTO `like_comment` VALUES (152, 11, 115, 1);
INSERT INTO `like_comment` VALUES (153, 6, 116, 1);
INSERT INTO `like_comment` VALUES (154, 6, 114, 1);
INSERT INTO `like_comment` VALUES (155, 8, 114, 1);
INSERT INTO `like_comment` VALUES (156, 8, 115, 1);
INSERT INTO `like_comment` VALUES (157, 4, 24, 1);
INSERT INTO `like_comment` VALUES (158, 5, 119, 1);
INSERT INTO `like_comment` VALUES (159, 5, 24, 1);
INSERT INTO `like_comment` VALUES (160, 1, 120, 1);
INSERT INTO `like_comment` VALUES (161, 1, 119, 1);
INSERT INTO `like_comment` VALUES (162, 1, 118, 1);
INSERT INTO `like_comment` VALUES (163, 1, 24, 1);
INSERT INTO `like_comment` VALUES (164, 13, 120, 1);
INSERT INTO `like_comment` VALUES (165, 13, 121, 1);
INSERT INTO `like_comment` VALUES (166, 13, 118, 1);
INSERT INTO `like_comment` VALUES (167, 10, 121, 1);
INSERT INTO `like_comment` VALUES (168, 10, 24, 1);
INSERT INTO `like_comment` VALUES (169, 1, 16, 1);
INSERT INTO `like_comment` VALUES (170, 9, 123, 1);
INSERT INTO `like_comment` VALUES (171, 4, 124, 1);
INSERT INTO `like_comment` VALUES (172, 5, 124, 1);
INSERT INTO `like_comment` VALUES (173, 10, 23, 1);
INSERT INTO `like_comment` VALUES (174, 10, 127, 1);
INSERT INTO `like_comment` VALUES (175, 1, 127, 1);
INSERT INTO `like_comment` VALUES (176, 1, 23, 1);
INSERT INTO `like_comment` VALUES (177, 9, 23, 1);
INSERT INTO `like_comment` VALUES (178, 9, 129, 1);
INSERT INTO `like_comment` VALUES (179, 11, 122, 1);
INSERT INTO `like_comment` VALUES (180, 11, 16, 1);
INSERT INTO `like_comment` VALUES (181, 11, 125, 1);
INSERT INTO `like_comment` VALUES (182, 11, 126, 1);
INSERT INTO `like_comment` VALUES (183, 11, 129, 1);
INSERT INTO `like_comment` VALUES (184, 11, 130, 1);
INSERT INTO `like_comment` VALUES (185, 11, 131, 1);
INSERT INTO `like_comment` VALUES (186, 10, 133, 1);
INSERT INTO `like_comment` VALUES (187, 10, 132, 1);
INSERT INTO `like_comment` VALUES (188, 5, 132, 1);
INSERT INTO `like_comment` VALUES (189, 12, 134, 1);
INSERT INTO `like_comment` VALUES (190, 12, 132, 1);
INSERT INTO `like_comment` VALUES (191, 9, 133, 1);
INSERT INTO `like_comment` VALUES (192, 9, 132, 1);
INSERT INTO `like_comment` VALUES (193, 1, 133, 1);
INSERT INTO `like_comment` VALUES (194, 12, 135, 1);
INSERT INTO `like_comment` VALUES (195, 10, 136, 1);
INSERT INTO `like_comment` VALUES (196, 10, 135, 1);
INSERT INTO `like_comment` VALUES (197, 9, 139, 1);
INSERT INTO `like_comment` VALUES (198, 9, 138, 1);
INSERT INTO `like_comment` VALUES (199, 8, 140, 1);
INSERT INTO `like_comment` VALUES (200, 8, 141, 1);
INSERT INTO `like_comment` VALUES (201, 5, 26, 1);
INSERT INTO `like_comment` VALUES (202, 11, 136, 1);
INSERT INTO `like_comment` VALUES (203, 11, 137, 1);
INSERT INTO `like_comment` VALUES (204, 11, 140, 1);
INSERT INTO `like_comment` VALUES (205, 11, 141, 1);
INSERT INTO `like_comment` VALUES (206, 11, 142, 1);
INSERT INTO `like_comment` VALUES (207, 11, 26, 1);
INSERT INTO `like_comment` VALUES (208, 10, 26, 1);
INSERT INTO `like_comment` VALUES (209, 10, 143, 1);
INSERT INTO `like_comment` VALUES (210, 13, 136, 1);
INSERT INTO `like_comment` VALUES (211, 13, 137, 1);
INSERT INTO `like_comment` VALUES (212, 13, 139, 1);
INSERT INTO `like_comment` VALUES (213, 13, 138, 1);
INSERT INTO `like_comment` VALUES (214, 13, 144, 1);
INSERT INTO `like_comment` VALUES (215, 13, 142, 1);
INSERT INTO `like_comment` VALUES (216, 4, 139, 1);
INSERT INTO `like_comment` VALUES (217, 4, 141, 1);
INSERT INTO `like_comment` VALUES (218, 4, 26, 1);
INSERT INTO `like_comment` VALUES (219, 4, 143, 1);
INSERT INTO `like_comment` VALUES (220, 4, 145, 1);
INSERT INTO `like_comment` VALUES (221, 6, 124, 1);
INSERT INTO `like_comment` VALUES (222, 6, 125, 1);
INSERT INTO `like_comment` VALUES (223, 6, 129, 1);
INSERT INTO `like_comment` VALUES (224, 6, 128, 1);
INSERT INTO `like_comment` VALUES (225, 6, 134, 1);
INSERT INTO `like_comment` VALUES (226, 6, 132, 1);
INSERT INTO `like_comment` VALUES (227, 6, 137, 1);
INSERT INTO `like_comment` VALUES (228, 6, 135, 1);
INSERT INTO `like_comment` VALUES (229, 6, 141, 1);
INSERT INTO `like_comment` VALUES (230, 6, 139, 1);
INSERT INTO `like_comment` VALUES (231, 6, 144, 1);
INSERT INTO `like_comment` VALUES (232, 6, 142, 1);
INSERT INTO `like_comment` VALUES (233, 6, 145, 1);
INSERT INTO `like_comment` VALUES (234, 9, 143, 1);
INSERT INTO `like_comment` VALUES (235, 9, 146, 1);
INSERT INTO `like_comment` VALUES (236, 9, 145, 1);
INSERT INTO `like_comment` VALUES (237, 13, 146, 1);
INSERT INTO `like_comment` VALUES (238, 13, 145, 1);
INSERT INTO `like_comment` VALUES (239, 12, 143, 1);
INSERT INTO `like_comment` VALUES (240, 12, 26, 1);
INSERT INTO `like_comment` VALUES (241, 12, 145, 1);
INSERT INTO `like_comment` VALUES (242, 12, 147, 1);
INSERT INTO `like_comment` VALUES (243, 12, 148, 1);
INSERT INTO `like_comment` VALUES (244, 1, 149, 1);
INSERT INTO `like_comment` VALUES (245, 4, 150, 1);
INSERT INTO `like_comment` VALUES (246, 4, 149, 1);
INSERT INTO `like_comment` VALUES (247, 10, 146, 1);
INSERT INTO `like_comment` VALUES (248, 10, 147, 1);
INSERT INTO `like_comment` VALUES (249, 10, 151, 1);
INSERT INTO `like_comment` VALUES (250, 10, 149, 1);
INSERT INTO `like_comment` VALUES (251, 13, 150, 1);
INSERT INTO `like_comment` VALUES (252, 13, 152, 1);
INSERT INTO `like_comment` VALUES (253, 13, 153, 1);
INSERT INTO `like_comment` VALUES (254, 11, 146, 1);
INSERT INTO `like_comment` VALUES (255, 11, 150, 1);
INSERT INTO `like_comment` VALUES (256, 11, 154, 1);
INSERT INTO `like_comment` VALUES (257, 5, 145, 1);
INSERT INTO `like_comment` VALUES (258, 5, 149, 1);
INSERT INTO `like_comment` VALUES (259, 5, 153, 1);
INSERT INTO `like_comment` VALUES (260, 6, 154, 1);
INSERT INTO `like_comment` VALUES (261, 6, 155, 1);
INSERT INTO `like_comment` VALUES (262, 6, 25, 1);
INSERT INTO `like_comment` VALUES (263, 6, 156, 1);
INSERT INTO `like_comment` VALUES (264, 8, 142, 1);
INSERT INTO `like_comment` VALUES (265, 8, 148, 1);
INSERT INTO `like_comment` VALUES (266, 8, 145, 1);
INSERT INTO `like_comment` VALUES (267, 8, 146, 1);
INSERT INTO `like_comment` VALUES (268, 8, 149, 1);
INSERT INTO `like_comment` VALUES (269, 8, 155, 1);
INSERT INTO `like_comment` VALUES (270, 8, 157, 1);
INSERT INTO `like_comment` VALUES (271, 8, 25, 1);
INSERT INTO `like_comment` VALUES (272, 11, 158, 1);
INSERT INTO `like_comment` VALUES (273, 11, 25, 1);
INSERT INTO `like_comment` VALUES (274, 9, 151, 1);
INSERT INTO `like_comment` VALUES (275, 9, 155, 1);
INSERT INTO `like_comment` VALUES (276, 9, 158, 1);
INSERT INTO `like_comment` VALUES (277, 9, 159, 1);
INSERT INTO `like_comment` VALUES (278, 5, 160, 1);
INSERT INTO `like_comment` VALUES (279, 5, 159, 1);
INSERT INTO `like_comment` VALUES (280, 13, 158, 1);
INSERT INTO `like_comment` VALUES (281, 13, 159, 1);
INSERT INTO `like_comment` VALUES (282, 13, 161, 1);
INSERT INTO `like_comment` VALUES (283, 1, 153, 1);
INSERT INTO `like_comment` VALUES (284, 1, 155, 1);
INSERT INTO `like_comment` VALUES (285, 1, 158, 1);
INSERT INTO `like_comment` VALUES (286, 1, 160, 1);
INSERT INTO `like_comment` VALUES (287, 1, 163, 1);
INSERT INTO `like_comment` VALUES (288, 6, 161, 1);
INSERT INTO `like_comment` VALUES (289, 6, 163, 1);
INSERT INTO `like_comment` VALUES (290, 6, 164, 1);
INSERT INTO `like_comment` VALUES (291, 5, 165, 1);
INSERT INTO `like_comment` VALUES (292, 5, 163, 1);
INSERT INTO `like_comment` VALUES (293, 4, 155, 1);
INSERT INTO `like_comment` VALUES (294, 4, 158, 1);
INSERT INTO `like_comment` VALUES (295, 4, 162, 1);
INSERT INTO `like_comment` VALUES (296, 4, 164, 1);
INSERT INTO `like_comment` VALUES (297, 4, 27, 1);
INSERT INTO `like_comment` VALUES (298, 11, 164, 1);
INSERT INTO `like_comment` VALUES (299, 11, 13, 1);
INSERT INTO `like_comment` VALUES (300, 10, 168, 1);
INSERT INTO `like_comment` VALUES (301, 9, 164, 1);
INSERT INTO `like_comment` VALUES (302, 9, 13, 1);
INSERT INTO `like_comment` VALUES (303, 9, 168, 1);
INSERT INTO `like_comment` VALUES (304, 9, 170, 1);
INSERT INTO `like_comment` VALUES (305, 6, 166, 1);
INSERT INTO `like_comment` VALUES (306, 6, 169, 1);
INSERT INTO `like_comment` VALUES (307, 6, 171, 1);
INSERT INTO `like_comment` VALUES (308, 11, 169, 1);
INSERT INTO `like_comment` VALUES (309, 11, 173, 1);
INSERT INTO `like_comment` VALUES (310, 13, 173, 1);
INSERT INTO `like_comment` VALUES (311, 10, 172, 1);
INSERT INTO `like_comment` VALUES (312, 1, 167, 1);
INSERT INTO `like_comment` VALUES (313, 1, 168, 1);
INSERT INTO `like_comment` VALUES (314, 1, 172, 1);
INSERT INTO `like_comment` VALUES (315, 1, 174, 1);
INSERT INTO `like_comment` VALUES (316, 12, 155, 1);
INSERT INTO `like_comment` VALUES (317, 12, 158, 1);
INSERT INTO `like_comment` VALUES (318, 12, 161, 1);
INSERT INTO `like_comment` VALUES (319, 12, 165, 1);
INSERT INTO `like_comment` VALUES (320, 12, 167, 1);
INSERT INTO `like_comment` VALUES (321, 12, 168, 1);
INSERT INTO `like_comment` VALUES (322, 12, 172, 1);
INSERT INTO `like_comment` VALUES (323, 12, 175, 1);
INSERT INTO `like_comment` VALUES (324, 12, 174, 1);
INSERT INTO `like_comment` VALUES (325, 12, 176, 1);
INSERT INTO `like_comment` VALUES (326, 12, 177, 1);
INSERT INTO `like_comment` VALUES (327, 5, 178, 1);
INSERT INTO `like_comment` VALUES (328, 5, 174, 1);
INSERT INTO `like_comment` VALUES (329, 5, 175, 1);
INSERT INTO `like_comment` VALUES (330, 5, 177, 1);
INSERT INTO `like_comment` VALUES (331, 6, 179, 1);
INSERT INTO `like_comment` VALUES (332, 6, 177, 1);
INSERT INTO `like_comment` VALUES (333, 6, 175, 1);
INSERT INTO `like_comment` VALUES (334, 6, 174, 1);
INSERT INTO `like_comment` VALUES (335, 8, 160, 1);
INSERT INTO `like_comment` VALUES (336, 8, 164, 1);
INSERT INTO `like_comment` VALUES (337, 8, 163, 1);
INSERT INTO `like_comment` VALUES (338, 8, 13, 1);
INSERT INTO `like_comment` VALUES (339, 8, 168, 1);
INSERT INTO `like_comment` VALUES (340, 8, 172, 1);
INSERT INTO `like_comment` VALUES (341, 8, 174, 1);
INSERT INTO `like_comment` VALUES (342, 8, 176, 1);
INSERT INTO `like_comment` VALUES (343, 8, 177, 1);
INSERT INTO `like_comment` VALUES (344, 8, 178, 1);
INSERT INTO `like_comment` VALUES (345, 4, 168, 1);
INSERT INTO `like_comment` VALUES (346, 4, 171, 1);
INSERT INTO `like_comment` VALUES (347, 4, 174, 1);
INSERT INTO `like_comment` VALUES (348, 4, 179, 1);
INSERT INTO `like_comment` VALUES (349, 4, 178, 1);
INSERT INTO `like_comment` VALUES (350, 4, 177, 1);
INSERT INTO `like_comment` VALUES (351, 4, 176, 1);
INSERT INTO `like_comment` VALUES (352, 5, 182, 1);
INSERT INTO `like_comment` VALUES (353, 12, 182, 1);
INSERT INTO `like_comment` VALUES (354, 12, 183, 1);
INSERT INTO `like_comment` VALUES (355, 10, 184, 1);
INSERT INTO `like_comment` VALUES (356, 10, 182, 1);
INSERT INTO `like_comment` VALUES (357, 10, 28, 1);
INSERT INTO `like_comment` VALUES (358, 11, 178, 1);
INSERT INTO `like_comment` VALUES (359, 11, 177, 1);
INSERT INTO `like_comment` VALUES (360, 11, 175, 1);
INSERT INTO `like_comment` VALUES (361, 11, 174, 1);
INSERT INTO `like_comment` VALUES (362, 11, 184, 1);
INSERT INTO `like_comment` VALUES (363, 11, 185, 1);
INSERT INTO `like_comment` VALUES (364, 11, 186, 1);
INSERT INTO `like_comment` VALUES (365, 6, 184, 1);
INSERT INTO `like_comment` VALUES (366, 6, 188, 1);
INSERT INTO `like_comment` VALUES (367, 6, 186, 1);
INSERT INTO `like_comment` VALUES (368, 6, 189, 1);
INSERT INTO `like_comment` VALUES (369, 11, 11, 1);
INSERT INTO `like_comment` VALUES (370, 10, 189, 1);
INSERT INTO `like_comment` VALUES (371, 10, 190, 1);
INSERT INTO `like_comment` VALUES (372, 11, 193, 1);
INSERT INTO `like_comment` VALUES (373, 12, 28, 1);
INSERT INTO `like_comment` VALUES (374, 12, 186, 1);
INSERT INTO `like_comment` VALUES (375, 12, 189, 1);
INSERT INTO `like_comment` VALUES (376, 12, 11, 1);
INSERT INTO `like_comment` VALUES (377, 12, 195, 1);
INSERT INTO `like_comment` VALUES (378, 12, 194, 1);
INSERT INTO `like_comment` VALUES (379, 12, 193, 1);
INSERT INTO `like_comment` VALUES (380, 8, 184, 1);
INSERT INTO `like_comment` VALUES (381, 8, 185, 1);
INSERT INTO `like_comment` VALUES (382, 8, 187, 1);
INSERT INTO `like_comment` VALUES (383, 8, 189, 1);
INSERT INTO `like_comment` VALUES (384, 8, 192, 1);
INSERT INTO `like_comment` VALUES (385, 8, 195, 1);
INSERT INTO `like_comment` VALUES (386, 9, 173, 1);
INSERT INTO `like_comment` VALUES (387, 9, 172, 1);
INSERT INTO `like_comment` VALUES (388, 9, 174, 1);
INSERT INTO `like_comment` VALUES (389, 9, 181, 1);
INSERT INTO `like_comment` VALUES (390, 9, 179, 1);
INSERT INTO `like_comment` VALUES (391, 9, 183, 1);
INSERT INTO `like_comment` VALUES (392, 9, 188, 1);
INSERT INTO `like_comment` VALUES (393, 9, 190, 1);
INSERT INTO `like_comment` VALUES (394, 9, 11, 1);
INSERT INTO `like_comment` VALUES (395, 9, 193, 1);
INSERT INTO `like_comment` VALUES (396, 9, 196, 1);
INSERT INTO `like_comment` VALUES (397, 5, 186, 1);
INSERT INTO `like_comment` VALUES (398, 5, 190, 1);
INSERT INTO `like_comment` VALUES (399, 5, 191, 1);
INSERT INTO `like_comment` VALUES (400, 5, 195, 1);
INSERT INTO `like_comment` VALUES (401, 5, 197, 1);
INSERT INTO `like_comment` VALUES (402, 4, 191, 1);
INSERT INTO `like_comment` VALUES (403, 4, 195, 1);
INSERT INTO `like_comment` VALUES (404, 4, 196, 1);
INSERT INTO `like_comment` VALUES (405, 9, 198, 1);
INSERT INTO `like_comment` VALUES (406, 1, 184, 1);
INSERT INTO `like_comment` VALUES (407, 1, 188, 1);
INSERT INTO `like_comment` VALUES (408, 1, 187, 1);
INSERT INTO `like_comment` VALUES (409, 1, 189, 1);
INSERT INTO `like_comment` VALUES (410, 1, 193, 1);
INSERT INTO `like_comment` VALUES (411, 1, 196, 1);
INSERT INTO `like_comment` VALUES (412, 1, 201, 1);
INSERT INTO `like_comment` VALUES (413, 9, 199, 1);
INSERT INTO `like_comment` VALUES (414, 6, 192, 1);
INSERT INTO `like_comment` VALUES (415, 6, 195, 1);
INSERT INTO `like_comment` VALUES (416, 6, 196, 1);
INSERT INTO `like_comment` VALUES (417, 6, 199, 1);
INSERT INTO `like_comment` VALUES (418, 6, 200, 1);
INSERT INTO `like_comment` VALUES (419, 6, 201, 1);
INSERT INTO `like_comment` VALUES (420, 6, 202, 1);
INSERT INTO `like_comment` VALUES (421, 4, 201, 1);
INSERT INTO `like_comment` VALUES (422, 11, 196, 1);
INSERT INTO `like_comment` VALUES (423, 11, 198, 1);
INSERT INTO `like_comment` VALUES (424, 11, 201, 1);
INSERT INTO `like_comment` VALUES (425, 11, 1, 1);
INSERT INTO `like_comment` VALUES (426, 11, 203, 1);
INSERT INTO `like_comment` VALUES (427, 10, 196, 1);
INSERT INTO `like_comment` VALUES (428, 10, 199, 1);
INSERT INTO `like_comment` VALUES (429, 10, 198, 1);
INSERT INTO `like_comment` VALUES (430, 10, 201, 1);
INSERT INTO `like_comment` VALUES (431, 10, 7, 1);
INSERT INTO `like_comment` VALUES (432, 10, 203, 1);
INSERT INTO `like_comment` VALUES (433, 10, 204, 1);
INSERT INTO `like_comment` VALUES (434, 10, 30, 1);
INSERT INTO `like_comment` VALUES (435, 10, 205, 1);
INSERT INTO `like_comment` VALUES (436, 10, 206, 1);
INSERT INTO `like_comment` VALUES (437, 13, 174, 1);
INSERT INTO `like_comment` VALUES (438, 13, 175, 1);
INSERT INTO `like_comment` VALUES (439, 13, 180, 1);
INSERT INTO `like_comment` VALUES (440, 13, 181, 1);
INSERT INTO `like_comment` VALUES (441, 13, 184, 1);
INSERT INTO `like_comment` VALUES (442, 13, 186, 1);
INSERT INTO `like_comment` VALUES (443, 13, 189, 1);
INSERT INTO `like_comment` VALUES (444, 13, 192, 1);
INSERT INTO `like_comment` VALUES (445, 13, 195, 1);
INSERT INTO `like_comment` VALUES (446, 13, 197, 1);
INSERT INTO `like_comment` VALUES (447, 13, 198, 1);
INSERT INTO `like_comment` VALUES (448, 13, 201, 1);
INSERT INTO `like_comment` VALUES (449, 13, 1, 1);
INSERT INTO `like_comment` VALUES (450, 13, 7, 1);
INSERT INTO `like_comment` VALUES (451, 13, 203, 1);
INSERT INTO `like_comment` VALUES (452, 13, 205, 1);
INSERT INTO `like_comment` VALUES (453, 1, 205, 1);
INSERT INTO `like_comment` VALUES (454, 12, 197, 1);
INSERT INTO `like_comment` VALUES (455, 12, 202, 1);
INSERT INTO `like_comment` VALUES (456, 12, 204, 1);
INSERT INTO `like_comment` VALUES (457, 12, 206, 1);
INSERT INTO `like_comment` VALUES (458, 9, 205, 1);
INSERT INTO `like_comment` VALUES (459, 5, 201, 1);
INSERT INTO `like_comment` VALUES (460, 5, 7, 1);
INSERT INTO `like_comment` VALUES (461, 5, 203, 1);
INSERT INTO `like_comment` VALUES (462, 5, 205, 1);
INSERT INTO `like_comment` VALUES (463, 6, 205, 1);
INSERT INTO `like_comment` VALUES (464, 8, 198, 1);
INSERT INTO `like_comment` VALUES (465, 8, 202, 1);
INSERT INTO `like_comment` VALUES (466, 8, 7, 1);
INSERT INTO `like_comment` VALUES (467, 8, 203, 1);
INSERT INTO `like_comment` VALUES (468, 8, 206, 1);
INSERT INTO `like_comment` VALUES (469, 4, 181, 1);
INSERT INTO `like_comment` VALUES (470, 4, 72, 1);
INSERT INTO `like_comment` VALUES (471, 4, 70, 1);
INSERT INTO `like_comment` VALUES (472, 3, 40, 1);
INSERT INTO `like_comment` VALUES (473, 3, 39, 1);
INSERT INTO `like_comment` VALUES (474, 3, 58, 1);
INSERT INTO `like_comment` VALUES (475, 3, 67, 1);
INSERT INTO `like_comment` VALUES (476, 3, 207, 1);
INSERT INTO `like_comment` VALUES (477, 3, 41, 1);
INSERT INTO `like_comment` VALUES (478, 4, 208, 1);
INSERT INTO `like_comment` VALUES (479, 4, 58, 1);

-- ----------------------------
-- Table structure for list_song
-- ----------------------------
DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `song_id` int(11) UNSIGNED NOT NULL COMMENT '歌曲id',
  `song_list_id` int(11) UNSIGNED NOT NULL COMMENT '歌单id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '歌曲添加到歌单时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of list_song
-- ----------------------------
INSERT INTO `list_song` VALUES (1, 2, 11, '2022-03-15 23:25:38', '1');
INSERT INTO `list_song` VALUES (2, 3, 11, '2022-03-15 23:26:23', '1');
INSERT INTO `list_song` VALUES (3, 4, 11, '2022-03-18 00:07:48', '1');
INSERT INTO `list_song` VALUES (4, 7, 11, '2022-03-20 23:39:22', '1');
INSERT INTO `list_song` VALUES (5, 11, 11, '2022-03-21 00:19:22', '1');
INSERT INTO `list_song` VALUES (6, 15, 11, '2022-03-21 00:21:51', '1');
INSERT INTO `list_song` VALUES (7, 2, 10, '2022-03-21 21:07:48', '1');
INSERT INTO `list_song` VALUES (8, 3, 10, '2022-03-21 21:09:11', '1');
INSERT INTO `list_song` VALUES (9, 15, 10, '2022-03-21 21:11:04', '1');
INSERT INTO `list_song` VALUES (10, 4, 10, '2022-03-21 21:22:46', '1');
INSERT INTO `list_song` VALUES (11, 7, 10, '2022-03-21 21:23:05', '1');
INSERT INTO `list_song` VALUES (12, 12, 9, '2022-03-21 21:23:37', '1');
INSERT INTO `list_song` VALUES (13, 2, 9, '2022-03-21 21:25:38', '1');
INSERT INTO `list_song` VALUES (14, 3, 9, '2022-03-21 21:31:16', '1');
INSERT INTO `list_song` VALUES (15, 4, 9, '2022-03-21 21:33:41', '1');
INSERT INTO `list_song` VALUES (16, 7, 9, '2022-03-21 21:33:44', '1');
INSERT INTO `list_song` VALUES (17, 11, 9, '2022-03-21 21:33:52', '1');
INSERT INTO `list_song` VALUES (18, 10, 8, '2022-03-21 21:36:11', '1');
INSERT INTO `list_song` VALUES (19, 2, 8, '2022-03-21 21:36:14', '1');
INSERT INTO `list_song` VALUES (20, 3, 8, '2022-03-21 21:41:48', '1');
INSERT INTO `list_song` VALUES (21, 11, 8, '2022-03-21 21:41:53', '1');
INSERT INTO `list_song` VALUES (22, 4, 8, '2022-03-21 22:33:41', '1');
INSERT INTO `list_song` VALUES (23, 7, 8, '2022-03-21 22:33:46', '1');
INSERT INTO `list_song` VALUES (24, 9, 8, '2022-04-11 04:07:49', '1');
INSERT INTO `list_song` VALUES (25, 13, 8, '2022-04-11 04:08:02', '1');
INSERT INTO `list_song` VALUES (26, 22, 8, '2022-04-11 04:08:16', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统通知id，主键，自增',
  `user_id` int(11) NOT NULL COMMENT '管理员id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通告内容',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '更新日期',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `state` tinyint(4) NOT NULL COMMENT '状态(0存在，1已删除)',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 3, '周五完音乐厅音乐表演，欢迎来看哦', '音乐厅音乐演奏', '2022-04-10 20:07:55', '2022-04-21 00:00:00', '2022-04-22 00:00:00', 1);
INSERT INTO `notice` VALUES (2, 3, '周末草坪音乐会不见不散', '草坪音乐会', '2022-04-10 20:09:34', '2022-04-10 20:09:34', '2022-04-12 20:09:34', 1);
INSERT INTO `notice` VALUES (3, 3, '你好，我是来自云村最可爱的多多，这位是我的好伙伴西西，在微软小冰的帮助下，我们学会了你们人类的语言，do-mi', '草坪音乐会', '2022-04-10 20:11:28', '2022-04-10 00:00:00', '2022-04-20 00:00:00', 1);
INSERT INTO `notice` VALUES (4, 3, '欢迎来看迎新晚会', '迎新晚会', '2022-04-12 23:53:33', '2022-04-12 19:30:00', '2022-04-19 22:00:00', 1);
INSERT INTO `notice` VALUES (5, 3, '校园十佳歌手比赛欢迎来观。', '校园十佳歌手比赛', '2022-04-12 23:58:52', '2022-04-15 00:00:00', '2022-04-18 00:00:00', 1);
INSERT INTO `notice` VALUES (6, 3, '大家本周草坪音乐会想听些什么歌呢？', '草坪音乐会', '2022-04-13 00:12:32', '2022-04-15 00:00:00', '2022-04-17 00:00:00', 1);
INSERT INTO `notice` VALUES (7, 3, '每一首歌都像一台时间机器，带着一段记忆——\n或许是不经意留在你⼼里的微笑，不留神走进你梦里的人，留下美好回忆的地方…...\n「热歌放映厅」让音乐看得见，特别邀请爱音乐的你抢先体验。\n音乐看着听，更好听。', '热歌放映厅', '2022-04-16 22:48:32', '2022-04-15 00:10:00', '2022-04-16 00:22:00', 1);
INSERT INTO `notice` VALUES (8, 3, '亲爱的云村村民：\n感谢你2019年的聆听，云村来给你送一大堆新年礼物啦——\niPhone11、欧洲双人游、黑胶会员……100%有礼！\n1月4日最后一天，每个人都有5次的免费领取机会，你会领到什么新年礼物？', '云村礼物大派送', '2022-04-16 22:55:39', '2022-04-16 00:00:00', '2022-04-20 00:00:00', 1);

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank`  (
  `rank_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评分id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '评分用户id',
  `score` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分',
  `song_id` int(11) NOT NULL COMMENT '歌单id',
  PRIMARY KEY (`rank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 468 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES (1, 1, 5, 2);
INSERT INTO `rank` VALUES (2, 3, 4, 2);
INSERT INTO `rank` VALUES (3, 4, 9, 2);
INSERT INTO `rank` VALUES (4, 1, 9, 3);
INSERT INTO `rank` VALUES (5, 1, 8, 4);
INSERT INTO `rank` VALUES (6, 1, 9, 9);
INSERT INTO `rank` VALUES (7, 1, 7, 13);
INSERT INTO `rank` VALUES (8, 13, 7, 2);
INSERT INTO `rank` VALUES (9, 13, 10, 3);
INSERT INTO `rank` VALUES (10, 13, 3, 4);
INSERT INTO `rank` VALUES (11, 13, 9, 7);
INSERT INTO `rank` VALUES (12, 13, 7, 11);
INSERT INTO `rank` VALUES (13, 13, 2, 15);
INSERT INTO `rank` VALUES (14, 13, 6, 26);
INSERT INTO `rank` VALUES (15, 13, 4, 27);
INSERT INTO `rank` VALUES (16, 13, 7, 9);
INSERT INTO `rank` VALUES (17, 6, 7, 17);
INSERT INTO `rank` VALUES (18, 6, 6, 41);
INSERT INTO `rank` VALUES (19, 6, 7, 35);
INSERT INTO `rank` VALUES (20, 6, 4, 38);
INSERT INTO `rank` VALUES (21, 7, 7, 50);
INSERT INTO `rank` VALUES (22, 7, 8, 49);
INSERT INTO `rank` VALUES (23, 7, 9, 51);
INSERT INTO `rank` VALUES (24, 7, 6, 46);
INSERT INTO `rank` VALUES (25, 7, 8, 42);
INSERT INTO `rank` VALUES (26, 7, 2, 38);
INSERT INTO `rank` VALUES (27, 7, 3, 40);
INSERT INTO `rank` VALUES (28, 7, 5, 33);
INSERT INTO `rank` VALUES (29, 7, 7, 36);
INSERT INTO `rank` VALUES (30, 7, 7, 25);
INSERT INTO `rank` VALUES (31, 7, 3, 29);
INSERT INTO `rank` VALUES (32, 7, 5, 17);
INSERT INTO `rank` VALUES (33, 7, 3, 3);
INSERT INTO `rank` VALUES (34, 7, 7, 14);
INSERT INTO `rank` VALUES (35, 7, 5, 7);
INSERT INTO `rank` VALUES (36, 7, 5, 23);
INSERT INTO `rank` VALUES (37, 10, 8, 51);
INSERT INTO `rank` VALUES (38, 10, 7, 50);
INSERT INTO `rank` VALUES (39, 10, 3, 49);
INSERT INTO `rank` VALUES (40, 10, 5, 48);
INSERT INTO `rank` VALUES (41, 10, 7, 47);
INSERT INTO `rank` VALUES (42, 10, 7, 46);
INSERT INTO `rank` VALUES (43, 10, 4, 45);
INSERT INTO `rank` VALUES (44, 10, 7, 44);
INSERT INTO `rank` VALUES (45, 10, 4, 43);
INSERT INTO `rank` VALUES (46, 10, 4, 42);
INSERT INTO `rank` VALUES (47, 10, 5, 41);
INSERT INTO `rank` VALUES (48, 10, 6, 40);
INSERT INTO `rank` VALUES (49, 10, 6, 39);
INSERT INTO `rank` VALUES (50, 10, 6, 38);
INSERT INTO `rank` VALUES (51, 10, 8, 37);
INSERT INTO `rank` VALUES (52, 10, 4, 36);
INSERT INTO `rank` VALUES (53, 10, 8, 35);
INSERT INTO `rank` VALUES (54, 10, 8, 34);
INSERT INTO `rank` VALUES (55, 10, 3, 33);
INSERT INTO `rank` VALUES (56, 10, 6, 32);
INSERT INTO `rank` VALUES (57, 10, 8, 31);
INSERT INTO `rank` VALUES (58, 10, 6, 30);
INSERT INTO `rank` VALUES (59, 10, 6, 29);
INSERT INTO `rank` VALUES (60, 10, 6, 28);
INSERT INTO `rank` VALUES (61, 10, 4, 27);
INSERT INTO `rank` VALUES (62, 10, 8, 26);
INSERT INTO `rank` VALUES (63, 10, 8, 25);
INSERT INTO `rank` VALUES (64, 10, 7, 10);
INSERT INTO `rank` VALUES (65, 10, 8, 16);
INSERT INTO `rank` VALUES (66, 10, 7, 17);
INSERT INTO `rank` VALUES (67, 10, 6, 19);
INSERT INTO `rank` VALUES (68, 10, 7, 20);
INSERT INTO `rank` VALUES (69, 10, 10, 21);
INSERT INTO `rank` VALUES (70, 10, 6, 18);
INSERT INTO `rank` VALUES (71, 10, 6, 3);
INSERT INTO `rank` VALUES (72, 10, 7, 11);
INSERT INTO `rank` VALUES (73, 10, 8, 15);
INSERT INTO `rank` VALUES (74, 10, 8, 13);
INSERT INTO `rank` VALUES (75, 10, 6, 14);
INSERT INTO `rank` VALUES (76, 10, 8, 9);
INSERT INTO `rank` VALUES (77, 10, 7, 7);
INSERT INTO `rank` VALUES (78, 10, 2, 4);
INSERT INTO `rank` VALUES (79, 10, 8, 2);
INSERT INTO `rank` VALUES (80, 10, 3, 22);
INSERT INTO `rank` VALUES (81, 10, 7, 23);
INSERT INTO `rank` VALUES (82, 13, 7, 51);
INSERT INTO `rank` VALUES (83, 13, 8, 50);
INSERT INTO `rank` VALUES (84, 13, 8, 49);
INSERT INTO `rank` VALUES (85, 13, 9, 48);
INSERT INTO `rank` VALUES (86, 13, 8, 47);
INSERT INTO `rank` VALUES (87, 13, 8, 46);
INSERT INTO `rank` VALUES (88, 13, 6, 45);
INSERT INTO `rank` VALUES (89, 13, 6, 44);
INSERT INTO `rank` VALUES (90, 13, 4, 43);
INSERT INTO `rank` VALUES (91, 13, 4, 42);
INSERT INTO `rank` VALUES (92, 13, 5, 41);
INSERT INTO `rank` VALUES (93, 13, 2, 40);
INSERT INTO `rank` VALUES (94, 13, 4, 39);
INSERT INTO `rank` VALUES (95, 13, 7, 38);
INSERT INTO `rank` VALUES (96, 13, 6, 37);
INSERT INTO `rank` VALUES (97, 13, 8, 36);
INSERT INTO `rank` VALUES (98, 13, 8, 35);
INSERT INTO `rank` VALUES (99, 13, 6, 34);
INSERT INTO `rank` VALUES (100, 13, 6, 33);
INSERT INTO `rank` VALUES (101, 13, 5, 32);
INSERT INTO `rank` VALUES (102, 13, 6, 31);
INSERT INTO `rank` VALUES (103, 13, 7, 30);
INSERT INTO `rank` VALUES (104, 13, 8, 29);
INSERT INTO `rank` VALUES (105, 13, 7, 28);
INSERT INTO `rank` VALUES (106, 13, 8, 25);
INSERT INTO `rank` VALUES (107, 13, 6, 10);
INSERT INTO `rank` VALUES (108, 13, 6, 16);
INSERT INTO `rank` VALUES (109, 13, 7, 17);
INSERT INTO `rank` VALUES (110, 13, 8, 19);
INSERT INTO `rank` VALUES (111, 13, 5, 20);
INSERT INTO `rank` VALUES (112, 13, 7, 21);
INSERT INTO `rank` VALUES (113, 13, 7, 18);
INSERT INTO `rank` VALUES (114, 13, 8, 13);
INSERT INTO `rank` VALUES (115, 13, 7, 14);
INSERT INTO `rank` VALUES (116, 13, 7, 22);
INSERT INTO `rank` VALUES (117, 13, 8, 23);
INSERT INTO `rank` VALUES (118, 1, 8, 51);
INSERT INTO `rank` VALUES (119, 1, 8, 50);
INSERT INTO `rank` VALUES (120, 1, 7, 49);
INSERT INTO `rank` VALUES (121, 1, 6, 48);
INSERT INTO `rank` VALUES (122, 1, 6, 47);
INSERT INTO `rank` VALUES (123, 1, 7, 46);
INSERT INTO `rank` VALUES (124, 1, 5, 45);
INSERT INTO `rank` VALUES (125, 1, 9, 44);
INSERT INTO `rank` VALUES (126, 1, 7, 43);
INSERT INTO `rank` VALUES (127, 1, 8, 42);
INSERT INTO `rank` VALUES (128, 1, 8, 41);
INSERT INTO `rank` VALUES (129, 1, 6, 40);
INSERT INTO `rank` VALUES (130, 1, 8, 39);
INSERT INTO `rank` VALUES (131, 1, 7, 38);
INSERT INTO `rank` VALUES (132, 1, 9, 37);
INSERT INTO `rank` VALUES (133, 1, 7, 36);
INSERT INTO `rank` VALUES (134, 1, 8, 35);
INSERT INTO `rank` VALUES (135, 1, 7, 34);
INSERT INTO `rank` VALUES (136, 1, 8, 33);
INSERT INTO `rank` VALUES (137, 1, 7, 32);
INSERT INTO `rank` VALUES (138, 1, 7, 31);
INSERT INTO `rank` VALUES (139, 1, 8, 30);
INSERT INTO `rank` VALUES (140, 1, 7, 29);
INSERT INTO `rank` VALUES (141, 1, 10, 28);
INSERT INTO `rank` VALUES (142, 1, 7, 27);
INSERT INTO `rank` VALUES (143, 1, 6, 26);
INSERT INTO `rank` VALUES (144, 1, 5, 25);
INSERT INTO `rank` VALUES (145, 1, 7, 10);
INSERT INTO `rank` VALUES (146, 1, 7, 16);
INSERT INTO `rank` VALUES (147, 1, 5, 17);
INSERT INTO `rank` VALUES (148, 1, 7, 19);
INSERT INTO `rank` VALUES (149, 1, 8, 20);
INSERT INTO `rank` VALUES (150, 1, 9, 21);
INSERT INTO `rank` VALUES (151, 1, 7, 18);
INSERT INTO `rank` VALUES (152, 1, 8, 11);
INSERT INTO `rank` VALUES (153, 1, 6, 15);
INSERT INTO `rank` VALUES (154, 1, 6, 14);
INSERT INTO `rank` VALUES (155, 1, 6, 7);
INSERT INTO `rank` VALUES (156, 1, 4, 22);
INSERT INTO `rank` VALUES (157, 1, 8, 23);
INSERT INTO `rank` VALUES (158, 11, 6, 51);
INSERT INTO `rank` VALUES (159, 11, 7, 50);
INSERT INTO `rank` VALUES (160, 11, 6, 49);
INSERT INTO `rank` VALUES (161, 11, 5, 48);
INSERT INTO `rank` VALUES (162, 11, 5, 47);
INSERT INTO `rank` VALUES (163, 11, 5, 46);
INSERT INTO `rank` VALUES (164, 11, 6, 45);
INSERT INTO `rank` VALUES (165, 11, 6, 44);
INSERT INTO `rank` VALUES (166, 11, 5, 43);
INSERT INTO `rank` VALUES (167, 11, 7, 42);
INSERT INTO `rank` VALUES (168, 11, 8, 41);
INSERT INTO `rank` VALUES (169, 11, 5, 40);
INSERT INTO `rank` VALUES (170, 11, 5, 39);
INSERT INTO `rank` VALUES (171, 11, 4, 38);
INSERT INTO `rank` VALUES (172, 11, 3, 37);
INSERT INTO `rank` VALUES (173, 11, 7, 36);
INSERT INTO `rank` VALUES (174, 11, 8, 35);
INSERT INTO `rank` VALUES (175, 11, 6, 34);
INSERT INTO `rank` VALUES (176, 11, 7, 33);
INSERT INTO `rank` VALUES (177, 11, 7, 32);
INSERT INTO `rank` VALUES (178, 11, 8, 31);
INSERT INTO `rank` VALUES (179, 11, 8, 30);
INSERT INTO `rank` VALUES (180, 11, 6, 29);
INSERT INTO `rank` VALUES (181, 11, 8, 28);
INSERT INTO `rank` VALUES (182, 11, 4, 27);
INSERT INTO `rank` VALUES (183, 11, 6, 26);
INSERT INTO `rank` VALUES (184, 11, 4, 25);
INSERT INTO `rank` VALUES (185, 11, 7, 10);
INSERT INTO `rank` VALUES (186, 11, 7, 16);
INSERT INTO `rank` VALUES (187, 11, 8, 17);
INSERT INTO `rank` VALUES (188, 11, 8, 19);
INSERT INTO `rank` VALUES (189, 11, 8, 20);
INSERT INTO `rank` VALUES (190, 11, 8, 21);
INSERT INTO `rank` VALUES (191, 11, 8, 18);
INSERT INTO `rank` VALUES (192, 11, 5, 3);
INSERT INTO `rank` VALUES (193, 11, 7, 11);
INSERT INTO `rank` VALUES (194, 11, 6, 15);
INSERT INTO `rank` VALUES (195, 11, 6, 13);
INSERT INTO `rank` VALUES (196, 11, 6, 14);
INSERT INTO `rank` VALUES (197, 11, 5, 9);
INSERT INTO `rank` VALUES (198, 11, 6, 7);
INSERT INTO `rank` VALUES (199, 11, 7, 4);
INSERT INTO `rank` VALUES (200, 11, 7, 2);
INSERT INTO `rank` VALUES (201, 11, 8, 22);
INSERT INTO `rank` VALUES (202, 11, 8, 23);
INSERT INTO `rank` VALUES (203, 12, 8, 51);
INSERT INTO `rank` VALUES (204, 12, 6, 50);
INSERT INTO `rank` VALUES (205, 12, 8, 49);
INSERT INTO `rank` VALUES (206, 12, 7, 48);
INSERT INTO `rank` VALUES (207, 12, 8, 47);
INSERT INTO `rank` VALUES (208, 12, 7, 46);
INSERT INTO `rank` VALUES (209, 12, 8, 45);
INSERT INTO `rank` VALUES (210, 12, 7, 44);
INSERT INTO `rank` VALUES (211, 12, 8, 43);
INSERT INTO `rank` VALUES (212, 12, 7, 42);
INSERT INTO `rank` VALUES (213, 12, 6, 41);
INSERT INTO `rank` VALUES (214, 12, 6, 40);
INSERT INTO `rank` VALUES (215, 12, 8, 39);
INSERT INTO `rank` VALUES (216, 12, 1, 38);
INSERT INTO `rank` VALUES (217, 12, 4, 37);
INSERT INTO `rank` VALUES (218, 12, 6, 36);
INSERT INTO `rank` VALUES (219, 12, 6, 35);
INSERT INTO `rank` VALUES (220, 12, 8, 34);
INSERT INTO `rank` VALUES (221, 12, 8, 33);
INSERT INTO `rank` VALUES (222, 12, 6, 32);
INSERT INTO `rank` VALUES (223, 12, 8, 31);
INSERT INTO `rank` VALUES (224, 12, 7, 30);
INSERT INTO `rank` VALUES (225, 12, 8, 29);
INSERT INTO `rank` VALUES (226, 12, 9, 28);
INSERT INTO `rank` VALUES (227, 12, 4, 27);
INSERT INTO `rank` VALUES (228, 12, 6, 26);
INSERT INTO `rank` VALUES (229, 12, 7, 25);
INSERT INTO `rank` VALUES (230, 12, 7, 10);
INSERT INTO `rank` VALUES (231, 12, 9, 16);
INSERT INTO `rank` VALUES (232, 12, 8, 17);
INSERT INTO `rank` VALUES (233, 12, 4, 19);
INSERT INTO `rank` VALUES (234, 12, 8, 20);
INSERT INTO `rank` VALUES (235, 12, 9, 21);
INSERT INTO `rank` VALUES (236, 12, 7, 18);
INSERT INTO `rank` VALUES (237, 12, 8, 3);
INSERT INTO `rank` VALUES (238, 12, 8, 11);
INSERT INTO `rank` VALUES (239, 12, 8, 15);
INSERT INTO `rank` VALUES (240, 12, 8, 13);
INSERT INTO `rank` VALUES (241, 12, 9, 14);
INSERT INTO `rank` VALUES (242, 12, 8, 9);
INSERT INTO `rank` VALUES (243, 12, 8, 7);
INSERT INTO `rank` VALUES (244, 12, 2, 4);
INSERT INTO `rank` VALUES (245, 12, 7, 2);
INSERT INTO `rank` VALUES (246, 12, 4, 22);
INSERT INTO `rank` VALUES (247, 12, 8, 23);
INSERT INTO `rank` VALUES (248, 9, 6, 51);
INSERT INTO `rank` VALUES (249, 9, 6, 50);
INSERT INTO `rank` VALUES (250, 9, 8, 49);
INSERT INTO `rank` VALUES (251, 9, 8, 48);
INSERT INTO `rank` VALUES (252, 9, 6, 47);
INSERT INTO `rank` VALUES (253, 9, 7, 46);
INSERT INTO `rank` VALUES (254, 9, 7, 45);
INSERT INTO `rank` VALUES (255, 9, 6, 44);
INSERT INTO `rank` VALUES (256, 9, 4, 43);
INSERT INTO `rank` VALUES (257, 9, 7, 42);
INSERT INTO `rank` VALUES (258, 9, 5, 41);
INSERT INTO `rank` VALUES (259, 9, 5, 40);
INSERT INTO `rank` VALUES (260, 9, 5, 39);
INSERT INTO `rank` VALUES (261, 9, 3, 38);
INSERT INTO `rank` VALUES (262, 9, 6, 37);
INSERT INTO `rank` VALUES (263, 9, 6, 36);
INSERT INTO `rank` VALUES (264, 9, 6, 35);
INSERT INTO `rank` VALUES (265, 9, 7, 34);
INSERT INTO `rank` VALUES (266, 9, 8, 33);
INSERT INTO `rank` VALUES (267, 9, 7, 32);
INSERT INTO `rank` VALUES (268, 9, 6, 31);
INSERT INTO `rank` VALUES (269, 9, 7, 30);
INSERT INTO `rank` VALUES (270, 9, 8, 29);
INSERT INTO `rank` VALUES (271, 9, 10, 28);
INSERT INTO `rank` VALUES (272, 9, 7, 27);
INSERT INTO `rank` VALUES (273, 9, 7, 26);
INSERT INTO `rank` VALUES (274, 9, 4, 25);
INSERT INTO `rank` VALUES (275, 9, 5, 10);
INSERT INTO `rank` VALUES (276, 9, 7, 16);
INSERT INTO `rank` VALUES (277, 9, 7, 17);
INSERT INTO `rank` VALUES (278, 9, 7, 19);
INSERT INTO `rank` VALUES (279, 9, 7, 20);
INSERT INTO `rank` VALUES (280, 9, 7, 21);
INSERT INTO `rank` VALUES (281, 9, 6, 18);
INSERT INTO `rank` VALUES (282, 9, 8, 3);
INSERT INTO `rank` VALUES (283, 9, 7, 11);
INSERT INTO `rank` VALUES (284, 9, 6, 15);
INSERT INTO `rank` VALUES (285, 9, 6, 13);
INSERT INTO `rank` VALUES (286, 9, 8, 14);
INSERT INTO `rank` VALUES (287, 9, 6, 9);
INSERT INTO `rank` VALUES (288, 9, 6, 7);
INSERT INTO `rank` VALUES (289, 9, 4, 4);
INSERT INTO `rank` VALUES (290, 9, 7, 2);
INSERT INTO `rank` VALUES (291, 9, 3, 22);
INSERT INTO `rank` VALUES (292, 9, 6, 23);
INSERT INTO `rank` VALUES (293, 5, 6, 51);
INSERT INTO `rank` VALUES (294, 5, 6, 50);
INSERT INTO `rank` VALUES (295, 5, 7, 49);
INSERT INTO `rank` VALUES (296, 5, 7, 48);
INSERT INTO `rank` VALUES (297, 5, 6, 47);
INSERT INTO `rank` VALUES (298, 5, 5, 46);
INSERT INTO `rank` VALUES (299, 5, 7, 45);
INSERT INTO `rank` VALUES (300, 5, 7, 44);
INSERT INTO `rank` VALUES (301, 5, 4, 43);
INSERT INTO `rank` VALUES (302, 5, 6, 42);
INSERT INTO `rank` VALUES (303, 5, 5, 41);
INSERT INTO `rank` VALUES (304, 5, 6, 40);
INSERT INTO `rank` VALUES (305, 5, 5, 39);
INSERT INTO `rank` VALUES (306, 5, 7, 38);
INSERT INTO `rank` VALUES (307, 5, 5, 37);
INSERT INTO `rank` VALUES (308, 5, 5, 36);
INSERT INTO `rank` VALUES (309, 5, 6, 35);
INSERT INTO `rank` VALUES (310, 5, 8, 34);
INSERT INTO `rank` VALUES (311, 5, 7, 33);
INSERT INTO `rank` VALUES (312, 5, 7, 32);
INSERT INTO `rank` VALUES (313, 5, 8, 31);
INSERT INTO `rank` VALUES (314, 5, 7, 30);
INSERT INTO `rank` VALUES (315, 5, 5, 29);
INSERT INTO `rank` VALUES (316, 5, 8, 28);
INSERT INTO `rank` VALUES (317, 5, 7, 27);
INSERT INTO `rank` VALUES (318, 5, 7, 26);
INSERT INTO `rank` VALUES (319, 5, 7, 25);
INSERT INTO `rank` VALUES (320, 5, 7, 10);
INSERT INTO `rank` VALUES (321, 5, 8, 16);
INSERT INTO `rank` VALUES (322, 5, 7, 17);
INSERT INTO `rank` VALUES (323, 5, 7, 19);
INSERT INTO `rank` VALUES (324, 5, 7, 20);
INSERT INTO `rank` VALUES (325, 5, 10, 21);
INSERT INTO `rank` VALUES (326, 5, 7, 18);
INSERT INTO `rank` VALUES (327, 5, 8, 3);
INSERT INTO `rank` VALUES (328, 5, 8, 11);
INSERT INTO `rank` VALUES (329, 5, 6, 15);
INSERT INTO `rank` VALUES (330, 5, 7, 13);
INSERT INTO `rank` VALUES (331, 5, 5, 14);
INSERT INTO `rank` VALUES (332, 5, 7, 9);
INSERT INTO `rank` VALUES (333, 5, 8, 7);
INSERT INTO `rank` VALUES (334, 5, 3, 4);
INSERT INTO `rank` VALUES (335, 5, 6, 2);
INSERT INTO `rank` VALUES (336, 5, 8, 22);
INSERT INTO `rank` VALUES (337, 5, 8, 23);
INSERT INTO `rank` VALUES (338, 6, 7, 51);
INSERT INTO `rank` VALUES (339, 6, 8, 50);
INSERT INTO `rank` VALUES (340, 6, 9, 49);
INSERT INTO `rank` VALUES (341, 6, 6, 48);
INSERT INTO `rank` VALUES (342, 6, 8, 47);
INSERT INTO `rank` VALUES (343, 6, 7, 46);
INSERT INTO `rank` VALUES (344, 6, 7, 45);
INSERT INTO `rank` VALUES (345, 6, 8, 44);
INSERT INTO `rank` VALUES (346, 6, 6, 43);
INSERT INTO `rank` VALUES (347, 6, 8, 42);
INSERT INTO `rank` VALUES (348, 6, 7, 40);
INSERT INTO `rank` VALUES (349, 6, 8, 39);
INSERT INTO `rank` VALUES (350, 6, 7, 37);
INSERT INTO `rank` VALUES (351, 6, 6, 36);
INSERT INTO `rank` VALUES (352, 6, 7, 34);
INSERT INTO `rank` VALUES (353, 6, 8, 33);
INSERT INTO `rank` VALUES (354, 6, 6, 32);
INSERT INTO `rank` VALUES (355, 6, 6, 31);
INSERT INTO `rank` VALUES (356, 6, 8, 30);
INSERT INTO `rank` VALUES (357, 6, 4, 29);
INSERT INTO `rank` VALUES (358, 6, 7, 28);
INSERT INTO `rank` VALUES (359, 6, 5, 27);
INSERT INTO `rank` VALUES (360, 6, 7, 26);
INSERT INTO `rank` VALUES (361, 6, 4, 25);
INSERT INTO `rank` VALUES (362, 6, 8, 10);
INSERT INTO `rank` VALUES (363, 6, 5, 16);
INSERT INTO `rank` VALUES (364, 6, 8, 19);
INSERT INTO `rank` VALUES (365, 6, 7, 20);
INSERT INTO `rank` VALUES (366, 6, 8, 21);
INSERT INTO `rank` VALUES (367, 6, 7, 18);
INSERT INTO `rank` VALUES (368, 6, 7, 3);
INSERT INTO `rank` VALUES (369, 6, 7, 11);
INSERT INTO `rank` VALUES (370, 6, 4, 15);
INSERT INTO `rank` VALUES (371, 6, 8, 13);
INSERT INTO `rank` VALUES (372, 6, 7, 14);
INSERT INTO `rank` VALUES (373, 6, 7, 9);
INSERT INTO `rank` VALUES (374, 6, 7, 7);
INSERT INTO `rank` VALUES (375, 6, 8, 4);
INSERT INTO `rank` VALUES (376, 6, 7, 2);
INSERT INTO `rank` VALUES (377, 6, 4, 22);
INSERT INTO `rank` VALUES (378, 6, 8, 23);
INSERT INTO `rank` VALUES (379, 8, 8, 51);
INSERT INTO `rank` VALUES (380, 8, 6, 50);
INSERT INTO `rank` VALUES (381, 8, 8, 49);
INSERT INTO `rank` VALUES (382, 8, 7, 48);
INSERT INTO `rank` VALUES (383, 8, 7, 47);
INSERT INTO `rank` VALUES (384, 8, 8, 46);
INSERT INTO `rank` VALUES (385, 8, 8, 45);
INSERT INTO `rank` VALUES (386, 8, 7, 44);
INSERT INTO `rank` VALUES (387, 8, 8, 43);
INSERT INTO `rank` VALUES (388, 8, 7, 42);
INSERT INTO `rank` VALUES (389, 8, 6, 41);
INSERT INTO `rank` VALUES (390, 8, 8, 40);
INSERT INTO `rank` VALUES (391, 8, 7, 39);
INSERT INTO `rank` VALUES (392, 8, 6, 38);
INSERT INTO `rank` VALUES (393, 8, 8, 37);
INSERT INTO `rank` VALUES (394, 8, 7, 36);
INSERT INTO `rank` VALUES (395, 8, 7, 35);
INSERT INTO `rank` VALUES (396, 8, 7, 34);
INSERT INTO `rank` VALUES (397, 8, 5, 33);
INSERT INTO `rank` VALUES (398, 8, 8, 32);
INSERT INTO `rank` VALUES (399, 8, 8, 31);
INSERT INTO `rank` VALUES (400, 8, 8, 30);
INSERT INTO `rank` VALUES (401, 8, 7, 29);
INSERT INTO `rank` VALUES (402, 8, 7, 28);
INSERT INTO `rank` VALUES (403, 8, 7, 27);
INSERT INTO `rank` VALUES (404, 8, 7, 26);
INSERT INTO `rank` VALUES (405, 8, 6, 25);
INSERT INTO `rank` VALUES (406, 8, 8, 10);
INSERT INTO `rank` VALUES (407, 8, 7, 16);
INSERT INTO `rank` VALUES (408, 8, 7, 17);
INSERT INTO `rank` VALUES (409, 8, 7, 19);
INSERT INTO `rank` VALUES (410, 8, 7, 20);
INSERT INTO `rank` VALUES (411, 8, 8, 21);
INSERT INTO `rank` VALUES (412, 8, 8, 18);
INSERT INTO `rank` VALUES (413, 8, 7, 3);
INSERT INTO `rank` VALUES (414, 8, 7, 11);
INSERT INTO `rank` VALUES (415, 8, 4, 15);
INSERT INTO `rank` VALUES (416, 8, 8, 13);
INSERT INTO `rank` VALUES (417, 8, 7, 14);
INSERT INTO `rank` VALUES (418, 8, 8, 9);
INSERT INTO `rank` VALUES (419, 8, 8, 7);
INSERT INTO `rank` VALUES (420, 8, 3, 4);
INSERT INTO `rank` VALUES (421, 8, 8, 2);
INSERT INTO `rank` VALUES (422, 8, 4, 22);
INSERT INTO `rank` VALUES (423, 8, 8, 23);
INSERT INTO `rank` VALUES (424, 4, 7, 51);
INSERT INTO `rank` VALUES (425, 4, 6, 50);
INSERT INTO `rank` VALUES (426, 4, 6, 49);
INSERT INTO `rank` VALUES (427, 4, 7, 48);
INSERT INTO `rank` VALUES (428, 4, 7, 47);
INSERT INTO `rank` VALUES (429, 4, 8, 46);
INSERT INTO `rank` VALUES (430, 4, 7, 45);
INSERT INTO `rank` VALUES (431, 4, 7, 44);
INSERT INTO `rank` VALUES (432, 4, 7, 43);
INSERT INTO `rank` VALUES (433, 4, 7, 42);
INSERT INTO `rank` VALUES (434, 4, 6, 41);
INSERT INTO `rank` VALUES (435, 4, 6, 40);
INSERT INTO `rank` VALUES (436, 4, 8, 39);
INSERT INTO `rank` VALUES (437, 4, 8, 38);
INSERT INTO `rank` VALUES (438, 4, 7, 37);
INSERT INTO `rank` VALUES (439, 4, 8, 36);
INSERT INTO `rank` VALUES (440, 4, 7, 35);
INSERT INTO `rank` VALUES (441, 4, 7, 34);
INSERT INTO `rank` VALUES (442, 4, 7, 33);
INSERT INTO `rank` VALUES (443, 4, 7, 32);
INSERT INTO `rank` VALUES (444, 4, 8, 31);
INSERT INTO `rank` VALUES (445, 4, 7, 30);
INSERT INTO `rank` VALUES (446, 4, 7, 29);
INSERT INTO `rank` VALUES (447, 4, 7, 28);
INSERT INTO `rank` VALUES (448, 4, 8, 27);
INSERT INTO `rank` VALUES (449, 4, 7, 26);
INSERT INTO `rank` VALUES (450, 4, 7, 25);
INSERT INTO `rank` VALUES (451, 4, 7, 10);
INSERT INTO `rank` VALUES (452, 4, 8, 16);
INSERT INTO `rank` VALUES (453, 4, 8, 17);
INSERT INTO `rank` VALUES (454, 4, 5, 19);
INSERT INTO `rank` VALUES (455, 4, 7, 20);
INSERT INTO `rank` VALUES (456, 4, 8, 21);
INSERT INTO `rank` VALUES (457, 4, 7, 18);
INSERT INTO `rank` VALUES (458, 4, 6, 3);
INSERT INTO `rank` VALUES (459, 4, 8, 11);
INSERT INTO `rank` VALUES (460, 4, 8, 15);
INSERT INTO `rank` VALUES (461, 4, 5, 13);
INSERT INTO `rank` VALUES (462, 4, 8, 14);
INSERT INTO `rank` VALUES (463, 4, 6, 9);
INSERT INTO `rank` VALUES (464, 4, 8, 7);
INSERT INTO `rank` VALUES (465, 4, 5, 4);
INSERT INTO `rank` VALUES (466, 4, 4, 22);
INSERT INTO `rank` VALUES (467, 4, 8, 23);

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `song_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `user_id` int(11) NOT NULL COMMENT '歌曲对应的用户id',
  `song_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌曲名',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发行时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲图片',
  `lyric` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '歌词',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长',
  PRIMARY KEY (`song_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '歌曲表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (2, 1, '消愁', '不太会唱，尽力了', '2022-02-07 00:48:35', '2022-04-07 15:22:38', '/img/songPic/1644166265777tx.jpg', '[00:00.000] 作曲 : 毛不易\n[00:01.000] 作词 : 毛不易\n[00:23.760]编曲Arranger : 赵兆\n[00:26.820]\n[00:31.660]当你走进这欢乐场\n[00:35.540]背上所有的梦与想\n[00:39.870]各色的脸上各色的妆\n[00:44.120]没人记得你的模样\n[00:46.370]\n[00:48.430]三巡酒过你在角落\n[00:52.600]固执的唱着苦涩的歌\n[00:57.000]听它在喧嚣里被淹没\n[01:01.260]你拿起酒杯对自己说\n[01:05.030]\n[01:07.550]一杯敬朝阳 一杯敬月光\n[01:11.710]唤醒我的向往 温柔了寒窗\n[01:15.580]于是可以不回头地逆风飞翔\n[01:20.310]不怕心头有雨 眼底有霜\n[01:23.070]\n[01:24.400]一杯敬故乡 一杯敬远方\n[01:28.620]守着我的善良 催着我成长\n[01:32.420]所以南北的路从此不再漫长\n[01:37.430]灵魂不再无处安放\n[01:44.370]\n[02:02.900]躁动不安的座上客\n[02:07.360]自以为是地表演着\n[02:11.600]伪装着 舞蹈着 疲惫着\n[02:15.640]你拿起酒杯对自己说\n[02:19.100]\n[02:20.180]一杯敬朝阳 一杯敬月光\n[02:24.400]唤醒我的向往 温柔了寒窗\n[02:28.240]于是可以不回头地逆风飞翔\n[02:33.100]不怕心头有雨 眼底有霜\n[02:36.840]\n[02:37.290]一杯敬故乡 一杯敬远方\n[02:41.580]守着我的善良 催着我成长\n[02:45.350]所以南北的路从此不再漫长\n[02:50.160]灵魂不再无处安放\n[02:53.010]\n[03:00.920]一杯敬明天 一杯敬过往\n[03:05.170]支撑我的身体 厚重了肩膀\n[03:08.910]虽然从不相信所谓山高水长\n[03:13.650]人生苦短何必念念不忘\n[03:15.870]\n[03:18.100]一杯敬自由 一杯敬死亡\n[03:22.210]宽恕我的平凡 驱散了迷惘\n[03:26.000]好吧天亮之后总是潦草离场\n[03:30.840]清醒的人最荒唐\n[03:37.360]清醒的人最荒唐\n[03:44.430]\n[03:46.680]制作人Producer : 李健 赵兆\n[03:48.130]手风琴Accordion : 许笑男\n[03:50.660]键盘Keyboard : 赵兆\n[03:52.300]吉他Guitar : 薛峰\n[03:53.860]贝斯Bass : 韩阳\n[03:55.550]鼓Drum : 武勇恒\n[03:57.300]合音Backing Vocal : 梁古驰\n[03:58.920]弦乐Strings : 国际首席爱乐乐团International Master Philharmonic Orchestra\n[04:00.460]混音Mixing : 李游\n[04:02.050]母带Mastering : Joe LaPorta .（Sterling Sound. NY）\n[04:03.600]录音棚Studio : 55TEC . Beijing\n[04:05.050]录音Recording : 李游 李杨\n[04:06.340]人声录音Vocal Recording : 李杨\n[04:07.470]人声编辑Vocal Editing : 李杨\n[04:08.650]录音助理Recording Assistants : 郭舒文 邢铜\n[04:10.150]音乐制作发行produced and distributed : 哇唧唧哇×智慧大狗', '/song/1649176286056消愁.mp3', 1, '183');
INSERT INTO `song` VALUES (3, 1, '好久不见', '好久不见', '2022-02-07 00:54:55', '2022-04-07 15:29:07', '/img/songPic/1646752268919图片1.png', '[00:00.10]好久不见 (《失恋33天》电影插曲|《不如不见》国语版) - 陈奕迅\n[00:00.20]词：施立\n[00:00.30]曲：陈小霞\n[00:00.40]编曲：C.Y.Kong/孙伟明/陈珀\n[00:15.07]我来到 你的城市\n[00:22.40]走过你来时的路\n[00:28.76]想象着 没我的日子\n[00:34.88]你是怎样的孤独\n[00:42.54]拿着你 给的照片\n[00:48.78]熟悉的那一条街\n[00:54.89]只是没了你的画面\n[01:00.82]我们回不到那天\n[01:08.00]你会不会忽然的出现\n[01:14.99]在街角的咖啡店\n[01:21.04]我会带着笑脸 挥手寒暄\n[01:27.40]和你 坐着聊聊天\n[01:33.71]我多么想和你见一面\n[01:40.89]看看你最近改变\n[01:46.76]不再去说从前 只是寒暄\n[01:53.31]对你说一句 只是说一句\n[02:01.79]好久不见\n[02:20.70]拿着你 给的照片\n[02:27.50]熟悉的那一条街\n[02:33.68]只是没了你的画面\n[02:39.55]我们回不到那天\n[02:46.16]你会不会忽然的出现\n[02:53.15]在街角的咖啡店\n[02:58.95]我会带着笑脸 挥手寒暄\n[03:05.38]和你 坐着聊聊天\n[03:11.87]我多么想和你见一面\n[03:18.80]看看你最近改变\n[03:24.35]不再去说从前 只是寒暄\n[03:31.15]对你说一句 只是说一句\n[03:40.42]好久不见', '/song/1649176067403好久不见-陈奕迅.mp3', 1, '289');
INSERT INTO `song` VALUES (4, 3, '不怪他', 'skr哈哈哈，今天心情不错', '2022-02-09 23:52:52', '2022-04-07 15:23:42', '/img/songPic/tubiao.png', 'a', '/song/1649176275614马思唯 不怪他(Hamming Edit ）-Hamming.mp3', 1, '245');
INSERT INTO `song` VALUES (7, 3, '那些你很冒险的梦', '那些你很冒险的梦', '2022-02-09 23:54:03', '2022-04-07 15:24:43', '/img/songPic/tubiao.png', '[00:00.03]林俊杰 - 那些你很冒险的梦\n[00:02.45]词：王雅君\n[00:03.37]曲：林俊杰\n[00:15.17]当两颗心开始震动\n[00:22.23]当你瞳孔学会闪躲\n[00:28.60]当爱慢慢被遮住只剩下黑\n[00:36.26]距离像影子被拉拖\n[00:43.35]当爱的故事剩听说\n[00:49.69]我找不到你单纯的面孔\n[00:56.82]当生命每分每秒都为你转动\n[01:04.10]心多执着就加倍心痛\n[01:09.90]那些你很冒险的梦 我陪你去疯\n[01:18.14]折纸飞机 碰到雨天 终究会坠落\n[01:23.75]太残忍的话我只说 因为爱很重\n[01:31.89]你却不想懂 只往反方向走\n[01:46.06]哦 当爱的故事剩听说\n[01:56.80]我找不到你单纯的面孔\n[02:03.82]当生命每分每秒都为你转动\n[02:10.91]心有多执着就加倍心痛\n[02:16.94]那些你很冒险的梦 我陪你去疯\n[02:25.19]折纸飞机 碰到雨天 终究会坠落\n[02:30.90]太残忍的话我只说 因为爱很重\n[02:38.89]你却不想懂 只往反方向走\n[02:46.37]我不想放手 你松开的左手\n[02:49.98]你爱的放纵 我白不回天空\n[02:53.94]我输了 累了\n[02:56.09]但你 再也 不回头\n[03:02.79]那些你很冒险的梦 我陪你去疯\n[03:11.14]折纸飞机 碰到雨天 终究会坠落\n[03:16.76]太残忍的话我只说 因为爱很重\n[03:24.79]你却不想懂 只往反方向走\n[03:32.01]你真的不懂 我的爱已降落', '/song/1649176163999那些你很冒险的梦-林俊杰-1120967.flac', 1, '259');
INSERT INTO `song` VALUES (9, 1, '永不失联的爱', '现学现唱', '2022-02-09 23:54:15', '2022-04-07 15:25:39', '/img/songPic/tubiao.png', '[00:00.16]周兴哲 - 永不失联的爱\n[00:01.09]词：饶雪漫\n[00:01.25]曲：周兴哲\n[00:23.05]亲爱的你躲在哪里发呆\n[00:28.79]有什么心事还无法释怀\n[00:34.37]我们总把人生想得太坏\n[00:39.99]像旁人不允许我们的怪\n[00:45.69]每一片与众不同的云彩\n[00:51.38]都需要找到天空去存在\n[00:56.96]我们都习惯了原地徘徊\n[01:02.61]却无法习惯被依赖\n[01:08.97]你给我 这一辈子都不想失联的爱\n[01:15.60]相信爱的征途就是星辰大海\n[01:20.62]美好剧情 不会更改\n[01:25.82]是命运最好的安排\n[01:31.50]你是我\n[01:33.30]这一辈子都不想失联的爱\n[01:38.27]何苦残忍逼我把手轻轻放开\n[01:43.18]请快回来 想听你说\n[01:48.43]说你还在\n[02:16.17]走过陪你看流星的天台\n[02:21.71]熬过失去你漫长的等待\n[02:27.36]好担心没人懂你的无奈\n[02:32.97]离开我谁还把你当小孩\n[02:38.79]我猜你一定也会想念我\n[02:44.23]也怕我失落在茫茫人海\n[02:49.90]没关系只要你肯回头望\n[02:55.52]会发现我一直都在\n[03:01.93]你给我 这一辈子都不想失联的爱\n[03:08.77]你的每条讯息都是心跳节拍\n[03:13.55]每秒都想 拥你入怀\n[03:18.78]全世界你最可爱\n[03:24.59]你是我 这一辈子都不想失联的爱\n[03:31.08]就算你的呼吸远在千山之外\n[03:36.09]请你相信 我给的爱\n[03:41.35]值得你爱', '/song/1649176141014永不失联的爱.mp3', 1, '219');
INSERT INTO `song` VALUES (10, 5, '美人鱼', '自以为还不错', '2022-02-09 23:54:17', '2022-04-09 01:22:30', '/img/songPic/tubiao.png', '[00:01.48]林俊杰 - 美人鱼\r\n[00:02.19]作词：简胜、林秋离\r\n[00:02.54]作曲：林俊杰\r\n[00:02.74]编曲：梁定江、Case Woo\r\n[00:26.86]我在沙滩划个圆圈\r\n[00:29.13]属于我俩安逸世界\r\n[00:31.65]不用和别人连线\r\n[00:36.85]我不管你来自深渊\r\n[00:39.12]也不在乎身上鳞片\r\n[00:41.75]爱情能超越一切\r\n[00:45.12]欧耶\r\n[00:46.13]只要你在我身边\r\n[00:48.05]所有蜚语流言\r\n[00:49.36]完全视而不见\r\n[00:51.28]请不要匆匆一面\r\n[00:53.10]一转身就沉入海平线\r\n[00:58.96]传说中\r\n[00:59.82]你为爱甘心被搁浅\r\n[01:03.86]我也可以为你\r\n[01:05.73]潜入海里面\r\n[01:08.55]怎么忍心断绝\r\n[01:11.18]忘记我不变的誓言\r\n[01:14.72]我眼泪断了线\r\n[01:18.01]欧耶\r\n[01:19.07]现实里有了我\r\n[01:20.89]对你的眷恋\r\n[01:24.25]我愿意化作雕像\r\n[01:26.32]等你出现\r\n[01:28.79]再见再也不见\r\n[01:31.37]心碎了飘荡在海边\r\n[01:34.90]你抬头就看见\r\n[02:00.25]我在沙滩划个圆圈\r\n[02:02.57]属于我俩安逸世界\r\n[02:05.10]不用和别人连线\r\n[02:07.93]呜呜\r\n[02:10.31]我不管你来自深渊\r\n[02:12.73]也不在乎身上鳞片\r\n[02:15.25]爱情能超越一切\r\n[02:18.51]欧耶\r\n[02:19.72]只要你在我身边\r\n[02:21.54]所有蜚语流言\r\n[02:22.80]完全视而不见\r\n[02:24.66]请不要匆匆一面\r\n[02:26.54]一转身就沉入海平线\r\n[02:32.50]传说中你为爱\r\n[02:34.11]甘心被搁浅\r\n[02:37.35]我也可以为你\r\n[02:39.22]潜入海里面\r\n[02:42.10]怎么忍心断绝\r\n[02:44.73]忘记我不变的誓言\r\n[02:48.15]我眼泪断了线\r\n[02:51.47]欧耶\r\n[02:52.53]现实里\r\n[02:53.44]有了我对你的眷恋\r\n[02:57.62]我愿意化作雕像\r\n[02:59.80]等你出现\r\n[03:02.27]再见再也不见\r\n[03:04.85]心碎了飘荡在海边\r\n[03:08.38]你抬头就看见\r\n[03:12.92]传说中\r\n[03:13.68]你为爱甘心被搁浅\r\n[03:17.72]我也可以为你\r\n[03:19.64]潜入海里面\r\n[03:22.47]怎么忍心断绝\r\n[03:25.05]忘记我不变的誓言\r\n[03:28.48]我眼泪断了线\r\n[03:31.87]欧耶\r\n[03:32.94]现实里\r\n[03:33.80]有了我对你的眷恋\r\n[03:37.93]我愿意化作雕像\r\n[03:40.20]等你出现\r\n[03:42.73]再见再也不见\r\n[03:45.20]心碎了飘荡在海边\r\n[03:48.69]你抬头就看见\r\n[03:53.13]你\r\n[03:53.84]你抬头就看见\r\n[03:57.11]欧耶\r\n[03:57.93]你\r\n[03:58.94]你抬头就看见', '/song/1649438550009美人鱼-林俊杰.mp3', 1, '285');
INSERT INTO `song` VALUES (11, 1, '这一生关于你的风景', '学习烟嗓，献丑了', '2022-02-09 23:54:18', '2022-04-07 15:28:30', '/img/songPic/16484863605866d9ec8f8d543f7f0f08053e9d0c799ff.jpeg', '[00:00.000] 作曲 : 枯木逢春\n[00:01.000] 作词 : 枯木逢春\n[00:24.551]远方灯火闪亮着光\n[00:30.348]你一人低头在路上\n[00:36.466]这城市越大越让人心慌\n[00:41.263]多向往多漫长\n[00:48.534]这一路经历太多伤\n[00:54.235]把最初笑容都淡忘\n[01:00.133]时光让我们变得\n[01:02.826]脆弱且坚强\n[01:04.944]让我再来轻轻对你唱\n[01:11.125]我多想能多陪你一场\n[01:16.662]把前半生的风景对你讲\n[01:22.613]在每个寂静的夜里我会想\n[01:28.936]那些关于你的爱恨情长\n[01:34.986]我也想能够把你照亮\n[01:40.664]在你的生命中留下阳光\n[01:47.188]陪你走过那山高水长\n[01:53.037]陪你一起生长\n[02:24.229]远方灯火闪亮着光\n[02:30.008]你一人低头在路上\n[02:36.144]这城市越大越让人心慌\n[02:41.045]多向往多漫长\n[02:48.246]这一路经历太多伤\n[02:54.211]把最初笑容都淡忘\n[03:00.145]时光让我们变得\n[03:02.915]脆弱且坚强\n[03:04.967]让我再来轻轻对你唱\n[03:10.908]我多想能多陪你一场\n[03:16.637]把前半生的风景对你讲\n[03:22.756]在每个寂静的夜里我会想\n[03:29.298]那些关于你的爱恨情长\n[03:34.739]我也想能够把你照亮\n[03:40.705]在你的生命中留下阳光\n[03:47.111]陪你走过那山高水长\n[03:53.009]陪你一起生长\n[03:59.460]这一生在你的风景里\n[04:05.256]我是谁\n[04:08.985]总策划：唐晶晶\n[04:11.918]制作人：段小林 / 姚政\n[04:14.544]编曲：黄超\n[04:16.391]企划：牛雪吟 / 陈莹\n[04:17.850]鼓手：郝稷伦\n[04:19.290]贝斯：韩阳\n[04:20.730]吉他：黄超\n[04:22.255]录音：甄浩.张明懂\n[04:23.814]混音：段小林\n[04:25.391]封面：苏泽欣\n[04:26.814]录音棚：北京好听音乐录音棚\n[04:28.391]网易云音乐特别企划“回声不息”出品', '/song/1649176081184这一生关于你的风景-隔壁老樊.mp3', 1, '250');
INSERT INTO `song` VALUES (12, 1, '可惜没如果', '一切都没如果', '2022-02-09 23:54:19', '2022-04-09 01:23:17', '/img/songPic/tubiao.png', '[00:00.22]汪睿 - 可惜没有如果\n[00:00.52]作词：林夕\n[00:00.67]作曲：林俊杰\n[00:25.47]假如把犯得起的错\n[00:29.21]能错的都错过\n[00:31.74]应该还来得及去悔过\n[00:37.52]假如没把一切说破\n[00:41.46]那一场小风波 将一笑带过\n[00:47.89]在感情面前 讲什么自我\n[00:53.56]要得过且过 才好过\n[00:59.98]全都怪我\n[01:02.56]不该沉默时沉默\n[01:05.55]该勇敢时软弱\n[01:08.64]如果不是我 误会自己洒脱\n[01:14.62]让我们难过\n[01:18.06]可当初的你 和现在的我\n[01:20.95]假如重来过\n[01:24.03]倘若那天\n[01:26.42]把该说的话好好说\n[01:29.56]该体谅的不执着\n[01:32.58]如果那天我 不受情绪挑拨\n[01:38.55]你会怎么做\n[01:42.04]那么多如果 可能如果我\n[01:45.11]可惜没如果\n[01:48.00]倘若那天\n[01:50.48]把该说的话好好说\n[01:53.58]该体谅的不执着\n[01:56.76]如果那天我 不受情绪挑拨\n[02:02.68]你会怎么做\n[02:06.07]那么多如果 可能如果我\n[02:09.05]可惜没如果\n[02:15.03]只剩下结果\n[02:20.81]可惜没如果', '/song/1649438597758可惜没如果(Live)-林俊杰.mp3', 1, '254');
INSERT INTO `song` VALUES (13, 1, '不为谁而作的歌', '唱完嗓子坏了', '2022-02-19 20:18:43', '2022-04-07 15:26:56', '/img/songPic/1647087972157yin.png', '[00:00.60]林俊杰 - 不为谁而作的歌\n[00:01.60]词：林秋离\n[00:02.60]曲：林俊杰\n[00:27.50]原谅我这一首\n[00:30.67]不为谁而作的歌\n[00:34.18]感觉像仿佛窗外的夜色\n[00:40.75]曾经有那一刻\n[00:44.01]回头竟然认不得\n[00:47.74]需要从记忆再摸索的人\n[00:54.52]和他们关心的 的地方\n[01:01.11]和那些走过的请等一等\n[01:10.37]梦为努力浇了水\n[01:13.84]爱在背后往前推\n[01:17.05]当我抬起头才发觉\n[01:20.99]我是不是忘了谁\n[01:23.52]累到整夜不能睡\n[01:27.24]夜色哪里都是美\n[01:30.21]一定有个人\n[01:32.36]她躲过避过闪过瞒过\n[01:35.22]她是谁\n[01:41.87]她是谁\n[01:50.31]原谅我这一首\n[01:53.43]不为谁而作的歌\n[01:56.85]感觉像仿佛窗外的夜色 哦\n[02:03.45]曾经有那一刻回头\n[02:07.35]竟然认不得\n[02:10.50]需要从记忆再摸索的人\n[02:17.34]和他们关心的 的地方\n[02:23.85]和那些走过的 耶\n[02:29.90]梦为努力浇了水\n[02:33.21]爱在背后往前推\n[02:36.51]当我抬起头才发觉\n[02:40.40]我是不是忘了谁\n[02:42.96]累到整夜不能睡\n[02:46.62]夜色哪里都是美\n[02:49.71]一定有个人她\n[02:52.01]躲过避过闪过瞒过\n[02:54.61]她是谁\n[03:01.05]她是谁 唔\n[03:09.34]也许在真实\n[03:11.29]面对自己才不顾一切\n[03:16.05]去探究当初我害怕面对\n[03:24.46]梦为努力浇了水\n[03:27.75]爱在背后往前推\n[03:31.06]当我抬起头才发觉\n[03:35.07]我是不是忘了谁\n[03:37.76]累到整夜不能睡\n[03:41.31]夜色哪里都是美\n[03:44.36]一定有个她\n[03:46.89]躲过避过闪过瞒过\n[03:49.25]她是谁\n[03:55.81]她是谁\n[04:08.97]她是谁', '/song/1649176111609不为谁而作的歌-林俊杰.mp3', 1, '268');
INSERT INTO `song` VALUES (14, 3, '天下', '只为他袖手天下', '2022-03-12 19:39:51', '2022-04-07 15:26:15', '/img/songPic/tubiao.png', '[00:00.000] 作曲 : 刘吉宁\n[00:01.000] 作词 : 周毅\n[00:26.800]烽烟起寻爱似浪淘沙\n[00:33.700]遇见她如春水映梨花\n[00:40.400]挥剑断天涯相思轻放下\n[00:46.900]梦中我痴痴牵挂\n[00:53.900]顾不顾将相王侯\n[00:55.800]管不管万世千秋\n[00:57.800]求只求爱化解\n[00:58.900]这万丈红尘纷乱永无休\n[01:01.400]爱更爱天长地久\n[01:02.800]要更要似水温柔\n[01:04.800]谁在乎谁主春秋\n[01:06.900]一生有爱何惧风飞沙\n[01:10.100]悲白发留不住芳华\n[01:13.900]抛去江山如画换她笑面如花\n[01:17.100]抵过这一生空牵挂\n[01:20.100]心若无怨爱恨也随他\n[01:23.300]天地大情路永无涯\n[01:27.100]只为她袖手天下\n[02:00.900]顾不顾将相王侯\n[02:02.700]管不管万世千秋\n[02:03.900]求只求爱化解\n[02:05.800]这万丈红尘纷乱永无休\n[02:07.900]爱更爱天长地久\n[02:09.900]要更要似水温柔\n[02:11.800]谁在乎谁主春秋\n[02:13.400]一生有爱何惧风飞沙\n[02:16.700]悲白发留不住芳华\n[02:20.900]抛去江山如画换她笑面如花\n[02:24.600]抵过这一生空牵挂\n[02:26.900]心若无怨爱恨也随他\n[02:30.700]天地大情路永无涯\n[02:33.900]只为她袖手天下\n[02:40.300]一生有爱何惧风飞沙\n[02:43.700]悲白发留不住芳华\n[02:47.400]抛去江山如画换她笑面如花\n[02:50.900]抵过这一生空牵挂\n[02:53.900]心若无怨爱恨也随他\n[02:56.900]天地大情路永无涯\n[02:59.900]只为她袖手天下\n[03:06.900]烽烟起寻爱似浪淘沙\n[03:13.300]遇见她如春水映梨花\n[03:20.100]挥剑断天涯相思轻放下\n[03:26.900]梦中我痴痴牵挂', '/song/1649176125936天下-张杰.mp3', 1, '265');
INSERT INTO `song` VALUES (15, 3, '愿得一人心', '白首不分离', '2022-03-14 23:15:07', '2022-04-07 15:27:41', '/img/songPic/tubiao.png', '[00:01.33]作词：胡小健\n[00:02.48]作曲：罗俊霖\n[00:22.44]曾在我背包小小夹层\n[00:25.19]里的那个人\n[00:27.34]陪伴我漂洋过海\n[00:29.70]经过每一段旅程\n[00:32.39]隐形的稻草人\n[00:34.90]守护我的天真\n[00:37.45]曾以为爱情能让\n[00:39.70]未来只为一个人\n[00:42.50]关了灯依旧在\n[00:44.45]书桌角落的那个人\n[00:47.55]变成我许多年来\n[00:49.86]纪念爱情的标本\n[00:52.56]消失的那个人\n[00:55.01]回不去的青春\n[00:57.71]忘不了爱过的人\n[01:00.02]才会对过往认真\n[01:04.68]只愿得一人心\n[01:07.18]白首不分离\n[01:09.63]这简单的话语\n[01:11.83]需要巨大的勇气\n[01:14.79]没想过失去你\n[01:17.34]却是在骗自己\n[01:20.37]最后你深深藏在\n[01:22.67]我的歌声里\n[01:24.92]只愿得一人心\n[01:27.43]白首不分离\n[01:29.91]这清晰的话语\n[01:32.06]嘲笑孤单的自己\n[01:34.96]盼望能见到你\n[01:37.46]却一直骗自己\n[01:40.67]遗憾你听不到我唱的这首歌\n[01:45.13]多想唱给你\n[02:06.00]曾在我背包小小夹层\n[02:08.80]里的那个人\n[02:10.95]陪伴我漂洋过海\n[02:13.15]经过每一段旅程\n[02:15.96]隐形的稻草人\n[02:18.51]守护我的天真\n[02:20.97]曾以为爱情能让\n[02:23.32]未来只为一个人\n[02:26.13]关了灯依旧在\n[02:28.03]书桌角落的那个人\n[02:31.09]变成我许多年来\n[02:33.43]纪念爱情的标本\n[02:36.19]消失的那个人\n[02:38.75]回不去的青春\n[02:41.20]忘不了爱过的人\n[02:43.51]才会对过往认真\n[02:48.22]只愿得一人心\n[02:50.77]白首不分离\n[02:53.22]这简单的话语\n[02:55.48]需要巨大的勇气\n[02:58.33]没想过失去你\n[03:00.88]却是在骗自己\n[03:03.99]最后你深深藏在\n[03:06.34]我的歌声里\n[03:08.45]只愿得一人心\n[03:11.01]白首不分离\n[03:13.51]这清晰的话语\n[03:15.61]嘲笑孤单的自己\n[03:18.51]盼望能见到你\n[03:21.06]却一直骗自己\n[03:24.17]遗憾你听不到\n[03:26.07]我唱的这首歌\n[03:28.63]只愿得一人心\n[03:31.23]白首不分离\n[03:33.79]这简单的话语\n[03:35.84]需要巨大的勇气\n[03:38.74]没想过失去你\n[03:41.35]却是在骗自己\n[03:44.35]最后你深深藏在\n[03:46.70]我的歌声里\n[03:48.86]只愿得一人心\n[03:51.41]白首不分离\n[03:53.91]这清晰的话语\n[03:56.07]嘲笑孤单的自己\n[03:59.32]我很想你\n[04:01.47]却一直骗自己\n[04:04.62]遗憾你听不到\n[04:06.67]我唱的这首歌\n[04:09.08]多想唱给你', '/song/1649176099584愿得一人心.mp3', 1, '276');
INSERT INTO `song` VALUES (16, 3, '这世界那么多人', '为啥还没遇到对的人', '2022-04-05 20:38:02', '2022-04-09 01:20:32', '/img/songPic/tubiao.png', '[00:00.00]这世界那么多人 (《我要我们在一起》电影主题曲) - 莫文蔚 (Karen Mok)\n[00:06.13]词：王海涛\n[00:06.85]曲：Akiyama Sayuri\n[00:07.34]编曲：彭飞\n[00:07.98]制作人：荒井十一/彭飞\n[00:10.95]Strings所有弦乐器：彭飞\n[00:11.21]Guitar吉他：胡洋\n[00:11.39]Mandolin曼陀林：彭飞\n[00:11.59]Drums鼓：荒井十一\n[00:11.79]Recording Studio录音室：Studio 21A\n[00:12.01]Recorded by 录音师：倪韩文\n[00:12.27]Mixing Studio 混音室：Studio 21A\n[00:12.50]Mixed by 混音师：周天澈\n[00:12.77]Master Engineer 母带工程师：周天澈\n[00:18.67]这世界有那么多人\n[00:24.67]人群里 敞着一扇门\n[00:31.67]我迷朦的眼睛里长存\n[00:38.28]初见你蓝色清晨\n[00:45.56]这世界有那么多人\n[00:51.52]多幸运 我有个我们\n[00:58.42]这悠长命运中的晨昏\n[01:04.74]常让我 望远方出神\n[01:12.41]灰树叶飘转在池塘\n[01:18.97]看飞机轰的一声去远乡\n[01:25.13]光阴的长廊 脚步声叫嚷\n[01:31.76]灯一亮 无人的空荡\n[01:39.18]晚风中闪过 几帧从前啊\n[01:45.67]飞驰中旋转 已不见了吗\n[01:52.39]远光中走来 你一身晴朗\n[01:59.12]身旁那么多人 可世界不声 不响\n[02:11.93]这世界有那么多人\n[02:18.21]多幸运 我有个我们\n[02:25.37]这悠长命运中的晨昏\n[02:31.67]常让我 望远方出神\n[02:39.28]灰树叶飘转在池塘\n[02:45.82]看飞机轰的一声去远乡\n[02:51.74]光阴的长廊 脚步声叫嚷\n[02:58.29]灯一亮 无人的空荡\n[03:05.68]晚风中闪过 几帧从前啊\n[03:12.41]飞驰中旋转 已不见了吗\n[03:19.10]远光中走来 你一身晴朗\n[03:26.09]身旁那么多人 可世界不声 不响\n[03:35.75]笑声中浮过 几张旧模样\n[03:42.34]留在梦田里 永远不散场\n[03:49.03]暖光中醒来 好多话要讲\n[03:56.00]世界那么多人 可是它不声 不响\n[04:08.44]这世界有那么个人\n[04:14.67]活在我 飞扬的青春\n[04:21.77]在泪水里浸湿过的长吻\n[04:28.36]常让我 想啊想出神', '/song/1649438432718这世界那么多人.mp3', 1, '180');
INSERT INTO `song` VALUES (17, 3, '危险派对', '', '2022-04-05 21:13:15', '2022-04-09 01:20:21', '/img/songPic/tubiao.png', '[00:00.000] 作词 : 王以太/YUN/球球\n[00:01.000] 作曲 : 王以太/YUN/张怿龙\n[00:02.000] 编曲 : DIESI\n[00:03.000] 制作人 : h3R3\n[00:11.33]『芳心收集行动』特别企划\n[00:20.01]你的光芒闪耀像是gold\n[00:22.69]逐渐入侵了我眼眸\n[00:24.93]到底要怎么样的口吻\n[00:27.17]才能让你内心点头\n[00:29.31]是我猜不透你的味觉\n[00:32.11]是我察觉不到的危险\n[00:34.27]别把离开挂在嘴边\n[00:36.30]当你慢慢靠近我\n[00:38.95]是我没把握你心跳的节奏\n[00:41.11]换来一堆轻佻的借口\n[00:43.60]别成为我心碎的理由\n[00:45.76]Don’t hurt me baby\n[00:46.72]Don’t hurt me\n[00:47.90]告诉我你现在的感觉\n[00:50.25]你的眼神都那么明显\n[00:52.75]别把结果拖延到明天\n[00:56.63]Maybe we just slow down\n[00:58.93]Anyone but you\'s so wrong\n[01:01.12]当音乐再次奏响\n[01:03.05]连呼吸都在碰撞\n[01:06.17]把心放你手掌\n[01:08.47]沦陷在你目光\n[01:10.42]享受着步调摇晃\n[01:12.20]舞会开场\n[01:14.41]左手保护你的腰\n[01:16.70]不会碰到你的背\n[01:19.10]右手托住你的心跳\n[01:21.60]不论向前或后退\n[01:23.70]如果你很信任我\n[01:25.63]手抬高原地转个圈\n[01:27.88]烦恼都丢掉像幻灯片\n[01:30.24]当我们站在舞台的正中间\n[01:32.73]如果我们的热情依然在增加\n[01:35.13]自然跳起象征着爱情的伦巴\n[01:37.38]一起跳到下一个晚宴\n[01:39.17]到星星布满天\n[01:40.19]把飞逝的时间给扔下\n[01:42.17]已然忘记美好的今天要拍照片\n[01:44.63]不知不觉就已送你到楼下\n[01:46.55]目前这些美好的幻想还没套现\n[01:49.10]希望你的回答可以让我留下\n[01:51.45]Maybe we just slow down\n[01:53.76]Anyone but you\'s so wrong\n[01:56.09]当音乐再次奏响\n[01:57.88]连呼吸都在碰撞\n[02:01.10]把心放你手掌\n[02:02.94]沦陷在你目光\n[02:05.19]享受着步调摇晃\n[02:07.14]我不危险\n[02:27.88]Maybe we just slow down\n[02:30.27]Anyone but you\'s so wrong\n[02:32.72]当音乐再次奏响\n[02:34.50]连呼吸都在碰撞\n[02:37.56]把心放你手掌\n[02:39.36]沦陷在你目光\n[02:41.76]享受着步调摇晃\n[02:43.70]我不危险\n[02:45.062] 监制 : h3R3', '/song/1649438421202危险派对.mp3', 1, '273');
INSERT INTO `song` VALUES (18, 3, '我怀念的', '', '2022-04-05 23:00:59', '2022-04-07 15:29:48', '/img/songPic/tubiao.png', '[00:00.35]孙燕姿 - 我怀念的\n[00:01.66]作词：姚若龙\n[00:02.56]作曲：李偲菘\n[00:16.74]我问为什么\n[00:19.10]那女孩传简讯给我\n[00:24.14]而你为什么\n[00:26.31]不解释低着头沉默\n[00:30.53]我该相信你很爱我\n[00:34.37]不愿意敷衍我\n[00:37.55]还是明白\n[00:38.81]你已不想挽回什么\n[00:45.93]想问为什么\n[00:48.27]我不再是你的快乐\n[00:53.21]可是为什么\n[00:55.30]却苦笑说我都懂了\n[00:59.26]自尊常常将人拖着\n[01:03.00]把爱都走曲折\n[01:06.23]假装了解是怕\n[01:08.51]真相太赤裸裸\n[01:11.73]狼狈比失去难受\n[01:14.26]我怀念的\n[01:15.47]是无话不说\n[01:17.75]我怀念的\n[01:18.86]是一起作梦\n[01:21.18]我怀念的\n[01:22.35]是争吵以后\n[01:24.37]还是想要\n[01:26.05]爱你的冲动\n[01:28.52]我记得那年生日\n[01:31.87]也记得那一首歌\n[01:35.06]记得那片星空\n[01:37.13]最紧的右手\n[01:38.85]最暖的胸口\n[01:40.42]谁记得\n[01:43.85]谁忘了\n[01:56.17]想问为什么\n[01:58.45]我不再是你的快乐\n[02:03.31]可是为什么\n[02:05.40]却苦笑说我都懂了\n[02:09.40]自尊常常将人拖着\n[02:13.24]把爱都走曲折\n[02:16.21]假装了解是怕\n[02:18.52]真相太赤裸裸\n[02:21.76]狼狈比失去难受\n[02:24.25]我怀念的\n[02:25.41]是无话不说\n[02:27.63]我怀念的\n[02:28.80]是一起作梦\n[02:31.01]我怀念的\n[02:32.22]是争吵以后\n[02:34.09]还是想要\n[02:35.81]爱你的冲动\n[02:38.29]我记得那年生日\n[02:41.55]也记得那一首歌\n[02:44.78]记得那片星空\n[02:46.81]最紧的右手\n[02:48.52]最暖的胸口\n[02:50.04]谁忘了\n[02:51.79]我怀念的\n[02:52.91]是无言感动\n[02:55.02]我怀念的\n[02:56.23]是绝对炽热\n[02:58.45]我怀念的\n[02:59.67]是你很激动\n[03:01.59]求我原谅\n[03:03.30]抱得我都痛\n[03:05.71]我记得你在背后\n[03:09.00]也记得我颤抖着\n[03:12.30]记得感觉汹涌\n[03:14.21]最美的烟火\n[03:15.97]最长的相拥\n[03:17.38]谁爱得太自由\n[03:20.94]谁过头太远了\n[03:24.33]谁要走我的心\n[03:27.73]谁忘了那就是承诺\n[03:31.18]谁自顾自地走\n[03:34.45]谁忘了看着我\n[03:37.89]谁让爱变沉重\n[03:41.38]谁忘了要给你温柔\n[03:56.89]我怀念的\n[03:59.51]我还有想要\n[04:01.53]爱你的冲动\n[04:03.84]我记得那年生日\n[04:07.17]也记得那一首歌\n[04:10.21]记得那片星空\n[04:12.28]最紧的右手\n[04:13.92]最暖的胸口\n[04:15.57]我放手\n[04:18.86]我让座\n[04:22.14]假洒脱\n[04:25.48]谁懂我多么不舍得\n[04:29.56]太爱了\n[04:32.26]所以我\n[04:35.74]没有哭\n[04:39.32]没有说', '/song/1649176053998我怀念的-孙燕姿.mp3', 1, '207');
INSERT INTO `song` VALUES (19, 3, '明天过后', '', '2022-04-05 23:07:24', '2022-04-07 15:32:06', '/img/songPic/tubiao.png', '[00:00.000] 作曲 : 梁伟丰\n[00:01.000] 作词 : 葛佳慧\n[00:19.070]没有星星的夜空\n[00:23.010]没有话题能补充\n[00:26.930]太多承诺从指缝中流走\n[00:31.100]不敢奢求什么\n[00:34.970]回忆将我们扣留\n[00:38.100]呜~一瞬间亲吻的时候\n[00:42.970]一切就好像轮回般朦胧\n[00:46.950]心动渐渐地失控\n[00:51.830]是否两个人足够捕捉爱的镜头\n[00:56.920]闭上了眼睛 记得你的笑容\n[01:00.820]幸福的从容 将灵魂都掏空\n[01:04.670]享受一分钟的感动\n[01:07.890]是否爱上一个人 不问明天过后\n[01:12.740]山明和水秀 不比你有看头\n[01:16.920]牵着你的手 一直走到最后\n[01:20.670]这一刻 怎么回头\n[01:42.940]没有星星的夜空\n[01:46.530]没有话题能补充\n[01:50.750]太多承诺从指缝中流走\n[01:54.810]不敢奢求什么\n[01:58.650]回忆将我们扣留\n[02:02.080]呜~一瞬间亲吻的时候\n[02:06.330]一切就好像轮回般朦胧\n[02:10.870]心动渐渐地失控\n[02:16.470]是否两个人足够捕捉爱的镜头\n[02:21.410]闭上了眼睛 记得你的笑容\n[02:25.880]幸福的从容 将灵魂都掏空\n[02:29.720]享受一分钟的感动\n[02:32.960]是否爱上一个人 不问明天过后\n[02:37.950]山明和水秀 不比你有看头\n[02:41.870]牵着你的手 一直走到最后\n[02:45.710]这一刻 怎么回头\n[02:51.060]是否两个人足够 捕捉爱的镜头\n[02:55.930]闭上了眼睛 记得你的笑容\n[02:59.950]幸福的从容 将灵魂都掏空\n[03:03.750]享受一分钟的感动\n[03:07.010]是否爱上一个人 不问明天过后\n[03:11.940]山明和水秀 不比你有看头\n[03:15.850]牵着你的手 一直走到最后\n[03:19.720]这一刻 怎么回头\n[03:23.950]这一刻 怎么回头', '/song/1649176023825明天过后-张杰.mp3', 1, '273');
INSERT INTO `song` VALUES (20, 3, '交换余生', '你喜欢JJ的歌吗', '2022-04-05 23:16:26', '2022-04-07 15:31:28', '/img/songPic/tubiao.png', '[00:00.000] 作曲 : 林俊杰\n[00:01.000] 作词 : 易家扬\n[00:35.510]孤单听雨的猫往时间裂缝里看到了我\n[00:42.785]雷电交加之外的另一些我\n[00:49.967]乌云静止以后 跳进平行时空\n[00:56.381]那些我 旅行中的妳我\n[01:00.518]回忆胡乱穿梭 坠落\n[01:08.820]交换余生 是我 非我 苦与乐\n[01:16.629]阴天之后总有续命的晴空\n[01:23.885]如果我们几经转折 结局一样不动\n[01:31.670]也才算无愧这分合\n[02:06.053]定位心海的锚让时间停顿的像慢动作\n[02:12.818]妳说命运很坏吧幸好有我\n[02:20.443]如果没有以后 如果平行失控\n[02:26.747]那些我 不同人生的我\n[02:30.691]会以什么方式 哭过\n[02:37.861]交换余生 是我 非我 苦与乐\n[02:45.313]阴天之后总有续命的晴空\n[02:52.540]如果我们几经转折 结局一样不动\n[03:00.539]也才算无愧这分合\n[03:07.946]云等风 人等梦 爱辗过时光等什么\n[03:15.072]记不住 认不出 泪眼中谁一样脸红\n[03:22.938]等妳说 等我说 一等就是一个宇宙\n[03:29.459]日升换月落 真爱换寂寞\n[03:37.364]交换余生 也许 忘了 第几梦\n[03:44.459]那时我们身处第几号时空\n[03:51.395]因为我们手心紧握 记忆也能紧扣\n[03:59.438]可不怕前方的虫洞\n[04:07.015]爱是时间的古董', '/song/1649176032283交换余生-泥人.mp3', 1, '237');
INSERT INTO `song` VALUES (21, 3, '雪龙吟', '', '2022-04-05 23:21:58', '2022-04-07 15:30:38', '/img/songPic/tubiao.png', '[00:01.35]演唱：张杰\n[00:01.74]作词：二水\n[00:02.07]作曲：包胡尔查\n[00:02.68]Rap 编写:刘乐\n[00:03.18]Rap Flow：杨和苏KeyNG\n[00:03.54]编曲：刘乐\n[00:03.87]录音师：孙炜祁\n[00:04.20]录音棚：Shicong Fatnunu\n[00:04.67]和声：DBD CHORUS\n[00:05.35]混音：张鸣利\n[00:05.64]混音助理：李永乾\n[00:05.96]母带：李琰祥/张鸣利ll\n[00:06.31]企划制作统筹：二水\n[00:07.07]制作人：包胡尔查\n[00:07.38]制作：包胡尔查工作室\n[00:08.73]我一声龙啸凌云志\n[00:12.66]热血燃冬扶摇起\n[00:16.68]看长城内外这天地\n[00:20.61]山河云开笑容里\n[00:24.69]我一声龙啸跨东西\n[00:28.68]踏雪而来创奇迹\n[00:32.67]来双奥之城感动你\n[00:36.57]神州铿锵亿万心\n[00:40.71] RAP:\n[00:40.89]我斟满来自东方的骄傲\n[00:42.99]痛饮一樽五千年的荣耀\n[00:44.94]四方英雄多多指教\n[00:46.83]我带着敬意向你们问声好\n[00:49.05]2008光芒依旧闪耀\n[00:50.88]圣火还在熊熊燃烧\n[00:52.86]老朋友坦诚相见的心跳\n[00:54.69]像中国的故事他传奇而美好\n[00:56.85]望长城内外雪花飘飘\n[00:58.98]冰雪健儿笑的多自豪\n[01:00.90]我张开海纳百川的怀抱\n[01:02.73]双奥之城繁星环绕\n[01:06.72]万里山河都在画里\n[01:10.68]金石铭刻盛世的崛起\n[01:14.64]春秋竹简泛黄入了泥\n[01:18.69]中国底气大写的传奇\n[01:22.74]苍山覆雪待写壮丽\n[01:26.73]共同愿望连接我和你\n[01:30.60]诗书古曲万卷成了集\n[01:34.71]寥寥数笔震撼这天地\n[01:46.71]我一声龙啸凌云志\n[01:50.67]热血燃冬扶摇起\n[01:54.66]看长城内外这天地\n[01:58.56]山河云开笑容里\n[02:02.70]我一声龙啸跨东西\n[02:06.72]踏雪而来创奇迹\n[02:10.71]来双奥之城感动你\n[02:14.58]神州铿锵亿万心\n[02:17.91] RAP:\n[02:18.96]五色的彩虹架起的跑道\n[02:20.94]千山万水缘起五环桥\n[02:22.80]世界的梦想最新的注脚\n[02:24.75]奇迹由我们来共同创造\n[02:26.73]你身如飞燕我好似游龙\n[02:28.86]我们御冰而行飞跃巅峰\n[02:30.96]每一个人都热情相拥\n[02:32.91]中国红最能让我们感动\n[02:34.83]望长城内外雪花飘飘\n[02:36.96]冰雪健儿笑的多自豪\n[02:38.88]我张开海纳百川的怀抱\n[02:40.71]双奥之城繁星环绕\n[02:44.73]我一声龙啸凌云志\n[02:48.66]热血燃冬扶摇起\n[02:52.65]看长城内外这天地\n[02:56.55]山河云开笑容里\n[03:00.69]我一声龙啸跨东西\n[03:04.68]踏雪而来创奇迹\n[03:08.67]来双奥之城感动你\n[03:12.54]神州铿锵亿万心', '/song/1649176041382雪龙吟.mp3', 1, '276');
INSERT INTO `song` VALUES (22, 3, '彩虹', '哪里有彩虹请告诉我', '2022-04-06 00:47:08', '2022-04-07 15:20:36', '/img/songPic/tubiao.png', '[00:00.000] 作曲 : 阿信/梁伯君\n[00:01.000] 作词 : 阿信\n[00:14.999]坐在浴缸里莲蓬头\n[00:20.190]代替我哭泣像下雨\n[00:25.039]其实我不知道\n[00:28.169]眼泪有没有流\n[00:35.360]就像这故事中\n[00:40.970]你有没有爱过我\n[00:46.640]虚弱的窗帘留不住\n[00:55.550]房里的黑夜也要走\n[01:01.200]清晨唤醒了我\n[01:05.220]照亮昨夜的梦\n[01:10.920]一直到这时候\n[01:16.550]才开始有一点懂\n[01:25.240]你的爱就像彩虹\n[01:29.130]雨后的天空\n[01:31.550]绚烂却教人迷惑\n[01:35.420]蓝绿黄红\n[01:37.010]你的爱就像彩虹\n[01:40.410]我张开了手\n[01:45.300]却只能抱住风\n[02:00.010]吻我离开我你就像\n[02:04.930]出太阳下雨难捉摸\n[02:09.969]越是努力揣摩\n[02:15.419]越是搞不懂\n[02:20.989]只好慢慢承认\n[02:26.239]这故事叫做错\n[02:34.969]你的爱就像彩虹\n[02:38.469]雨后的天空\n[02:40.639]绚烂却教人迷惑\n[02:43.699]蓝绿黄红\n[02:46.279]你的爱就像彩虹\n[02:49.479]我张开了手\n[02:54.219]却只能抱住风\n[03:19.439]oh!一层一层一层一层\n[03:21.469]一层一层又一层层的迷宫\n[03:24.499]我来不及回头\n[03:29.269]oh!忽左忽右忽上忽下\n[03:31.599]忽东忽西忽前忽后的折磨\n[03:36.690]都是你的捉弄\n[03:43.479]你的爱就像彩虹\n[03:48.690]雨后的天空\n[03:49.699]绚烂却教人迷惑\n[03:53.109]蓝绿黄红\n[03:55.109]你的爱就像彩虹\n[03:58.489]我张开了手\n[04:03.509]却只能抱住风\n[04:06.299]你的爱就像彩虹\n[04:09.659]雨后的天空\n[04:11.599]绚烂却教人迷惑\n[04:15.589]你的轮廓\n[04:17.269]你的爱就像彩虹\n[04:20.990]我张开了手\n[04:25.579]却只能抱住风', '/song/1649177228585彩虹-五月天.mp3', 1, '296');
INSERT INTO `song` VALUES (23, 3, '爱如潮水', '我的爱如潮水', '2022-04-06 00:55:26', '2022-04-07 14:54:25', '/img/songPic/tubiao.png', '[00:02.58]爱如潮水\n[00:04.78]演唱：张信哲\n[00:07.00]\n[00:31.12]不问你为何流眼泪\n[00:38.03]不在乎你心里还有谁\n[00:45.12]请让我给你安慰\n[00:49.06]不论结局是喜是悲\n[00:52.73]走过千山万水\n[00:55.76]在我心里你永远是那么美\n[01:03.06]既然爱了就不后悔\n[01:10.49]再多的苦我也愿意背\n[01:17.47]我的爱如潮水爱如潮水将我向你推\n[01:25.04]紧紧跟随\n[01:27.94]爱如潮水她将你我包围\n[01:34.48]我再也不愿见你在深夜里买醉\n[01:38.21]不愿别的男人见识你的妩媚\n[01:41.97]你该知道这样会让我心碎\n[01:48.69]答应我你从此不在深夜里徘徊\n[01:52.74]不要轻易尝试放纵的滋味\n[01:56.49]你可知道这样会让我心碎\n[02:06.17]\n[02:32.85]既然爱了就无怨无悔\n[02:40.01]再多的苦我也愿意背\n[02:46.98]我的爱如潮水爱如潮水将我向你推\n[02:54.55]紧紧跟随\n[02:57.45]爱如潮水她将你我包围\n[03:04.05]我再也不愿见你在深夜里买醉\n[03:07.75]不愿别的男人见识你的妩媚\n[03:11.61]你该知道这样会让我心碎\n[03:18.54]答应我你从此不在深夜里徘徊\n[03:22.45]不要轻易尝试放纵的滋味\n[03:26.01]你可知道这样会让我心碎\n[03:32.74]我再也不愿见你在深夜里买醉\n[03:36.42]不愿别的男人见识你的妩媚\n[03:40.39]你该知道这样会让我心碎\n[03:47.12]答应我你从此不在深夜里徘徊\n[03:51.01]不要轻易尝试放纵的滋味\n[03:54.74]你可知道这样会让我心碎\n[04:01.55]', '/song/1649177726306爱如潮水-张信哲.mp3', 1, '272');
INSERT INTO `song` VALUES (24, 1, '知否知否', '知否知否，应是绿肥红瘦', '2022-04-11 01:14:54', '2022-04-11 01:14:54', '/img/songPic/tubiao.png', '[00:00.06]胡夏、郁可唯 - 知否知否(《知否知否应是绿肥红瘦》电视剧主题曲)\r\n[00:01.54]作词：李清照、张靖怡\r\n[00:01.88]作曲：刘炫豆\r\n[00:02.08]编曲：刘炫豆\r\n[00:02.29]录音：刘文扬、佟新宇\r\n[00:02.59]混音：刘文扬、佟新宇\r\n[00:02.94]录音室：青春繁花录音室\r\n[00:03.30]箫演奏：陈昱融\r\n[00:03.50]弦乐演奏：国际首席爱乐乐团\r\n[00:03.96]配唱制作人：刘炫豆\r\n[00:04.26]制作人：刘靖\r\n[00:04.42]监制：刘靖、杨宇\r\n[00:04.72]音乐制作：青春繁花\r\n[00:05.02]音乐出品发行：正午阳光影业、世纪中腾\r\n[00:26.06]一朝花开傍柳\r\n[00:29.30]寻香误觅亭侯\r\n[00:35.66]纵饮朝霞半日晖\r\n[00:39.74]风雨着不透\r\n[00:44.55]一任宫长骁瘦\r\n[00:47.57]台高冰泪难流\r\n[00:54.05]锦书送罢蓦回首\r\n[00:58.09]无余岁可偷\r\n[01:04.03]昨夜雨疏风骤\r\n[01:06.06]浓睡不消残酒\r\n[01:08.57]试问卷帘人\r\n[01:09.94]却道海棠依旧\r\n[01:12.58]知否 知否\r\n[01:17.13]应是绿肥红瘦\r\n[01:22.46]昨夜雨疏风骤\r\n[01:24.50]浓睡不消残酒\r\n[01:26.93]试问卷帘人\r\n[01:28.35]却道海棠依旧\r\n[01:31.10]知否 知否\r\n[01:35.62]应是绿肥红瘦\r\n[02:21.38]一朝花开傍柳\r\n[02:24.75]寻香误觅亭侯\r\n[02:30.99]纵饮朝霞半日晖\r\n[02:35.10]风雨着不透\r\n[02:39.89]一任宫长骁瘦\r\n[02:42.87]台高冰泪难流\r\n[02:49.50]锦书送罢蓦回首\r\n[02:53.52]无余岁可偷\r\n[02:59.40]昨夜雨疏风骤\r\n[03:01.47]浓睡不消残酒\r\n[03:03.96]试问卷帘人\r\n[03:05.38]却道海棠依旧\r\n[03:07.96]知否 知否\r\n[03:12.50]应是绿肥红瘦\r\n[03:17.72]昨夜雨疏风骤\r\n[03:19.89]浓睡不消残酒\r\n[03:22.37]试问卷帘人\r\n[03:23.78]却道海棠依旧\r\n[03:26.47]知否 知否\r\n[03:31.02]应是绿肥红瘦\r\n[03:36.28]昨夜雨疏风骤\r\n[03:38.31]浓睡不消残酒\r\n[03:40.80]试问卷帘人\r\n[03:42.27]却道海棠依旧\r\n[03:44.94]知否 知否\r\n[03:49.46]应是绿肥红瘦\r\n[03:54.61]昨夜雨疏风骤\r\n[03:56.78]浓睡不消残酒\r\n[03:59.21]试问卷帘人\r\n[04:00.69]却道海棠依旧\r\n[04:03.37]知否 知否\r\n[04:07.88]应是绿肥红瘦\r\n[04:14.92]知否 知否\r\n[04:19.68]应是绿肥红瘦', '/song/1649610894012知否知否.mp3', 0, '290');
INSERT INTO `song` VALUES (25, 13, '记事本', '爱的痛了，痛的哭了', '2022-04-20 18:38:32', '2022-04-20 18:38:32', '/img/songPic/tubiao.png', '[by:诗十]\r\n[00:06.56]\r\n[00:23.30]翻开随身携带的记事本\r\n[00:28.19]写着许多事都是关于你\r\n[00:33.28]你讨厌被冷落\r\n[00:35.57]习惯被守候\r\n[00:38.58]寂寞才找我\r\n[00:42.12]\r\n[00:46.54]我看见自己写下的心情\r\n[00:50.96]把自己放在卑微的后头\r\n[00:56.15]等你等太久\r\n[00:58.53]想你泪会流\r\n[01:01.37]而幸福快乐是什么\r\n[01:05.06]\r\n[01:08.02]爱得痛了 痛得哭了\r\n[01:12.49]哭得累了\r\n[01:14.66]日记本里页页执着\r\n[01:18.68]记载着你的好\r\n[01:21.46]像上瘾的毒药\r\n[01:24.26]它反复骗着我\r\n[01:27.37]\r\n[01:30.85]爱得痛了 痛得哭了\r\n[01:35.32]哭得累了\r\n[01:37.65]矛盾心里总是强求\r\n[01:41.66]劝自己要放手\r\n[01:44.21]闭上眼让你走\r\n[01:46.99]烧掉日记重新来过\r\n[01:53.68]HO\r\n[01:56.73]\r\n[02:04.18]我看见自己写下的心情\r\n[02:08.04]把自己放在卑微的后头\r\n[02:13.38]等你等太久\r\n[02:15.43]想你泪会流\r\n[02:18.59]而幸福快乐是什么\r\n[02:22.16]\r\n[02:25.15]爱得痛了 痛得哭了\r\n[02:29.77]哭得累了\r\n[02:31.77]日记本里页页执着\r\n[02:35.72]记载着你的好\r\n[02:38.48]像上瘾的毒药\r\n[02:41.35]它反复骗着我\r\n[02:44.08]\r\n[02:47.96]爱得痛了 痛得哭了\r\n[02:52.61]哭得累了\r\n[02:54.65]矛盾心里总是强求\r\n[02:58.63]劝自己要放手\r\n[03:01.43]闭上眼让你走\r\n[03:04.34]烧掉日记重新来过\r\n[03:09.35]HO\r\n[03:10.90]爱得痛了 痛得哭了\r\n[03:15.78]哭得累了\r\n[03:17.55]矛盾心里总是强求\r\n[03:21.62]劝自己要放手\r\n[03:24.20]闭上眼让你走\r\n[03:26.99]烧掉日记重新来过\r\n[03:33.23]HA HO\r\n[03:37.54]', '/song/1650451112371记事本.mp3', 1, '252');
INSERT INTO `song` VALUES (26, 13, '当', '', '2022-04-20 18:44:15', '2022-04-20 18:44:15', '/img/songPic/tubiao.png', '[by:nostaticsin]\r\n\r\n[00:24.80]\r\n[00:27.38]Heo...Heo...\r\n[00:57.39]当山峰没有棱角的时候\r\n[01:00.79]当河水不再流\r\n[01:04.10]当时间停住日夜不分\r\n[01:08.18]当天地万物化为虚有\r\n[01:11.41]我还是不能和你分手\r\n[01:15.06]不能和你分手\r\n[01:17.95]你的温柔\r\n[01:19.65]是我今生最大的守候\r\n[01:25.01]当太阳不再上升的时候\r\n[01:28.48]当地球不再转动\r\n[01:31.70]当春夏秋冬不再变换\r\n[01:35.40]当花草树木全部凋残\r\n[01:38.58]我还是不能和你分散\r\n[01:42.56]不能和你分散\r\n[01:45.76]你的笑容\r\n[01:47.20]是我今生最大的眷恋\r\n[01:52.32]让我们红尘做伴\r\n[01:53.86]活得潇潇洒洒\r\n[01:56.04]策马奔腾共享人世繁华\r\n[01:59.52]对酒当歌唱出心中喜悦\r\n[02:02.79]轰轰烈烈把握青春年华\r\n[02:05.94]让我们红尘做伴\r\n[02:07.48]活得潇潇洒洒\r\n[02:09.75]策马奔腾共享人世繁华\r\n[02:13.49]对酒当歌唱出心中喜悦\r\n[02:16.69]轰轰烈烈把握青春年华\r\n[02:22.55]Heo...Heo...\r\n[02:53.30]当太阳不再上升的时候\r\n[02:57.36]当地球不再转动\r\n[03:00.74]当春夏秋冬不再变换\r\n[03:04.58]当花草树木全部凋残\r\n[03:07.81]我还是不能和你分散\r\n[03:11.66]不能和你分散\r\n[03:14.64]你的笑容\r\n[03:16.20]是我今生最大的眷恋\r\n[03:21.34]让我们红尘做伴\r\n[03:22.93]活得潇潇洒洒\r\n[03:25.22]策马奔腾共享人世繁华\r\n[03:28.69]对酒当歌唱出心中喜悦\r\n[03:31.97]轰轰烈烈把握青春年华\r\n[03:35.17]让我们红尘做伴\r\n[03:36.61]活得潇潇洒洒\r\n[03:38.95]策马奔腾共享人世繁华\r\n[03:42.36]对酒当歌唱出心中喜悦\r\n[03:45.95]轰轰烈烈把握青春年华\r\n[03:52.40]让我们红尘做伴\r\n[03:53.97]活得潇潇洒洒\r\n[03:56.13]策马奔腾共享人世繁华\r\n[03:59.58]对酒当歌唱出心中喜悦\r\n[04:03.08]轰轰烈烈把握青春年华\r\n[04:06.09]让我们红尘做伴\r\n[04:07.38]活得潇潇洒洒\r\n[04:09.94]策马奔腾共享人世繁华\r\n[04:13.35]对酒当歌唱出心中喜悦\r\n[04:16.72]轰轰烈烈把握青春年华\r\n[04:22.75]Heo...Heo...\r\n[04:53.25]', '/song/1650451455013当 (Live)-动力火车.mp3', 1, '309');
INSERT INTO `song` VALUES (27, 13, '独角戏', '独角戏', '2022-04-20 18:47:53', '2022-04-20 18:47:53', '/img/songPic/tubiao.png', '[by:Autumm-枫叶]\r\n\r\n\r\n[00:49.11]是谁导演这场戏\r\n[00:53.29]在这孤单角色里\r\n[00:56.78]对白总是自言自语\r\n[00:59.37]对手都是回忆 看不出什么结局\r\n[01:05.83]自始至终全是你\r\n[01:10.00]让我投入太彻底\r\n[01:13.31]故事如果注定悲剧\r\n[01:16.03]何苦给我美丽 演出相聚和别离\r\n[01:22.54]没有星星的夜里\r\n[01:26.51]我用泪光吸引你\r\n[01:30.22]既然爱你不能言语\r\n[01:32.83]只能微笑哭泣 让我从此忘了你\r\n[01:39.20]没有星星的夜里\r\n[01:43.37]我把往事留给你\r\n[01:47.01]如果一切只是演戏\r\n[01:49.52]要你好好看戏 心碎只是我自己\r\n[02:21.24]是谁导演这场戏\r\n[02:25.18]在这孤单角色里\r\n[02:28.80]对白总是自言自语\r\n[02:31.49]对手都是回忆 看不出什么结局\r\n[02:37.98]自始至终全是你\r\n[02:41.97]让我投入太彻底\r\n[02:45.54]故事如果注定悲剧\r\n[02:48.20]何苦给我美丽 演出相聚和别离\r\n[02:54.68]没有星星的夜里\r\n[02:58.88]我用泪光吸引你\r\n[03:02.47]既然爱你不能言语\r\n[03:04.90]只能微笑哭泣 让我从此忘了你\r\n[03:11.33]没有星星的夜里\r\n[03:15.64]我把往事留给你\r\n[03:19.08]如果一切只是演戏\r\n[03:21.74]要你好好看戏 心碎只是我自己\r\n[03:32.37]没有星星的夜里\r\n[03:36.52]我用泪光吸引你\r\n[03:40.01]既然爱你不能言语\r\n[03:42.68]只能微笑哭泣 让我从此忘了你\r\n[03:49.17]没有星星的夜里\r\n[03:53.30]我把往事留给你\r\n[03:56.71]如果一切只是演戏\r\n[03:59.41]要你好好看戏 心碎只是我自己', '/song/1650451673919独角戏-许茹芸.mp3', 1, '277');
INSERT INTO `song` VALUES (28, 11, '孤勇者', '谁说站在光里的才算英雄', '2022-04-21 00:16:46', '2022-04-21 00:16:46', '/img/songPic/tubiao.png', '[00:04.33]Vocal edite：汝文博@SBMS Beijing\r\n[00:04.49]混音&母带：周天澈@Studio 21A\r\n[00:04.63]词版权管理方：北京梦织音传媒有限公司\r\n[00:04.78]曲版权管理方：索尼音乐版权代理（北京）有限公司\r\n[00:04.92]录音作品及MV版权：EAS MUSIC LTD\r\n[00:05.07]出品监制：霍锦 卢泓宇\r\n[00:22.29]都 是勇敢的\r\n[00:28.50]你额头的伤口 你的 不同 你犯的错\r\n[00:36.96]都 不必隐藏\r\n[00:43.20]你破旧的玩偶 你的 面具 你的自我\r\n[00:51.46]\r\n[00:51.76]他们说 要带着光 驯服每一头怪兽\r\n[00:58.65]他们说 要缝好你的伤 没有人爱小丑\r\n[01:05.98]为何孤独 不可 光荣\r\n[01:09.25]人只有不完美 值得歌颂\r\n[01:13.52]谁说污泥满身的不算英雄\r\n[01:20.50]\r\n[01:20.80]爱你孤身走暗巷\r\n[01:22.88]爱你不跪的模样\r\n[01:24.61]爱你对峙过绝望\r\n[01:26.41]不肯哭一场\r\n[01:28.05]\r\n[01:28.35]爱你破烂的衣裳\r\n[01:30.11]却敢堵命运的枪\r\n[01:31.95]爱你和我那么像\r\n[01:33.83]缺口都一样\r\n[01:35.23]\r\n[01:35.53]去吗？配吗？这褴褛的披风\r\n[01:39.43]战吗？战啊！以最卑微的梦\r\n[01:43.08]致那黑夜中的呜咽与怒吼\r\n[01:50.35]谁说站在光里的才算英雄\r\n[02:08.41]\r\n[02:08.71]他们说 要戒了你的狂 就像擦掉了污垢\r\n[02:16.25]他们说 要顺台阶而上 而代价是低头\r\n[02:23.33]那就让我 不可 乘风\r\n[02:26.59]你一样骄傲着 那种孤勇\r\n[02:31.07]谁说对弈平凡的不算英雄\r\n[02:38.05]\r\n[02:38.35]爱你孤身走暗巷\r\n[02:40.29]爱你不跪的模样\r\n[02:42.10]爱你对峙过绝望\r\n[02:43.85]不肯哭一场\r\n[02:45.92]\r\n[02:45.92]爱你破烂的衣裳\r\n[02:47.62]却敢堵命运的枪\r\n[02:49.43]爱你和我那么像\r\n[02:51.37]缺口都一样\r\n[02:52.86]\r\n[02:53.16]去吗？配吗？这褴褛的披风\r\n[02:56.85]战吗？战啊！以最卑微的梦\r\n[03:00.55]致那黑夜中的呜咽与怒吼\r\n[03:07.82]谁说站在光里的才算英雄\r\n[03:12.25]\r\n[03:12.55]你的斑驳 与众不同\r\n[03:19.89]你的沉默 震耳欲聋 You Are The Hero\r\n[03:26.14]\r\n[03:26.44]爱你孤身走暗巷\r\n[03:28.27]爱你不跪的模样\r\n[03:30.09]爱你对峙过绝望\r\n[03:31.94]不肯哭一场 (You Are The Hero)\r\n[03:33.45]\r\n[03:33.75]爱你来自于蛮荒\r\n[03:35.75]一生不借谁的光\r\n[03:37.43]你将造你的城邦\r\n[03:39.25]在废墟之上\r\n[03:40.72]\r\n[03:41.02]去吗？去啊！以最卑微的梦\r\n[03:44.85]战吗？战啊！以最孤高的梦\r\n[03:48.54]致那黑夜中的呜咽与怒吼\r\n[03:55.81]谁说站在光里的才算英雄', '/song/1650471405983孤勇者-陈奕迅.mp3', 1, '256');
INSERT INTO `song` VALUES (29, 11, '单车', '难离难舍', '2022-04-21 00:20:20', '2022-04-21 00:20:20', '/img/songPic/tubiao.png', '[00:08.14] \r\n[00:16.58]不要不要假设我知道\r\n[00:20.24]一切一切也都是为我而做\r\n[00:25.06]为何这么伟大\r\n[00:28.83]如此感觉不到\r\n[00:31.23]不说一句的爱有多好\r\n[00:34.95]只有一次记得实在接触到\r\n[00:39.56]骑着单车的我俩\r\n[00:43.53]怀紧贴背的拥抱\r\n[00:45.53]难离难舍想抱紧些\r\n[00:49.24]茫茫人生好像荒野\r\n[00:52.95]如孩儿能伏于爸爸的肩膊\r\n[00:56.52]谁要下车\r\n[01:00.28]难离难舍总有一些\r\n[01:04.00]常情如此不可推卸\r\n[01:07.70]任世间再冷酷\r\n[01:09.51]想起这单车还有幸福可借\r\n[01:30.43]经已给我怎会看不到\r\n[01:34.09]虽说演你角色实在有难度\r\n[01:38.96]从来虚位以待\r\n[01:42.62]何不给个拥抱\r\n[01:45.03]想我怎去相信这一套\r\n[01:48.79]多痛惜我却不便让我知道\r\n[01:53.41]怀念单车给你我\r\n[01:57.37]唯一有过的拥抱\r\n[01:59.38]难离难舍想抱紧些\r\n[02:03.04]茫茫人生好像荒野\r\n[02:06.75]如孩儿能伏于爸爸的肩膊\r\n[02:10.31]哪怕遥遥长路多斜\r\n[02:14.84]你爱我爱多些\r\n[02:17.45]让我他朝走得坚壮些\r\n[02:22.01]你介意来爱护\r\n[02:24.27]又靠谁施舍\r\n[02:38.27]难离难舍想抱紧些\r\n[02:41.83]茫茫人生好像荒野\r\n[02:45.49]如孩儿能伏于爸爸的肩膊\r\n[02:49.26]谁要下车\r\n[02:52.87]难离难舍总有一些\r\n[02:56.63]常情如此不可推卸\r\n[03:00.49]任世间怨我坏\r\n[03:02.40]可知我只得你承受我的狂或野\r\n[03:27.02]监制 : 陈辉阳', '/song/1650471620775单车.mp3', 1, '208');
INSERT INTO `song` VALUES (30, 11, '富士山下', '每个人都是这样，享受过提心吊胆，才拒绝做爱情代罪的羔羊', '2022-04-21 00:26:49', '2022-04-21 00:26:49', '/img/songPic/tubiao.png', '[00:02.700]\r\n[00:21.961]拦路雨偏似雪花 饮泣的你冻吗\r\n[00:26.464]这风褛我给你磨到有襟花\r\n[00:31.023]连调了职也不怕 怎么始终牵挂\r\n[00:35.618]苦心选中今天想车你回家\r\n[00:40.181]原谅我不再送花 伤口应要结疤\r\n[00:44.739]花瓣铺满心里坟场才害怕\r\n[00:49.337]如若你非我不嫁 彼此终必火化\r\n[00:53.878]一生一世等一天需要代价\r\n[00:58.438]谁都只得那双手靠拥抱亦难任你拥有\r\n[01:03.612]要拥有必先懂失去怎接受\r\n[01:08.177]曾沿着雪路浪游 为何为好事泪流\r\n[01:12.733]谁能凭爱意要富士山私有\r\n[01:17.292]何不把悲哀感觉假设是来自你虚构\r\n[01:21.912]试管里找不到它染污眼眸\r\n[01:26.405]前尘硬化像石头 随缘地抛下便逃走\r\n[01:34.143]我绝不罕有 往街里绕过一周\r\n[01:38.559]我便化乌有\r\n[01:42.640]情人节不要说穿 只敢抚你发端\r\n[01:47.193]这种姿态可会令你更心酸\r\n[01:51.795]留在汽车里取暖 应该怎么规劝\r\n[01:56.376]怎么可以将手腕忍痛划损\r\n[02:00.953]人活到几岁算短 失恋只有更短\r\n[02:05.501]归家需要几里路谁能预算\r\n[02:10.088]忘掉我跟你恩怨 樱花开了几转\r\n[02:14.697]东京之旅一早比一世遥远\r\n[02:19.226]谁都只得那双手靠拥抱亦难任你拥有\r\n[02:24.393]要拥有必先懂失去怎接受\r\n[02:28.941]曾沿着雪路浪游 为何为好事泪流\r\n[02:33.512]谁能凭爱意要富士山私有\r\n[02:38.087]何不把悲哀感觉假设是来自你虚构\r\n[02:42.681]试管里找不到它染污眼眸\r\n[02:47.210]前尘硬化像石头 随缘地抛下便逃走\r\n[02:54.214]我绝不罕有 往街里绕过一周\r\n[02:59.066]我便化乌有\r\n[03:03.313]谁都只得那双手靠拥抱亦难任你拥有\r\n[03:08.689]要拥有必先懂失去怎接受\r\n[03:13.391]曾沿着雪路浪游 为何为好事泪流\r\n[03:18.156]谁能凭爱意要富士山私有\r\n[03:22.849]何不把悲哀感觉假设是来自你虚构\r\n[03:27.562]试管里找不到它染污眼眸\r\n[03:32.248]前尘硬化像石头 随缘地抛下便逃走\r\n[03:41.286]我绝不罕有 往街里绕过一周\r\n[03:46.586]我便化乌有\r\n[03:52.009]你还嫌不够 我把这陈年风褛 送赠你解咒\r\n[04:01.002]\r\n[04:02.699]Produced by 梁荣骏\r\n[04:03.699]Production Coordination: Stanley Leung\r\n[04:04.699]Keyboards & Programming: 陈珀 / C.Y.Kong (江志仁)\r\n[04:05.699]Drums: Davy Chan (陈匡荣)\r\n[04:06.699]Bass: 细威\r\n[04:07.699]Guitar: Joey Tang (邓建明)\r\n[04:08.699]Percussion: Davy Chan & Kevin (Hardpack)\r\n[04:09.699]Strings Arranged & Conducted by 陈珀\r\n[04:10.699]Recorded at aroom studio & seewisehk,\r\n[04:11.699]Engineered by Davy Chan, Rob Porter & C.Y.Kong\r\n[04:12.699]Vocals Recorded at Avon Studios,\r\n[04:13.699]Engineered by Anthony Leung\r\n[04:14.699]Mixed by Simon Li at nOiz\r\n[04:15.699]OP: Forward Music Publishing Co Ltd / Universal Music Publishing Ltd\r\n[04:16.699]SP: Fujipacific Music (S.E. Asia) Ltd', '/song/1650472008680富士山下-陈奕迅.mp3', 1, '259');
INSERT INTO `song` VALUES (31, 11, '十年', '十年之前我不认识你你不属于我', '2022-04-21 00:40:47', '2022-04-21 00:40:47', '/img/songPic/tubiao.png', '[00:15.54]如果那两个字没有颤抖\r\n\r\n[00:19.26]我不会发现 我难受\r\n\r\n[00:22.64]怎么说出口\r\n\r\n[00:26.08]也不过是分手\r\n\r\n[00:30.77]如果对于明天没有要求\r\n\r\n[00:34.85]牵牵手就像旅游\r\n\r\n[00:37.96]成千上万个门口\r\n\r\n[00:41.70]总有一个人要先走\r\n\r\n[00:47.39]怀抱既然不能逗留\r\n\r\n[00:50.89]何不在离开的时候\r\n\r\n[00:53.77]一边享受 一边泪流\r\n\r\n[01:00.93]十年之前\r\n\r\n[01:02.95]我不认识你\r\n\r\n[01:04.89]你不属于我\r\n\r\n[01:06.87]我们还是一样\r\n\r\n[01:09.24]陪在一个陌生人左右\r\n\r\n[01:13.12]走过渐渐熟悉的街头\r\n\r\n[01:16.46]十年之后\r\n\r\n[01:18.33]我们是朋友\r\n\r\n[01:20.31]还可以问候\r\n\r\n[01:22.27]只是那种温柔\r\n\r\n[01:24.70]再也找不到拥抱的理由\r\n\r\n[01:28.64]情人最后难免沦为朋友\r\n\r\n[01:57.07]怀抱既然不能逗留\r\n\r\n[02:00.54]何不在离开的时候\r\n\r\n[02:03.58]一边享受 一边泪流\r\n\r\n[02:10.63]十年之前\r\n\r\n[02:12.65]我不认识你\r\n\r\n[02:14.63]你不属于我\r\n\r\n[02:16.50]我们还是一样\r\n\r\n[02:18.98]陪在一个陌生人左右\r\n\r\n[02:22.72]走过渐渐熟悉的街头\r\n\r\n[02:26.15]十年之后我们是朋友\r\n\r\n[02:30.04]还可以问候\r\n\r\n[02:32.01]只是那种温柔\r\n\r\n[02:34.38]再也找不到拥抱的理由\r\n\r\n[02:38.27]情人最后难免沦为朋友\r\n\r\n[02:48.19]直到和你做了多年朋友\r\n\r\n[02:52.38]才明白我的眼泪\r\n\r\n[02:55.21]不是为你而流\r\n\r\n[02:58.99]也为别人而流', '/song/1650472847306十年-陈奕迅.mp3', 1, '205');
INSERT INTO `song` VALUES (32, 12, '陪你到漫长岁月', '未来多漫长 再漫长 还有期待', '2022-04-21 01:01:17', '2022-04-21 01:01:17', '/img/songPic/tubiao.png', '[00:09.00]\r\n[00:10.61]走过了人来人往\r\n[00:15.31]不喜欢也得欣赏\r\n[00:20.00]我是沉默的存在\r\n[00:25.15]不当你的世界 只作你肩膀\r\n[00:29.68]拒绝成长到成长\r\n[00:34.53]变成想要的模样\r\n[00:39.34]在举手投降以前\r\n[00:42.85]让我再陪你一段\r\n[00:49.02]陪你把沿路感想活出了答案\r\n[00:53.65]陪你把独自孤单变成了勇敢\r\n[00:59.04]一次次失去又重来 我没离开\r\n[01:03.92]陪伴是 最长情的告白\r\n[01:08.17]陪你把想念的酸 拥抱成温暖\r\n[01:12.83]陪你把彷徨 写出情节来\r\n[01:18.10]未来多漫长 再漫长 还有期待\r\n[01:23.10]陪伴你 一直到 故事给说完\r\n[01:30.23]\r\n[01:46.77]让我们静静分享\r\n[01:51.36]此刻难得的坦白\r\n[01:56.11]只是无声地交谈\r\n[01:59.51]感觉幸福 感觉不孤单\r\n[02:05.63]陪你把沿路感想 活出了答案\r\n[02:10.51]陪你把独自孤单 变成了勇敢\r\n[02:15.71]一次次失去 又重来 我没离开\r\n[02:20.93]陪伴是 最长情的告白\r\n[02:25.06]陪你把想念的酸 拥抱成温暖\r\n[02:29.67]陪你把彷徨 写出情节来\r\n[02:34.91]未来多漫长 再漫长 还有期待\r\n[02:39.87]陪伴你 一直到 故事给说完\r\n[02:48.75]\r\n[03:03.54]陪你把沿路感想 活出了答案\r\n[03:08.07]陪你把独自孤单 变成了勇敢\r\n[03:13.26]一次次失去 又重来 我没离开\r\n[03:18.39]陪伴是 最长情的告白\r\n[03:22.51]陪你把想念的酸 拥抱成温暖\r\n[03:27.35]陪你把彷徨 写出情节来\r\n[03:32.51]未来多漫长 再漫长 还有期待\r\n[03:37.42]陪伴你 一直到 这故事说完\r\n[03:46.23]', '/song/1650474077383陪你度过漫长岁月-陈奕迅.mp3', 1, '242');
INSERT INTO `song` VALUES (33, 12, '阴天快乐', '阴天别闹了', '2022-04-21 01:02:48', '2022-04-21 01:02:48', '/img/songPic/tubiao.png', '[00:16.810]天空它像什么\r\n[00:20.880]爱情就像什么\r\n[00:24.570]几朵云在阴天忘了该往哪儿走\r\n[00:30.320]\r\n[00:31.970]思念和寂寞\r\n[00:34.830]被吹进了左耳\r\n[00:38.380]也许我记不住可是也忘不掉那时候\r\n[00:43.830]那种秘密的快乐\r\n[00:48.060]\r\n[00:50.440]听阴天说什么\r\n[00:53.880]在昏暗中的我\r\n[00:57.550]想对着天讲 说无论如何\r\n[01:01.899]阴天快乐\r\n[01:04.840]\r\n[01:05.239]叫阴天别闹了\r\n[01:08.469]想念你都那么久那么久了\r\n[01:12.959]我一抬头 就看见你\r\n[01:16.500]那个酒窝\r\n[01:20.230]\r\n[01:32.459]翻山越岭之后\r\n[01:35.379]爱却神出鬼没\r\n[01:39.980]你像一首唱到沙哑偏爱的情歌\r\n[01:46.539]\r\n[01:47.539]旅途中坐一坐\r\n[01:50.459]在秋千上的我\r\n[01:54.369]原来我忽略的如今想纪念也没用\r\n[01:59.950]那些时光的因果\r\n[02:04.129]\r\n[02:04.530]听阴天说什么\r\n[02:07.719]在昏暗中的我\r\n[02:11.610]想对着天讲 说无论如何\r\n[02:15.649]阴天快乐\r\n[02:18.789]\r\n[02:19.099]叫阴天别闹了\r\n[02:22.438]想念你都那么久那么久了\r\n[02:26.889]我一抬头 就看见你\r\n[02:30.300]那个酒窝\r\n[02:33.949]\r\n[02:35.979]过去穿过了现在绕过了未来缝在心海中\r\n[02:42.438]带着你我旅行变成老头\r\n[02:48.629]孤单怕成了习惯所以我淡定走在人海中\r\n[02:57.160]偶尔想看云飞却没风\r\n[03:03.218]\r\n[03:03.688]听阴天说什么\r\n[03:06.819]在昏暗中的我\r\n[03:10.669]想对着天讲 说无论如何\r\n[03:14.808]阴天快乐\r\n[03:17.718]\r\n[03:18.119]叫阴天别闹了\r\n[03:21.679]想念你都那么久那么久了\r\n[03:26.169]我一抬头 就看见了 当时的我\r\n[03:35.879]', '/song/1650474168495阴天快乐-陈奕迅.mp3', 1, '260');
INSERT INTO `song` VALUES (34, 12, '像我这样的人', '像我这样庸俗的人', '2022-02-24 01:04:37', '2022-04-21 01:04:37', '/img/songPic/tubiao.png', '[00:09.840]\r\n[00:15.000]像我这样优秀的人\r\n[00:18.770]本该灿烂过一生\r\n[00:22.620]怎么二十多年到头来\r\n[00:26.700]还在人海里浮沉\r\n[00:30.240]\r\n[00:30.350]像我这样聪明的人\r\n[00:34.500]早就告别了单纯\r\n[00:38.380]怎么还是用了一段情\r\n[00:42.360]去换一身伤痕\r\n[00:44.680]\r\n[00:46.150]像我这样迷茫的人\r\n[00:49.840]像我这样寻找的人\r\n[00:53.800]像我这样碌碌无为的人\r\n[00:57.590]你还见过多少人\r\n[01:06.910]\r\n[01:18.640]像我这样庸俗的人\r\n[01:22.830]从不喜欢装深沉\r\n[01:26.540]怎么偶尔听到老歌时\r\n[01:30.620]忽然也晃了神\r\n[01:34.380]像我这样懦弱的人\r\n[01:38.240]凡事都要留几分\r\n[01:42.200]怎么曾经也会为了谁\r\n[01:45.950]想过奋不顾身\r\n[01:47.680]\r\n[01:49.870]像我这样迷茫的人\r\n[01:53.770]像我这样寻找的人\r\n[01:57.490]像我这样碌碌无为的人\r\n[02:01.450]你还见过多少人\r\n[02:04.690]\r\n[02:05.460]像我这样孤单的人\r\n[02:09.200]像我这样傻的人\r\n[02:13.260]像我这样不甘平凡的人\r\n[02:16.990]世界上有多少人\r\n[02:21.580]\r\n[02:26.760]像我这样迷茫的人\r\n[02:30.510]像我这样寻找的人\r\n[02:34.370]像我这样碌碌无为的人\r\n[02:38.230]你还见过多少人\r\n[02:41.240]\r\n[02:42.000]像我这样孤单的人\r\n[02:46.100]像我这样傻的人\r\n[02:49.970]像我这样不甘平凡的人\r\n[02:53.650]世界上有多少人\r\n[02:56.630]\r\n[02:59.630]像我这样莫名其妙的人\r\n[03:05.430]会不会有人心疼\r\n[03:14.050]\r\n\r\n[03:25.940]', '/song/1650474277205像我这样的人-毛不易.mp3', 1, '207');
INSERT INTO `song` VALUES (35, 10, '一荤一素', '月儿明 风儿轻', '2022-02-23 01:13:42', '2022-04-21 01:13:42', '/img/songPic/tubiao.png', '[00:26.950]日出又日落 深处再深处\r\n[00:33.890]一张小方桌 有一荤一素\r\n[00:40.600]一个身影从容地忙忙碌碌\r\n[00:47.250]一双手让这时光有了温度\r\n[00:54.460]太年轻的人 他总是不满足\r\n[01:01.369]固执地不愿停下 远行的脚步\r\n[01:07.799]望着高高的天走了长长的路\r\n[01:15.189]忘了回头看 她有没有哭\r\n[01:25.870]月儿明 风儿轻\r\n[01:31.230]可是你在敲打我的窗棂\r\n[01:38.190]听到这儿你就别担心\r\n[01:44.870]其实我过的还可以\r\n[01:51.480]月儿明 风儿轻\r\n[01:57.160]你又可曾来过我的梦里\r\n[02:04.439]一定是你来时太小心\r\n[02:10.150]知道我睡得轻\r\n[02:43.639]太年轻的人 他总是不满足\r\n[02:49.629]固执地不愿停下 远行的脚步\r\n[02:55.569]望着高高的天走了长长的路\r\n[03:02.979]忘了回头看 她有没有哭\r\n[03:09.250]月儿明 风儿轻\r\n[03:14.949]可是你在敲打我的窗棂\r\n[03:22.090]听到这儿你就别担心\r\n[03:28.870]其实我过的还可以\r\n[03:34.960]月儿明 风儿轻\r\n[03:40.960]你又可曾来过我的梦里\r\n[03:48.229]一定是你来时太小心\r\n[03:53.690]知道我睡得轻\r\n[04:01.719]一定是你来时太小心\r\n[04:09.349]怕我再想起你\r\n[04:16.420]\r\n[04:18.709]键盘Keyboard：宋涛\r\n[04:20.050]吉他Guitar：薛峰\r\n[04:21.160]贝斯Bass：韩阳\r\n[04:22.180]合音Backing Vocal：赵兆\r\n[04:23.189]黑管Clarinet：李为\r\n[04:24.360]弦乐Strings：国际首席爱乐乐团International Master Philharmonic Orchestra\r\n[04:25.970]混音Mixing：李游\r\n[04:27.009]母带Mastering：Joe LaPorta .（Sterling Sound. NY）\r\n[04:27.769]录音棚Studio：55TEC . Beijing\r\n[04:28.610]录音Recording：李游 李杨\r\n[04:29.350]人声录音Vocal Recording：李杨\r\n[04:30.089]人声编辑Vocal Editing：李杨\r\n[04:30.810]录音助理Recording Assistants：郭舒文 邢铜\r\n[04:31.389]音乐制作发行produced and distributed: 哇唧唧哇×智慧大狗\r\n[04:32.509]', '/song/1650474822188一荤一素-毛不易.mp3', 1, '281');
INSERT INTO `song` VALUES (36, 10, '借', '被这风吹散的人说他爱得不深', '2022-02-22 01:15:37', '2022-04-21 01:15:37', '/img/songPic/tubiao.png', '[00:12.110]\r\n[00:24.810]借一盏午夜街头 昏黄灯光\r\n[00:31.160]照亮那坎坷路上人影一双\r\n[00:37.430]借一寸三九天里 冽冽暖阳\r\n[00:43.800]融这茫茫人间刺骨凉\r\n[00:50.410]借一泓古老河水 九曲回肠\r\n[00:56.430]带着那摇晃烛火 漂往远方\r\n[01:02.738]借一段往日旋律 婉转悠扬\r\n[01:08.939]把这不能说的轻轻唱\r\n[01:15.539]被这风吹散的人说他爱得不深\r\n[01:22.239]被这雨淋湿的人说他不会冷\r\n[01:28.149]无边夜色到底还要蒙住多少人\r\n[01:35.489]它写进眼里 他不敢承认\r\n[02:05.977]借一抹临别黄昏悠悠斜阳\r\n[02:12.369]为这漫漫余生添一道光\r\n[02:18.629]借一句刻骨铭心来日方长\r\n[02:25.259]倘若不得不天各一方\r\n[02:31.259]被这风吹散的人说他爱得不深\r\n[02:37.938]被这雨淋湿的人说他不会冷\r\n[02:43.789]无边夜色到底还要蒙住多少人\r\n[02:51.210]它写进眼里 他不敢承认\r\n[02:56.910]可是啊 总有那风吹不散的认真\r\n[03:03.449]总有大雨也不能抹去的泪痕\r\n[03:09.039]有一天太阳会升起在某个清晨\r\n[03:20.009]一道彩虹 两个人\r\n[03:28.528]借一方乐土让他容身\r\n[03:35.938]借他平凡一生', '/song/1650474937206借-毛不易.mp3', 1, '243');
INSERT INTO `song` VALUES (37, 10, '不染', '不愿染是与非', '2022-04-13 01:19:39', '2022-04-21 01:19:39', '/img/songPic/tubiao.png', '[00:39.95]不愿染是与非 怎料事与愿违\r\n\r\n[00:46.83]心中的花枯萎 时光它去不回\r\n\r\n[00:53.83]但愿洗去浮华 掸去一身尘灰\r\n\r\n[01:00.79]再与你一壶清酒 话一世沉醉\r\n\r\n \r\n\r\n[01:08.19]不愿染是与非 怎料事与愿违\r\n\r\n[01:14.97]心中的花枯萎 时光它去不回\r\n\r\n[01:22.14]回忆辗转来回 痛不过这心扉\r\n\r\n[01:29.20]愿只愿余生无悔 随花香远飞\r\n\r\n \r\n\r\n[01:36.65]一壶清酒 一身尘灰\r\n\r\n[01:43.45]一念来回度余生无悔\r\n\r\n[01:50.65]一场春秋 生生灭灭 浮华是非\r\n\r\n[01:57.81]待花开之时再醉一回\r\n\r\n \r\n\r\n[02:32.97]不愿染是与非 怎料事与愿违\r\n\r\n[02:39.61]心中的花枯萎 时光它去不回\r\n\r\n[02:46.80]回忆辗转来回 痛不过这心扉\r\n\r\n[02:53.84]愿只愿余生无悔 随花香远飞\r\n\r\n \r\n\r\n[03:01.40]一壶清酒 一身尘灰\r\n\r\n[03:08.45]一念来回度余生无悔\r\n\r\n[03:15.39]一场春秋 生生灭灭 浮华是非\r\n\r\n[03:22.37]待花开之时再醉一回\r\n\r\n \r\n\r\n[03:29.56]愿这生生的时光不再枯萎 待花开之时再醉一回\r\n\r\n[03:43.63]愿这生生的时光不再枯萎 再回首浅尝心酒余味\r\n\r\n \r\n\r\n[03:58.14]一壶清酒 一身尘灰\r\n\r\n[04:04.84]一念来回度余生无悔\r\n\r\n[04:11.86]一场春秋 生生灭灭 浮华是非\r\n\r\n[04:18.91]待花开之时再醉一回\r\n\r\n \r\n\r\n[04:26.23]一壶清酒 一身尘灰\r\n\r\n[04:33.09]一念来回度余生无悔\r\n\r\n[04:40.13]一场回忆 生生灭灭 了了心扉\r\n\r\n[04:47.12]再回首浅尝心酒余味\r\n\r\n \r\n\r\n[04:54.34]一场回忆 生生灭灭 了了心扉\r\n\r\n[05:01.39]再回首浅尝心酒余味\r\n[05:08.93]\r\n[05:10.12]监制：付宏声\r\n[05:10.51]和声、弦乐编写：丁培峰\r\n[05:10.99]吉他：王晓松\r\n[05:11.51]贝斯：王晓松\r\n[05:12.10]笛子：赵雪\r\n[05:12.55]弦乐：国际首席爱乐乐团\r\n[05:13.10]和声：高莹 王勖\r\n[05:13.55]录音师：李牧野\r\n[05:13.95]录音棚：CU Music中英音乐\r\n[05:14.35]混音师：李牧野\r\n[05:14.81]混音录音棚：CU Music中英音乐\r\n[05:15.23]音乐制作出品：中英音乐\r\n[05:15.62]音乐发行：智慧大狗x天才联盟\r\n[05:15.95]统筹：张葛 王明宇', '/song/1650475179075不染-毛不易.mp3', 1, '325');
INSERT INTO `song` VALUES (38, 10, '遥远的你', '卑微的我喜欢遥远的你', '2022-04-14 01:22:32', '2022-04-21 01:22:32', '/img/songPic/tubiao.png', '[00:00.100]遥远的你 - 不靠谱组合\r\n[00:00.200]词：王明明&李亚然\r\n[00:00.300]曲：王明明\r\n[00:00.400]编曲：明锐\r\n[00:00.500]制作人：明锐\r\n[00:00.600]混音：廖国钺\r\n[00:00.700]吉他：齐成刚\r\n[00:00.720]和声编写：廖国钺\r\n[00:00.740]和声：不靠谱组合\r\n[00:00.760]监制：张雯杰\r\n[00:00.780]制作公司：Hikoon Music\r\n[00:00.800]发行公司：鲸鱼向海（北京）文化有限公司\r\n[00:00.820]女：\r\n[00:00.830]七月的风 八月的雨\r\n[00:05.500]卑微的我喜欢遥远的你\r\n[00:10.150]你的过去 无法参与\r\n[00:15.890]但我还是 喜欢你\r\n[00:30.590]眼角闪起的泪光\r\n[00:34.790]无边无际地游荡\r\n[00:38.730]眉下的一记荒唐\r\n[00:42.880]庸俗地写在脸上\r\n[00:46.070]男：\r\n[00:47.030]犹如一缕阳光\r\n[00:50.920]但却觉得感伤\r\n[00:55.030]记忆挥散不去\r\n[00:59.250]却藏进了 我的诗句\r\n[01:06.480]合：\r\n[01:06.940]七月的风 八月的雨\r\n[01:10.960]卑微的我喜欢遥远的你\r\n[01:15.000]你还未来 怎敢老去\r\n[01:19.120]未来的我和你奉陪到底\r\n[01:23.000]你若同意 我一定去\r\n[01:27.200]可你并不在意我的出席\r\n[01:30.710]女：\r\n[01:31.340]你的过去 无法参与\r\n[01:34.869]合：\r\n[01:36.259]但我还是\r\n[01:38.820]女：\r\n[01:39.690]喜欢你\r\n[02:03.470]男：\r\n[02:04.340]我有一把钥匙\r\n[02:08.310]能解开你的故事\r\n[02:12.330]单纯的像个孩子\r\n[02:16.440]偏藏进了 我的诗句\r\n[02:23.650]合：\r\n[02:24.260]七月的风 八月的雨\r\n[02:28.240]卑微的我喜欢遥远的你\r\n[02:32.200]你还未来 怎敢老去\r\n[02:36.390]未来的我和你奉陪到底\r\n[02:40.310]你若同意 我一定去\r\n[02:44.570]可你并不在意我的出席\r\n[02:47.900]女：\r\n[02:48.480]你的过去 无法参与\r\n[02:52.160]合：\r\n[02:53.500]但我还是\r\n[02:56.070]女：\r\n[02:57.050]喜欢你\r\n[03:01.500]但我还是 喜欢你', '/song/1650475352432遥远的你-不靠谱组合.mp3', 1, '201');
INSERT INTO `song` VALUES (39, 9, '你算什么男人', '不错哦', '2022-03-20 01:34:24', '2022-04-21 01:34:24', '/img/songPic/tubiao.png', '[00:00.000]算什么男人 - 周杰伦 (Jay Chou)\r\n[00:07.590]词：周杰伦\r\n[00:15.190]曲：周杰伦\r\n[00:22.790]编曲：黄雨勋\r\n[00:30.380]制作人：周杰伦\r\n[00:37.980]亲吻你的手\r\n[00:40.020]还靠着你的头\r\n[00:42.300]让你躺胸口\r\n[00:44.150]那个人已不是我\r\n[00:47.040]这些平常的举动现在叫做难过\r\n[00:52.040]喔 难过\r\n[00:55.890]日子开始过\r\n[00:57.960]我没你照样过\r\n[01:00.350]不会很难受\r\n[01:02.120]我会默默的接受\r\n[01:04.830]反正在一起时你我都有开心过\r\n[01:09.940]就足够\r\n[01:13.810]我的温暖你的冷漠让爱起雾了\r\n[01:18.440]如果爱心画在起雾的窗是模糊\r\n[01:25.100]还是更清楚\r\n[01:29.940]你算什么男人\r\n[01:32.369]算什么男人\r\n[01:34.640]眼睁睁看她走却不闻不问\r\n[01:38.780]是有多天真  就别再硬撑\r\n[01:43.340]期待你挽回你却拱手让人\r\n[01:47.850]你算什么男人\r\n[01:50.250]算什么男人\r\n[01:52.490]还爱着她却不敢叫她再等\r\n[01:56.759]没差 你再继续认份\r\n[01:59.900]她会遇到更好的男人\r\n[02:21.120]亲吻你的手\r\n[02:23.110]还靠着你的头\r\n[02:25.260]让你躺胸口\r\n[02:27.220]那个人已不是我\r\n[02:30.220]这些平常的举动现在叫做难过\r\n[02:35.080]喔 难过\r\n[02:39.000]日子开始过\r\n[02:41.130]我没你照样过\r\n[02:43.430]不会很难受\r\n[02:45.170]我会默默的接受\r\n[02:47.950]反正在一起时你我都有开心过\r\n[02:53.050]就足够\r\n[02:57.010]我的温暖你的冷漠让爱起雾了\r\n[03:01.690]如果爱心画在起雾的窗是模糊\r\n[03:08.570]还是更清楚\r\n[03:13.040]你算什么男人\r\n[03:15.440]算什么男人\r\n[03:17.790]眼睁睁看她走却不闻不问\r\n[03:21.990]是有多天真  就别再硬撑\r\n[03:26.360]期待你挽回你却拱手让人\r\n[03:30.830]你算什么男人\r\n[03:33.430]算什么男人\r\n[03:35.730]还爱着她却不敢叫她再等\r\n[03:39.890]没差 你再继续认份\r\n[03:42.950]她会遇到更好的男人\r\n[03:49.100]你算什么男人\r\n[03:51.280]算什么男人\r\n[03:53.660]眼睁睁看她走却不闻不问\r\n[03:57.840]是有多天真  就别再硬撑\r\n[04:02.350]期待你挽回却拱手让人\r\n[04:06.820]你算什么男人\r\n[04:09.260]算什么男人\r\n[04:11.680]还爱着她却不敢叫她再等\r\n[04:15.760]没差 你再继续认份\r\n[04:18.940]她会遇到更好的男人', '/song/1650476064273算什么男人-周杰伦.mp3', 1, '288');
INSERT INTO `song` VALUES (40, 9, '红色高跟鞋', '怎么去形容你最贴切', '2022-03-20 01:35:21', '2022-04-21 01:35:21', '/img/songPic/tubiao.png', '[00:00.730]红色高跟鞋-蔡健雅\r\n[00:22.260]该怎么去形容你最贴切\r\n[00:27.770]拿什么跟你作比较才算特别\r\n[00:33.190]对你的感觉 强烈\r\n[00:36.010]却又不太了解 只凭直觉\r\n[00:42.010]你像窝在被子里的舒服\r\n[00:47.550]却又像风 琢磨不住\r\n[00:52.660]像手腕 上散发的香水味\r\n[00:58.290]像爱不释手的 红色高跟鞋\r\n[01:16.760]该怎么去形容你最贴切\r\n[01:22.300]拿什么跟你作比较才算特别\r\n[01:27.750]对你的感觉 强烈\r\n[01:30.520]却又不太了解 只凭直觉\r\n[01:36.690]你像窝在被子里的舒服\r\n[01:42.080]却又像风 琢磨不住\r\n[01:47.220]像手纹 像散发的香水味\r\n[01:52.869]像爱不释手的 红色高跟鞋\r\n[02:14.720]你像窝在被子里的舒服\r\n[02:20.270]却又像风 琢磨不住\r\n[02:25.160]像手腕 上散发的香水味\r\n[02:31.060]像爱不释手的\r\n[02:36.150]我爱你有种左灯右行的冲突\r\n[02:42.150]疯狂却怕没有退路\r\n[02:47.090]你能否让我停止这种追逐\r\n[02:53.590]就这么双 最后唯一的 红色高跟鞋', '/song/1650476121475红色高跟鞋-蔡健雅.mp3', 1, '206');
INSERT INTO `song` VALUES (41, 5, '云烟成雨', '多想再见你，哪怕匆匆一眼就别离', '2022-03-18 01:40:27', '2022-04-21 01:40:27', '/img/songPic/tubiao.png', '[00:00.600]云烟成雨(?歌手) - 房东的猫\r\n[00:14.880]你的晚安是下意识的恻隐\r\n[00:21.350]我留至夜深治疗失眠梦呓\r\n[00:27.540]那封手写信留在行李箱底\r\n[00:34.300]来不及赋予它旅途的意义\r\n[00:39.810]若一切都已云烟成雨\r\n[00:46.160]我能否变成淤泥\r\n[00:48.900]再一次沾染你\r\n[00:52.210]若生命如过场电影\r\n[00:57.530]Oh 让我再一次甜梦里惊醒\r\n[01:09.490]我多想再见你\r\n[01:11.390]哪怕匆匆一眼就别离\r\n[01:15.490]路灯下昏黄的剪影\r\n[01:18.460]越走越漫长的林径\r\n[01:21.690]我多想再见你\r\n[01:23.940]至少玩笑话还能说起\r\n[01:27.710]街巷初次落叶的秋分\r\n[01:30.900]渐行渐远去的我们\r\n[01:48.850]若一切都已云烟成雨\r\n[01:54.250]我能否变成淤泥\r\n[01:57.290]再一次沾染你\r\n[02:00.820]若生命如过场电影\r\n[02:05.930]Oh 让我再一次甜梦里惊醒\r\n[02:14.620]我多想再见你\r\n[02:16.650]哪怕匆匆一眼就别离\r\n[02:20.840]路灯下昏黄的剪影\r\n[02:23.720]越走越漫长的林径\r\n[02:26.950]我多想再见你\r\n[02:29.560]至少玩笑话还能说起\r\n[02:33.010]街巷初次落叶的秋分\r\n[02:36.170]渐行渐远去的我们\r\n[02:44.760]站台汽笛响起\r\n[02:47.150]想念是你的声音\r\n[02:50.190]我们提着过去走入人群\r\n[02:56.510]寻找着一个位置安放自己\r\n[03:08.300]我多想再见你\r\n[03:10.120]哪怕匆匆一眼就别离', '/song/1650476426875云烟成雨(_歌手)-房东的猫.mp3', 1, '212');
INSERT INTO `song` VALUES (42, 5, '空城 + 破茧 + 烟火里的尘埃 + 即刻出发 + 一笑倾城 + 伎俩', '', '2022-03-17 01:42:33', '2022-04-21 01:42:33', '/img/songPic/tubiao.png', '[00:00.000]空城 + 破茧 + 烟火里的尘埃 + 即刻出发 + 一笑倾城 + 伎俩 (Live) - 宋亚轩\r\n[00:06.590]这城市那么空 这回忆那么凶\r\n[00:14.960]这街道车水马龙 我能和谁相拥\r\n[00:23.090]这眉头那么重 这思念那么浓\r\n[00:31.110]Alone alone\r\n[00:35.630]这感觉我跟从\r\n[00:40.480]抬头 乱与战不休\r\n[00:44.400]回首 你在我左右\r\n[00:47.700]击溃 命运的诅咒\r\n[00:53.360]也不曾退后\r\n[00:57.070]只有我守着安静的沙漠\r\n[01:02.960]竟然会感慨\r\n[01:12.260]即刻出发\r\n[01:14.400]当我唱起这首歌\r\n[01:17.680]感伤快乐 都将为你 找到出口\r\n[01:26.140]毫不保留\r\n[01:28.800]这世界总有人在忙忙碌碌寻宝藏\r\n[01:33.380]却误了浮世骄阳\r\n[01:36.190]也错过人间万象\r\n[01:41.530]大哥你玩摇滚\r\n[01:44.790]你玩他有啥用啊', '/song/1650476553797空城 + 破茧 + 烟火里的尘埃 + 即刻出发 + 一笑倾城 + 伎俩 (Live)-宋亚轩.mp3', 1, '113');
INSERT INTO `song` VALUES (43, 5, '小星星', '每个人的心里都有一颗小星星', '2022-03-16 01:47:41', '2022-04-21 01:47:41', '/img/songPic/tubiao.png', '[00:16.645]承认不勇敢\r\n[00:19.768]你能不能别离开\r\n[00:23.562]很多爱不能重来\r\n[00:26.995]我应该释怀\r\n[00:30.529]在街头徘徊\r\n[00:33.545]下雨时为你撑伞\r\n[00:37.369]对你的爱成阻碍\r\n[00:40.931]祝福你愉快\r\n[00:44.699]窗外的天气\r\n[00:47.735]像你心忐忑不定\r\n[00:51.354]如果这是结局\r\n[00:53.437]我希望你是真的满意\r\n[00:58.941](希望你能听我)\r\n[01:00.737]你 就是我的小星星\r\n[01:04.016]挂 在那天上放光明\r\n[01:07.352]我已经决定要爱你\r\n[01:11.061]就不会轻易放弃\r\n[01:11.991](希望你能听我)\r\n[01:14.769]海 上流浪的许愿瓶\r\n[01:18.075]每 个心愿都是为你\r\n[01:21.394]就算不能够在一起\r\n[01:25.170]我还是为你担心\r\n[01:41.897]wo~窗外的天气\r\n[01:45.906]像你心忐忑不定\r\n[01:49.425]如果这是结局\r\n[01:52.047]我希望你是真的满意\r\n[01:57.126](希望你能听我)\r\n[01:58.908]你 就是我的小星星\r\n[02:02.183]挂 在那天上放光明\r\n[02:05.325]我已经决定要爱你\r\n[02:09.224]就不会轻易放弃\r\n[02:12.858]海 上流浪的许愿瓶\r\n[02:16.318]每 个心愿都是为你\r\n[02:19.984]就算不能够在一起\r\n[02:23.451]我还是为你担心\r\n[02:28.732]把 悲伤写成协奏曲\r\n[02:32.160]在 角落里为你弹琴\r\n[02:35.364]就算你可能听不清\r\n[02:39.331]也代表我的心意\r\n[02:41.950]也代表我的心\r\n[02:42.884]爱 不一定要很甜蜜\r\n[02:46.286]说 山盟海誓的言语\r\n[02:49.485]只要那幸福在心底\r\n[02:53.351]哪怕我一人演戏\r\n[03:02.215]其实每个人的心里都有一颗小星星', '/song/1650476861966小星星-汪苏泷.mp3', 1, '196');
INSERT INTO `song` VALUES (44, 6, '感谢你曾经来过', '感谢您曾经来过就算是个过客', '2022-04-13 01:55:34', '2022-04-21 01:55:34', '/img/songPic/tubiao.png', '[by:苦苦可乐]\r\n[00:00.000]作曲 : 无\r\n[00:01.000]作词 : 无\r\n[00:12.02]你最近过得还好吗 故事里的那个她\r\n[00:14.82]海南的冬天没有雪 但不影响它开着花\r\n[00:17.82]自从你走后 我回到了那个没有你的家\r\n[00:20.92]就是在这个地方 我说我要娶了她\r\n[00:23.62]你是我这一辈子 最最难忘的关卡\r\n[00:27.07]我抱着吉他 被暴雨淋伤\r\n[00:29.90]到你家楼下 为你四处游荡\r\n[00:32.85]做了一个只会歌唱的傻瓜\r\n[00:36.47]你才不是一个没人要的女同学\r\n[00:41.90]谁会不厌其烦地安慰那无知的少年\r\n[00:47.92]我走进了你的世界 别怪我太耀眼\r\n[00:51.07]愿意用十年奋斗 换你一小时的笑脸\r\n[00:54.15]你当时特别的可爱 但能不能靠近点\r\n[00:56.80]你不说真心话 你让我怎么为你大冒险\r\n[01:01.00]曾经的照片还留在那个房间\r\n[01:06.10]曾经的一切还印在我心里面\r\n[01:11.95]感谢你曾经来过\r\n[01:14.92]就算你是个过客\r\n[01:17.92]我也无法割舍不得\r\n[01:24.60]我说的每句话你都已听不见\r\n[01:30.70]回忆的一幕幕不断的在浮现\r\n[01:35.85]不后悔曾经爱过\r\n[01:39.22]哭过痛过都值得\r\n[01:42.02]如果难过也不要忘了我\r\n[01:47.42]忘了我\r\n[01:50.25]\r\n[01:51.12]人总是学着孤独试着慢慢去长大\r\n[01:53.87]遗憾就遗憾吧 当你都重新回到这\r\n[01:56.85]你送我的我都不要了 我希望你也会笑着\r\n[02:00.02]走过去前面的路口 以后 我们的故事就到这\r\n[02:03.05]你干嘛不讲话\r\n[02:04.97]我希望你过得更好 也不会又放不下\r\n[02:08.02]别继续看着我 你确实应该听你爸\r\n[02:10.55]只有看着你的背影 我才能说出这心里话\r\n[02:15.17]曾经的照片还留在那个房间\r\n[02:21.35]曾经的一切还印在我心里面\r\n[02:27.02]感谢你曾经来过\r\n[02:29.65]就算你是个过客\r\n[02:32.97]我也无法割舍不得\r\n[02:39.37]我说的每句话你都已听不见\r\n[02:45.32]回忆的一幕幕不断地在浮现\r\n[02:50.97]不后悔曾经爱过\r\n[02:53.92]哭过痛过都值得\r\n[02:56.97]如果难过也不要忘了我\r\n[03:02.30]忘了我\r\n[03:06.17]\r\n[03:14.95]感谢你曾经来过\r\n[03:17.97]就算你是个过客\r\n[03:20.97]我也无法割舍不得\r\n[03:27.30]我说的每句话你都已听不见\r\n[03:33.37]回忆的一幕幕不断地在浮现\r\n[03:38.65]不后悔曾经爱过\r\n[03:42.02]哭过痛过都值得\r\n[03:44.97]如果难过也不要忘了我\r\n[03:50.22]忘了我', '/song/1650477334782感谢你曾经来过-小阿颜.mp3', 1, '237');
INSERT INTO `song` VALUES (45, 6, '起风了', '我曾难自拔于世界之大', '2022-02-15 01:58:17', '2022-02-15 01:58:17', '/img/songPic/16505124896156d9ec8f8d543f7f0f08053e9d0c799ff.jpeg', '[00:05.520]\r\n[00:06.820]我曾将青春翻涌成她\r\n[00:10.460]也曾指尖弹出盛夏\r\n[00:13.728]心之所动 且就随缘去吧\r\n[00:20.729]\r\n[00:44.996]这一路上走走停停\r\n[00:48.215]顺着少年漂流的痕迹\r\n[00:51.443]迈出车站的前一刻\r\n[00:54.743]竟有些犹豫\r\n[00:57.346]\r\n[00:57.975]不禁笑这近乡情怯\r\n[01:01.181]仍无可避免\r\n[01:03.723]而长野的天\r\n[01:05.296]依旧那么暖\r\n[01:06.905]风吹起了从前\r\n[01:09.310]\r\n[01:09.506]从前初识这世间\r\n[01:12.372]万般流连\r\n[01:14.123]看着天边似在眼前\r\n[01:17.225]也甘愿赴汤蹈火去走它一遍\r\n[01:21.882]\r\n[01:22.103]如今走过这世间\r\n[01:25.357]万般流连\r\n[01:27.128]翻过岁月不同侧脸\r\n[01:29.940]措不及防闯入你的笑颜\r\n[01:35.522]\r\n[01:36.023]我曾难自拔于世界之大\r\n[01:40.130]也沉溺于其中梦话\r\n[01:43.387]不得真假 不做挣扎 不惧笑话\r\n[01:48.996]\r\n[01:49.213]我曾将青春翻涌成她\r\n[01:52.426]也曾指尖弹出盛夏\r\n[01:55.764]心之所动 且就随缘去吧\r\n[02:01.922]逆着光行走 任风吹雨打\r\n[02:08.622]\r\n[02:18.958]短短的路走走停停\r\n[02:22.143]也有了几分的距离\r\n[02:25.376]不知抚摸的是故事 还是段心情\r\n[02:31.837]也许期待的不过是 与时间为敌\r\n\r\n[02:37.707]再次看到你\r\n[02:39.273]微凉晨光里\r\n[02:40.959]笑得很甜蜜\r\n[02:43.013]\r\n[02:43.304]从前初识这世间\r\n[02:46.403]万般流连\r\n[02:48.109]看着天边似在眼前\r\n[02:51.230]也甘愿赴汤蹈火去走它一遍\r\n[02:56.213]\r\n[02:56.391]如今走过这世间\r\n[02:59.447]万般流连\r\n[03:00.989]翻过岁月不同侧脸\r\n[03:04.024]措不及防闯入你的笑颜\r\n[03:12.872]\r\n[03:13.469]我曾难自拔于世界之大\r\n[03:17.271]也沉溺于其中梦话\r\n[03:20.547]不得真假 不做挣扎 不惧笑话\r\n[03:26.320]\r\n[03:26.532]我曾将青春翻涌成她\r\n[03:30.112]也曾指尖弹出盛夏\r\n[03:33.160]心之所动 且就随缘去吧\r\n[03:39.029]\r\n[03:41.138]晚风吹起你鬓间的白发\r\n[03:44.814]抚平回忆留下的疤\r\n[03:48.139]你的眼中 明暗交杂 一笑生花\r\n[03:55.224]\r\n[03:55.864]我仍感叹于世界之大\r\n[03:59.111]也沉醉于儿时情话\r\n[04:02.250]不剩真假 不做挣扎 无谓笑话\r\n[04:08.541]我终将青春还给了她\r\n[04:11.917]连同指尖弹出的盛夏\r\n[04:15.655]心之所动 就随风去了\r\n[04:21.462]以爱之名 你还愿意吗', '/song/1650477497577起风了-吴青峰.mp3', 1, '313');
INSERT INTO `song` VALUES (46, 8, '阿刁', '', '2022-03-08 11:57:20', '2022-04-21 11:57:20', '/img/songPic/tubiao.png', '[00:00.000]作曲 : 赵雷\r\n[00:01.000]作词 : 赵雷\r\n[00:20.180]编曲：赵雷 / 喜子\r\n[00:21.800]制作人：赵雷 / 喜子 / 姜北生\r\n[00:23.270]贝斯：张岭\r\n[00:24.720]鼓：贝贝\r\n[00:25.630]电琴：喜子\r\n[00:26.660]箱琴：赵雷\r\n[00:27.480]MIDI：喜子 / 赵雷\r\n[00:28.430]童声：朵儿\r\n[00:29.660]和声：赵雷 / 旭东\r\n[00:47.910]阿刁 住在西藏的某个地方\r\n[00:56.760]秃鹫一样 栖息在山顶上\r\n[01:06.890]阿刁 大昭寺门前铺满阳光\r\n[01:15.680]打一壶甜茶 我们聊着过往\r\n[01:45.430]阿刁 你总把自己打扮的像\r\n[01:54.160]男孩子一样 可比格桑还顽强\r\n[02:04.320]阿刁 狡猾的人有千百种笑\r\n[02:13.370]你何时下山 记得带上卓玛刀\r\n[02:22.990]灰色帽檐下 凹陷的脸颊\r\n[02:27.600]你很少说话 简单的回答\r\n[02:32.410]明天在哪里 谁会在意你\r\n[02:37.180]即使死在路上格桑 妮可 阿七 石榴 东措 大冰 安子 浮游 赵雷 三文鱼 浩子 小友 卓玛 阿达 彬子 回锅肉\r\n[03:21.350]阿刁 明天是否能吃顿饱饭\r\n[03:30.460]你已习惯 饥饿是一种信仰\r\n[03:40.530]阿刁 不会被现实磨平棱角\r\n[03:49.380]你不是这世界的人 没必要在乎真相\r\n[03:59.260]命运多舛 痴迷 淡然\r\n[04:03.590]挥别了青春 数不尽的车站\r\n[04:08.350]甘于平凡却不甘平凡的腐烂\r\n[04:13.260]你是阿刁 你是自由的鸟\r\n[04:37.270]灰色帽檐下 凹陷的脸颊\r\n[04:41.840]你很少说话 简单的回答\r\n[04:46.570]明天在哪里 谁会在意你\r\n[04:51.460]即使死在路上\r\n[04:56.300]命运多舛 痴迷 淡然\r\n[05:00.930]挥别了青春 数不尽的车站\r\n[05:05.750]甘于平凡却不甘平凡的腐烂\r\n[05:10.610]你是阿刁\r\n[05:45.320]阿刁 爱情是粒悲伤的种子\r\n[05:53.750]你是一棵树 你永远都不会枯', '/song/1650513440448阿刁-赵雷.mp3', 1, '374');
INSERT INTO `song` VALUES (47, 8, '成都', '和我在成都的街头走一走', '2022-04-13 11:59:25', '2022-04-21 11:59:25', '/img/songPic/tubiao.png', '[00:05.409]\r\n[00:18.744]让我掉下眼泪的\r\n[00:22.138]不止昨夜的酒\r\n[00:26.187]让我依依不舍的\r\n[00:30.218]不止你的温柔\r\n[00:34.185]余路还要走多久\r\n[00:38.218]你攥着我的手\r\n[00:42.176]让我感到为难的\r\n[00:45.984]是挣扎的自由\r\n[00:52.186]分别总是在九月\r\n[00:55.935]回忆是思念的愁\r\n[00:59.878]深秋嫩绿的垂柳\r\n[01:03.802]亲吻着我额头\r\n[01:07.696]在那座阴雨的小城里\r\n[01:11.835]我从未忘记你\r\n[01:15.877]成都 带不走的 只有你\r\n[01:23.740]和我在成都的街头走一走\r\n[01:31.721]直到所有的灯都熄灭了也不停留\r\n[01:39.451]你会挽着我的衣袖\r\n[01:43.392]我会把手揣进裤兜\r\n[01:47.297]走到玉林路的尽头\r\n[01:51.364]坐在小酒馆的门口\r\n[02:31.189]分别总是在九月\r\n[02:34.726]回忆是思念的愁\r\n[02:38.523]深秋嫩绿的垂柳\r\n[02:42.552]亲吻着我额头\r\n[02:46.530]在那座阴雨的小城里\r\n[02:50.650]我从未忘记你\r\n[02:54.459]成都 带不走的 只有你\r\n[03:02.260]和我在成都的街头走一走\r\n[03:10.433]直到所有的灯都熄灭了也不停留\r\n[03:18.294]你会挽着我的衣袖\r\n[03:22.022]我会把手揣进裤兜\r\n[03:26.142]走到玉林路的尽头\r\n[03:30.164]坐在小酒馆的门口\r\n[03:38.409]和我在成都的街头走一走\r\n[03:46.065]直到所有的灯都熄灭了也不停留\r\n[03:54.019]和我在成都的街头走一走\r\n[04:01.809]直到所有的灯都熄灭了也不停留\r\n[04:09.659]你会挽着我的衣袖\r\n[04:13.564]我会把手揣进裤兜\r\n[04:17.530]走到玉林路的尽头\r\n[04:21.581]走过小酒馆的门口\r\n[04:36.177]和我在成都的街头走一走\r\n[04:43.454]直到所有的灯都熄灭了也不停留\r\n[04:53.227]', '/song/1650513565482成都-赵雷.mp3', 1, '328');
INSERT INTO `song` VALUES (48, 8, '理想', '理想今年你几岁。。。', '2022-03-10 12:02:13', '2022-04-21 12:02:13', '/img/songPic/tubiao.png', '[00:35.170]一个人住在这城市\r\n[00:38.310]为了填饱肚子就已精疲力尽\r\n[00:42.690]还谈什么理想\r\n[00:45.670]那是我们的美梦\r\n[00:49.250]\r\n[00:52.030]梦醒后 还是依然奔波在风雨的街头\r\n[00:59.100]有时候想哭就把泪 咽进一腔热血的胸口\r\n[01:06.730]\r\n[01:08.940]公车上我睡过了车站\r\n[01:17.410]一路上我望着霓虹的北京\r\n[01:25.830]我的理想把我丢在这个拥挤的人潮\r\n[01:32.740]车窗外已经是一片白雪茫茫\r\n[01:40.110]\r\n[01:40.710]又一个四季在轮回\r\n[01:44.450]而我一无所获的坐在街头\r\n[01:49.430]只有理想在支撑着那些麻木的血肉\r\n[01:57.180]\r\n[01:57.260]理想今年你几岁\r\n[02:01.690]你总是诱惑着年轻的朋友\r\n[02:06.560]你总是谢了又开 给我惊喜\r\n[02:10.220]又让我沉入失望的生活里\r\n[02:16.380]\r\n[02:56.190]公车上我睡过了车站\r\n[03:04.600]一路上我望着霓虹的北京\r\n[03:13.080]我的理想把我丢在这个拥挤的人潮\r\n[03:20.160]车窗外已经是一片白雪茫茫\r\n[03:27.790]\r\n[03:28.350]又一个四季在轮回\r\n[03:31.910]而我一无所获的坐在街头\r\n[03:36.750]只有理想在支撑着那些麻木的血肉\r\n[03:44.260]\r\n[03:44.540]理想今年你几岁\r\n[03:49.120]你总是诱惑着年轻的朋友\r\n[03:53.870]你总是谢了又开 给我惊喜\r\n[03:57.610]又让我沉入失望的生活里\r\n[04:01.660]\r\n[04:01.940]又一个年代在变换\r\n[04:05.690]我已不是无悔的那个青年\r\n[04:10.200]青春被时光抛弃\r\n[04:13.830]已是当父亲的年纪\r\n[04:17.670]\r\n[04:18.370]理想永远都年轻\r\n[04:22.970]你让我倔强地反抗着命运\r\n[04:27.590]你让我变得苍白\r\n[04:29.670]却依然天真的相信花儿会再次的盛开\r\n[04:40.730]\r\n[04:48.020]阳光之中 到处可见奔忙的人们\r\n[04:56.120]被拥挤着 被一晃而飞的光阴忽略过', '/song/1650513733145理想-赵雷.mp3', 1, '313');
INSERT INTO `song` VALUES (49, 4, '风吹一夏', '一整个夏天所有和你的画面', '2022-04-12 12:17:01', '2022-04-21 12:17:01', '/img/songPic/tubiao.png', '[00:07.761]风吹过我的头发\r\n[00:10.863]淋着雨我就站在你家楼下\r\n[00:15.323]迫不及待地拨通你的电话\r\n[00:20.080]一整个夏天所有和你的画面\r\n[00:23.730]\r\n[00:25.523]好美丽随意是你是我的唯一\r\n[00:29.857]不经意回忆想起恋爱的轨迹\r\n[00:34.243]对不起何必忘记放在我嘴里\r\n[00:38.432]无法呼吸在此刻空气也变得炙热\r\n[00:43.182]快靠近一点阳光很刺眼\r\n[00:47.350]就算很快会消失的欺骗\r\n[00:51.591]这一段感情无法去避免\r\n[00:55.779]让我好带你去历险\r\n\r\n[00:59.326]定格在这瞬间\r\n[01:03.896]我生活你主演\r\n[01:08.289]等着你的出现\r\n[01:12.556]我对你爱爱爱不完\r\n[01:16.702]\r\n[01:16.941]风吹过我的头发\r\n[01:20.158]淋着雨我就站在你家楼下\r\n[01:24.475]迫不及待地拨通你的电话\r\n[01:29.286]一整个夏天所有和你的画面\r\n[01:32.928]\r\n[01:34.724]一起拍很多照片\r\n[01:36.756]你是全场的焦点\r\n[01:38.844]月色因你而耀眼\r\n[01:40.517]你轻轻踮起脚尖\r\n[01:43.487]一起拍很多照片\r\n[01:45.118]你是全场的焦点\r\n[01:47.151]月色因你而耀眼\r\n[01:49.317]你轻轻踮起脚尖\r\n[01:52.604]\r\n[02:08.670]风吹过我的头发\r\n[02:12.037]淋着雨我就站在你家楼下\r\n[02:16.236]迫不及待地拨通你的电话\r\n[02:21.186]一整个夏天所有和你的画面\r\n[02:24.740]\r\n[02:26.116]定格在这瞬间\r\n[02:30.501]我生活你主演\r\n[02:34.691]等着你的出现\r\n[02:39.066]我对你爱爱爱不完\r\n[02:43.118]\r\n[02:43.423]风吹过我的头发\r\n[02:46.609]淋着雨我就站在你家楼下\r\n[02:50.822]迫不及待地拨通你的电话\r\n[02:55.849]一整个夏天所有和你的画面\r\n[03:17.368][02:59.667]\r\n[03:01.248]一起拍很多照片\r\n[03:05.550]你是全场的焦点\r\n[03:09.678]月色因你而耀眼\r\n[03:13.768]你轻轻踮起脚尖', '/song/1650514621132风吹一夏-DP龙猪、Swei水、Rays陈袁.mp3', 1, '198');
INSERT INTO `song` VALUES (50, 4, '理想三旬', '就歌唱吧', '2022-02-18 12:19:39', '2022-04-21 12:19:39', '/img/songPic/tubiao.png', '[00:00.340]混音：马雨阳\r\n[00:01.340]雨后有车驶来\r\n[00:03.510]驶过暮色苍白\r\n[00:06.090]旧铁皮往南开 恋人已不在\r\n[00:10.890]收听浓烟下的 诗歌电台\r\n[00:15.700]不动情的咳嗽 至少看起来\r\n[00:20.420]归途也还可爱\r\n[00:22.870]琴弦少了姿态\r\n[00:25.160]再不见那夜里 听歌的小孩\r\n[00:30.170]时光匆匆独白\r\n[00:32.380]将颠沛磨成卡带\r\n[00:34.810]已枯卷的情怀 踏碎成年代\r\n[00:39.970]\r\n[00:49.170]就老去吧 孤独别醒来\r\n[00:54.650]\r\n[00:55.310]你渴望的离开\r\n[00:59.540]只是无处停摆\r\n[01:03.700]就歌唱吧 眼睛眯起来\r\n[01:09.858]而热泪的崩坏\r\n[01:14.218]只是没抵达的存在\r\n[01:18.650]\r\n[01:37.090]青春又醉倒在\r\n[01:39.840]籍籍无名的怀\r\n[01:42.200]靠嬉笑来虚度 聚散得慷慨\r\n[01:46.989]辗转却去不到 对的站台\r\n[01:51.890]如果漂泊是成长 必经的路牌\r\n[01:56.530]你迷醒岁月中\r\n[01:58.840]那贫瘠的未来\r\n[02:01.418]像遗憾季节里 未结果的爱\r\n[02:05.808]弄脏了每一页诗\r\n[02:08.310]吻最疼痛的告白\r\n[02:10.859]而风声吹到这 已不需要释怀\r\n[02:15.718]就老去吧 孤独别醒来\r\n[02:20.598]\r\n[02:21.869]你渴望的离开\r\n[02:26.000]只是无处停摆\r\n[02:30.138]就歌唱吧 眼睛眯起来\r\n[02:36.000]而热泪的崩坏\r\n[02:40.220]只是没抵达的存在\r\n[02:47.239]\r\n[03:06.019]就甜蜜地忍耐\r\n[03:08.459]繁星润湿窗台\r\n[03:10.878]光影跳动着像在 困倦里说爱\r\n[03:15.679]再无谓的感慨\r\n[03:18.348]以为明白\r\n[03:20.418]梦倒塌的地方 今已爬满青苔', '/song/1650514779943理想三旬-陈鸿宇.mp3', 1, '210');
INSERT INTO `song` VALUES (51, 4, '不将就', '不将就', '2022-02-15 14:37:28', '2022-04-21 14:37:28', '/img/songPic/tubiao.png', '[00:13.54]那时候 我以为爱的是生活\r\n[00:19.55]也算懂得 什么适合什么不可\r\n[00:26.24]最近还是一样努力着\r\n[00:29.76]配合你的性格\r\n[00:32.81]你的追求者 你的坎坷\r\n[00:36.27]我开的车\r\n[00:39.53]算一算 虚度了多少个年头\r\n[00:46.30]仿佛足够写一套错爱的春秋\r\n[00:52.50]如果以后 你还想为谁\r\n[00:56.47]浪费美好时候\r\n[00:59.48]眼泪只能在我的胸膛\r\n[01:03.21]毫无保留\r\n[01:09.63]互相折磨到白头\r\n[01:16.59]悲伤坚决不放手\r\n[01:23.16]开始纠缠之后\r\n[01:28.33]才又被人放大了自由\r\n[01:36.67]你的暴烈太温柔\r\n[01:43.17]感情又痛又享受\r\n[01:49.88]如果我说不吻你不罢休\r\n[01:56.07]谁能逼我将就\r\n[02:06.89]你问我 为什么顽固而专一\r\n[02:12.98]天下太大 总有人比你更合适\r\n[02:19.44]其实我觉得这样不值\r\n[02:23.01]可没选择方式\r\n[02:26.16]你一出场别人都显得不过如此\r\n[02:34.65]互相折磨到白头\r\n[02:41.54]悲伤坚决不放手\r\n[02:48.20]开始纠缠之后\r\n[02:53.38]才又被人放大了自由\r\n[03:01.58]你的暴烈太温柔\r\n[03:08.19]感情又痛又享受\r\n[03:14.89]如果我说不吻你不罢休\r\n[03:21.05]谁能逼我将就\r\n[03:48.46]不吻你不罢休\r\n[03:51.65]谁能逼我将就\r\n[03:58.53]互相折磨到白头\r\n[04:04.87]悲伤坚决不放手\r\n[04:11.39]开始纠缠之后\r\n[04:16.85]才又被人放大了自由\r\n[04:24.88]你的暴烈太温柔\r\n[04:31.66]感情又痛又享受\r\n[04:38.26]如果我说不吻你不罢休\r\n[04:44.29]谁能逼我将就\r\n[04:50.92]他们不过将就\r\n[04:57.91]', '/song/1650523048140不将就-李荣浩.mp3', 1, '313');

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '歌单id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌单标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单图片',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '歌单简介',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '歌单发布时间',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (1, '重温粤语经典', '/img/songListPic/1646840498984tx.jpg', '12', '粤语', '2022-03-10 00:04:43', 1);
INSERT INTO `song_list` VALUES (2, '老歌新唱', '/img/songListPic/1650565752781c75cad8cbc87e8eac731bccdac1966b9.jpeg', '22', '怀旧', '2022-03-10 00:04:57', 1);
INSERT INTO `song_list` VALUES (3, '催泪情歌', '/img/songListPic/1650565744348ddf1f65f90dce4ae699261d05e9eafe0.jpeg', '光线暗下来的黄昏\n即将消失的傍晚\n你的身影出现在和弦切换的眨眼之间\n\n餐厅里熟悉的座位\n一起挤过的拥挤车厢\n你的笑声回荡在词曲交织的呢喃里\n\n记忆中的画面日渐模糊\n回忆中的甜蜜越发苦涩\n人群吞没所有情绪\n当歌声响起\n是疗愈你心放下过往，\n还是伤你至深越发沉沦？', '伤感', '2022-03-10 00:05:01', 1);
INSERT INTO `song_list` VALUES (4, '怀旧歌集', '/img/songListPic/1650565731512a6dcdb919636a8dd861887a3e966bf32.jpeg', '怀旧', '怀旧', '2022-03-10 00:05:04', 1);
INSERT INTO `song_list` VALUES (5, '怀旧歌集', '/img/songListPic/16505659049907cfe2243f7556e4ad4fec9bc1a7a68da.jpeg', '怀旧', '怀旧', '2022-03-10 00:05:08', 1);
INSERT INTO `song_list` VALUES (6, '得到', '/img/songListPic/1650565718817ddf1f65f90dce4ae699261d05e9eafe0.jpeg', 'undefined', '', '2022-03-10 00:05:10', 1);
INSERT INTO `song_list` VALUES (7, '我多想能陪你一场', '/img/songListPic/16505657066364168b80e93c3dbe02c423c6d8a8fbb70.jpeg', '得到', '', '2022-03-10 00:05:12', 1);
INSERT INTO `song_list` VALUES (8, '催泪瞬间', '/img/songListPic/1648741491600ba14217c28801c0f9135924b35299618.jpeg', '多少个日日夜夜被摧毁，遍体鳞伤的心还可以爱谁！！！', '伤感', '2022-03-31 23:13:58', 1);
INSERT INTO `song_list` VALUES (9, '得到的', '/img/songListPic/16505658948366f5dd579fb125992be2d59d49454b451.jpeg', '得不到的', '怀旧', '2022-03-10 00:05:36', 1);
INSERT INTO `song_list` VALUES (10, '轻松一夏', '/img/songListPic/1650565889461a5afaf7ad2f985f0504e3467c905a56b.jpeg', '放轻松点', '励志', '2022-03-15 00:04:29', 1);
INSERT INTO `song_list` VALUES (11, '在留声机里的独家记忆', '/img/songListPic/165056568228644f74fe8a12610a24b6d25aec72b5c5f.jpeg', '每个人的记忆里都有那么一首值得被称为经典的歌', '粤语', '2022-03-15 00:04:53', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `sex` tinyint(255) NULL DEFAULT NULL COMMENT '性别(0:女，1:男)',
  `phone_num` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `birth` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地',
  `avator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `identity` tinyint(255) NULL DEFAULT NULL COMMENT '身份（0：普通用户，1：管理员）',
  `state` tinyint(255) NULL DEFAULT NULL COMMENT '状态（0：已删除，1：存在）',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `phone_num_unique`(`phone_num`) USING BTREE,
  UNIQUE INDEX `email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '黄宇康', '321', 1, '17875911489', '2506173954@qq.com', '1999-05-21 00:00:00', 'kk永远的神', '0,0,0', '/avatorImages/1650104137494R-C.jpg', '2022-02-06 23:22:33', '2022-04-16 18:15:37', '岭南师范学院', 0, 1);
INSERT INTO `user` VALUES (3, 'witcon1', '12', 1, '13719938731', '12@qq.com', '2022-02-01 00:00:00', 'kk', '0,0,0', '/avatorImages/1646746035788tx.jpg', '2022-02-06 23:29:55', '2022-03-27 20:59:47', '岭师', 1, 1);
INSERT INTO `user` VALUES (4, '米康', '5201314', 1, '17812876509', '2506173953@qq.com', '2022-02-01 00:00:00', '帅就完事', '0,0,0', '/avatorImages/16505289943191c85cd1f4515a27fc622acb7fbfaa0ad.jpeg', '2022-02-13 23:30:08', '2022-04-21 16:16:34', '岭师', 0, 1);
INSERT INTO `user` VALUES (5, '拉拉', 'dsf', 1, '17838911389', '23232@qq.com', '2022-02-15 00:00:00', 'ddf', '0,0,0', '/avatorImages/165052896201712b2caa4dc5e80fb4a8b54e1682c85d9.jpeg', '2022-02-14 00:11:01', '2022-04-21 16:16:02', '', 0, 1);
INSERT INTO `user` VALUES (6, '一只羊', 'yzy', 0, '13718934511', 'Java0130@neusoft.com', '2022-02-08 00:00:00', '没有', '0,0,0', '/avatorImages/165052897294100e3b8d730d73c653a42a584fa005982.jpeg', '2022-02-25 00:57:06', '2022-04-21 16:16:12', '广东海洋大学', 0, 1);
INSERT INTO `user` VALUES (7, 'Lucy', 'lucy', 0, '13623828388', 'Java0130@neoft.com', '2022-03-12 00:00:00', 'kgk', '0,0,0', '/img/user.jpg', '2022-03-16 16:08:29', '2022-04-21 14:38:25', '广东海洋大学', 1, 1);
INSERT INTO `user` VALUES (8, 'kkk', '123', 1, '13711198632', '2506173953123@qq.com', '2022-03-31 00:00:00', '', '0,0,0', '/avatorImages/1650528982414512af5637c660e7c4ce456fc0f3ffe81.jpeg', '2022-03-14 23:00:32', '2022-04-21 16:16:22', '', 0, 1);
INSERT INTO `user` VALUES (9, '小米康', '123456', 1, '17888833139', '25061753@qq.com', '2022-03-27 00:00:00', '', '0,0,0', '/avatorImages/1650528950578e34f888d951c0b58a18b6c08d8db25ef.jpeg', '2022-03-27 21:05:51', '2022-04-21 16:15:50', '岭南师范学院', 0, 1);
INSERT INTO `user` VALUES (10, '苏日锐', '12', 1, '13689752911', '1234@qq.com', '2022-02-01 00:00:00', 'the first su', '18,19,1', '/avatorImages/1650474512483ba14217c28801c0f9135924b35299618.jpeg', '2022-04-04 20:59:58', '2022-04-21 01:08:32', '岭南师范学院', 1, 1);
INSERT INTO `user` VALUES (11, '马晓华', '123', 1, '13790826893', '12345@qq.com', '2022-04-04 00:00:00', '车陂歌神', '18,0,3', '/avatorImages/165053754998448bb823ab109be252ac461c751980ee6.jpeg', '2022-04-04 21:07:35', '2022-04-21 18:39:10', '', 0, 1);
INSERT INTO `user` VALUES (12, '叶学斌', '12', 0, '17875911299', '123456@qq.com', '2022-04-07 19:49:57', '', '', '/avatorImages/16505289321255634ca7987c6d2330a194086782e5888.jpeg', '2022-04-07 19:49:57', '2022-04-21 16:15:32', '岭南师范学院', 0, 1);
INSERT INTO `user` VALUES (13, '庄海富', '123', 1, '17872944018', '2506173959@qq.com', '2022-04-08 00:00:00', '', '18,1,2', '/avatorImages/164940542420950d88b6ece232da9cfd38c03e3b9bcf5.jpeg', '2022-04-08 11:47:16', '2022-04-09 18:29:20', '', 0, 1);

-- ----------------------------
-- Table structure for user_notice
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` int(11) NOT NULL COMMENT '公告id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `isread` tinyint(4) NOT NULL COMMENT '是否已读公告',
  `state` tinyint(4) NOT NULL COMMENT '状态（1：存在，0：已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO `user_notice` VALUES (2, 1, 1, 0, 1);
INSERT INTO `user_notice` VALUES (3, 1, 3, 0, 1);
INSERT INTO `user_notice` VALUES (4, 1, 4, 0, 1);
INSERT INTO `user_notice` VALUES (5, 6, 1, 1, 1);
INSERT INTO `user_notice` VALUES (6, 6, 3, 0, 1);
INSERT INTO `user_notice` VALUES (7, 6, 4, 0, 1);
INSERT INTO `user_notice` VALUES (8, 8, 1, 1, 0);
INSERT INTO `user_notice` VALUES (9, 8, 13, 1, 0);
INSERT INTO `user_notice` VALUES (10, 8, 11, 0, 0);
INSERT INTO `user_notice` VALUES (11, 8, 12, 0, 1);
INSERT INTO `user_notice` VALUES (12, 8, 10, 0, 1);
INSERT INTO `user_notice` VALUES (13, 8, 9, 0, 1);
INSERT INTO `user_notice` VALUES (14, 8, 5, 0, 1);
INSERT INTO `user_notice` VALUES (15, 8, 6, 0, 1);
INSERT INTO `user_notice` VALUES (16, 8, 3, 0, 1);
INSERT INTO `user_notice` VALUES (17, 8, 8, 0, 1);
INSERT INTO `user_notice` VALUES (18, 8, 4, 0, 1);
INSERT INTO `user_notice` VALUES (19, 8, 7, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
