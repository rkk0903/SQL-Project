CREATE DATABASE GENERAL_ELECTION_RESULTS;
USE GENERAL_ELECTION_RESULTS;
CREATE TABLE Constituencywise_details
(S_N INT,
CANDIDATE VARCHAR(100),
PARTY VARCHAR(100),
EVM INT,
POSTAL_VOTES INT,
TOTAL_VOTES INT,
Percenteg_of_votes int,
CONSTITUENCY_ID varchar(100),
foreign key (constituency_id) references constituency_results(constituency_id));



CREATE TABLE Constituency_results
(S_N INT,
Parliament_constituency varchar(100),
foreign key (parliament_constituency) references statewise_results(parliament_constituency),
Constituency_Name varchar(100),
Winning_Candidate varchar(100),
Total_Votes int,
Margin int,
Constituency_ID varchar(100)primary key,
Party_ID int,
foreign key(Party_ID) references partywise_results(Party_ID));



CREATE TABLE Partywise_results
(PARTY VARCHAR(100), 
WON INT,
 PARTY_ID INT primary key);
 
 
 
 CREATE TABLE Statewise_results
 (Constituenct varchar(100),
 Const_NO int,
 Parliament_Constituency Varchar(100) primary key,
 Leading_Candidate varchar(100),
 Trailing_Candidate varchar(100) null,
 Margin int,Status varchar(100),
 State_ID Varchar(100),
 foreign key(state_id) references states(state_ID), 
 State Varchar(100));



 CREATE TABLE States
 (State_ID Varchar(100) primary key,
 State Varchar(100));
 
select*from Constituencywise_details;
select*from Constituency_RESULTS;
select*from partywise_results; 
select*from statewise_results;
select*from states; 


drop table Constituencywise_details; 
drop table Constituency_RESULTS; 
drop table partywise_results; 
drop table statewise_results;
drop table states;