# Trade Data - An SQL Case Study

## Table of Contents
[1. Introduction](#1.-Introduction)

[2. Entity Relationship Diagram](#2.-Entity-Relationship-Diagram)

[3. Question and Answers](#3.-Question-and-Answers)

## 1. Introduction
For any developing nation, the data on its trade with the rest of the world is a useful parameter to judge its growth. This SQL case study uses the trade data of 60 nations for the time period 2015-21 and seeks to determine the import export trends and trade insights for the commodities in the H2S basket. For this purpose we will be framing 20 questions and then use SQL Queries to answer them. The original data for this case study can be found [here.](https://www.kaggle.com/datasets/lakshyaag/india-trade-data) For the purpose of analysis the original list of 254 nations has been ccut short to 60 only and the time frame of the study has also been reduced from 2010-21 to 2015-21. 

## 2. Entity Relationship Diagram
The entity relationship diagram for our data can be represented as follows:
![ER Diagram](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b2b74e1a-0da9-4b8f-86a4-014270bfcea6)

There are five entities in our ER diagram which have been identified using the Noun rule.  
- The Region table enlists the name of the regions of the world, i.e., Asia, Africa, Europe, North America, South America, Oceania and Antarctica
- The Countries table enlists the name of the countries that are a part of our study. The Countries table has a one to many realtionship with the Region table with the Region ID serving as enjoining key. Countries table also has one to many relationships with the Export and Import Tables via the Country ID key.
- The Commodities tables enlists all the commodities that are a part of the H2S basket. There are around 98 commodities in this table with each commodity having its own unique key. The commodities table has one to mamy relationship with the exports and imports table
- The exports and imports table contain the export and import recorod for each country on the basis of year of trade and the commodity traded. Both of these tables have one to many relationships with commodity as well as countries table. 
## 3. Question and Answers
