use AdventureWorks2019;

create view dbo.vw_colaboradores as 
select
	CONCAT(p.FirstName , ' ', p.LastName) as NomeCompleto,
	e.JobTitle as Cargo,
	p.BirthDate as DataNascimento,
	p.MaritalStatus as EstadoCivil,
	YEAR(GETDATE()) - YEAR(p.BirthDate) AS Idade,
	a.AddresLine1 as Endereco,
	a.CountryRegion as Pais,
	a.StateProvince as Estado,
	a.city as Cidade

from
	Person.Person as p
	join HumanResources.Employee as e on p.BusinessEntityID = e.BusinessEntityID
	join Person.BusinessEntityAddress as BEA on p.BusinessEntityID = BEA.BusinessEntityID
	join Person.Address as a on BEA.AddressID = a.AddressID

-- Listar todos os colaboradores da empresa com Nome Completo, Cargo, Data de Nascimento, Estado Civil e Idade:
SELECT NomeCompleto, Cargo, DataNascimento, EstadoCivil, Idade
FROM VW_COLABORADORES;

--Contabilizar a quantidade de colaboradores por cargo:
SELECT Cargo, COUNT(*) AS Quantidade
FROM VW_COLABORADORES
GROUP BY Cargo;


--Identificar a origem dos colaboradores através de seus endereços. Apresentar as informações de Endereço, País, Estado e Cidade:
SELECT Endereco, Pais, Estado, Cidade
FROM VW_COLABORADORES;


--Contabilizar o número de colaboradores por País e Estado:
SELECT Pais, Estado, COUNT(*) AS Quantidade
FROM VW_COLABORADORES
GROUP BY Pais, Estado;

