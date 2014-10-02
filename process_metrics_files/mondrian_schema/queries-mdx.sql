
-- JOBS

WITH
 SET JOBS AS FILTER([Jobs and Tasks].[Task ID].Members, [Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Type') = 'job') 
 SET METRICS AS HIERARCHIZE({{[Hadoop Metrics].[Hadoop Metric Group].Members}, {[Hadoop Metrics].[Hadoop Metric Name].Members}})
 SET MEASURES AS {[Measures].[Job Name], [Measures].[Username], [Measures].[Status], [Measures].[Start Time], [Measures].[Finish Time], [Measures].[Spent Time]}
 MEMBER [Measures].[Subtype] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Subtype]).NAME
 MEMBER [Measures].[Type] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Type]).NAME
 MEMBER [Measures].[Job Name] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Job Name'),'')
 MEMBER [Measures].[Username] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Username'),'')
 MEMBER [Measures].[Status] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Status'),'')
 MEMBER [Measures].[Start Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Start Time')) AS STRING), '')
 MEMBER [Measures].[Finish Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Finish Time')) AS STRING), '')
 MEMBER [Measures].[Spent Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Spent Time')) AS STRING), '')
SELECT
NON EMPTY MEASURES ON COLUMNS,
NON EMPTY JOBS ON ROWS
FROM [Inquiro - Hadoop Metrics]

-- Hadoop Metrics details

WITH
 MEMBER [Measures].[Measure] AS [Measures].[Average]+0
 SET TASKS AS FILTER([Jobs and Tasks].[Task ID].Members, [Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Type') = 'task')  
 SET METRICS AS FILTER({[Hadoop Metrics].[Hadoop Metric Group].Members, [Hadoop Metrics].[Hadoop Metric Name].Members}, [Hadoop Metrics].CURRENTMEMBER.LEVEL.NAME <> 'Hadoop Metric Group')
 SET MEASURES AS {[Measures].[Measure], [Measures].[Hostname], [Measures].[Username], [Measures].[Status], [Measures].[Start Time], [Measures].[Finish Time], [Measures].[Spent Time], [Measures].[Job Name], [Measures].[Parent Job ID], [Measures].[Type], [Measures].[Subtype], [Measures].[Metric Name], [Measures].[Metric Unit]}
 MEMBER [Measures].[Subtype] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Subtype]).NAME
 MEMBER [Measures].[Type] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Type]).NAME
 MEMBER [Measures].[Metric Name] AS [Hadoop Metrics].CURRENTMEMBER.PARENT.NAME
 MEMBER [Measures].[Metric Unit] AS [Hadoop Metrics].CURRENTMEMBER.NAME
 MEMBER [Measures].[Parent Job ID] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Parent Job ID'),'')
 MEMBER [Measures].[Job Name] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Job Name'),'')
 MEMBER [Measures].[Hostname] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Hostname'),'')
 MEMBER [Measures].[Username] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Username'),'')
 MEMBER [Measures].[Status] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Status'),'')
 MEMBER [Measures].[Start Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Start Time')) AS STRING), '')
 MEMBER [Measures].[Finish Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Finish Time')) AS STRING), '')
 MEMBER [Measures].[Spent Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Spent Time')) AS STRING), '')
SELECT
 NON EMPTY MEASURES ON COLUMNS,
 NON EMPTY TASKS * METRICS ON ROWS
FROM [Inquiro - Hadoop Metrics]

-- PDI Metrics details

WITH
 MEMBER [Measures].[Measure] AS [Measures].[Average]+0
 SET TASKS AS FILTER([Jobs and Tasks].[Task ID].Members, [Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Type') = 'task')  SET STEPS AS {[PDI Steps.Steps].[Step Type].Members}
 SET METRICS AS HIERARCHIZE({[PDI Metrics].[Metric Name].Members})
 SET MEASURES AS {[Measures].[Measure], [Measures].[Hostname], [Measures].[Username], [Measures].[Status], [Measures].[Start Time], [Measures].[Finish Time], [Measures].[Spent Time], [Measures].[Job Name], [Measures].[Parent Job Task ID], [Measures].[Type], [Measures].[Subtype]}
 MEMBER [Measures].[Subtype] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Subtype]).NAME
 MEMBER [Measures].[Type] AS ANCESTOR([Jobs and Tasks].CURRENTMEMBER, [Jobs and Tasks].[Type]).NAME
 MEMBER [Measures].[Parent Job Task ID] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Parent Job ID'),'')
 MEMBER [Measures].[Job Name] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Job Name'),'')
 MEMBER [Measures].[Hostname] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Hostname'),'')
 MEMBER [Measures].[Username] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Username'),'')
 MEMBER [Measures].[Status] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID',[Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Status'),'')
 MEMBER [Measures].[Start Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Start Time')) AS STRING), '')
 MEMBER [Measures].[Finish Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Finish Time')) AS STRING), '')
 MEMBER [Measures].[Spent Time] AS IIF([Jobs and Tasks].LEVEL.NAME='Task ID', CAST(([Jobs and Tasks].[Task ID].CURRENTMEMBER.PROPERTIES('Spent Time')) AS STRING), '')
SELECT
 NON EMPTY MEASURES ON COLUMNS,
 NON EMPTY TASKS * STEPS *  METRICS ON ROWS
FROM [Inquiro - PDI Metrics]