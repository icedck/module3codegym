create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
	cID int primary key not null auto_increment,
    cName varchar(20) not null,
    cAge int
);

create table Order1(
	oID int primary key not null auto_increment,
    cID int not null,
    oDate datetime,
    oTotalPrice bigint,
    foreign key (cID) references Customer(cID)
);

create table Product(
	pID int primary key not null auto_increment,
    pName varchar(20) not null,
    pPrice int
);

create table OrderDetail(
	oID int not null,
    pID int not null,
    odQTY int,
    primary key(oID, pID),
    foreign key(oID) references Order1(oID),
    foreign key(pID) references Product(pID)
);	
	