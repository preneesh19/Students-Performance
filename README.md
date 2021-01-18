# Students Math Performance Analysis

## **Preneesh Puvanarajah**

**Files Used** 

StudentsPerformance.csv - Original data that was taken from kaggle.

StudentsPerformance.sql - SQL file that contains the analysis/queries that was performed on the data.

Students Performance.pbix - Dashboard to visualize the findings using Power BI.

StudentsPerformanceDashboard.png - Picture of the dashboard.

**The Process**

Welcome to my first project with SQL and Power BI! Here I will be discussing how I went about my analysis, what I found, and how I displayed my findings. 

To give a little background, I had been teaching myself SQL through online courses and doing practice problems using various resources from the internet. After I had learned how to use SQL with Power BI, I decided it was time for me to start doing projects on my own to improve my skills. 

Through kaggle, I download a dataset that showcased students performance for math, reading, and writing. The dataset also included columns for gender, race, education, lunch, and test preparation. So through looking at this data, I was brainstorming questions for myself that I would want to find the answers to by writing queries in SQL. After I felt that I had asked enough questions that I wanted to find the answer to, I got started on writing queries.

When I imported the csv file to MS SQL Server, I had found that the math score column had the wrong data type and so I converted it from nvarchar(50) to int. Then I chose columns that I wanted to focus on for this particular analysis and using the INTO statement, I copied the columns to a new table. I had noticed that in this data there was not a grade column to show what grade each student had gotten and so I added column for grades using the CASE statement. So if a student scored a 50 on the exam the grade would be an F and if a student scored 88, the resulting grade would be B. I also added another column by utlizing the window function ROW_NUMBER() to numbers the rows by math score, highest to lowest. I had used INTO again to put the data in a new table so that I can write queries using this table which is called Students Math Performance.

I then proceeded to find the moving average math score by education by using AVG and PARTITION BY. Then I had found the average and standard deviation for the math score by lunch and test preparation. I also found how many people by gender had scored 70 and above by using COUNT. Finally, I found the grade distribution by math score, the lowest and highest score, the average and standard deviation by gender. 

From these queries, I had found many insights to the data. I found that from this particular data, the education level does not matter too much in terms of how well you do on the math exam. The highest average was for students with a master's degree with a 69.75 average and the lowest average was students that had only completed high school with a 62.14 average. Oddly enough the students that only had some high school as their education had a higher average at 63.50. Overrall the averages by education were very close to each other, with the biggest gap being students with some college as their education having a 67.13 average against students with some high school at 63.50. Whether the student had the standard lunch or the free/reduced lunch does matter in how well they performed on the test. Students with standard lunch had a 70 average with 13.65 standard deviation and students with free/reduced lunch had a 58 average with a 15.16 standard deviation. These results show that students that come from a wealthier family perform better and so more support is needed for students that have free/reduced lunch. Whether the student had prepared for the exam or not does matter and from the results, students that prepared had an average of 69, while the average for students that did not prepare had 64. Therefore, it is beneficial for the students to prepare for the exam. I had also found that out of the 1,000 test takers, 482 were male and 518 were female. From the average math score, the male average was higher than the female average. Both genders had the same highest score of 100 but males had a higher lowest score of 27, while the female lowest score was 0. From the grade distribution, only 35 males and 23 females had gotten an A and 126 males and 197 females had gotten an F. By gender, 231 males had scored 70 and above, while 178 females had scored 70 and above. From this data, it can be concluded that males performed better on the math exam than females.  

The queries were then imported into Power BI to visualize the data. Using the card, total male and female test takers, average male and female score is displayed at the top. Using pie chart, the grade distribution is shown with the legend included to show how many people got a particular grade. The average by education is also shown through the use of funnel under visualizations in Power BI. Both the average and standard deviation by test preparation and lunch is shown through the use of the clustered bar chart. Finally, the slicer is used so that you can filter the data by gender, education, lunch, and test preparation.  

You have reached the end! That was quite a bit of text and if you had read all of it, I commend you. This was my first project with SQL and Power BI and I have learned a lot from doing this project. My next project will be more ambitious with a larger data set and multiple tables so stay tuned!

**Source**

https://www.kaggle.com/spscientist/students-performance-in-exams
