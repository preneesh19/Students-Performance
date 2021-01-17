-- Preneesh Puvanarajah
-- Student Math Performance Analysis Using SQL


-- Got rid of columns that will not be used in the analysis and put in to another table
SELECT 
	[gender],
	[parental_level_of_education],
	[lunch],
	[test_preparation_course],
	[math_score]
INTO [Student Performance]
FROM [dbo].[StudentsPerformance];

-- Added columns for grade and row number column
SELECT *,
	CASE 
		WHEN math_score BETWEEN 0 AND 59 THEN 'F'
		WHEN math_score BETWEEN 60 AND 69 THEN 'D'
		WHEN math_score BETWEEN 70 AND 79 THEN 'C'
		WHEN math_score BETWEEN 80 AND 89 THEN 'B'
		ELSE 'A'
	END AS [Grade],
	ROW_NUMBER()
		OVER (ORDER BY [math_score] DESC)
		AS [Row Number]
INTO [Students Math Performance]
FROM [Student Performance];	


-- Get average math score by education
SELECT *,
	AVG([math_score]) 
		OVER (PARTITION BY [parental_level_of_education]
				ORDER BY [math_score])
		AS [Math Running Average By Education]
FROM [Students Math Performance];	



-- Average and standard deviation math score by lunch
SELECT 
	[lunch],
	AVG([math_score]) AS [Average Math Score],
	ROUND(STDEV([math_score]),2) AS [Standard Deviation]
FROM [Students Math Performance]
GROUP BY [lunch];	


-- How many people got a passing grade by gender
SELECT	
	[gender],
	COUNT([math_score]) AS [Passing]
FROM [Students Math Performance]
WHERE [math_score] >= 70
GROUP BY [gender];	


-- Average and standard deviation by test prep
SELECT 
	[test_preparation_course],
	AVG([math_score]) AS [Average Math Score],
	ROUND(STDEV([math_score]),2) AS [Standard Deviation]
FROM [Students Math Performance]
GROUP BY [test_preparation_course];	


-- Finding count of people for each grade by gender and how many people took exam by gender, lowest and
-- highest grade by gender, average score and standard deviation by gender
SELECT
	[gender],
	SUM(CASE WHEN math_score BETWEEN 90 AND 100 THEN 1 END) AS [A Total],
	SUM(CASE WHEN math_score BETWEEN 80 AND 89 THEN 1 END) AS [B Total],
	SUM(CASE WHEN math_score BETWEEN 70 AND 79 THEN 1 END) AS [C Total],
	SUM(CASE WHEN math_score BETWEEN 60 AND 69 THEN 1 END) AS [D Total],
	SUM(CASE WHEN math_score BETWEEN 0 AND 59 THEN 1 END) AS [F Total],
	COUNT(*) AS [Total],
	MIN([math_score]) AS [Lowest Score],
	MAX([math_score]) AS [Highest Score],
	AVG([math_score]) AS [Average Math Score],
	ROUND(STDEV([math_score]),2) AS [Standard Deviation]
FROM [Students Math Performance]
GROUP BY [gender];	













