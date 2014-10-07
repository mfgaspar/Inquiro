INQUIRO - BIG DATA PERFORMANCE STATS
===


#Overview 

The Inquiro it's a PEntaho plugin build on top of Sparkl (http://community.pentaho.com/projects/sparkl/) and it's main purpose is to monitor the performance of the transformations and jobs running inside Hadoop Mapreduce. It will grab the stats from PDI (Pentaho Data Integration) transformations and also grab info from Hadoop Counters. This data will processed to build a datawarehouse to use whitin Pentaho.

It's possible to open the prebuilded analysis reports and dashboards and analyse the metrics related with jobs and tasks. One intereting feature is the ability of having the metrics for each of the jobs and tasks, wich makes possible to establish relations between the metrics comming from haddop and the metrics from PDI. 

There is a mondrain schema already builded that let you use to build your own reports.  


#Requirements and Compatibility

This plugin was built and tested against Pentaho 5.X

As most of the other Sparkl plugins, it also requires CDE, CDA and CDF. Make sure that you have updated versions of these plugins when you install Inquiro. You can use Pentaho Marketplace install/update/uninstall them.

#Instructions for use

## Install the plugin 

- Copy your plugin/Inquiro folder into your pentaho-solution/system folder. Restart the server. 
- Open the link http://localhost:8080/pentaho/plugin/Inquiro/api/setup to install the rest to run the setup of the plugin. 
- Just change the settings that you need to change, about the following 4 sections:

	- Database (setting for the database to be used);
	- BA Server (settings of BA Server);
	- Hadoop Namenode (settings to connect to the hadoop namenode);
	- Hadoop Jobtracker (settings to connect to the jobtracker). 

- Click on Setup Plugin button and you should get a success message at the right side of the button.

There are some sample data available on the plugin. To use them set "filesystem" on "Read metrics from" property and click the "Process Metrics" button. You should get a success message.

The installation of the plugin will make available two cubes named PDI Metrics and Hadoop Metrics in you Pentaho instance. Will also make available some analysis reports on Public/Inquiro folder (to see the files you may need to refresh your  pentaho repository solution).

You have also available a CDE dashboard using the following link: http://localhost:8080/pentaho/plugin/Inquiro/api/timeline.



## Replace some .jar files for your PDI libraries

There is a bug on Pentaho-hadoop-shims when exposing some internal variables on the reducers, when running Map-reduce tasks. To fix that problem replace the .jar files that are place in pentaho-hadoop-shims folder. You sould use the files depending on the Hadoop distribution and version that you are using.
For innstance if you are using Cloudera 4.2 you should replace pentaho-hadoop-shims*.jars inside PDI by the following ones:

- pentaho-hadoop-shims-cdh42-hbase-comparators-TRUNK-SNAPSHOT.jar
- pentaho-hadoop-shims-cdh42-mapred-TRUNK-SNAPSHOT.jar
- pentaho-hadoop-shims-cdh42-TRUNK-SNAPSHOT.jar

## Create Jobs/transformations to run on Hadoop Mapreduce

Follow the instructions and looking to the samples inside <b>hadoop-sample-files</b> folder

- Create your jobs/transformations to run under hadoop;
- Set the variable that you need;
- Fo each of the transformations running as mapper, combinar or reducer add the following steps. You may copy the steps from the samples. Edit the Return Step Metrics, remove the lines and click "Get Steps" and save. Those steps must be the ones from where you want to get stats. 
- At the end of your PDI Job include "capture_hadoop_metrics.ktr the the transformation to get the hadoop stats. You can just use the one on the samples in hadoop-sample-files folder. 

#Future Work

- Change Process Metrics to get the files directly from HDFS. Set a variable with the path. <b>DONE</b>
- Users shouls be able to choose the database to use between (MySQL, Postgres and Oracle).  <b>DONE</b>
- Create dashboards:
	- Timeline (http://timeline.knightlab.com/)  <b>REVAMP</b>
	- Comparator (compare multiple jobs/tasks)
	- Links to the hadoop logs file (to leverage the process of development and debug)
