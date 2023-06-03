create database aula03;
use aula03;

--O propriet�rio de um empresa implantou um com�rcio eletr�nico, logo este seu novo foco do 
--empreendimento ir� necessitar de controles para uma gest�o mais eficiente. Neste sentido espera-se 
--realizar o controle dos seguintes aspectos: produtos, pedidos e clientes. Para atender a esta necessidade 
--fa�a uma proposta para o modelo de dados que a empresa de modo a contemplar as regras a seguir:
--1. Deve existir um controle de Clientes de modo a identificar informa��es como: Nome, CPF, CNPJ, 
--Endere�os (com dados padronizados de Pais, Estado e Munic�pio), Telefones, e-mails;
--2. Para os produtos deve existir o controle de informa��es como: Nome do Produto, C�digo (SKU), 
--descri��o, dimens�es, peso, valor de compra, margem de lucro;
--3. Controle de Pedidos que permita identificar os produtos adquiridos por um Cliente (produto e 
--quantidade), situa��o do pedido, valor do frete



create table dbo.Cliente
(
	id int primary key,
	nome varchar(255),
	Genero varchar(1),
	cpf  varchar(11),
	cnpj varchar(14),
	enderecos varchar(255),
	telefones varchar(20),
	emails varchar(255)
);

create table dbo.Produtos
(
	id int primary key,
	nome varchar(255),
	sku varchar(255),
	descri��o varchar(255),
	altura decimal(10,2),
	largura decimal(10,2),
	peso decimal(10,2),
	valorDeCompra decimal(10,2),
	MargemDeLucro decimal(10,2)

);

create table dbo.Pedido
(
	id int primary key,
	ClienteId int,
	DataHora DATETIME,
	Situacao varchar(50),
	ValorFrete decimal(10,2),
	foreign key (ClienteId) references Cliente(id)
);

create table dbo.Detalhespedido
(
	Pedidoid int,
	Produtoid int,
	Quantidade int,
	foreign key (Pedidoid) references Pedido(id),
	foreign key (Produtoid) references Produtos(id)
);

insert into Cliente(id, nome, cpf , cnpj , enderecos, telefones, emails) 
values (1,'Thiago Silveira Alexandre','12345678900', null,'rua amauri 7826','1478956523','n�opuedocre@gmail.com');

INSERT INTO Produtos (id, nome, sku, descri��o, altura, largura, peso, valorDeCompra, MargemDeLucro)
VALUES (1, 'Playstation 4', '01', 'console de pen�ltima gera��o 4k hd de 1t', 1.4, 3.56, 4, 5, 1333);


insert into Pedido(id,ClienteId,DataHora,Situacao,ValorFrete) values (1, 1,GETDATE(),'novo',250);

insert into Detalhespedido(Pedidoid,Produtoid,Quantidade) values ( 1, 1, 1000);

select * from Cliente;

select * from Produtos;
