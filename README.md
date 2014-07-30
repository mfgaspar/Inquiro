BIG DATA PERFORMANCE STAT
===


#Overview 

This pugin can be use to monitor the performance of the transformations and jobs running inside Hadoop Mapreduce.  It will grab the stats from PDI transformations and from Hadoop counters and write log files that go under ETL process writing them to a datawarehouse for use to be able to do query on top of. 
There is a mondrain schema already pre-builded that let you use to build reports with Analyzer and Report Designer or build amaizing dashboards.  
...

#Instructions for use


## Replace some .jar files on PDI Libs


There is a bug when exposing some internal variables on the reducer. 
To fix that problem replace the .jar files that are place in fixed-jars folder. You sould use the files depending on the Hadoop distribution and version that you are using.
For innstance if you are using Cloudera 4.2 you should replace pentaho-hadoop-shims*.jars inside PDI by the following ones:

- pentaho-hadoop-shims-cdh42-hbase-comparators-TRUNK-SNAPSHOT.jar
- pentaho-hadoop-shims-cdh42-mapred-TRUNK-SNAPSHOT.jar
- pentaho-hadoop-shims-cdh42-TRUNK-SNAPSHOT.jar



## Create Jobs/transformations to run on Hadoop Mapreduce

Follow the instructions and looking to the samples inside <b>hadoop-sample-files</b> folder

- Create your jobs/transformations to run under hadoop;
- Your job must set the following variables:

![image](screen-shots/stepsTransformations.png)

- Fo each of the transformations running as mapper, combinar or reducer add the following steps. You may copy the steps from the samples. Edit the Return Step Metrics, remove the lines and click "Get Steps" and save. Those steps must be the ones from where you want to get stats. 

![image](screen-shots/setVariables.png)

- At the end of your PDI Job include "capture_hadoop_metrics.ktr the the transformation to get the hadoop stats. You can just use the one on the samples in hadoop-sample-files folder. 

NOTES: transformations will be written to HDFS folders. You may need to change the values from the used variables.

## Database

Install/start MySql database;
Run the script "bigmet.sql" inside db_scripts folders (it will create the database needed to store the data to query)

## Create connection to database

- Goto PUC and add a new JDBC datasource to the database we have created on the last point.

## Upload mondrian schema 

- Now you need to add an Analysis Datasource and upload the mondrian schema file named bigmet.mondrian.xml under the folder mondrain_schema to your Pentaho BA Server.

## Copy the stats files created on HDFS 

- Download the stats log folder created on HDFS. Use the command line to download full folder. NOTE: this will be changed to get files directly from HDFS.

	Usage: hadoop fs -cp URI [URI …] <dest>

	Copy files from source to destination. This command allows multiple 	sources as well in which case the destination must be a directory. 
	Example:		

	hadoop fs -cp /user/hadoop/file1 /user/hadoop/file2
	hadoop fs -cp /user/hadoop/file1 /user/hadoop/file2 /user/hadoop/dir


- Place the files inside the folder process_metrics_files/process_metrics/logs.
- Using PDI, run the job named process_metrics.kjb and wait until finish.


## Create reports

- You should now be able to build reports and dashboards using the datasource created earlier. 

#Dependencies

#Future Work

- Change Process Metrics to get the files directly from HDFS. Set a variable with the path.
- Users shouls be able to choose the database to use between (MySQL, Postgres and Oracle). Create the scripts for Postgres and Oracle.
- Create dashboards:
	- Timeline (http://timeline.knightlab.com/)
	- Comparator (compare multiple jobs/tasks)
	- Links to the hadoop logs file (to leverage the process of development and debug)
	- 