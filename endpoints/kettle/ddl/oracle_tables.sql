ALTER SESSION SET CURRENT_SCHEMA = Inquiro;
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_date';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_date (
  date_tk number(10) DEFAULT NULL,
  date_field timestamp(0) DEFAULT NULL,
  ymd varchar2(10),
  ym varchar2(10),
  year number(10) DEFAULT NULL,
  quarter number(10) DEFAULT NULL,
  quarter_code varchar2(10),
  month number(10) DEFAULT NULL,
  month_desc varchar2(10),
  month_code varchar2(10),
  day number(10) DEFAULT NULL,
  day_of_year number(10) DEFAULT NULL,
  day_of_week number(10) DEFAULT NULL,
  day_of_week_desc varchar2(10),
  day_of_week_code varchar2(10),
  week number(10) DEFAULT NULL
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_hadoop_metrics';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_hadoop_metrics (
  hadoop_metric_id number(10) NOT NULL,
  version number(10) DEFAULT NULL,
  date_from timestamp(0) DEFAULT NULL,
  date_to timestamp(0) DEFAULT NULL,
  hadoop_metric_group varchar2(40) DEFAULT NULL,
  hadoop_metric_name varchar2(40) DEFAULT NULL,
  hadoop_metric_desc varchar2(80) DEFAULT NULL,
  PRIMARY KEY (hadoop_metric_id)
) ;

CREATE INDEX idx_dim_hadoop_metrics_lookup ON dim_hadoop_metrics (hadoop_metric_group,hadoop_metric_name);

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_jobs_and_tasks';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_jobs_and_tasks (
  type varchar2(10) NOT NULL,
  subtype varchar2(10) NOT NULL,
  hadoop_id varchar2(50) NOT NULL,
  parent_hadoop_id varchar2(50) DEFAULT NULL,
  hadoop_attempt_id varchar2(50) DEFAULT NULL,
  groupname varchar2(50) DEFAULT NULL,
  name varchar2(50) DEFAULT NULL,
  status varchar2(20) DEFAULT NULL,
  priority varchar2(20) DEFAULT NULL,
  username varchar2(20) DEFAULT NULL,
  start_time varchar2(30) DEFAULT NULL,
  finish_time varchar2(30) DEFAULT NULL,
  spent_time number(19) DEFAULT NULL,
  hostname varchar2(30) DEFAULT NULL
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_jobs_and_tasks_closure';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_jobs_and_tasks_closure (
  parent_hadoop_id varchar2(40) DEFAULT NULL,
  hadoop_id varchar2(40) DEFAULT NULL,
  level number(10) DEFAULT NULL
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_pdi_metrics';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_pdi_metrics (
  pdi_metric_id number(10) DEFAULT NULL,
  pdi_metric_name varchar2(40) DEFAULT NULL,
  CONSTRAINT idx_dim_pdi_metrics_pk UNIQUE  (pdi_metric_id)
) ;

CREATE INDEX idx_dim_pdi_metrics_lookup ON dim_pdi_metrics (pdi_metric_name);

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_steps';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_steps (
  step_type_id number(19) NOT NULL,
  step_type varchar2(30) DEFAULT NULL,
  PRIMARY KEY (step_type_id),
  CONSTRAINT idx_dim_steps_pk UNIQUE  (step_type_id)
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE dim_time';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE dim_time (
  time_tk varchar2(10),
  hms varchar2(10),
  hm varchar2(10),
  ampm varchar2(10),
  hour number(10) DEFAULT NULL,
  hour12 number(10) DEFAULT NULL,
  minute number(10) DEFAULT NULL,
  second number(10) DEFAULT NULL
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE fact_hadoop_metrics';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE fact_hadoop_metrics (
  type varchar2(10) DEFAULT NULL,
  hadoop_job_id varchar2(50) DEFAULT NULL,
  hadoop_task_id varchar2(50) DEFAULT NULL,
  hadoop_id_start_date varchar2(20) DEFAULT NULL,
  hadoop_id_start_time varchar2(20) DEFAULT NULL,
  hadoop_metric_id number(10) DEFAULT NULL,
  value number(19) DEFAULT NULL
) ;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE fact_pdi_metrics';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE fact_pdi_metrics (
  hadoop_task_id varchar2(50) DEFAULT NULL,
  step_type_id number(10) DEFAULT NULL,
  duration number(10) DEFAULT NULL,
  hadoop_id_start_date varchar2(20) DEFAULT NULL,
  hadoop_id_start_time varchar2(20) DEFAULT NULL,
  pdi_metric_id number(10) DEFAULT NULL,
  value number(10) DEFAULT NULL
) ;
