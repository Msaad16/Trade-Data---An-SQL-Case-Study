# Trade Data - An SQL Case Study

## Table of Contents
[Introduction](#Introduction)

[Entity Relationship Diagram](#Entity-Relationship-Diagram)

[Question and Answers](#Question-and-Answers)

## Introduction
For any developing nation, the data on its trade with the rest of the world is a useful parameter to judge its growth. This SQL case study uses the trade data of 60 nations for the time period 2015-21 and seeks to determine the import export trends and trade insights for the commodities in the H2S basket. For this purpose we will be framing 20 questions and then use SQL Queries to answer them. The original data for this case study can be found [here.](https://www.kaggle.com/datasets/lakshyaag/india-trade-data) For the purpose of analysis the original list of 254 nations has been cut short to 60 only and the time frame of the study has also been reduced from 2010-21 to 2015-21. 
**NOTE: ALL THE VALUES IN THE DATA ARE IN TERMS OF MILLION US DOLLARS**

## Entity Relationship Diagram
The entity relationship diagram for our data can be represented as follows:
![ER Diagram](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b2b74e1a-0da9-4b8f-86a4-014270bfcea6)

There are five entities in our ER diagram which have been identified using the Noun rule.  
- The Region table enlists the name of the regions of the world, i.e., Asia, Africa, Europe, North America, South America, Oceania and Antarctica
- The Countries table enlists the name of the countries that are a part of our study. The Countries table has a one to many realtionship with the Region table with the Region ID serving as enjoining key. Countries table also has one to many relationships with the Export and Import Tables via the Country ID key.
- The Commodities tables enlists all the commodities that are a part of the H2S basket. There are around 98 commodities in this table with each commodity having its own unique key. The commodities table has one to mamy relationship with the exports and imports table
- The exports and imports table contain the export and import recorod for each country on the basis of year of trade and the commodity traded. Both of these tables have one to many relationships with commodity as well as countries table. 
## Question and Answers
1. **What was the total amount of export during 2021?**
```
Select sum(Million$) as 'Total Exports during 2021'
from Exports
where Year = 2021
```
![Q1](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/71069867-1f66-41af-ac69-b3203adfec90)

_So, the total exports during 2021 were 284259 Million US dollars._

 
2. **What was the total export amount (irrespective of commodities) for each region during the entire time period?**

_The total amount of exports grouped by region can be calculated using the following query:_
```
Select sum(Million$) as 'Export Value', Region.Name
from Exports
Join 
Countries on Exports.[Country ID] = Countries.[Country ID]
Join 
Region on Region.[Region ID] = Countries.[Country ID]
group by Region.Name
```
![Q2](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/a36e19ff-f57a-4679-aa43-72e5fe030fbd)


3.  **What was the total amount of imports during 2021?**
```
Select sum(Million$) as 'Total Imports during 2021'
from Imports
where Year = 2021
```
![Q3](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b6dd9548-a4e6-4062-bacf-a436bb7791ae)

_So, the total amount of imports during 2021 were 350151 Million Dollars._

4. **What was the total import amount (irrespective of commodities) for each region during the entire time period?**

_The total import amounts grouped by region can be given by the following query:_
```
Select sum(Million$) as 'Import Value' , Region.Name
from Imports
Join 
Countries on Imports.[Country ID] = Countries.[Country ID]
Join 
Region on Region.[Region ID] = Countries.[Country ID]
group by Region.Name
```
![Q4](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/29efd11a-218b-4507-a4d4-9a2dd6bf2451)

5. **Among all the nations which nation had the highest export amount for 2015?**
```
Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) desc
```
![Q5](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/a6422e22-dbad-4a99-9196-e362f5e9f852)

_So, clearly USA had the highest amount of exports during 2015._

6. **Among all the nations which nation had the highest import amount for 2015?**
```
Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) desc
```
![Q6](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/daacbebf-ec8c-44af-8d0a-5fbb3b80cfd8)

_So, China had the highest import amount during 2015._

7. **Among all the nations which nation had the lowest export amount for 2015?**
```
Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) asc
```
![Q7](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/6af70c90-c934-48ec-953d-f4decec4d8d2)

_So, Dominica had absolutely zero exports during 2015. If we consider only those countries which had positive export amounts, then Barbados has the lowest amount of exports in 2015._

8. **Among all the nations which nation had the lowest import amount for 2015?**
```
Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) asc
```
![Q8](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/1c1303bd-8b74-4fbb-802e-16db1bdc343e)

_As per the results, Barbados, Cuba and Dominica; did not import anything at all during 2015. If we consider those countries which had postive import amounts then Bosnia and Herzergovina had the lowest amount of imports._

9. **What was the trend in export values for Asia during 2015-21?**
```
Select sum(Million$) as 'Value', Exports.Year
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Where Region.Name = 'Asia'
group by Exports.Year
order by Year
```
![Q9](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/1652b7f3-a892-4f75-bedb-edd97c28f0b0)

_From the output we can see that the export amount for Asia has been steadily increasing except for 2019, when it took a dip. But it recovered in 2020 and 2021._

10. **What was the trend in import values for Europe during 2015-21?**
```
Select sum(Million$) as 'Value', Imports.Year
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Where Region.Name = 'Europe'
group by Imports.Year
order by Year
```
![Q10](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/3907616f-4293-44b2-9f77-32b85edd8c00)

_The import trend for Europe has been a little bit shaky when it dipped for consecutively two periods during 2019 and 2020._

11. **Which nation has been the top exporter in each region for the year 2016?**
```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Asia'
group by Countries.Name
order by sum(Million$) desc
```
![11 a](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/cdc97e9f-b5b2-4937-be7e-a91f18182ef1)

_So, Hong Kong has been the top exporter in Asia._
```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Africa'
group by Countries.Name
order by sum(Million$) desc
```
![11 b](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/9535076e-d361-4c89-9bdf-14d69e7dab77)

_So, South Africa has been the top exporter in Africa._

```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Europe'
group by Countries.Name
order by sum(Million$) desc
```
![11 c](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/7b5ed94d-0504-4356-9c1d-563f7dcddf68)

_So, United Kingdom has been the top exporter in Europe._

```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'North America'
group by Countries.Name
order by sum(Million$) desc
```
![11 d](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/30b5fb44-662e-4809-8c50-6ff94d73e391)

_So, USA has been the top exporter in North America._

```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'South America'
group by Countries.Name
order by sum(Million$) desc
```
![11 e](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/f54cf1c0-aafd-4274-8cb2-f8b1369642f7)

_So, Brazil has been the top exporter in South America._

```
Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Oceania'
group by Countries.Name
order by sum(Million$) desc
```
![11 f](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/8834e375-84b4-406b-8557-e585bcde83e6)

_And Australia has been the top exporter in Oceania._

12. **Which commodity has been the most exported commodity during 2015-21?**
```
Select Sum(Million$) as 'Value', Commodities.Commodity
from Exports
Join 
Commodities on Exports.[Commodity ID] = Commodities.[Commodity ID]
group by Commodities.Commodity
order by sum(Million$) desc
```
![12](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/de77e845-cc80-43fe-85c0-03263662d1b8)

_"NATURAL OR CULTURED PEARLS,PRECIOUS OR SEMIPRECIOUS STONES,PRE.METALS,CLAD WITH PRE.METAL AND ARTCLS THEREOF;IMIT.JEWLRY;COIN" have been the most exported commodity during 2015-21_

13. **Which commodity has been the most imported commodity during 2015-21?**
```
Select Sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join 
Commodities on Imports.[Commodity ID] = Commodities.[Commodity ID]
group by Commodities.Commodity
order by sum(Million$) desc
```
![13](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/d230d760-f1ce-41d5-96cc-8511a05ad0d9)

_"MINERAL FUELS, MINERAL OILS AND PRODUCTS OF THEIR DISTILLATION; BITUMINOUS SUBSTANCES; MINERAL WAXES" have been the most imported commodity during 2015-21._

14. **Which nation has been the biggest exporter overall? Which nation has been the biggest importer overall?**
```
Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
group by Countries.Name
order by sum(Million$) desc
```
![14](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/ed493aec-2134-4e78-980f-a4b951cd89f0)

_So, USA has been the biggest exporter over the years._

```
Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
group by Countries.Name
order by sum(Million$) desc
```
![14 b](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/c67581b8-5d5a-438e-870c-f6faf5a48405)

_So, China has been the biggest importer overall._

15. **Which were the top five most exported commodities in 2020?**
```
Select sum(Million$) as 'Value', Commodities.Commodity
from Exports
Join
Commodities on Exports.[Commodity ID] = Commodities.[Commodity ID]
where Exports.Year = 2020
group by Commodities.Commodity
order by sum(Million$) desc
```
![15](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b6a0ed95-c2e3-4a51-81e8-9733c1c827b2)

_So, the top five exported commodities in 2020 were 

-NATURAL OR CULTURED PEARLS,PRECIOUS OR SEMIPRECIOUS STONES,PRE.METALS,CLAD WITH PRE.METAL AND ARTCLS THEREOF;IMIT.JEWLRY;COIN.

-MINERAL FUELS, MINERAL OILS AND PRODUCTS OF THEIR DISTILLATION; BITUMINOUS SUBSTANCES; MINERAL WAXES.

-PHARMACEUTICAL PRODUCTS

-ORGANIC CHEMICALS

-NUCLEAR REACTORS, BOILERS, MACHINERY AND MECHANICAL APPLIANCES; PARTS THEREOF._

16. **Which weas most imported commodities for each region during 2020?**
```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'Asia'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 a](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/320c77a4-fa26-4240-af9d-f0681114933b)

_So, for Asia most imported commodity was "ELECTRICAL MACHINERY AND EQUIPMENT AND PARTS THEREOF; SOUND RECORDERS AND REPRODUCERS, TELEVISION IMAGE AND SOUND RECORDERS AND REPRODUCERS,AND PARTS."_

```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'Europe'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 b](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/782817d0-6bb5-4f51-841c-4633a444dbc3)

_So, for Europe most imported commodity was "NUCLEAR REACTORS, BOILERS, MACHINERY AND MECHANICAL APPLIANCES; PARTS THEREOF."_ 

```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'Africa'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 c](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/57a69a7e-4528-4d4e-ac7e-fd5aedfe1741)

_So, for Africa most imported commodity was "MINERAL FUELS, MINERAL OILS AND PRODUCTS OF THEIR DISTILLATION; BITUMINOUS SUBSTANCES; MINERAL WAXES."_ 

```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'North America'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 d](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b96b887a-9018-4c50-b029-aa052cad1b69)

_So, for North America most imported commodity was "MINERAL FUELS, MINERAL OILS AND PRODUCTS OF THEIR DISTILLATION; BITUMINOUS SUBSTANCES; MINERAL WAXES."_ 

```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'South America'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 e](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/fc184f2a-7688-4cbf-b01a-8193c742a09c)

_So, for South America most imported commodity was "ANIMAL OR VEGETABLE FATS AND OILS AND THEIR CLEAVAGE PRODUCTS; PRE. EDIBLE FATS; ANIMAL OR VEGETABLE WAXEX."_

```
Select sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
join 
Region on Region.[Region ID] = Countries.[Region ID]
Join 
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Imports.Year= 2020 and Region.Name = 'Oceania'
group by Commodities.Commodity
order by sum(Million$) desc
```
![16 f](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/b715b1c3-6517-4f73-aa51-c74e20c335fe)

_So, for Oceania most imported commodity was "MINERAL FUELS, MINERAL OILS AND PRODUCTS OF THEIR DISTILLATION; BITUMINOUS SUBSTANCES; MINERAL WAXES."_ 

17. **What was the pattern of export for Iron and Steel in Europe?**
```
Select sum(Million$) as 'Value', Exports.Year
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Join
Commodities on Commodities.[Commodity ID] = Exports.[Commodity ID]
where Region.Name='Europe' and Commodities.Commodity= 'IRON AND STEEL'
group by Exports.Year
```
![17](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/db7a0f20-6e02-4160-9464-ab682ace0c71)

_The export trend for Iron and steel for Europe has been very fluctuative. There have been two dips and two recoveries._

18. **What was the pattern of import for Beverages, Spirit and Vinegar in Asia?**
```
Select sum(Million$) as 'Value', Imports.Year
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Join
Commodities on Commodities.[Commodity ID] = Imports.[Commodity ID]
where Region.Name='Asia' and Commodities.Commodity= 'BEVERAGES, SPIRITS AND VINEGAR.'
group by Imports.Year
```
![18](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/505f47fe-beac-4db5-8a96-28b0480f896d)

_The import pattern for Beverages, spirtis and vinegar steadily rose until 2019 when it suddenly fell and reduced by more than half._

19. **Which commodity had the least exports in North America?**
```
Select sum(Million$) as 'Value', Commodities.Commodity
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Join
Commodities on Commodities.[Commodity ID] = Exports.[Commodity ID]
Where Region.Name = 'North America'
group by Commodities.Commodity
order by sum(Million$) asc
```
![19](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/055de24d-e8cc-4bb4-9b96-9af1d3b678b3)

_Exactly four commodities had zero export values in North America. These commodites were:

-LIVE ANIMALS.

-PHOTOGRAPHIC OR CINEMATOGRAPHIC GOODS.

-PULP OF WOOD OR OF OTHER FIBROUS CELLULOSIC MATERIAL; WASTE AND SCRAP OF PAPER OR PAPERBOARD.

-UMBRELLAS, SUN UMBRELLAS, WALKING-STICKS, SEAT-STICKS, WHIPS,RIDING-CROPS AND PARTS THEREOF.

If we consider only those commodities which has positive export amounts then TIN AND ARTICLES THEREOF had the least amount of exports._

20. **What was the export pattern for Russia in the trade of Air crafts, spacecraft and parts thereof?**
```
Select sum(Million$) as 'Value', Exports.Year
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Commodities on Commodities.[Commodity ID] = Exports.[Commodity ID]
where Countries.Name = 'Russia' and Commodities.Commodity = 'AIRCRAFT, SPACECRAFT, AND PARTS THEREOF.'
group by Exports.Year
```
![20](https://github.com/Msaad16/Trade-Data---An-SQL-Case-Study/assets/91818867/bef8cfc2-1093-4b0f-a2a5-c65c6064b09b)

_The exports for the said commodity began fairly well for Russia after which it steadily fell and did not recover much._
