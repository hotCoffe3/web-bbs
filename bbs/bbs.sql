prompt PL/SQL Developer import file
prompt Created on 2017��2��25�� by Administrator
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
values (1, '����Ա');
insert into USERTYPE (id, type)
values (2, '��ͨ��Ա');
insert into USERTYPE (id, type)
values (3, '��ѻ�Ա');
insert into USERTYPE (id, type)
values (4, '��ͨ�û�');
commit;
prompt 4 records loaded
prompt Loading USERS...
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (47, '�ν�', '����', 'Ů', '12345678910', 18, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (48, '�ž�', '����', 'Ů', '12345678911', 13, '�㶫��ҵ��ѧ', '�Ź�', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (49, '�Ϻ�', '����', 'Ů', '12345679810', 19, '���ݴ�ѧ', '���', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (50, '����', '����', 'Ů', '12345678912', 20, '���ݴ�ѧ', '���', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (51, '����', '����', 'Ů', '12345679813', 19, '���ݴ�ѧ', '���', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (52, '����', 'Fred', 'Ů', '111', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (53, '���', '����', 'Ů', '123', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (54, '���', '����', 'Ů', '12345678914', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (73, '��ѻ�Ա', '����', '��', '12345678955', 25, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (74, '��ͨ��Ա', '����', 'Ů', '12345678945', 15, '����ҩѧԺ', '��ҩ', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (75, '�����', '�㹤����', 'secret', '11111111111', 12, '�㹤', '���', 2);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (15, '����', '����', 'Ů', '1354646464', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (33, '���', '����', 'Ů', '1354646464', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (34, '����', '����', 'Ů', '137643', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (35, '����', '����', 'Ů', '120', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (36, '����', '����', 'Ů', '110', 19, '�㹤���Ӽ���ѧԺ', '�Ź�', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (37, 'ǧ��', '����', 'Ů', '114', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (38, 'Ľ��', '����', 'Ů', '12345678915', 19, '�㶫��ҵ��ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (39, 'С��', '����', '��', '12345678916', 19, '���ݴ�ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (40, '����', '����', '��', '12345678918', 19, '���ݴ�ѧ', '����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (41, '���� ', '����', '��', '12345678919', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (42, '����', '����', '��', '12345678920', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (43, '�Ž�', '����', '��', '12345679821', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (44, '����', '����', '��', '12345678922', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (45, '�ɰ�', '����', '��', '12345678923', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (46, '�Ʒ�', '����', '��', '13546876313', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (55, '����', '����', '��', '13135465613', 19, '���ݴ�ѧ', 'Ӣ��', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (56, '�պ�', '����', '��', '13246546555', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (57, '���� ', '����', '��', '13135446542', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (5, '����', '����', '��', '13514543115', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (58, '��󸻺�', 'admin6', '��', '13543154333', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (95, '����', '�㶫����', 'secret', '12485452414', 125, '�㹤', '��Ϣ����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (117, '�ֶ���', '�����ݸ���', 'male', '12345677775', 11, '������ʽ', '���¸�', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (10, '����', '����', '��', '31354354313', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (1, '��', '����', '��', '13135434634', 19, '���ݴ�ѧ', '�����', 1);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (12, '��ʽ', '����', '��', '13543131345', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (13, '������', '����', '��', '31654613132', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (14, '��', '����', '��', '13164531545', 19, '���ݴ�ѧ', '�����', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (115, '���', '����', 'male', '12345677777', 22, '���ݴ�ѧ', '�ڻ���', 4);
insert into USERS (id, name, address, sex, phone, age, school, major, typeid)
values (116, '�ĸ��Ϲ�', '���Ļ��պ���', 'male', '1233333333', 65, '���ҵ绰', '��', 4);
commit;
prompt 40 records loaded
prompt Loading CHAT...
insert into CHAT (id, usersid, loginid, content, time, record)
values (1, 1, 5, 'hello', to_date('24-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (11, 14, 35, '�Ŀ��ڵ�����ɶ�ķ���', to_date('24-02-2017 15:41:13', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (33, 14, 12, '������', to_date('24-02-2017 21:08:21', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (34, 14, 12, '��������', to_date('24-02-2017 21:08:29', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (35, 14, 12, '������', to_date('24-02-2017 21:08:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (55, 58, 14, '�Եľ��ǹ���', to_date('25-02-2017 10:53:31', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (59, 58, 14, 'ɳĮ', to_date('25-02-2017 11:10:41', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (71, 117, 12, '�������ﰡ', to_date('25-02-2017 14:43:28', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (73, 117, 75, 'shflasd�յ�������˹�绰', to_date('25-02-2017 16:42:23', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (74, 117, 75, '�յ������͵����͵�', to_date('25-02-2017 16:42:27', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (2, 5, 1, 'hello��', to_date('24-02-2017', 'dd-mm-yyyy'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (56, 14, 58, '�����Ҳ�֪����', to_date('25-02-2017 10:54:04', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (62, 58, 14, 'ɳĮ', to_date('25-02-2017 11:11:17', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (63, 58, 14, '���ò�����', to_date('25-02-2017 11:11:36', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (66, 14, 58, '����', to_date('25-02-2017 11:20:07', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (67, 14, 58, '����', to_date('25-02-2017 11:20:49', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (68, 12, 117, '��������', to_date('25-02-2017 14:04:51', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (69, 12, 117, '������', to_date('25-02-2017 14:04:56', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (4, 14, 35, 'hello', to_date('23-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (5, 35, 14, '���ǣ�', to_date('24-02-2017', 'dd-mm-yyyy'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (54, 14, 58, '������', to_date('25-02-2017 10:53:12', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (60, 14, 58, 'ɵ����ȸ', to_date('25-02-2017 11:10:50', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (61, 14, 58, '������i', to_date('25-02-2017 11:11:05', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (65, 14, 58, '��ô��' || chr(13) || '' || chr(10) || '', to_date('25-02-2017 11:12:39', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (70, 12, 117, '��������', to_date('25-02-2017 14:42:29', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (3, 1, 5, 'fgsdhf', to_date('23-02-2017', 'dd-mm-yyyy'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (12, 14, 35, 'ʮ���ɵ���ǵ�����ʽ', to_date('24-02-2017 15:47:27', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (13, 12, 35, '�Ǵ�����¸�', to_date('24-02-2017 15:50:02', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (31, 14, 35, '���Բ���', to_date('24-02-2017 18:54:51', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHAT (id, usersid, loginid, content, time, record)
values (32, 12, 35, '������ˬ��ˮ��������', to_date('24-02-2017 21:04:47', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (57, 58, 14, '�԰�', to_date('25-02-2017 11:09:36', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (58, 14, 58, 'ɵ����ȸ', to_date('25-02-2017 11:09:59', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (64, 14, 58, 'GV�־ֹٷ�v', to_date('25-02-2017 11:11:50', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (51, 58, 14, '�ҷ���Ϣ����', to_date('25-02-2017 10:40:22', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (52, 58, 14, '�յĵ���', to_date('25-02-2017 10:40:29', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (53, 14, 58, '������', to_date('25-02-2017 10:43:37', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CHAT (id, usersid, loginid, content, time, record)
values (72, 12, 117, '������', to_date('25-02-2017 14:44:02', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
prompt 37 records loaded
prompt Loading CONTENTTYPE...
insert into CONTENTTYPE (id, type)
values (1, 'ѧ��ֹ��');
insert into CONTENTTYPE (id, type)
values (2, 'ְ��ְ��');
insert into CONTENTTYPE (id, type)
values (3, '��������');
insert into CONTENTTYPE (id, type)
values (4, 'game');
commit;
prompt 4 records loaded
prompt Loading POST...
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/15', 1, '�������¸¸�', to_date('23-02-2017 21:54:03', 'dd-mm-yyyy hh24:mi:ss'), 179, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 1, '�»��緢��ʿ���', to_date('25-02-2017 11:34:29', 'dd-mm-yyyy hh24:mi:ss'), 235, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 1, '���ֵ�ˮ��ɳ', to_date('25-02-2017 11:37:54', 'dd-mm-yyyy hh24:mi:ss'), 236, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/3', 2, '�Ϸ��д�ۺ�ɫ', to_date('25-02-2017 14:03:16', 'dd-mm-yyyy hh24:mi:ss'), 246, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/16', 1, 'SDAFHSAGHSA', to_date('23-02-2017 21:56:19', 'dd-mm-yyyy hh24:mi:ss'), 180, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/8', 3, '�ɽ�����', to_date('24-02-2017 21:37:02', 'dd-mm-yyyy hh24:mi:ss'), 220, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 4, '��������', to_date('25-02-2017 10:36:04', 'dd-mm-yyyy hh24:mi:ss'), 232, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/1', 1, '���ֵ�ˮ��ɳ', to_date('25-02-2017 11:38:46', 'dd-mm-yyyy hh24:mi:ss'), 237, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 2, '����ĺϷ��ĵ��', to_date('25-02-2017 11:40:55', 'dd-mm-yyyy hh24:mi:ss'), 238, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 1, '�ֶ���ɶ������ɫ��������ɶ���˸�', to_date('25-02-2017 11:43:23', 'dd-mm-yyyy hh24:mi:ss'), 239, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/1', 1, '�ֶ���ɶ������ɫ��������ɶ���˸�', to_date('25-02-2017 11:44:37', 'dd-mm-yyyy hh24:mi:ss'), 240, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 1, '�ֶ���ɶ������ɫ��������ɶ���˸�', to_date('25-02-2017 11:45:52', 'dd-mm-yyyy hh24:mi:ss'), 241, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/0', 2, '����', to_date('25-02-2017 14:37:31', 'dd-mm-yyyy hh24:mi:ss'), 247, 2);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/1', 1, 'ˮ��Ѻ���', to_date('25-02-2017 14:38:35', 'dd-mm-yyyy hh24:mi:ss'), 248, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/1', 1, '���緢������������˵', to_date('25-02-2017 14:41:09', 'dd-mm-yyyy hh24:mi:ss'), 250, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (75, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin123/0', 1, 'dsjffsdfhˮ��Ѿ�����', to_date('25-02-2017 16:36:28', 'dd-mm-yyyy hh24:mi:ss'), 252, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/11', 2, '�ϴ����ʱ���е�', to_date('21-02-2017 21:16:27', 'dd-mm-yyyy hh24:mi:ss'), 154, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/0', 2, '����', to_date('25-02-2017 10:40:15', 'dd-mm-yyyy hh24:mi:ss'), 233, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, 'MySQL�鿴���޸ĵ�ǰ���ݿ����', to_date('24-02-2017 19:13:48', 'dd-mm-yyyy hh24:mi:ss'), 216, 1);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (117, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin11/2', 2, 'ɶ�ط���ʿ���ͼƬ', to_date('25-02-2017 14:41:46', 'dd-mm-yyyy hh24:mi:ss'), 251, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (75, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin123/1', 1, '����ͼƬ', to_date('23-02-2017 22:05:25', 'dd-mm-yyyy hh24:mi:ss'), 183, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/0', 2, '���¶ຣ�Ӵ�۶�����', to_date('21-02-2017 21:14:50', 'dd-mm-yyyy hh24:mi:ss'), 143, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/1', 2, '���¶ຣ�Ӵ�۶�����', to_date('21-02-2017 21:15:07', 'dd-mm-yyyy hh24:mi:ss'), 144, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/4', 1, '��ͼƬ�ı���3ˬ��ˮ', to_date('21-02-2017 21:15:41', 'dd-mm-yyyy hh24:mi:ss'), 147, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/13', 1, '��ͼƬ', to_date('21-02-2017 23:34:15', 'dd-mm-yyyy hh24:mi:ss'), 156, 1);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, 'sqlserver���ݿ�����', to_date('25-02-2017 12:00:53', 'dd-mm-yyyy hh24:mi:ss'), 242, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, 'ɶ���ɻ������绰��', to_date('25-02-2017 13:36:23', 'dd-mm-yyyy hh24:mi:ss'), 243, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/���̺�/17', 1, 'SSDFJSAHAFLAHSDGLASHG', to_date('23-02-2017 22:01:44', 'dd-mm-yyyy hh24:mi:ss'), 181, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (14, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/������/0', 2, '����', to_date('24-02-2017 13:31:03', 'dd-mm-yyyy hh24:mi:ss'), 192, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (58, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin6/7', 1, '�ظ����Ļѷ��˹�ʿ���', to_date('25-02-2017 13:42:41', 'dd-mm-yyyy hh24:mi:ss'), 244, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (116, 'G:\\apache-tomcat-7.0.73\\webapps\\bbs\\users/admin111/0', 1, '��󸻺�������������', to_date('25-02-2017 13:50:35', 'dd-mm-yyyy hh24:mi:ss'), 245, null);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/2', 2, '���¶ຣ�Ӵ�۶�����', to_date('21-02-2017 21:15:17', 'dd-mm-yyyy hh24:mi:ss'), 145, 0);
insert into POST (usersid, content, typeid, title, time, id, countdis)
values (12, 'G:\\eclipse\\WorkSpace\\bbs\\WebContent\\users/���̺�/3', 2, '���¶ຣ�Ӵ�۶�����', to_date('21-02-2017 21:15:28', 'dd-mm-yyyy hh24:mi:ss'), 146, 0);
commit;
prompt 33 records loaded
prompt Loading DISCUSS...
insert into DISCUSS (id, postid, content, time, usersid)
values (245, 247, 'asdfsadfhlsfhsdlfglfdsf', to_date('25-02-2017 16:41:57', 'dd-mm-yyyy hh24:mi:ss'), 75);
insert into DISCUSS (id, postid, content, time, usersid)
values (234, 243, '���ĸ����˸�hashas��·��������', to_date('25-02-2017 13:37:28', 'dd-mm-yyyy hh24:mi:ss'), 58);
insert into DISCUSS (id, postid, content, time, usersid)
values (243, 156, '���������·�ɹ�������Ʒ����򷢻��˺�', to_date('25-02-2017 14:46:27', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (236, 247, 'fsafjsadfasdjfɳ����', to_date('25-02-2017 14:37:59', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (240, 156, '�����ɱ���������������ʦ�˺�', to_date('25-02-2017 14:45:51', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (238, 156, 'ʿ���������ѹ���˹������ ʦ����', to_date('25-02-2017 14:44:49', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (195, 156, '�����¸��ŵĺð���ʱ�ѿ͹��Ͽ�������', to_date('23-02-2017 21:38:37', 'dd-mm-yyyy hh24:mi:ss'), 51);
insert into DISCUSS (id, postid, content, time, usersid)
values (198, 147, '���������Է��ܴ����´��ᰮ�ĺõ�', to_date('23-02-2017 21:47:06', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (241, 156, '���Ҵ��µ����к�ɽ��������ɱ������', to_date('25-02-2017 14:46:05', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (231, 180, '���������˻���ɽ�����쿧�ɶ���������glad�ø߿�ɽ����', to_date('25-02-2017 10:30:10', 'dd-mm-yyyy hh24:mi:ss'), 14);
insert into DISCUSS (id, postid, content, time, usersid)
values (199, 144, 'if���ʱ���������ɫ�󺣸����ڵķ�ʽ���緹��', to_date('23-02-2017 21:49:27', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (211, 216, '������£���ô������������', to_date('24-02-2017 19:14:46', 'dd-mm-yyyy hh24:mi:ss'), 58);
insert into DISCUSS (id, postid, content, time, usersid)
values (237, 156, '��ʿ�������Ʒ����˺ٷ��������Ϲ���ɫ����ɫ�󺣲������ܴ�������÷�ʽ�´�����������˷Ѵ�ʡ�ԺŸ�', to_date('25-02-2017 14:44:37', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (196, 156, '��ʹ�ݺ��ֵ�ˮ�㷢����', to_date('23-02-2017 21:46:11', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (197, 156, '���ĸ¶Է��ظ���ƹ淶�Ͷ��㹤�͸Ͻ�', to_date('23-02-2017 21:46:32', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (200, 180, 'GDSGADHDA;GJSD FSDAGSGSA', to_date('23-02-2017 21:57:44', 'dd-mm-yyyy hh24:mi:ss'), 12);
insert into DISCUSS (id, postid, content, time, usersid)
values (239, 156, '���ķ����ķ��������has�� ɳ��', to_date('25-02-2017 14:45:03', 'dd-mm-yyyy hh24:mi:ss'), 117);
insert into DISCUSS (id, postid, content, time, usersid)
values (242, 156, '�׷澫��ط��ϵ���������', to_date('25-02-2017 14:46:16', 'dd-mm-yyyy hh24:mi:ss'), 12);
commit;
prompt 18 records loaded
prompt Loading LOGIN...
insert into LOGIN (id, nickname, password, usertype, usersid)
values (163, 'admin123', '123456', 2, 75);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (6, '�ĵ�����������', '123456', 1, 1);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (7, '�����ľ�', '123456', 4, 10);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (8, '���̺�', '123456', 4, 12);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (204, 'admin111', '123456', 4, 116);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (5, '�������', '123456', 4, 34);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (94, 'admin6', '1234567', 4, 58);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (110, '����', '123456', 4, 51);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (138, '������', '123456', 4, 14);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (139, '��������', '123456', 4, 15);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (140, '�������', '123456', 4, 35);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (141, 'happy', '123456123456', 4, 36);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (142, 'Happy', '123456', 4, 37);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (143, 'Admin7', '123456', 4, 38);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (144, '���ã�����', '123456', 4, 39);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (145, '���ã���', '123456', 4, 40);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (146, '�ð�', '123456', 4, 41);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (147, '����˹', '123456', 4, 42);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (148, '��˹', '123456', 4, 43);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (149, '����', '123456', 4, 44);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (150, '����', '123456', 4, 45);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (151, '���ڹ���', '123456', 4, 46);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (152, '����ΪŮ����', '123456', 4, 47);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (153, 'ˮ��ɳ����', '123456', 4, 48);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (154, 'ɳ��', '123456', 4, 49);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (155, 'ˢ����', '123456', 4, 50);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (156, '˧��', '123456', 4, 52);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (157, '�����ظ�', '123456', 4, 53);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (158, '�Ƿ�Ϸ�', '123456', 4, 54);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (159, '���Ƿ��', '123456', 4, 56);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (160, '������', '123456', 4, 57);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (161, '��', '123456', 4, 73);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (162, '�ֽṹ����', '123456', 4, 74);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (183, 'kkk123456', '123456', 4, 95);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (205, 'admin11', '123456', 4, 117);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (12, 'jinliang', '123456', 4, 33);
insert into LOGIN (id, nickname, password, usertype, usersid)
values (11, '����', '123456', 4, 13);
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
