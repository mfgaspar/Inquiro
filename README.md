INQUIRO - BIG DATA PERFORMANCE STATS
===


#Overview 

The Inquiro it's a Pentaho plugin built on top of Sparkl to make possible analysis from operational metrics involving Hadoop and Pentaho Big Data technology. It's main purpose is to monitor the performance of Pentaho Data Integration (PDI) jobs and transformations running on Hadoop Mapreduce . It will grab the stats from PDI (Pentaho Data Integration) transformations and from Hadoop Counters , building a datawarehouse to use within Pentaho . It's possible to open the pre-built analysis reports and dashboards and analyse the metrics related with jobs and tasks . An interesting feature is the ability of having the metrics for each of the jobs and tasks, which makes possible to establish relations between the metrics coming from Hadoop and PDI metrics. 

![Inquiro Diagram](docs/Inquiro.png =700x)


#Requirements and Compatibility

This plugin was built and tested against Pentaho 5.X

As most of the other Sparkl plugins, it also requires CDE, CDA and CDF. Make sure that you have updated versions of these plugins when you install Inquiro.


#Instructions for use

## Install the plugin 

### Steps to install 

- Copy the entire Inquiro folder to your pentaho-solution/system folder. 
- Restart Pentaho BA Server. 
- Open the link http://localhost:8080/pentaho/plugin/Inquiro/api/setup
- Just change the settings that you need to change, about the following 4 sections:
	- Database (setting for the database to be used);
	- BA Server (settings of BA Server);
	- Hadoop Namenode (settings to connect to the hadoop namenode);
	- Hadoop Jobtracker (settings to connect to the jobtracker). 
- On the bottom of the page click on the button "Setup".
- Just goto the dashboard using the following ]link: )http://localhost:8080/pentaho/plugin/Inquiro/api/timeline or create an analyzer report.

### Sample data 

You you want to see the report and use the Datasourses, there are sample data available. Just need to choose "filesystem" on "Read metrics from" property and click the button "Process Metrics" to import sample data. You should get a success message.

### Available Datasources 

The installation of the plugin will make available two cubes named PDI Metrics and Hadoop Metrics in you Pentaho instance. Will also make available some analysis reports on Public/Inquiro folder (to see the files you may need to refresh your  pentaho repository solution).

## Aquire PDI Metrics 

Please see the sample transformations available at <b>[this link](https://github.com/mfgaspar/Inquiro-project/tree/master/hadoop_sample_files/get_hadoop_metrics)</b>.

You will need to create Jobs/transformations to run on Hadoop, You will nedd to add some extra steps to aquire metrics from PDI and Hadoop.

Follow the instructions bellow 
- Create your jobs/transformations to run under hadoop;
- Set the variable that you need;
- For each of the transformations running as mapper, combinar or reducer add the following steps. You may copy the steps from the samples. Edit the Return Step Metrics, remove the lines and click "Get Steps" and save. Those steps must be the ones from where you want to get stats. 
- At the end of your PDI Job include "capture_hadoop_metrics.ktr the the transformation to get the hadoop stats. You can just use the one on the samples in hadoop-sample-files folder. 

## Replace shims with a fixed version

There is a bug on Pentaho-hadoop-shims when exposing some internal variables on the combinares and reducers. To fix that problem replace the .jar files that are place in pentaho-hadoop-shims folder. You sould use the files depending on the Hadoop distribution and version that you are using. Fixed shims can be found [here](https://github.com/mfgaspar/Inquiro-project/tree/master/pentaho_hadoop_shims)

[JIRA case](http://jira.pentaho.com/browse/PDI-13557)

[Pull Request](https://github.com/mfgaspar/pentaho-hadoop-shims/commit/9c7ec2b934b4b832feacb9a97e13cd4b44994ec7)

#Future Work

- Create analyzer reports to show detailed metrics for each task. A link will redirect to the report. 
- Dashboards:
	- Comparator (compare multiple jobs/tasks)
	- Links to the hadoop logs file (to leverage the process of development and debug)
- Rewrite ETL to be cleaner and faster.
