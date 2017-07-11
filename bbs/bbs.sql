prompt PL/SQL Developer import file
prompt Created on 2017年2月25日 by Administrator
set feedback off
set define off
prompt Disabling triggers for USERTYPE...
alter table USERTYPE disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CHAT...
alter table CHAT disable all triggers;
prompt Disabling triggers for CONTENTTYPE...
alter table CONTENTTYPE disable all triggers;
prompt Disabling triggers for POST...
alter table POST disable all triggers;
prompt Disabling triggers for DISCUSS...
alter table DISCUSS disable all triggers;
prompt Disabling triggers for LOGIN...
alter table LOGIN disable all triggers;
prompt Disabling triggers for PAY...
alter table PAY disable all triggers;
prompt Disabling triggers for USERFACE...
alter table USERFACE disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint USERS_TYPEID_FK;
prompt Disabling foreign key constraints for CHAT...
alter table CHAT disable constraint CAHT_LOGINID_FK;
alter table CHAT disable constraint CAHT_USERSID_FK;
prompt Disabling foreign key constraints for POST...
alter table POST disable constraint POST_TYPEID_FK;
alter table POST disable constraint POST_USERSID_FK;
prompt Disabling foreign key constraints for DISCUSS...
alter table DISCUSS disable constraint DISCUSS_POSTID_FK;
alter table DISCUSS disable constraint DISCUSS_USERSID_FK;
prompt Disabling foreign key constraints for LOGIN...
alter table LOGIN disable constraint LOGIN_USERSID_FK;
alter table LOGIN disable constraint LOGIN_USERTYPE_FK;
prompt Disabling foreign key constraints for PAY...
alter table PAY disable constraint ID_USERID_FK;
prompt Disabling foreign key constraints for USERFACE...
alter table USERFACE disable constraint FACE_USER_FK;
prompt Deleting USERFACE...
delete from USERFACE;
commit;
prompt Deleting PAY...
delete from PAY;
commit;
prompt Deleting LOGIN...
delete from LOGIN;
commit;
prompt Deleting DISCUSS...
delete from DISCUSS;
commit;
prompt Deleting POST...
delete from POST;
commit;
prompt Deleting CONTENTTYPE...
delete from CONTENTTYPE;
commit;
prompt Deleting CHAT...
delete from CHAT;
commit;
prompt Deleting USERS...
delete from USERS;
commit;
prompt Deleting USERTYPE...
delete from USERTYPE;
commit;
prompt Loading USERTYPE...
insert into USERTYPE (id, type)
values (1, '管理员');
insert into USERTYPE (id, type)
values (2, '普通会员');
insert into USERTYPE (id, type)
values (3, '年费会员');
insert into USERTYPE (id, type)
values (4, '普通用户');
commit;
prompt 4 records loaded
prompt Loading USERS...
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (47, '梦洁', '广州', '女', '12345678910', 18, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (48, '雅静', '广州', '女', '12345678911', 13, '广东工业大学', '信工', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (49, '韵寒', '广州', '女', '12345679810', 19, '广州大学', '设计', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (50, '莉姿', '广州', '女', '12345678912', 20, '广州大学', '设计', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (51, '沛玲', '广州', '女', '12345679813', 19, '广州大学', '设计', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (52, '欣妍', 'Fred', '女', '111', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (53, '歆瑶', '广宗', '女', '123', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (54, '凌菲', '广州', '女', '12345678914', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (73, '年费会员', '广州', '男', '12345678955', 25, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (74, '普通会员', '广州', '女', '12345678945', 15, '广州药学院', '制药', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (75, '李家乐', '广工教育', 'secret', '11111111111', 12, '广工', '电科', 2);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (15, '靖瑶', '广州', '女', '1354646464', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (33, '瑾萱', '广州', '女', '1354646464', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (34, '初灵', '广州', '女', '137643', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (35, '亮文', '广州', '女', '120', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (36, '紫云', '广州', '女', '110', 19, '广工男子技术学院', '信工', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (37, '千香', '广州', '女', '114', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (38, '慕翠', '广州', '女', '12345678915', 19, '广东工业大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (39, '小翠', '广州', '男', '12345678916', 19, '广州大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (40, '安邦', '广州', '男', '12345678918', 19, '广州大学', '物理', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (41, '安翔 ', '广州', '男', '12345678919', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (42, '宾白', '广州', '男', '12345678920', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (43, '才捷', '广州', '男', '12345679821', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (44, '成仁', '广州', '男', '12345678922', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (45, '飞昂', '广州', '男', '12345678923', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (46, '菲菲', '广州', '男', '13546876313', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (55, '飞宇', '广州', '男', '13135465613', 19, '广州大学', '英语', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (56, '刚豪', '广州', '男', '13246546555', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (57, '晗昱 ', '广州', '男', '13135446542', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (5, '涵育', '广州', '男', '13514543115', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (58, '鲨大富豪', 'admin6', '男', '13543154333', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (95, '家乐', '广东广州', 'secret', '12485452414', 125, '广工', '信息工程', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (117, '手动阀', '发数据个数', 'male', '12345677775', 11, '撒耳挂式', '撒嘎嘎', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (10, '涵忍', '广州', '男', '31354354313', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (1, '昊昊', '广州', '男', '13135434634', 19, '广州大学', '计算机', 1);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (12, '格式', '广州', '男', '13543131345', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (13, '萨芬是', '广州', '男', '31654613132', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (14, '是', '广州', '男', '13164531545', 19, '广州大学', '计算机', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (115, '礼拜', '广州', 'male', '12345677777', 22, '广州大学', '挖机级', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (116, '的复合弓', '发的货刚好熟', 'male', '1233333333', 65, '大哥挂电话', '发', 4);
commit;
prompt 40 records loaded
prompt Loading CHAT...
insert into CHAT (id, usersid, loginid, content, time, record)
values (1, 1, 5, 'hello', to_date('24-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (11, 14, 35, '的开黑的撒干啥的份上', to_date('24-02-2017 15:41:13', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (33, 14, 12, '我来了', to_date('24-02-2017 21:08:21', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (34, 14, 12, '我又来了', to_date('24-02-2017 21:08:29', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (35, 14, 12, '我走了', to_date('24-02-2017 21:08:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (55, 58, 14, '对的就是怪你', to_date('25-02-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (59, 58, 14, '沙漠', to_date('25-02-2017 11:10:41', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (71, 117, 12, '你来干嘛啊', to_date('25-02-2017 14:43:28', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (73, 117, 75, 'shflasd收到货格拉斯电话', to_date('25-02-2017 16:42:23', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (74, 117, 75, '收到发发送到发送到', to_date('25-02-2017 16:42:27', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (2, 5, 1, 'hello！', to_date('24-02-2017', 'dd-mm-yyyy'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (56, 14, 58, '是吗？我不知道啊', to_date('25-02-2017 10:54:04', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (62, 58, 14, '沙漠', to_date('25-02-2017 11:11:17', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (63, 58, 14, '你拿不到吗', to_date('25-02-2017 11:11:36', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (66, 14, 58, '干嘛', to_date('25-02-2017 11:20:07', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (67, 14, 58, '家乐', to_date('25-02-2017 11:20:49', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (68, 12, 117, '哈哈哈哈', to_date('25-02-2017 14:04:51', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (69, 12, 117, '我来啦', to_date('25-02-2017 14:04:56', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (4, 14, 35, 'hello', to_date('23-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (5, 35, 14, '你是？', to_date('24-02-2017', 'dd-mm-yyyy'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (54, 14, 58, '怪我罗', to_date('25-02-2017 10:53:12', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (60, 14, 58, '傻逼麻雀', to_date('25-02-2017 11:10:50', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (61, 14, 58, '韩国或i', to_date('25-02-2017 11:11:05', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (65, 14, 58, '家么就' || chr(13) || '' || chr(10) || '', to_date('25-02-2017 11:12:39', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (70, 12, 117, '我又来了', to_date('25-02-2017 14:42:29', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (3, 1, 5, 'fgsdhf', to_date('23-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (12, 14, 35, '十多个傻瓜是的撒格式', to_date('24-02-2017 15:47:27', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (13, 12, 35, '是大纲撒嘎嘎', to_date('24-02-2017 15:50:02', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (31, 14, 35, '测试测试', to_date('24-02-2017 18:54:51', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (32, 12, 35, '哈哈是爽肤水我又来了', to_date('24-02-2017 21:04:47', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (57, 58, 14, '对啊', to_date('25-02-2017 11:09:36', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (58, 14, 58, '傻逼麻雀', to_date('25-02-2017 11:09:59', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (64, 14, 58, 'GV分局官方v', to_date('25-02-2017 11:11:50', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (51, 58, 14, '我发信息给你', to_date('25-02-2017 10:40:22', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (52, 58, 14, '收的到吗', to_date('25-02-2017 10:40:29', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (53, 14, 58, '怪我罗', to_date('25-02-2017 10:43:37', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (72, 12, 117, '哈哈哈', to_date('25-02-2017 14:44:02', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
prompt 37 records loaded
prompt Loading CONTENTTYPE...
insert into CONTENTTYPE (id, type)
values (1, '学无止境');
insert into CONTENTTYPE (id, type)
values (2, '职来职往');
insert into CONTENTTYPE (id, type)
values (3, '激情裸聊');
insert into CONTENTTYPE (id, type)
values (4, 'game');
commit;
prompt 4 records loaded
prompt Loading POST...
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/15', 1, '范德萨嘎嘎嘎', to_date('23-02-2017 21:54:03', 'dd-mm-yyyy hh24:mi:ss'), 179, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 1, '新华社发哈士大夫', to_date('25-02-2017 11:34:29', 'dd-mm-yyyy hh24:mi:ss'), 235, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 1, '涸鲋得水萨沙', to_date('25-02-2017 11:37:54', 'dd-mm-yyyy hh24:mi:ss'), 236, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/3', 2, '合肥市打粉红色', to_date('25-02-2017 14:03:16', 'dd-mm-yyyy hh24:mi:ss'), 246, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/16', 1, 'SDAFHSAGHSA', to_date('23-02-2017 21:56:19', 'dd-mm-yyyy hh24:mi:ss'), 180, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/8', 3, '渡江侦察记', to_date('24-02-2017 21:37:02', 'dd-mm-yyyy hh24:mi:ss'), 220, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 4, '发帖测试', to_date('25-02-2017 10:36:04', 'dd-mm-yyyy hh24:mi:ss'), 232, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/1', 1, '涸鲋得水萨沙', to_date('25-02-2017 11:38:46', 'dd-mm-yyyy hh24:mi:ss'), 237, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 2, '更大的合肥四点半', to_date('25-02-2017 11:40:55', 'dd-mm-yyyy hh24:mi:ss'), 238, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 1, '手动阀啥都噶黑色大丽花干啥打了个', to_date('25-02-2017 11:43:23', 'dd-mm-yyyy hh24:mi:ss'), 239, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/1', 1, '手动阀啥都噶黑色大丽花干啥打了个', to_date('25-02-2017 11:44:37', 'dd-mm-yyyy hh24:mi:ss'), 240, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 1, '手动阀啥都噶黑色大丽花干啥打了个', to_date('25-02-2017 11:45:52', 'dd-mm-yyyy hh24:mi:ss'), 241, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/0', 2, '发帖', to_date('25-02-2017 14:37:31', 'dd-mm-yyyy hh24:mi:ss'), 247, 2);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/1', 1, '水电费寒风', to_date('25-02-2017 14:38:35', 'dd-mm-yyyy hh24:mi:ss'), 248, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/1', 1, '闪电发货萨拉丁肥良说', to_date('25-02-2017 14:41:09', 'dd-mm-yyyy hh24:mi:ss'), 250, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (75, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin123/0', 1, 'dsjffsdfh水电费就算了', to_date('25-02-2017 16:36:28', 'dd-mm-yyyy hh24:mi:ss'), 252, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/11', 2, '上打广告的时代感的', to_date('21-02-2017 21:16:27', 'dd-mm-yyyy hh24:mi:ss'), 154, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/0', 2, '家乐', to_date('25-02-2017 10:40:15', 'dd-mm-yyyy hh24:mi:ss'), 233, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, 'MySQL查看并修改当前数据库编码', to_date('24-02-2017 19:13:48', 'dd-mm-yyyy hh24:mi:ss'), 216, 1);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/2', 2, '啥地方哈士大夫图片', to_date('25-02-2017 14:41:46', 'dd-mm-yyyy hh24:mi:ss'), 251, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (75, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin123/1', 1, '测试图片', to_date('23-02-2017 22:05:25', 'dd-mm-yyyy hh24:mi:ss'), 183, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/0', 2, '萨嘎多海河大观豆腐花', to_date('21-02-2017 21:14:50', 'dd-mm-yyyy hh24:mi:ss'), 143, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/1', 2, '萨嘎多海河大观豆腐花', to_date('21-02-2017 21:15:07', 'dd-mm-yyyy hh24:mi:ss'), 144, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/4', 1, '有图片的标题3爽肤水', to_date('21-02-2017 21:15:41', 'dd-mm-yyyy hh24:mi:ss'), 147, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/13', 1, '有图片', to_date('21-02-2017 23:34:15', 'dd-mm-yyyy hh24:mi:ss'), 156, 1);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, 'sqlserver数据库乱码', to_date('25-02-2017 12:00:53', 'dd-mm-yyyy hh24:mi:ss'), 242, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, '啥都干坏事拉电话费', to_date('25-02-2017 13:36:23', 'dd-mm-yyyy hh24:mi:ss'), 243, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/即蕴涵/17', 1, 'SSDFJSAHAFLAHSDGLASHG', to_date('23-02-2017 22:01:44', 'dd-mm-yyyy hh24:mi:ss'), 181, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/巧玲珑/0', 2, '测试', to_date('24-02-2017 13:31:03', 'dd-mm-yyyy hh24:mi:ss'), 192, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, '回复撒的谎发了哈士大夫', to_date('25-02-2017 13:42:41', 'dd-mm-yyyy hh24:mi:ss'), 244, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (116, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin111/0', 1, '鲨大富豪撒雕龙画凤撒', to_date('25-02-2017 13:50:35', 'dd-mm-yyyy hh24:mi:ss'), 245, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/2', 2, '萨嘎多海河大观豆腐花', to_date('21-02-2017 21:15:17', 'dd-mm-yyyy hh24:mi:ss'), 145, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/即蕴涵/3', 2, '萨嘎多海河大观豆腐花', to_date('21-02-2017 21:15:28', 'dd-mm-yyyy hh24:mi:ss'), 146, 0);
commit;
prompt 33 records loaded
prompt Loading DISCUSS...
insert into DISCUSS (id, postid, content, time, usersid)
values (245, 247, 'asdfsadfhlsfhsdlfglfdsf', to_date('25-02-2017 16:41:57', 'dd-mm-yyyy hh24:mi:ss'), 75);
insert into DISCUSS (id, postid, content, time, usersid)
values (234, 243, '萨的嘎少了个hashas电路和撒旦了', to_date('25-02-2017 13:37:28', 'dd-mm-yyyy hh24:mi:ss'), 58);
insert into DISCUSS (id, postid, content, time, usersid)
values (243, 156, '开火锅店上路干哈拉闪电黄蜂啦打发货了好', to_date('25-02-2017 14:46:27', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (236, 247, 'fsafjsadfasdjf沙发是', to_date('25-02-2017 14:37:59', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (240, 156, '无穷扼杀雕龙画凤拉横幅老师了好', to_date('25-02-2017 14:45:51', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (238, 156, '士大夫撒代理费哈里斯付好了 师傅带', to_date('25-02-2017 14:44:49', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (195, 156, '阿萨德噶放的好啊工时费客观上看带回来', to_date('23-02-2017 21:38:37', 'dd-mm-yyyy hh24:mi:ss'), 51);
insert into DISCUSS (id, postid, content, time, usersid)
values (198, 147, '范德萨给对方很大方萨嘎待会爱的好的', to_date('23-02-2017 21:47:06', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (241, 156, '国家大事第六感和山东理工两个杀待会了', to_date('25-02-2017 14:46:05', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (231, 180, '发电量萨克花果山拉丁红咖喱啥读后感拉黑glad好高咯山东理工', to_date('25-02-2017 10:30:10', 'dd-mm-yyyy hh24:mi:ss'), 14);
insert into DISCUSS (id, postid, content, time, usersid)
values (199, 144, 'if大好时光来获得蓝色大海给拉黑的方式来电饭锅', to_date('23-02-2017 21:49:27', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (211, 216, '就你多事，怎么字数还有限制', to_date('24-02-2017 19:14:46', 'dd-mm-yyyy hh24:mi:ss'), 58);
insert into DISCUSS (id, postid, content, time, usersid)
values (237, 156, '阿士大夫撒大黄蜂撒浪嘿发电量复合弓蓝色大海蓝色大海不厉害很大声来获得方式嘎达和厉害厉害浪费大省略号噶', to_date('25-02-2017 14:44:37', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (196, 156, '大使馆涸鲋得水广发基金', to_date('23-02-2017 21:46:11', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (197, 156, '萨的嘎对方回复设计规范就读广工就赶紧', to_date('23-02-2017 21:46:32', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (200, 180, 'GDSGADHDA;GJSD FSDAGSGSA', to_date('23-02-2017 21:57:44', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (239, 156, '撒的发生的发生代理费has了 沙发', to_date('25-02-2017 14:45:03', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (242, 156, '雷锋精神地方上的来划分了', to_date('25-02-2017 14:46:16', 'dd-mm-yyyy hh24:mi:ss'), 12);
commit;
prompt 18 records loaded
prompt Loading LOGIN...
insert into LOGIN (id, nickname, password, usertype, usersid)
values (163, 'admin123', '123456', 2, 75);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (6, '心地善良，纯洁', '123456', 1, 1);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (7, '优雅文静', '123456', 4, 10);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (8, '即蕴涵', '123456', 4, 12);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (204, 'admin111', '123456', 4, 116);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (5, '精神充沛', '123456', 4, 34);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (94, 'admin6', '1234567', 4, 58);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (110, '中文', '123456', 4, 51);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (138, '巧玲珑', '123456', 4, 14);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (139, '妍是美丽', '123456', 4, 15);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (140, '开心愉快', '123456', 4, 35);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (141, 'happy', '123456123456', 4, 36);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (142, 'Happy', '123456', 4, 37);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (143, 'Admin7', '123456', 4, 38);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (144, '心悦，欢愉', '123456', 4, 39);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (145, '心悦，欢', '123456', 4, 40);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (146, '悦爱', '123456', 4, 41);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (147, '董秋斯', '123456', 4, 42);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (148, '曼斯', '123456', 4, 43);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (149, '曼谷', '123456', 4, 44);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (150, '慢慢', '123456', 4, 45);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (151, '甚于寡人', '123456', 4, 46);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (152, '大星为女主的', '123456', 4, 47);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (153, '水果沙拉个', '123456', 4, 48);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (154, '沙拉', '123456', 4, 49);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (155, '刷给个', '123456', 4, 50);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (156, '帅哥', '123456', 4, 52);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (157, '护发回复', '123456', 4, 53);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (158, '是否合法', '123456', 4, 54);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (159, '这是否会', '123456', 4, 56);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (160, '归属感', '123456', 4, 57);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (161, '刚', '123456', 4, 73);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (162, '钢结构功能', '123456', 4, 74);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (183, 'kkk123456', '123456', 4, 95);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (205, 'admin11', '123456', 4, 117);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (12, 'jinliang', '123456', 4, 33);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (11, '测试', '123456', 4, 13);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (203, 'admin1234', '123456', 4, 115);
commit;
prompt 38 records loaded
prompt Loading PAY...
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (35, 58, to_date('25-02-2017 15:44:26', 'dd-mm-yyyy hh24:mi:ss'), null, '24EB40ABC3774F9CA1E0AFF1BD65889E', 450);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (34, 51, to_date('25-02-2017 15:42:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-02-2022 15:42:19', 'dd-mm-yyyy hh24:mi:ss'), '49E83EA233C24460972DDDC6E5400A3F', 450);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (38, 75, to_date('25-02-2017 16:39:22', 'dd-mm-yyyy hh24:mi:ss'), null, '34484C0386244DA3A60BDF15BA91B70D', 10);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (39, 75, to_date('25-02-2017 16:40:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-03-2017 16:40:14', 'dd-mm-yyyy hh24:mi:ss'), '1CACF0CA007E4657B512F8E84222FD60', 10);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (33, 51, to_date('25-02-2017 15:41:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2017 15:41:28', 'dd-mm-yyyy hh24:mi:ss'), '6DA6E65508704B549F94B63D347F7244', 45);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (36, 58, to_date('25-02-2017 15:47:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0DFEB8A310764781B465431BD0918A7F', 10);
insert into PAY (id, userid, paytime, endtime, payuuid, money)
values (37, 75, to_date('25-02-2017 15:47:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-07-2017 15:47:53', 'dd-mm-yyyy hh24:mi:ss'), 'B6F8035598694D5F96D0C8FFDF6A0257', 45);
commit;
prompt 7 records loaded
prompt Loading USERFACE...
insert into USERFACE (id, userid, userface)
values (26, 75, 'images/face_img/377282753971448AB0EE42E82B7C305F_t01fd28074e1a38fccd.jpg');
insert into USERFACE (id, userid, userface)
values (27, 117, 'images/face_img/BF9436128C764D939B4AC26939010C1D_20090819205029-1265245578.jpg');
insert into USERFACE (id, userid, userface)
values (25, 58, 'images/face_img/7AF220AAE4E44F0AB4722824C364A976_2535030.gif');
commit;
prompt 3 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint USERS_TYPEID_FK;
prompt Enabling foreign key constraints for CHAT...
alter table CHAT enable constraint CAHT_LOGINID_FK;
alter table CHAT enable constraint CAHT_USERSID_FK;
prompt Enabling foreign key constraints for POST...
alter table POST enable constraint POST_TYPEID_FK;
alter table POST enable constraint POST_USERSID_FK;
prompt Enabling foreign key constraints for DISCUSS...
alter table DISCUSS enable constraint DISCUSS_POSTID_FK;
alter table DISCUSS enable constraint DISCUSS_USERSID_FK;
prompt Enabling foreign key constraints for LOGIN...
alter table LOGIN enable constraint LOGIN_USERSID_FK;
alter table LOGIN enable constraint LOGIN_USERTYPE_FK;
prompt Enabling foreign key constraints for PAY...
alter table PAY enable constraint ID_USERID_FK;
prompt Enabling foreign key constraints for USERFACE...
alter table USERFACE enable constraint FACE_USER_FK;
prompt Enabling triggers for USERTYPE...
alter table USERTYPE enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CHAT...
alter table CHAT enable all triggers;
prompt Enabling triggers for CONTENTTYPE...
alter table CONTENTTYPE enable all triggers;
prompt Enabling triggers for POST...
alter table POST enable all triggers;
prompt Enabling triggers for DISCUSS...
alter table DISCUSS enable all triggers;
prompt Enabling triggers for LOGIN...
alter table LOGIN enable all triggers;
prompt Enabling triggers for PAY...
alter table PAY enable all triggers;
prompt Enabling triggers for USERFACE...
alter table USERFACE enable all triggers;
set feedback on
set define on
prompt Done.
