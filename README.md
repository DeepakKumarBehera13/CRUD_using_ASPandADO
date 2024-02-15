# CRUD
Before Starting This CRUD application using ASP.NET Framework and ADO.NET ORM Tool with Backend MS SQL Server Database , first of all we have to Complete Database Part for Creating Tables and Stored Procedures are as follows :-
--------------------------------------------------------------------------------------
<--- CREATE DATABASE FIRST -->
Create Database Centroxy_DB
use Centroxy_DB
<-- CREATE TABLE [Emp_Details] -->
Create Table Emp_Details
(
Emp_Id int primary key identity(1,1),
FirstName varchar(100),
LastName varchar(100),
Photo varchar(Max),
Gender varchar(100),
Qualification varchar(100),
Mobile varchar(12),
Email varchar(30),
UserName varchar(100),
Password_ varchar(100),
ConfirmPassword varchar(100),
DateOfBirth date,
Age varchar(100),
DateOfJoin date,
City varchar(100),
District Varchar(100),
State_ Varchar(100),
Country varchar(100),
PinCode int,
dtm_CreatedOn datetime Not Null Default GetDate(),
)

Alter Table Emp_Details Add Token varchar(100),Active_Status bit,Expiry_Time date
Alter Table Emp_Details alter Column Active_Status bit

Select * from Emp_Details
<--- CREATE PROCEDURES --->
Create Procedure Pro_Update_Details
(
@Emp_Id int,@FirstName varchar(100),@LastName varchar(100),
@Photo varchar(Max),@Gender varchar(100),@Qualification varchar(100),@DateOfBirth date,
@Age varchar(100),@DateOfJoin varchar(100),@City varchar(100),@District varchar(100),
@State_ varchar(100),@Country varchar(100),@PinCode varchar(100),@Action varchar(100)
)
as
Begin
If(@Action='U')
Begin
Update Emp_Details set 
FirstName=@FirstName,
LastName=@LastName,
Photo=@Photo,
Gender=@Gender,
Qualification=@Qualification,
DateOfBirth=@DateOfBirth,
Age=@Age,
DateOfJoin=@DateOfJoin,
City=@City,
District=@District,
State_=@State_,
Country=@Country,
PinCode=@PinCode
where Emp_Id=@Emp_Id
End
End

Create Procedure Disp_Emp_Details
as
Select * from Emp_Details

Create Procedure USP_SignUp
(
@Mobile varchar(12),
@Email varchar(30),
@UserName varchar(100),
@Password_ varchar(100),
@ConfirmPassword varchar(100),
@Token varchar(100),
@Action varchar(100)
)
as
Begin
If(@Action='S')
Begin
Insert into Emp_Details(Mobile,Email,UserName,Password_,ConfirmPassword,Token,Active_Status,Expiry_Time)values(@Mobile,@Email,@UserName,@Password_,@ConfirmPassword,@Token,0,dateadd(minute, 10, getdate()))
End
End


Create Procedure Usp_SignIn
(
@Id int=null,
@UserName varchar(100)=null,
@Password_ varchar(100)=null,
@Action varchar(100)
)
as
Begin
If(@Action='L')
Begin
Select * from Emp_Details where UserName=@UserName and Password_=@Password_
End
End

Create Procedure Pro_Retrieve_Pwd @Email varchar(100)
as
Select UserName,Password_ FROM Emp_Details where Email=@Email

Create Procedure Pro_Validate_Token @Email Varchar(100)
as
Select UserName,Token,Active_Status,Expiry_Time from Emp_Details where Email=@Email
-----------------------------------------------------------------
--TABLE QUALIFICATION
Create Table Tbl_Qualification(Q_Id int primary Key identity(1,1),Q_Name Varchar(100))
Create Procedure Disp_Qualification
as
Select * from Tbl_Qualification
--TABLE COUNTRY
Create Table Tbl_Country(C_Id int primary key identity(1,1),C_Name varchar(100))
Create Procedure Disp_Country
as
Select * from Tbl_Country
--TABLE STATE
Create Table Tbl_State(S_Id int primary key identity(1,1),S_Name varchar(100))
Create Procedure Disp_State
as
Select * from Tbl_State

--TABLE DISTRICT
Create Table Tbl_District(D_Id int primary key identity(1,1),D_Name varchar(100))
Create Procedure Disp_District
as
Select * from Tbl_District
--TABLE CITY
Create Table Tbl_City(City_Id Int primary key identity(1,1),City_Name varchar(100))
Create Procedure Disp_City
as
Select * from Tbl_City
-----------------------------------------------------------
Create Procedure Search_Previous_Data @Emp_id int
as
Select * From Emp_Details where Emp_Id=@Emp_id

CREATE procedure Del_Record @Emp_Id int
as 
Delete from Emp_Details where Emp_Id=@Emp_Id

Create Procedure Pro_Reset_Pwd @UserName varchar(100),@Old_Password varchar(100),@New_Password varchar(100),@ConfirmPassword varchar(100)
as
Update Emp_Details set Emp_Details.Password_=@New_Password,ConfirmPassword=@ConfirmPassword where UserName=@UserName and Password_=@Old_Password
