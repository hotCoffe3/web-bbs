prompt PL/SQL Developer import file
prompt Created on 2017年2月14日 by Administrator
set feedback off
set define off
prompt Disabling triggers for CONTENTTYPE...
alter table CONTENTTYPE disable all triggers;
prompt Disabling triggers for USERTYPE...
alter table USERTYPE disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for POST...
alter table POST disable all triggers;
prompt Disabling triggers for DISCUSS...
alter table DISCUSS disable all triggers;
prompt Disabling triggers for LOGIN...
alter table LOGIN disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint USERS_TYPEID_FK;
prompt Disabling foreign key constraints for POST...
alter table POST disable constraint POST_TYPEID_FK;
alter table POST disable constraint POST_USERSID_FK;
prompt Disabling foreign key constraints for DISCUSS...
alter table DISCUSS disable constraint DISCUSS_POSTID_FK;
prompt Disabling foreign key constraints for LOGIN...
alter table LOGIN disable constraint LOGIN_USERSID_FK;
alter table LOGIN disable constraint LOGIN_USERTYPE_FK;
prompt Deleting LOGIN...
delete from LOGIN;
commit;
prompt Deleting DISCUSS...
delete from DISCUSS;
commit;
prompt Deleting POST...
delete from POST;
commit;
prompt Deleting USERS...
delete from USERS;
commit;
prompt Deleting USERTYPE...
delete from USERTYPE;
commit;
prompt Deleting CONTENTTYPE...
delete from CONTENTTYPE;
commit;
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
values (15, '序列', '广州', '男', '1354646464', 54, '广工', '首胜', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (5, '亮文', '广州', '人妖', '137643', 3, 'dsf', '1212', 3);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (10, '亮文2号', '广州', '男', '120', 4, '广工', '铁砂掌', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (1, '亮文', '广州', '女', '110', 3, '广工男子技术学院', '铁头功', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (12, '亮文3号', '广州', '男', '114', 5, '广工', '金钟罩', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (13, '亮文名字', '广州', '女', '111', 5, '广工', '啥', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (14, '测试', '广宗', '男', '123', 2, '广工', '这', 4);
commit;
prompt 7 records loaded
prompt Loading POST...
insert into POST (usersid, content, typeid, title, time, id)
values (5, '用户id为5', 1, '亮文谁啊', to_date('13-02-2017 12:00:05', 'dd-mm-yyyy hh24:mi:ss'), 16);
insert into POST (usersid, content, typeid, title, time, id)
values (12, 'sdfsf', 4, 'fsdfs', to_date('14-02-2017 12:00:01', 'dd-mm-yyyy hh24:mi:ss'), 52);
insert into POST (usersid, content, typeid, title, time, id)
values (5, '职来职往', 2, '职来职往', to_date('14-02-2017 00:00:58', 'dd-mm-yyyy hh24:mi:ss'), 53);
insert into POST (usersid, content, typeid, title, time, id)
values (5, '最新的', 3, '最新的title', to_date('15-02-2017 00:00:01', 'dd-mm-yyyy hh24:mi:ss'), 54);
insert into POST (usersid, content, typeid, title, time, id)
values (12, '亮文大傻逼', 3, '亮文狗币', to_date('10-02-2017 01:01:01', 'dd-mm-yyyy hh24:mi:ss'), 15);
insert into POST (usersid, content, typeid, title, time, id)
values (1, '亮文是狗币', 3, '亮文标题1', to_date('12-02-2017 11:01:01', 'dd-mm-yyyy hh24:mi:ss'), 32);
insert into POST (usersid, content, typeid, title, time, id)
values (1, '亮文是菜逼', 3, '亮文标题2', to_date('12-02-2017 11:01:00', 'dd-mm-yyyy hh24:mi:ss'), 33);
insert into POST (usersid, content, typeid, title, time, id)
values (10, '亮文是谁啊', 3, '亮文标题3', to_date('12-02-2017 00:00:56', 'dd-mm-yyyy hh24:mi:ss'), 34);
insert into POST (usersid, content, typeid, title, time, id)
values (1, '亮文是傻逼', 3, '亮文是第一傻逼', to_date('10-02-2017', 'dd-mm-yyyy'), 13);
insert into POST (usersid, content, typeid, title, time, id)
values (10, '亮文也是傻逼', 3, '亮文是第二傻逼', to_date('10-02-2017', 'dd-mm-yyyy'), 14);
commit;
prompt 10 records loaded
prompt Loading DISCUSS...
insert into DISCUSS (id, postid, content, time)
values (31, 32, '"Bible-in-a-Year was so rewarding! Before BiAY, I didn''t have a consistent quiet time and couldn''t figure out what to study, but the BiAY', to_date('13-02-2017', 'dd-mm-yyyy'));
insert into DISCUSS (id, postid, content, time)
values (32, 32, '撒旦法是否是否合适发货撒发哈雷锋号森林防火', to_date('14-02-2017 00:00:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (1, 13, '我也觉得', to_date('14-02-2017 00:00:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (2, 13, '我也也觉得', to_date('14-02-2017 00:00:56', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (29, 13, 'duidui', to_date('14-02-2017 00:01:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (18, 13, '哈哈哈', to_date('14-02-2017 00:00:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (19, 14, '这是啥', to_date('14-02-2017 00:00:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (20, 14, '我来灌水了', to_date('14-02-2017 00:00:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (21, 14, '刷存在感', to_date('14-02-2017 00:00:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (22, 15, '测试', to_date('14-02-2017 00:00:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (23, 15, '测试网速', to_date('14-02-2017 00:00:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (24, 32, '我来啦', to_date('14-02-2017 00:00:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into DISCUSS (id, postid, content, time)
values (25, 33, '亮文是谁', null);
insert into DISCUSS (id, postid, content, time)
values (26, 33, '谁认识这个亮文啊', null);
insert into DISCUSS (id, postid, content, time)
values (27, 34, '为什么都知道他是傻逼的', null);
insert into DISCUSS (id, postid, content, time)
values (28, 34, '哈啊哈', null);
insert into DISCUSS (id, postid, content, time)
values (30, 34, 'ceshi', to_date('14-02-2017 00:00:03', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 17 records loaded
prompt Loading LOGIN...
insert into LOGIN (id, nickname, password, usertype, usersid)
values (6, 'isname', '123456', 2, 5);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (7, 'isname2', '123456', 3, 10);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (8, 'isname3', '123456', 4, 12);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (5, 'Nickname', 'password', 1, 1);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (12, 'jinliang', '123456', 3, null);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (11, '测试', '123456', 4, 13);
commit;
prompt 6 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint USERS_TYPEID_FK;
prompt Enabling foreign key constraints for POST...
alter table POST enable constraint POST_TYPEID_FK;
alter table POST enable constraint POST_USERSID_FK;
prompt Enabling foreign key constraints for DISCUSS...
alter table DISCUSS enable constraint DISCUSS_POSTID_FK;
prompt Enabling foreign key constraints for LOGIN...
alter table LOGIN enable constraint LOGIN_USERSID_FK;
alter table LOGIN enable constraint LOGIN_USERTYPE_FK;
prompt Enabling triggers for CONTENTTYPE...
alter table CONTENTTYPE enable all triggers;
prompt Enabling triggers for USERTYPE...
alter table USERTYPE enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for POST...
alter table POST enable all triggers;
prompt Enabling triggers for DISCUSS...
alter table DISCUSS enable all triggers;
prompt Enabling triggers for LOGIN...
alter table LOGIN enable all triggers;
set feedback on
set define on
prompt Done.
