CUBE generates a result set that shows aggregates for all combinations of values in the selected columns, where as ROLLUP generates a result set that shows aggregates for a hierarchy of values in the selected columns.

Let us understand this difference with an example. 

ROLLUP(Continent, Country, City) produces Sum of Salary for the following hierarchy
Continent, Country, City
Continent, Country, 
Continent
()

CUBE(Continent, Country, City) produces Sum of Salary for all the following column combinations
Continent, Country, City
Continent, Country, 
Continent, City
Continent
Country, City
Country,
City
()
