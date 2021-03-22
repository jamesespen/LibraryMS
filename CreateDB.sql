/* 1. bibrary Management System
An online bibrary management system offers a user-friendly way of issuing books
and also viewing different books and titles available under a category. 
This type of Management Information System (MIS) can be easily developed in Asp.Net using C#. 
And SQL queries enable quick retrieval of the required information.  

Take the example of your college bibrary, where both teachers and students can issue books. 
Usually, the number of days within which you have to return the book varies for both the groups. 
Also, each book has a unique ID, even if they are copies of the same book by the same author. 
So, a bibrary management system has an entry for every book, capturing who has issued it, the issue 
duration, and the amount of fine, if any.

SQL Query to create database: */

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'LIBRARY')

CREATE DATABASE LIBRARY COLLATE SQL_Latin1_General_CP1_CI_AS

GO

USE LIBRARY

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Books') AND type in (N'U'))
BEGIN
CREATE TABLE [Books] (
	[ISBN] 				[char] NOT NULL ,
	[Book_Title] 		[char] NOT NULL ,
	[Publication_Year] 	[int] NOT NULL ,
	[Book_Language]		[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Book_Category] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Binding_ID] 		[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Copies_Total] 		[int] NOT NULL ,
	[Copies_Available] 	[int] NOT NULL ,
	CONSTRAINT [ISBN] PRIMARY KEY
) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Binding') AND type in (N'U'))
BEGIN
CREATE TABLE [Authors] (
	[Author_ID] 		[int] NOT NULL ,
	[Author_Name] 		[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Author_Country] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Book_Genre] 		[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Users') AND type in (N'U'))
BEGIN
CREATE TABLE [Users] (
	[Borrower_User_ID] 	[int] NOT NULL ,
	[Borrower_Name] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Borrower_Address] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Borrower_Phone] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Borrower_Email] 	[char] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pwd] 			[char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Admin] 		[int] NOT NULL ,
	
) ON [PRIMARY]
END
