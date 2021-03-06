  DROP TABLE IF EXISTS AU_GROUP_RELATION;
  DROP TABLE IF EXISTS AU_ORGINFO;
  DROP TABLE IF EXISTS AU_ROLEINFO;
  DROP TABLE IF EXISTS AU_USERINFO;
  DROP TABLE IF EXISTS FOXBPM_AGENT;
  DROP TABLE IF EXISTS FOXBPM_AGENT_DETAILS;
  DROP TABLE IF EXISTS FOXBPM_DEF_BYTEARRAY;
  DROP TABLE IF EXISTS FOXBPM_DEF_DEPLOYMENT;
  DROP TABLE IF EXISTS FOXBPM_DEF_PROCESSDEFINITION;
  DROP TABLE IF EXISTS FOXBPM_MAIL;
  DROP TABLE IF EXISTS FOXBPM_RUN_OPERATING;
  DROP TABLE IF EXISTS FOXBPM_RUN_PROCESSINSTANCE;
  DROP TABLE IF EXISTS FOXBPM_RUN_RUNNINGTRACK;
  DROP TABLE IF EXISTS FOXBPM_RUN_TASK;
  DROP TABLE IF EXISTS FOXBPM_RUN_TASKIDENTITYLINK;
  DROP TABLE IF EXISTS FOXBPM_RUN_TOKEN;
  DROP TABLE IF EXISTS FOXBPM_RUN_VARIABLE;
  DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
  DROP TABLE IF EXISTS QRTZ_CALENDARS;
  DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
  DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS; 
  DROP TABLE IF EXISTS QRTZ_LOCKS;
  DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
  DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
  DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
  DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
  DROP TABLE IF EXISTS QRTZ_TRIGGERS;
  DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
  DROP TABLE IF EXISTS TB_EXPENSE;
  DROP TABLE IF EXISTS FOXBPM_RUN_PROCESS_INFO;
  CREATE TABLE `AU_GROUP_RELATION` (	
      `GUID` varchar(64) NOT NULL, 
      `USERID` varchar(512) DEFAULT NULL, 
      `GROUPID` varchar(512) DEFAULT NULL, 
      `GROUPTYPE` varchar(512) DEFAULT NULL,
      PRIMARY KEY(`GUID`)
   );
  CREATE TABLE `AU_ORGINFO` 
   (	
      `ORGID` varchar(64) NOT NULL, 
      `SUPORGID` varchar(512) DEFAULT NULL, 
      `ORGNAME` varchar(512) DEFAULT NULL,
      PRIMARY KEY (`ORGID`)
   );
  CREATE TABLE `AU_ROLEINFO` 
   (	
      `ROLEID` varchar(64) NOT NULL, 
      `ROLENAME` varchar(512) DEFAULT NULL,
      PRIMARY KEY (`ROLEID`)
   );
  CREATE TABLE `AU_USERINFO` 
   (	
      `USERID` varchar(64) NOT NULL, 
      `USERNAME` varchar(512) DEFAULT NULL, 
      `PASSWORD` varchar(512) DEFAULT NULL, 
      `EMAIL` varchar(250) DEFAULT NULL, 
      `TEL` varchar(255) DEFAULT NULL, 
      `IMAGE` varchar(64) DEFAULT NULL,
      PRIMARY KEY (`USERID`) 
   );
   CREATE TABLE `FOXBPM_AGENT` 
   (	
      `ID` varchar(255) NOT NULL, 
      `AGENT_USER` varchar(255) DEFAULT NULL, 
      `STARTTIME` TIMESTAMP NULL DEFAULT NULL, 
      `ENDTIME` TIMESTAMP NULL DEFAULT NULL, 
      `STATUS` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`ID`)
   );
   CREATE TABLE `FOXBPM_AGENT_DETAILS` 
   (	
      `ID` varchar(255) NOT NULL, 
      `AGENT_ID` varchar(255) DEFAULT NULL, 
      `PROCESSDEFINITION_KEY` varchar(255), 
      `AGENT_TOUSER` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`ID`)
   );
  CREATE TABLE `FOXBPM_DEF_BYTEARRAY` 
   (	
      `ID` varchar(64) NOT NULL, 
      `REV` decimal(12,0) DEFAULT NULL, 
      `NAME` varchar(512) DEFAULT NULL, 
      `BYTES` BLOB, 
      `DEPLOYMENT_ID` varchar(256) DEFAULT NULL,
      PRIMARY KEY(`ID`)
   );
  CREATE TABLE `FOXBPM_DEF_DEPLOYMENT` 
   (	
      `ID` varchar(64) NOT NULL, 
      `NAME` varchar(512) DEFAULT NULL, 
      `DEPLOY_TIME` TIMESTAMP NULL DEFAULT NULL,
      PRIMARY KEY(`ID`)
   );
 
  CREATE TABLE `FOXBPM_DEF_PROCESSDEFINITION` 
   (	
      `DIFINITIONS_KEY` varchar(512) DEFAULT NULL, 
      `DIFINITIONS_ID` varchar(512) DEFAULT NULL, 
      `PROCESS_KEY` varchar(512) DEFAULT NULL, 
      `PROCESS_ID` varchar(250) NOT NULL, 
      `CATEGORY` varchar(255) DEFAULT NULL, 
      `PROCESS_NAME` varchar(255) DEFAULT NULL, 
      `VERSION` decimal(12,0) DEFAULT NULL, 
      `RESOURCE_NAME` varchar(4000) DEFAULT NULL, 
      `DEPLOYMENT_ID` varchar(64) DEFAULT NULL, 
      `DIAGRAM_RESOURCE_NAME` varchar(512) DEFAULT NULL, 
      `START_FORM_KEY` varchar(1024) DEFAULT NULL, 
      `RESOURCE_ID` varchar(64) DEFAULT NULL, 
      `SUB_TASK_ID` varchar(128) DEFAULT NULL, 
      `REV_` decimal(12,0) DEFAULT 0,
      PRIMARY KEY(`PROCESS_ID`)
   );
  CREATE TABLE `FOXBPM_MAIL` 
   (	
      `MAIL_ID` varchar(128) NOT NULL, 
      `MAIL_NAME` varchar(4000) DEFAULT NULL, 
      `MAIL_TO` varchar(4000) DEFAULT NULL, 
      `MAIL_SUBJECT` varchar(4000) DEFAULT NULL, 
      `MAIL_BODY` BLOB, 
      `MAIL_STATUS` varchar(64) DEFAULT NULL, 
      `CREATE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `SEND_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `MAIL_CC` varchar(4000) DEFAULT NULL, 
      `CREATE_USER` varchar(64) DEFAULT NULL, 
      `FAILURE_REASON` varchar(4000) DEFAULT NULL,
      PRIMARY KEY (`MAIL_ID`)
   );
  CREATE TABLE `FOXBPM_RUN_PROCESSINSTANCE` 
   (	
      `ID` varchar(64) NOT NULL, 
      `PROCESSDEFINITION_ID` varchar(512) DEFAULT NULL, 
      `PROCESSDEFINITION_KEY` varchar(512) DEFAULT NULL, 
      `SUBJECT` varchar(4000) DEFAULT NULL, 
      `START_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `END_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `DEFINITION_ID` varchar(64) DEFAULT NULL, 
      `ROOTTOKEN_ID` varchar(64) DEFAULT NULL, 
      `BIZ_KEY` varchar(64) DEFAULT NULL, 
      `INITIATOR` varchar(64) DEFAULT NULL, 
      `START_AUTHOR` varchar(64) DEFAULT NULL, 
      `ISSUSPENDED` varchar(20) DEFAULT NULL, 
      `PARENT_ID` varchar(64) DEFAULT NULL, 
      `PARENT_TOKEN_ID` varchar(64) DEFAULT NULL, 
      `UPDATE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `PROCESSLOCATION` varchar(2048) DEFAULT NULL, 
      `INSTANCE_STATUS` varchar(45) DEFAULT NULL, 
      `ARCHIVE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `REV_` decimal(12,0) DEFAULT 0,
      PRIMARY KEY(`ID`)
   ); 
  CREATE TABLE `FOXBPM_RUN_RUNNINGTRACK` 
   (	
       `ID` varchar(64) NOT NULL, 
      `PROCESSINSTANCE_ID` varchar(64), 
      `PROCESSDEFINITION_ID` varchar(512), 
      `PROCESSDEFINITION_KEY` varchar(512), 
      `TOKEN_ID` varchar(64) DEFAULT NULL, 
      `PARENT_TOKEN_ID` varchar(64) DEFAULT NULL, 
      `EXECUTION_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `TRACK_RECORD` varchar(64) DEFAULT NULL, 
      `OPERATOR` varchar(512) DEFAULT NULL, 
      `NODE_ID` varchar(128) DEFAULT NULL, 
      `NODE_NAME` varchar(512) DEFAULT NULL, 
      `EVENT_NAME` varchar(512) DEFAULT NULL, 
      `ARCHIVE_TIME` TIMESTAMP NULL DEFAULT NULL,
      PRIMARY KEY(`ID`)
   );
 
  CREATE TABLE `FOXBPM_RUN_TASK` 
   (	
      `ID` varchar(64) NOT NULL, 
      `PROCESSINSTANCE_ID` varchar(64) DEFAULT NULL, 
      `PROCESSDEFINITION_ID` varchar(512) DEFAULT NULL, 
      `VERSION` decimal(12,0) DEFAULT NULL, 
      `TOKEN_ID` varchar(64) DEFAULT NULL, 
      `NODE_ID` varchar(64) DEFAULT NULL, 
      `DESCRIPTION` varchar(4000) DEFAULT NULL, 
      `SUBJECT` varchar(255) DEFAULT NULL, 
      `PARENT_ID` varchar(64) DEFAULT NULL, 
      `ASSIGNEE` varchar(64) DEFAULT NULL, 
      `CLAIM_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `NAME` varchar(255) DEFAULT NULL, 
      `CREATE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `START_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `ISBLOCKING` varchar(20) DEFAULT NULL, 
      `END_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `DUEDATE` TIMESTAMP NULL DEFAULT NULL, 
      `PRIORITY` decimal(6,0) DEFAULT NULL, 
      `CATEGORY` varchar(64) DEFAULT NULL, 
      `OWNER` varchar(64) DEFAULT NULL, 
      `DELEGATIONSTATE` varchar(64) DEFAULT NULL, 
      `BIZKEY` varchar(64) DEFAULT NULL, 
      `COMMAND_TYPE` varchar(256) DEFAULT NULL, 
      `COMMAND_MESSAGE` varchar(256) DEFAULT NULL, 
      `TASK_COMMENT` varchar(4000) DEFAULT NULL, 
      `NODE_NAME` varchar(512) DEFAULT NULL, 
      `PROCESSDEFINITION_KEY` varchar(512) DEFAULT NULL, 
      `FORMURI` varchar(256) DEFAULT NULL, 
      `TASKGROUP` varchar(64) DEFAULT NULL, 
      `TASKTYPE` varchar(64) DEFAULT NULL, 
      `PROCESSDEFINITION_NAME` varchar(512) DEFAULT NULL, 
      `ISCANCELLED` varchar(64) DEFAULT NULL, 
      `ISSUSPENDED` varchar(64) DEFAULT NULL, 
      `ISOPEN` varchar(64) DEFAULT NULL, 
      `ISDRAFT` varchar(64) DEFAULT NULL, 
      `EXPECTED_EXECUTIONTIME` decimal(14,2) DEFAULT NULL, 
      `AGENT` varchar(64) DEFAULT NULL, 
      `ADMIN` varchar(64) DEFAULT NULL, 
      `FORMURIVIEW` varchar(512) DEFAULT NULL, 
      `CALLACTIVITY_INSTANCE_ID` varchar(256) DEFAULT NULL, 
      `COMMAND_ID` varchar(64) DEFAULT NULL, 
      `PENDINGTASKID` varchar(64) DEFAULT NULL, 
      `ARCHIVE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `COMPLETEDESCRIPTION` varchar(1024) DEFAULT NULL, 
      `PROCESSSTART_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `PROCESS_INITIATOR` varchar(255) DEFAULT NULL, 
      `REV_` decimal(12,0) DEFAULT 0, 
      `NEXT_TASK_ID` varchar(64), 
      `ADDSIGN_TYPE` varchar(64),
      PRIMARY KEY(`ID`)
   );
 
  CREATE TABLE `FOXBPM_RUN_TASKIDENTITYLINK` 
   (	
      `ID` varchar(64) NOT NULL, 
      `TYPE` varchar(64) DEFAULT NULL, 
      `USER_ID` varchar(64) DEFAULT NULL, 
      `GROUP_ID` varchar(64) DEFAULT NULL, 
      `GROUP_TYPE` varchar(64) DEFAULT NULL, 
      `TASK_ID` varchar(64) DEFAULT NULL, 
      `INCLUDE_EXCLUSION` varchar(64) DEFAULT NULL,
      PRIMARY KEY(`ID`)
   );
 
  CREATE TABLE `FOXBPM_RUN_TOKEN` 
   (	
      `ID` varchar(64) NOT NULL, 
      `NAME` varchar(64) DEFAULT NULL, 
      `PROCESSINSTANCE_ID` varchar(64) DEFAULT NULL, 
      `NODE_ID` varchar(128) DEFAULT NULL, 
      `PARENT_ID` varchar(64) DEFAULT NULL, 
      `START_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `END_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `NODEENTER_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `ARCHIVE_TIME` TIMESTAMP NULL DEFAULT NULL, 
      `ISSUSPENDED` varchar(64) DEFAULT NULL, 
      `ISLOCK` varchar(64) DEFAULT NULL, 
      `ISACTIVE` varchar(64) DEFAULT NULL, 
      `ISSUBPROCESSROOTTOKEN` varchar(64) DEFAULT NULL, 
      `REV_` decimal(12,0) DEFAULT 0, 
      `LOOP_COUNT` decimal(12,0),
      PRIMARY KEY(`ID`)
   );

  CREATE TABLE `FOXBPM_RUN_VARIABLE` 
   (	
      `ID` varchar(64) NOT NULL, 
      `PROCESSINSTANCE_ID` varchar(64) DEFAULT NULL, 
      `PROCESSDEFINITION_ID` varchar(255) DEFAULT NULL, 
      `PROCESSDEFINITION_KEY` varchar(255) DEFAULT NULL, 
      `VARIABLE_KEY` varchar(64) DEFAULT NULL, 
      `VARIABLE_VALUE` BLOB, 
      `CLASSNAME` varchar(64) DEFAULT NULL, 
      `TASK_ID` varchar(64) DEFAULT NULL, 
      `TOKEN_ID` varchar(64) DEFAULT NULL, 
      `NODE_ID` varchar(512) DEFAULT NULL, 
      `VARIABLE_TYPE` varchar(45) DEFAULT NULL, 
      `BIZ_DATA` varchar(2048) DEFAULT NULL, 
      `REV_` decimal(12,0) DEFAULT 0,
      PRIMARY KEY(`ID`)
   );
  
   CREATE TABLE `FOXBPM_RUN_PROCESS_INFO`
   (
      `PROCESSINSTANCEID` varchar(64 ) NOT NULL, 
      `UPDATE_TIME` TIMESTAMP, 
      `PROCESS_STATUS` varchar(64 ), 
      `PROCESS_STEP` varchar(256 ),
      `INITATOR` varchar(64 ), 
      `BIZKEY` varchar(64 ), 
      PRIMARY KEY (`PROCESSINSTANCEID`)
   );
  
  CREATE TABLE `QRTZ_BLOB_TRIGGERS` 
   (	
       `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `BLOB_DATA` BLOB
   );
  CREATE UNIQUE INDEX `SYS_C009109` ON `QRTZ_BLOB_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  ALTER TABLE `QRTZ_BLOB_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`); 
  
    
  CREATE TABLE `QRTZ_CALENDARS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `CALENDAR_NAME` varchar(200) NOT NULL, 
      `CALENDAR` BLOB NOT NULL
   );
  CREATE UNIQUE INDEX `SYS_C009114` ON `QRTZ_CALENDARS` (`SCHED_NAME`, `CALENDAR_NAME`);
  ALTER TABLE `QRTZ_CALENDARS` ADD PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`); 
  
  CREATE TABLE `QRTZ_CRON_TRIGGERS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `CRON_EXPRESSION` varchar(120) NOT NULL, 
      `TIME_ZONE_ID` varchar(80)
   );
  CREATE UNIQUE INDEX `SYS_C009099` ON `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);  
  ALTER TABLE `QRTZ_CRON_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`); 
 
  CREATE TABLE `QRTZ_FIRED_TRIGGERS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `ENTRY_ID` varchar(95) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `INSTANCE_NAME` varchar(200) NOT NULL, 
      `FIRED_TIME` decimal(13,0) NOT NULL, 
      `PRIORITY` decimal(13,0) NOT NULL, 
      `STATE` varchar(16) NOT NULL, 
      `JOB_NAME` varchar(200), 
      `JOB_GROUP` varchar(200), 
      `IS_NONCONCURRENT` varchar(1), 
      `REQUESTS_RECOVERY` varchar(1)
   );
  CREATE INDEX `IDX_QRTZ_FT_JG` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `JOB_GROUP`);
  CREATE INDEX `IDX_QRTZ_FT_T_G` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`); 
  CREATE INDEX `IDX_QRTZ_FT_TG` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`); 
  CREATE UNIQUE INDEX `SYS_C009126` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `ENTRY_ID`); 
  CREATE INDEX `IDX_QRTZ_FT_TRIG_INST_NAME` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `INSTANCE_NAME`); 
  CREATE INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`); 
  CREATE INDEX `IDX_QRTZ_FT_J_G` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);  
  ALTER TABLE `QRTZ_FIRED_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`); 
  
  CREATE TABLE `QRTZ_JOB_DETAILS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `JOB_NAME` varchar(200) NOT NULL, 
      `JOB_GROUP` varchar(200) NOT NULL, 
      `DESCRIPTION` varchar(250), 
      `JOB_CLASS_NAME` varchar(250) NOT NULL, 
      `IS_DURABLE` varchar(1) NOT NULL, 
      `IS_NONCONCURRENT` varchar(1) NOT NULL, 
      `IS_UPDATE_DATA` varchar(1) NOT NULL, 
      `REQUESTS_RECOVERY` varchar(1) NOT NULL, 
      `JOB_DATA` BLOB
   );
  CREATE INDEX `IDX_QRTZ_J_REQ_RECOVERY` ON `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `REQUESTS_RECOVERY`);  
  CREATE INDEX `IDX_QRTZ_J_GRP` ON `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_GROUP`);  
  CREATE UNIQUE INDEX `SYS_C009076` ON `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);  
  ALTER TABLE `QRTZ_JOB_DETAILS` ADD PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`); 

  CREATE TABLE `QRTZ_LOCKS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `LOCK_NAME` varchar(40) NOT NULL
   );
  CREATE UNIQUE INDEX `SYS_C009134` ON `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`);  
  ALTER TABLE `QRTZ_LOCKS` ADD PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`); 

  CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL
   );
  CREATE UNIQUE INDEX `SYS_C009117` ON `QRTZ_PAUSED_TRIGGER_GRPS` (`SCHED_NAME`, `TRIGGER_GROUP`);  
  ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`);
   
  CREATE TABLE `QRTZ_SCHEDULER_STATE` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `INSTANCE_NAME` varchar(200) NOT NULL, 
      `LAST_CHECKIN_TIME` decimal(13,0) NOT NULL, 
      `CHECKIN_INTERVAL` decimal(13,0) NOT NULL
   );
  CREATE UNIQUE INDEX `SYS_C009131` ON `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`);
  ALTER TABLE `QRTZ_SCHEDULER_STATE` ADD PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`); 
  
  CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `REPEAT_COUNT` decimal(7,0) NOT NULL, 
      `REPEAT_INTERVAL` decimal(12,0) NOT NULL, 
      `TIMES_TRIGGERED` decimal(10,0) NOT NULL
   );
  CREATE UNIQUE INDEX `SYS_C009093` ON `QRTZ_SIMPLE_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`); 
  
  CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `STR_PROP_1` varchar(512), 
      `STR_PROP_2` varchar(512), 
      `STR_PROP_3` varchar(512), 
      `INT_PROP_1` decimal(10,0), 
      `INT_PROP_2` decimal(10,0), 
      `LONG_PROP_1` decimal(13,0), 
      `LONG_PROP_2` decimal(13,0), 
      `DEC_PROP_1` decimal(13,4), 
      `DEC_PROP_2` decimal(13,4), 
      `BOOL_PROP_1` varchar(1), 
      `BOOL_PROP_2` varchar(1)
   );
  CREATE UNIQUE INDEX `SYS_C009104` ON `QRTZ_SIMPROP_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);  
  ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);  
  
  CREATE TABLE `QRTZ_TRIGGERS` 
   (	
      `SCHED_NAME` varchar(120) NOT NULL, 
      `TRIGGER_NAME` varchar(200) NOT NULL, 
      `TRIGGER_GROUP` varchar(200) NOT NULL, 
      `JOB_NAME` varchar(200) NOT NULL, 
      `JOB_GROUP` varchar(200) NOT NULL, 
      `DESCRIPTION` varchar(250), 
      `NEXT_FIRE_TIME` decimal(13,0), 
      `PREV_FIRE_TIME` decimal(13,0), 
      `PRIORITY` decimal(13,0), 
      `TRIGGER_STATE` varchar(16) NOT NULL, 
      `TRIGGER_TYPE` varchar(8) NOT NULL, 
      `START_TIME` decimal(13,0) NOT NULL, 
      `END_TIME` decimal(13,0), 
      `CALENDAR_NAME` varchar(200), 
      `MISFIRE_INSTR` decimal(2,0), 
      `JOB_DATA` BLOB
   );
  CREATE INDEX `IDX_QRTZ_T_J` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);
  CREATE INDEX `IDX_QRTZ_T_JG` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `JOB_GROUP`);  
  CREATE INDEX `IDX_QRTZ_T_C` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `CALENDAR_NAME`);  
  CREATE INDEX `IDX_QRTZ_T_G` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`);  
  CREATE INDEX `IDX_QRTZ_T_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_STATE`);  
  CREATE INDEX `IDX_QRTZ_T_N_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);  
  CREATE INDEX `IDX_QRTZ_T_N_G_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);  
  CREATE INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `NEXT_FIRE_TIME`);  
  CREATE INDEX `IDX_QRTZ_T_NFT_ST` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`);  
  CREATE INDEX `IDX_QRTZ_T_NFT_MISFIRE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`); 
  CREATE INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`); 
  CREATE INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);  
  CREATE UNIQUE INDEX `SYS_C009085` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  ALTER TABLE `QRTZ_TRIGGERS` ADD PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`); 
  ALTER TABLE `QRTZ_TRIGGERS` ADD FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
	  REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);
  ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ADD FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
	  REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ADD FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
	  REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
   ALTER TABLE `QRTZ_CRON_TRIGGERS` ADD FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
	  REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  ALTER TABLE `QRTZ_BLOB_TRIGGERS` ADD FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
	  REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);
  CREATE TABLE `TB_EXPENSE` 
   (	
      `ID` varchar(64) NOT NULL, 
      `OWNER` varchar(64), 
      `DEPT` varchar(64), 
      `ACCOUNT` decimal, 
      `INVOICETYPE` varchar(64), 
      `REASON` varchar(252), 
      `CREATE_TIME` varchar(64), 
      `PROCESSINSTANCEID` varchar(64), 
      PRIMARY KEY (`ID`)
   );  
Insert into AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('2000','2000','**公司');
Insert into AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('20001','2000','ERP技术中心');
Insert into AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('200011','20001','研发部');
Insert into AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('200012','20001','市场部'); 
Insert into AU_ROLEINFO (ROLEID,ROLENAME) values ('10001','总经理');
Insert into AU_ROLEINFO (ROLEID,ROLENAME) values ('10002','秘书'); 
Insert into AU_GROUP_RELATION (GUID,USERID,GROUPID,GROUPTYPE) values ('100000000000004','admin','200012','dept');
Insert into AU_GROUP_RELATION (GUID,USERID,GROUPID,GROUPTYPE) values ('100000000000003','admin','200011','dept');
Insert into AU_USERINFO (USERID,USERNAME,PASSWORD,EMAIL,TEL,IMAGE) values ('admin','超级管理员','1','84989979@qq.com','ddxx','admin.jpg');