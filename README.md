# Google Data Analytics Capstone Project: Cyclistic Bikeshare 


## Introduction
This is my approach to the **Capstone Project** from the **Google Data Analytics Specialization** course from Coursera. In this project, I will be analyzing data provided by Cyclistic, a fictional company, using the following steps learned from this specialization:
1.  **Ask**
2.  **Prepare**
3.  **Process**
4.  **Analyze**
5.  **Share**
6.  **Act**

## Background
I am  a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing, Lily Moreno, believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
The Question Moreno assigned me to is: 
> "How do annual members and casual riders use Cyclistic bikes differently?"

## Prepare
- **Data**: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) with permission from Motivate Internatinal Inc. under this [license](https://divvybikes.com/data-license-agreement).
  - Data taken from 09/2023 - 08/2024.
    
- **Tools:**
  - PostgreSQL
  - Tableau

## Process 
### Combining Data
The data from 09/2023 - 08/2024 was [combined](https://github.com/davidsarte/Cyclistic-Project/blob/main/1.%20Data%20Combining.sql) into one table named **cyclistic_combined** in PostgreSQL. 

**Columns & Data Types**

<img width="1236" alt="Screenshot 2024-10-01 at 10 20 17 PM" src="https://github.com/user-attachments/assets/0ed4df2c-3ca9-40bb-8374-baad17b9098c"> <br>

**Total Number of Rows** <br>

<img width="132" alt="Screenshot 2024-10-01 at 10 07 11 PM" src="https://github.com/user-attachments/assets/a641dfae-d7c0-4817-bb42-24f5fdba5cee">

### Cleaning Data
After combining the data, I proceeded with [data cleaning](https://github.com/davidsarte/Cyclistic-Project/blob/main/2.%20Data%20Cleaning.sql) <br>. Four main actions were performed in the data cleaning process:
1. **Check the number of blank rows**
2. **Delete the blank rows**
3. **Check the number of invalid values in rows**
4. **Delete the rows with invalid values** 

### Data Transforming
Finally, after cleaning the data, I [transformed](https://github.com/davidsarte/Cyclistic-Project/blob/main/3.%20Data%20Transforming.sql) the data by adding columns useful in the analysis. I added:
-  **Ride length column, taking the difference of the started_at and ended_at columns**
-  **Month column, displaying the month in which rides were recorded**
-  **Week column, indicating the day of the week for each recorded ride**

## Analyze & Share
<p align="center">
  <img src="https://github.com/user-attachments/assets/e8915776-1a69-48b0-a811-e67c8ee4fd8f" alt="Member Data" width="300"/>
</p>

There are significantly more members than casual users at 2.67 million users to 1.46 million casual users.


<p align="center">
  <img src="https://github.com/user-attachments/assets/fa942f90-8207-4840-9600-2a49465bc72b" alt="Member Data by Day of Week" width="700"/>
</p>

When looking at ride count per day of the week by member type, members are more active on every single day of the week, with a peak usage on Wednesdays. However, there is a significant increase in casual users on weekends. 

<p align="center">
  <img src="https://github.com/user-attachments/assets/0a902045-d2ba-47e2-831a-38268cfab0ec" alt="Per Month Count" width="700"/>
</p>

Looking at ride count from a month-to-month basis, summer is the most popular time for renting bikes from both casual users and members. Winter, especially December and January, are the least popular months for both member types.

<p align="center">
  <img src="https://github.com/user-attachments/assets/7e7bc22d-0766-4d53-9237-5a4e4912809f" alt="Bike Type (1)" width="700"/>
</p>

Next, when comparing what type of bikes each member type prefers, both prefer classic bikes over electric bikes. Among casual users, 
66% prefer to use classic bikes while only 34% prefer to use electric bikes. As for members, 67% prefer to use classic bikes while only 33% prefer to use electric bikes.

<p align="center">
  <img src="https://github.com/user-attachments/assets/5d721f61-c736-440e-a119-1a2d973ffa05" alt="Ride Length Per Member Type (1)" width="900"/>
</p>

Finally, members appear to prefer shorter bike rides under 30 minutes. On the other hand, casual members prefer longer rides that exceed 30 minutes.

## Insights
Based on the data, the following conclusions have been made:
1. Significantly more members use bike sharing compared to casual users.
2. More casual users use bike sharing on weekends.
3. Users of both member types prefer classic bikes over electric bikes.
4. Members prefer shorter bike rides while casual users prefer longer bike rides.

## Act 

Now that we know how annual members and casual riders use Cyclistic bikes differently, it is time to come up with suggestions to boost engagement and profitability. Some options are:
1. **Lower prices during slow periods**. By lowering prices, there will be more incentive to use bike sharing, increasing revenue during slower periods like winter. 
2. **Provide more membership options**. Providing more membership options will attract more market segments because there are more options. For example, student discounts can incentivize students to use the service more and would be practical, especially for commuters.
3. **More engaging social media campaigns**. Besides lowering prices, having engaging social media campaigns will bring more attention to Cyclistic, possibly increasing member purchases. Some fun campaign ideas could be referral bonuses, local business collaborations, and themed, seasonal promotions, like Valentines' Day couple rides.

## Conclusion
Thank you for reading this capstone project! The analysis of Cyclistic shows how understanding user behavior with data can lead to better decision-making. 







