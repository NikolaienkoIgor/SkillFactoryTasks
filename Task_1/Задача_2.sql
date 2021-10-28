CREATE TABLE NOBEL_LAUREATE_ANALYSIS AS (
		WITH  NoLa AS (SELECT * FROM NobelLaureatesTable)
			 ,CoDa AS (SELECT * FROM CountryDataTable)
			 ,CoWo AS (SELECT * FROM CountriesOfWorld)
			 ,WoCi AS (SELECT * FROM WorldCitiesTable)

		SELECT 
		   NoLa.laureate_ID
		  ,NoLa.laureate_Name
		  ,NoLa.laureate_Type
		  ,NoLa.laureate_Gender
		  ,NoLa.laureate_Org
		  ,NoLa.laureate_Category
		  ,NoLa.prize_date
		  ,NoLa.birth_date
		  ,NoLa.death_date
		  ,NoLa.birth_city
		  ,NoLa.org_city
		  ,NoLa.death_city
		  
		  ,WoCi.cityPopulation AS BirthCityPopulation
		  ,WoCi.cityCountry AS BirthCountryCode
		  
		  ,CoDa.CountryName AS BirthCountryName
		  
		  ,CoWo.Region AS BirthCountryRegion
		  ,CoWo.Population AS BirthCountryPopulation
		  ,CoWo.Area AS BirthCountryArea
		  ,CoWo.PopDensity AS BirthCountryPopDensity
		  ,CoWo.Coastline AS BirthCountryCoastline
		  ,CoWo.Migration AS BirthCountryMigration
		  ,CoWo.InfantMortality AS BirthCountryInfantMortality
		  ,CoWo.GDP AS BirthCountryGDP
		  ,CoWo.Literacy AS BirthCountryLiteracy
		  ,CoWo.Phones AS BirthCountryPhones
		  ,CoWo.Arable AS BirthCountryArable
		  ,CoWo.Crops AS BirthCountryCrops
		  ,CoWo.Other AS BirthCountryOther
		  ,CoWo.Climate AS BirthCountryClimate
		  ,CoWo.Birthrate AS BirthCountryBirthrate
		  ,CoWo.Deathrate AS BirthCountryDeathrate
		  ,CoWo.Agriculture AS BirthCountryAgriculture
		  ,CoWo.Industry AS BirthCountryIndustry
		  ,CoWo.Service AS BirthCountryService

		FROM NoLa

		LEFT JOIN WoCi
		ON NoLa.birth_city = WoCi.city

		LEFT JOIN CoDa
		ON WoCi.BirthCountryCode = CoDa.CountryCode
			 
		LEFT JOIN CoWo
		ON CoDa.CountryCode = CoWo.CountryCode

) WITH DATA
PRIMARY INDEX (laureate_ID);
	 
