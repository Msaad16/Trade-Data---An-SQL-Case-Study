--Question 1

Select sum(Million$) as 'Total Exports during 2021'
from Exports
where Year = 2021

-- Question 2

Select sum(Million$) as 'Export Value', Region.Name
from Exports
Join 
Countries on Exports.[Country ID] = Countries.[Country ID]
Join 
Region on Region.[Region ID] = Countries.[Country ID]
group by Region.Name

-- Question 3

Select sum(Million$) as 'Total Imports during 2021'
from Imports
where Year = 2021

-- Question 4

Select sum(Million$) as 'Import Value' , Region.Name
from Imports
Join 
Countries on Imports.[Country ID] = Countries.[Country ID]
Join 
Region on Region.[Region ID] = Countries.[Country ID]
group by Region.Name


-- Question 5

Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) desc

-- Question 6
Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) desc

-- Question 7

Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) asc

-- Question 8

Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
where Year=2015
group by Countries.Name
order by sum(Million$) asc

-- Question 9

Select sum(Million$) as 'Value', Exports.Year
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Where Region.Name = 'Asia'
group by Exports.Year
order by Year

-- Question 10

Select sum(Million$) as 'Value', Imports.Year
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
Join
Region on Region.[Region ID] = Countries.[Region ID]
Where Region.Name = 'Europe'
group by Imports.Year
order by Year

-- Question 11

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Asia'
group by Countries.Name
order by sum(Million$) desc

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Africa'
group by Countries.Name
order by sum(Million$) desc

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Europe'
group by Countries.Name
order by sum(Million$) desc

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'North America'
group by Countries.Name
order by sum(Million$) desc

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'South America'
group by Countries.Name
order by sum(Million$) desc

Select Sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Region on Region. [Region ID] = Countries.[Region ID]
Where Exports.Year = 2016 and Region.Name = 'Oceania'
group by Countries.Name
order by sum(Million$) desc

-- Question 12

Select Sum(Million$) as 'Value', Commodities.Commodity
from Exports
Join 
Commodities on Exports.[Commodity ID] = Commodities.[Commodity ID]
group by Commodities.Commodity
order by sum(Million$) desc

-- Question 13

Select Sum(Million$) as 'Value', Commodities.Commodity
from Imports
Join 
Commodities on Imports.[Commodity ID] = Commodities.[Commodity ID]
group by Commodities.Commodity
order by sum(Million$) desc

-- Question 14

Select sum(Million$) as 'Value', Countries.Name
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
group by Countries.Name
order by sum(Million$) desc


Select sum(Million$) as 'Value', Countries.Name
from Imports
Join
Countries on Countries.[Country ID] = Imports.[Country ID]
group by Countries.Name
order by sum(Million$) desc

-- Question 15

Select sum(Million$) as 'Value', Commodities.Commodity
from Exports
Join
Commodities on Exports.[Commodity ID] = Commodities.[Commodity ID]
where Exports.Year = 2020
group by Commodities.Commodity
order by sum(Million$) desc

-- Question 16

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

-- Question 17

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

-- Question 18

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

-- Question 19

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

-- Question 20

Select sum(Million$) as 'Value', Exports.Year
from Exports
Join
Countries on Countries.[Country ID] = Exports.[Country ID]
Join
Commodities on Commodities.[Commodity ID] = Exports.[Commodity ID]
where Countries.Name = 'Russia' and Commodities.Commodity = 'AIRCRAFT, SPACECRAFT, AND PARTS THEREOF.'
group by Exports.Year