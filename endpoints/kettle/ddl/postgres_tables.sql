BEGIN;

DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date (
  date_tk int DEFAULT NULL,
  date_field timestamp(0) DEFAULT NULL,
  ymd varchar(10),
  ym varchar(10),
  year int DEFAULT NULL,
  quarter int DEFAULT NULL,
  quarter_code varchar(10),
  month int DEFAULT NULL,
  month_desc varchar(10),
  month_code varchar(10),
  day int DEFAULT NULL,
  day_of_year int DEFAULT NULL,
  day_of_week int DEFAULT NULL,
  day_of_week_desc varchar(10),
  day_of_week_code varchar(10),
  week int DEFAULT NULL
) ;

DROP TABLE IF EXISTS dim_hadoop_metrics;
CREATE TABLE dim_hadoop_metrics (
  hadoop_metric_id int NOT NULL,
  version int DEFAULT NULL,
  date_from timestamp(0) DEFAULT NULL,
  date_to timestamp(0) DEFAULT NULL,
  hadoop_metric_group varchar(40) DEFAULT NULL,
  hadoop_metric_name varchar(40) DEFAULT NULL,
  hadoop_metric_desc varchar(80) DEFAULT NULL,
  PRIMARY KEY (hadoop_metric_id)
) ;

CREATE INDEX idx_dim_hadoop_metrics_lookup ON dim_hadoop_metrics (hadoop_metric_group,hadoop_metric_name);

DROP TABLE IF EXISTS dim_jobs_and_tasks;
CREATE TABLE dim_jobs_and_tasks (
  type varchar(10) NOT NULL,
  subtype varchar(10) NOT NULL,
  hadoop_id varchar(50) NOT NULL,
  parent_hadoop_id varchar(50) DEFAULT NULL,
  hadoop_attempt_id varchar(50) DEFAULT NULL,
  groupname varchar(50) DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  priority varchar(20) DEFAULT NULL,
  username varchar(20) DEFAULT NULL,
  start_time varchar(30) DEFAULT NULL,
  finish_time varchar(30) DEFAULT NULL,
  spent_time bigint DEFAULT NULL,
  hostname varchar(30) DEFAULT NULL
) ;

DROP TABLE IF EXISTS dim_jobs_and_tasks_closure;
CREATE TABLE dim_jobs_and_tasks_closure (
  parent_hadoop_id varchar(40) DEFAULT NULL,
  hadoop_id varchar(40) DEFAULT NULL,
  level int DEFAULT NULL
) ;

DROP TABLE IF EXISTS dim_pdi_metrics;
CREATE TABLE dim_pdi_metrics (
  pdi_metric_id int DEFAULT NULL,
  pdi_metric_name varchar(40) DEFAULT NULL,
  CONSTRAINT idx_dim_pdi_metrics_pk UNIQUE  (pdi_metric_id)
) ;

CREATE INDEX idx_dim_pdi_metrics_lookup ON dim_pdi_metrics (pdi_metric_name);

DROP TABLE IF EXISTS dim_steps;
CREATE TABLE dim_steps (
  step_type_id bigint NOT NULL,
  step_type varchar(30) DEFAULT NULL,
  PRIMARY KEY (step_type_id),
  CONSTRAINT idx_dim_steps_pk UNIQUE  (step_type_id)
) ;

DROP TABLE IF EXISTS dim_time;
CREATE TABLE dim_time (
  time_tk varchar(10),
  hms varchar(10),
  hm varchar(10),
  ampm varchar(10),
  hour int DEFAULT NULL,
  hour12 int DEFAULT NULL,
  minute int DEFAULT NULL,
  second int DEFAULT NULL
) ;

DROP TABLE IF EXISTS fact_hadoop_metrics;
CREATE TABLE fact_hadoop_metrics (
  type varchar(10) DEFAULT NULL,
  hadoop_job_id varchar(50) DEFAULT NULL,
  hadoop_task_id varchar(50) DEFAULT NULL,
  hadoop_id_start_date varchar(20) DEFAULT NULL,
  hadoop_id_start_time varchar(20) DEFAULT NULL,
  hadoop_metric_id int DEFAULT NULL,
  value bigint DEFAULT NULL
) ;

DROP TABLE IF EXISTS fact_pdi_metrics;
CREATE TABLE fact_pdi_metrics (
  hadoop_task_id varchar(50) DEFAULT NULL,
  step_type_id int DEFAULT NULL,
  duration int DEFAULT NULL,
  hadoop_id_start_date varchar(20) DEFAULT NULL,
  hadoop_id_start_time varchar(20) DEFAULT NULL,
  pdi_metric_id int DEFAULT NULL,
  value int DEFAULT NULL
) ;

COMMIT;
