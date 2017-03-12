drop database if exists librarySystem;

create database if not exists librarySystem;

use librarySystem;

create table authors(
	authNo integer not null,
	authName char(20),
	primary key (authNo)
);
insert into authors values (1,'Stormzy');
insert into authors values (2,'J.K Rowling');

create table borrowers (
	borrNo integer not null,
	borrName char(20),
	borrLimit integer,
	primary key (borrNo)
);
insert into borrowers values (857845,'David Plumb',5);
insert into borrowers values (837867,'Abubakar Suudy',5);

create table books (
	bookNo integer not null,
	title char(20),
	pageCount Integer,
	primary key (bookNo)
);
insert into books values(1,'The Flash',60);
insert into books values(2,'The Batman',70);

create table library (
	libNo integer not null,
	libName char(20),
	location char(20),
	primary key(libNo)
);
insert into library values(1,'Cardiff central','Cardiff');
insert into library values(2,'Old Swansea Central','Swansea');

create table has (
	bookNo integer not null,
	libNo integer not null,
	bookCopies integer,
	primary key(libNo, bookNo),
	foreign key (bookNo) references books (bookNo),
	foreign key (libNo) references library (libNo)
);
insert into has values(1,1,35);
insert into has values(2,1,3);

create table returnBook (
	bookNo integer not null,
	borrNo integer not null,
	dueBack char(15),
	primary key(bookNo),
	foreign key (bookNo) references books (bookNo),
	foreign key (borrNo) references borrowers (borrNo)
);
insert into returnBook values (1,837867,'14-12-2015');
insert into returnBook values (2,857845,'27-11-2015');