--- RETRIEVE THE TITANIC_CSV FILE FROM Titanic database
SELECT *
FROM [dbo].[SURVIVOR PREDICTION]

--- retrieve names of passengers, sex and pclass they belong to: filter female passengers
SELECT NAME, Sex, Pclass
FROM [dbo].[SURVIVOR PREDICTION]
where sex ='female'

----retrieve names of passengers, sex and pclass they belong to: filter  male passengers
SELECT NAME, Sex, Pclass
FROM [dbo].[SURVIVOR PREDICTION]
where sex ='male'

-- retrieve all passengersid that did not survive from the dbo table
select SURVIVED AS NUMBER  ,  NAME AS dead,PassengerId
FROM [dbo].[SURVIVOR PREDICTION]
WHERE SURVIVED ='0'

--- retrieve all passengerid that survived from the dbo table 
select SURVIVED AS NUMBER  ,  NAME AS Alive,PassengerId
FROM [dbo].[SURVIVOR PREDICTION]
WHERE SURVIVED ='1'

---decide fare factor in sum , group by total fare, age, ticket, sex and class . retrive all groups to determine the totalfare according to passengerid
select sum(Fare)   as totalfare ,Age, Ticket, sex, Pclass             
from[dbo].[SURVIVOR PREDICTION]
group by survived, age, ticket,sex,pclass
order by  totalfare, pclass, Sex,age, ticket

---retreive all passengers that did not survive
select *
FROM [dbo].[SURVIVOR PREDICTION]
where survived > 0 

--- retrive all survivors 
select *
FROM [dbo].[SURVIVOR PREDICTION]
where survived < 1

---retrive age, pclass, fare, sex by survivors and age of survivors which is not null
select Age, Pclass, fare,Sex
FROM [dbo].[SURVIVOR PREDICTION]
where survived < 1 and Age is not null

---retrieve passengers who did not survive by age , pclass,fare and sex
select Age, Pclass, fare,Sex
FROM [dbo].[SURVIVOR PREDICTION]
where survived > 0 and Age is not null

--- retrieve survived female passengers by pclass ( ist ticket) and fare
select pclass, survived, Fare,sex
FROM [dbo].[SURVIVOR PREDICTION]
where Pclass ='1' and sex='female'

---retrieve passengers who paid more that $10 and 0 survival
select pclass, survived, Fare
FROM [dbo].[SURVIVOR PREDICTION]
where fare >10 and survived ='0'

--retrieve passengers who paid more than $10 fare and survived , grouped by pclass and sibsp
select pclass, survived, SibSp
FROM [dbo].[SURVIVOR PREDICTION]
where fare >10 and survived ='1'

---retrive the passengers between male and demale  who had more  siblings and spouses on board 
select sex, count(*) SibSp 
FROM [dbo].[SURVIVOR PREDICTION]
group by sex, SibSp
order by sibsp, sex


---retreive number of passengers who had parents and children on board
select sex, count(*) Parch
FROM [dbo].[SURVIVOR PREDICTION]
group by sex, Parch
order by sex,parch

---retrieve passengers by survived who had cabin ids 
Select passengerid, survived, cabin
from[dbo].[SURVIVOR PREDICTION]
where Cabin IS NOT NULL

--- retrieve total count of survivors 
Select count (*) survived  
from[dbo].[SURVIVOR PREDICTION]

---retrieve all columns by non -survivors
SELECT passengerid, survived,Pclass,name,sex,age,sibsp,parch,ticket,fare,cabin,embarked
FROM [dbo].[SURVIVOR PREDICTION]
where survived ='0' 

---retrieve all columns to find more information about survivors
SELECT passengerid, survived,Pclass,name,sex,age,sibsp,parch,ticket,fare,cabin,embarked
FROM [dbo].[SURVIVOR PREDICTION]
where survived ='1' 

---retrive information on survivors and their destination "S"   means Southampton 
SELECT passengerid, survived,Pclass,name,sex,age,sibsp,parch,ticket,fare,cabin,embarked
FROM [dbo].[SURVIVOR PREDICTION]
where survived ='1'  and embarked ='S'

--- retrive all rows of passneger's destinations by name and sex
SELECT passengerid, survived,embarked,name,Sex
FROM [dbo].[SURVIVOR PREDICTION]
where embarked ='S'

SELECT passengerid, survived,embarked,name,Sex
FROM [dbo].[SURVIVOR PREDICTION]
where embarked ='Q'

SELECT passengerid, survived,embarked,name,Sex
FROM [dbo].[SURVIVOR PREDICTION]
where embarked ='C'

--- retrieve the percentage of survivors(1) and non -survivors (0) BY GENDER 
SELECT survived,
count(*) * 100.0/(select count(*)  from [dbo].[SURVIVOR PREDICTION]) as 'totalpercentageofdeath and survived'
from [dbo].[SURVIVOR PREDICTION]
group by survived,Sex

SELECT Sex,
count(*) * 100.0/(select count(*)  from [dbo].[SURVIVOR PREDICTION]) as '%DEATH&SURVIVED'
from [dbo].[SURVIVOR PREDICTION]
group by  Sex

select count(*)passengerid 
from  [dbo].[SURVIVOR PREDICTION]

select count(*)sex
from  [dbo].[SURVIVOR PREDICTION]
where sex='female'

select count(*)sex
from  [dbo].[SURVIVOR PREDICTION]
where sex='male'


----------------------------------------------------Insights
--*The passengers on board are 418 in Total male passengers are 266 while female passengers are 152 in total.
--*Male passengers had more relatives on board. 
--*The dataset revealed that only female passengers survived while the all the male passengers did not survive.
--*Percentage of female survivors 36.3 %.
--* The prediction model analysis has been carried out by gender, Age, destination and ticketid.



 





