USE `Inquiro`;

DROP TABLE IF EXISTS `dim_date`;
CREATE TABLE `dim_date` (
  `date_tk` int(11) DEFAULT NULL,
  `date_field` datetime DEFAULT NULL,
  `ymd` varchar(10),
  `ym` varchar(10),
  `year` int(11) DEFAULT NULL,
  `quarter` int(11) DEFAULT NULL,
  `quarter_code` varchar(10),
  `month` int(11) DEFAULT NULL,
  `month_desc` varchar(10),
  `month_code` varchar(10),
  `day` int(11) DEFAULT NULL,
  `day_of_year` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `day_of_week_desc` varchar(10),
  `day_of_week_code` varchar(10),
  `week` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_hadoop_metrics`;
CREATE TABLE `dim_hadoop_metrics` (
  `hadoop_metric_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `hadoop_metric_group` varchar(40) DEFAULT NULL,
  `hadoop_metric_name` varchar(40) DEFAULT NULL,
  `hadoop_metric_desc` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`hadoop_metric_id`),
  KEY `idx_dim_hadoop_metrics_lookup` (`hadoop_metric_group`,`hadoop_metric_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_jobs_and_tasks`;
CREATE TABLE `dim_jobs_and_tasks` (
  `type` varchar(10) NOT NULL,
  `subtype` varchar(10) NOT NULL,
  `hadoop_id` varchar(50) NOT NULL,
  `parent_hadoop_id` varchar(50) DEFAULT NULL,
  `hadoop_attempt_id` varchar(50) DEFAULT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `start_time` varchar(30) DEFAULT NULL,
  `finish_time` varchar(30) DEFAULT NULL,
  `spent_time` bigint(20) DEFAULT NULL,
  `hostname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_jobs_and_tasks_closure`;
CREATE TABLE `dim_jobs_and_tasks_closure` (
  `parent_hadoop_id` varchar(40) DEFAULT NULL,
  `hadoop_id` varchar(40) DEFAULT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_pdi_metrics`;
CREATE TABLE `dim_pdi_metrics` (
  `pdi_metric_id` int(11) DEFAULT NULL,
  `pdi_metric_name` varchar(40) DEFAULT NULL,
  UNIQUE KEY `idx_dim_pdi_metrics_pk` (`pdi_metric_id`),
  KEY `idx_dim_pdi_metrics_lookup` (`pdi_metric_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_steps`;
CREATE TABLE `dim_steps` (
  `step_type_id` bigint(20) NOT NULL,
  `step_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`step_type_id`),
  UNIQUE KEY `idx_dim_steps_pk` (`step_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dim_time`;
CREATE TABLE `dim_time` (
  `time_tk` varchar(10),
  `hms` varchar(10),
  `hm` varchar(10),
  `ampm` varchar(10),
  `hour` int(11) DEFAULT NULL,
  `hour12` int(11) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL,
  `second` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `fact_hadoop_metrics`;
CREATE TABLE `fact_hadoop_metrics` (
  `type` varchar(10) DEFAULT NULL,
  `hadoop_job_id` varchar(50) DEFAULT NULL,
  `hadoop_task_id` varchar(50) DEFAULT NULL,
  `hadoop_id_start_date` varchar(20) DEFAULT NULL,
  `hadoop_id_start_time` varchar(20) DEFAULT NULL,
  `hadoop_metric_id` int(11) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `fact_pdi_metrics`;
CREATE TABLE `fact_pdi_metrics` (
  `hadoop_task_id` varchar(50) DEFAULT NULL,
  `step_type_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `hadoop_id_start_date` varchar(20) DEFAULT NULL,
  `hadoop_id_start_time` varchar(20) DEFAULT NULL,
  `pdi_metric_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
