-- Esiteks loome GalleryDB andmebaas, kus tuleb hoiata meie tabeleid koos andmetega.
create database GalleryDB
use GalleryDB

-- Nüüd alustame Gallery_DETAILS tabeliga, kus hoitakse Galerii andmete kirjeldus
create table Gallery_DETAILS
(
gallery_Id INT PRIMARY KEY IDENTITY(1, 1),
Name NVARCHAR(50),
Address NVARCHAR(50),
Phone NVARCHAR(50),
Email NVARCHAR(145)
)

-- Autorite andmete kirjeldus
create table Author_DETAILS
(
author_Id INT PRIMARY KEY IDENTITY(1, 1),
FirstName NVARCHAR(20),
LastName NVARCHAR(20),
Birthday DATETIME2,
Nationality NVARCHAR(35),
LifeDescription NVARCHAR(255)
)

-- Autorite teos andmete kirjeldus
create table Author_CREATION
(
author_creation_Id INT PRIMARY KEY IDENTITY(1, 1),
author_Id INT,
FOREIGN KEY (author_Id) REFERENCES Author_DETAILS(author_Id),
AuthorName NVARCHAR(41),
Title NVARCHAR(100),
YearOfCreation DATETIME2,
TechniqueUsed NVARCHAR(100),
Size NVARCHAR(80),
Status NVARCHAR(35)
)

-- Galerii näituse andmete kirjeldus
create table Gallery_ARTSHOW
(
gallery_artshow_Id INT PRIMARY KEY IDENTITY(1, 1),
ArtshowName NVARCHAR(50),

gallery_Id INT,
FOREIGN KEY(gallery_Id) REFERENCES Gallery_DETAILS(gallery_Id),
Galleryname NVARCHAR(50),

author_creation_Id INT,
FOREIGN KEY(author_creation_Id) REFERENCES Author_CREATION(author_creation_Id),
CreationTitle NVARCHAR(100),

author_Id INT,
FOREIGN KEY(author_Id) REFERENCES Author_DETAILS(author_Id),
AuthorName NVARCHAR(100),

Date DATETIME2,
Director NVARCHAR(41),
Description NVARCHAR(255)
)

-- General tabel, kus on iga Galerii, Näitusi, kunstnikke ja nende teoseid.
create table GalleryDB_TABLE
(
galleryDB_Id INT PRIMARY KEY IDENTITY(1, 1),

gallery_id INT,
FOREIGN KEY(gallery_Id) REFERENCES Gallery_DETAILS(gallery_Id),
GalleryName NVARCHAR(50),

gallery_artshow_Id INT,
FOREIGN KEY(gallery_artshow_Id) REFERENCES Gallery_ARTSHOW(gallery_artshow_Id),
ArtshowName NVARCHAR(50),

author_Id INT,
FOREIGN KEY(author_Id) REFERENCES Author_DETAILS(author_Id),
AuthorName NVARCHAR(41),

author_creation_Id INT,
FOREIGN KEY(author_creation_Id) REFERENCES Author_CREATION(author_creation_Id),
CreationTitle NVARCHAR(100)
)

-- Suvalised andmed [Vähemalt 5 rida andmeid]
insert into Gallery_DETAILS (Name, Address, Phone, Email)
values
('Kuri Koerad', 'Vana Muuga tee 45', '+3725657520', 'KKoerad@gmail.com'),
('Avatud Ruum', 'Kadaka tee 69', '+3720002544', 'ARuum@gmail.com'),
('Kaasaegne Pilt', 'Mustakivi tee 3a', '+37242455594', 'KPilt@gmail.com'),
('Unfortunate Consequences', 'Peterburi tee 4', '+3725354430', 'uceeOU@gmail.com'),
('Õnnelik Karud', 'Ringi 22b', '+3714485392', 'OKarud@gmail.com')

insert into Author_DETAILS(FirstName, LastName, Birthday, Nationality, LifeDescription)
values
('Erik', 'Stepanov', '2006-04-10', 'Eesti', 'The one that makes everyone smile by his adorable art style reminding people of their childhoods'),
('Victor', 'Gideon', '1995-02-04', 'British', 'The researched that decided to drop his science and fiction ideas to turn this flame into the art that make peoples jaw drop down wide open'),
('Leon', 'Kennedy', '1984-09-20', 'American', 'His unique style of having to do a lot of backflips and kicks with the rotation of his leg really impacted the modern art stylistics and perhaps over a thousand walls with new holes'),
('Steinhard', 'Grüheft', '1999-05-22', 'German', 'The way his moustace looks reminds people of some important history figure, but do not be so suspicious of him, he is the kindnest artist having over a thousand billion euros invested into charity for kids with mental illnesses'),
('Tapok', 'Pomil', '2002-01-01', 'Russian', 'The name that makes even the most skilled artists shiver in their own seats, the sheer quality of his works make it feel like he have a genuine connection with aliens, which is also frankly his unique way of expressing himself')

insert into Author_CREATION (author_Id, AuthorName, Title, YearOfCreation, TechniqueUsed, Size, Status)
values
('5', 'Tapok Pomil', 'Sadness amongst others', '2022', 'Machine Oil', '220x450', 'Renting'),
('2', 'Victor Gideon', 'Sending my kisses goodbye', '2026', 'Acid', '500x500', 'On Sale'),
('4', 'Steinhard Grüheft', 'Moustace on the face', '2009', 'Acrylic Paint', '100x100', 'On Sale'),
('3', 'Leon Kennedy', 'Amazing Digital Backflip', '2026', 'Dirty Shoes', '1920x1600', 'Renting'),
('1', 'Erik Stepanov', 'Wall is white', '2023', 'White Paint', '450x450', 'Sold Out')

insert into Gallery_ARTSHOW(ArtshowName, gallery_Id, Galleryname, author_creation_Id, CreationTitle, author_Id, AuthorName, Date, Director, Description)
values
('Night Show', '5', 'Õnnelik Karud', '5', 'Wall is white', '1', 'Erik Stepanov', '2025-04-20', 'Asha Aloe', 'The night show'),
('Day Show', '2', 'Avatud Ruum', '3', 'Moustace on the face', '4', 'Steainhard Grüheft', '2026-02-21', 'Asha Aloe', 'The day show'),
('Unfortunate Joke', '2', 'Avatud Ruum', '5', 'Wall is white', '1', 'Erik Stepanov', '2025-05-20', 'Asha Aloe', 'The unfortunate joke show'),
('Selected Table', '1', 'Kuri Koerad', '4', 'Amazing Digital Backflip', '3', 'Leon Kennedy', '2022-01-23', 'Asha Aloe', 'The selected table show'),
('Darkness', '4', 'Unfortunate Consequences', '2', 'Sending my kisses goodbye', '2', 'Victor Gideon', '2026-01-01', 'Asha Aloe', 'The darkness show')


insert into GalleryDB_TABLE(gallery_id, GalleryName, gallery_artshow_Id, ArtshowName, author_Id, AuthorName, author_creation_Id, CreationTitle)
values
('1', 'Kuri Koerad', '1', 'Night Show', '1', 'Erik Stepanov', '5', 'Wall is white'),
('2', 'Avatud Ruum', '2', 'Day Show', '2', 'Victor Gideon', '2', 'Sending my kisses goodbye'),
('3', 'Kaasaegne Pilt', '3', 'Unfortunate Joke', '3', 'Leon Kennedy', '4', 'Amazing Digital Backflip'),
('4', 'Unfortunate Consequences', '4', 'Selected Table', '4', 'Steinhard Grüheft', '3', 'Moustace on the face'),
('5', 'Õnnelik Karud', '5', 'Darkness', '5', 'Tapok Pomil', '1', 'Sadness amongst others')

select * from Author_DETAILS
select * from Gallery_DETAILS
select * from Author_CREATION
select * from Gallery_ARTSHOW
select * from GalleryDB_TABLE


-- Teeme Stored Procedure
create procedure sp_ShowFullName
as begin
	select concat(FirstName, ' ', LastName) as [FULLNAME]
	from Author_DETAILS
end

exec sp_ShowFullName

-- JOIN-päringut

--- [1.]
select AuthorName, AD.Birthday, AD.Nationality, Title, TechniqueUsed, Status
from dbo.Author_DETAILS AD
join dbo.Author_CREATION CREAT
on AD.author_Id = CREAT.author_Id

--- [2.]
select gallery_artshow_Id, ArtshowName, CreationTitle, concat(FirstName,' ', LastName) as [Full Author Name], Director, Description
from dbo.Gallery_ARTSHOW GART
join dbo.Author_DETAILS ADE
on ADE.author_Id = GART.author_Id

--- [3.]
-- Ei jõudnud :(