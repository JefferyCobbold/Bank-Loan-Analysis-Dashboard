SELECT * FROM world.financial_loan_data_excel;
#BASIC PORTFOLIO OVERVIEW
#1. How many total loan application have been recorded?
SELECT COUNT(id) AS Total_Loans FROM world.financial_loan_data_excel;

#2. What is the total amount received from borrowers?
SELECT 
SUM(total_payment) AS Total_Amount_Received
FROM world.financial_loan_data_excel;


#3. What is the total amount received 
SELECT SUM(total_payment) AS Total_Amount_Received
FROM world.financial_loan_data_excel;

# 4.Average interest rate
SELECT
ROUND(AVG(int_rate)*100,2)
AS Average_Interest_Rate
FROM world.financial_loan_data_excel;

#5. Average loan amount given 
SELECT 
ROUND(AVG(loan_amount),2) AS Average_Loan_Amount
FROM world.financial_loan_data_excel;



#Test.FOR RECORDS
SELECT 
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received,
ROUND(AVG(int_rate)*100,2)
AS Average_Interest_Rate,
ROUND(AVG(loan_amount),2) AS Average_Loan_Amount
FROM world.financial_loan_data_excel;

#MONTHLY AND YEARLY
SELECT * FROM world.financial_loan_data_excel;

#1.Loan Issued Each Month
SELECT 
MONTH(issue_date_formatted) AS MonthNumber,
MONTHNAME (issue_date_formatted) AS Month,
COUNT(id) AS Loan_Count
FROM world.financial_loan_data_excel
GROUP BY MonthNumber,Month 
ORDER BY MonthNumber;

#2. Total funded and received amount per each
SELECT 
MONTH(issue_date_formatted) AS MonthNumber,
MONTHNAME (issue_date_formatted) AS Month,
SUM(loan_amount) AS FUNDED,
SUM(total_payment) AS Received 
FROM world.financial_loan_data_excel
GROUP BY MonthNumber,Month 
ORDER BY MonthNumber;

#Yearly Trends
#Total Funded Amount per year
SELECT YEAR(issue_date_formatted) AS Year,
SUM(loan_amount) AS Total_Funded
FROM world.financial_loan_data_excel
GROUP BY Year 
ORDER BY Year;

#Highest loan issuance month
SELECT 
MONTHNAME (issue_date_formatted) AS Month,
COUNT(id) AS Loan_Count 
FROM world.financial_loan_data_excel 
GROUP BY Month 
ORDER BY Loan_Count
DESC LIMIT 1;






#Test
SELECT 
MONTH(issue_date_formatted) AS MonthNumber,
MONTHNAME (issue_date_formatted) AS Month,
COUNT(id) AS Loan_Count,
SUM(loan_amount) AS FUNDED,
SUM(total_payment) AS Received 
FROM world.financial_loan_data_excel
GROUP BY MonthNumber,Month 
ORDER BY MonthNumber;


#LOAN PERFORMANCE ANALYSIS

#1. Distribution of loan by status
SELECT loan_status,
COUNT(id) AS Total
FROM world.financial_loan_data_excel
GROUP BY loan_status;

#2.Percentage of loans performing(Good and Bad Loans)
SELECT 
(COUNT(CASE WHEN loan_status IN ('Fully Paid','Current') THEN id END)*100 /COUNT(id)) 
AS Good_Loan_Percentage,
(COUNT(CASE WHEN loan_status IN ('Charged Off') THEN id END)*100 /COUNT(id)) 
AS Bad_Loan_Percentage
FROM world.financial_loan_data_excel;

#3.Funded and Received 
SELECT 
loan_status AS Loan_Status,
COUNT(id) AS Total,
SUM(loan_amount) AS Total_Funded,
SUM(total_payment) AS Total_Received
FROM world.financial_loan_data_excel
GROUP BY loan_status ;


#4.Borrower And Risk Analysis
#Average Interest Rate By Grade
SELECT 
grade,
ROUND(AVG(int_rate)*100,2) AS Avg_Interest_Rate,
COUNT(id) AS Number_of_Loans_Taken,
ROUND(AVG(loan_amount),2) AS Average_Loan_Amount,
ROUND((COUNT(CASE WHEN loan_status='Charged Off' THEN id END)*100/COUNT(id)),2) AS Default_Rate_Percent
FROM world.financial_loan_data_excel

GROUP BY grade
ORDER BY grade;



#Financial Ratios and KPI's 
SELECT
ROUND(SUM(total_payment)/SUM(loan_amount)*100,2) AS Repayment_Rate_Percent
FROM world.financial_loan_data_excel









 

