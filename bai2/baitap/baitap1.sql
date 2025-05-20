create database QuanLyVatTu;

use QuanLyVatTu;

create table NhaCC(
	MaNCC varchar(10) primary key not null,
    TenNCC varchar(50) not null,
    DiaChi varchar(50) not null
);

create table SDT_NhaCC(
	SDT varchar(10) not null,
	MaNCC varchar(10) not null,
    foreign key (MaNCC) references NhaCC (MaNCC)
);

create table DonDH(
	SoDH varchar(10) primary key not null,
    NgayDH datetime not null
);

create table VatTu(
	MaVTU varchar(10) primary key not null,
    TenVTU varchar(50) not null
);

create table PhieuXuat(
	SoPX varchar(10) primary key not null,
    NgayXuat datetime not null
);

create table PhieuNhap(
	SoPN varchar(10) primary key not null,
    NgayNhap datetime not null
);

create table CT_PhieuXuat(
	SoPX varchar(10) not null,
    MaVTU varchar(10) not null,
    DGXuat decimal(10,2) not null,
    SLXuat int not null,
    primary key(SoPX, MaVTU),
    foreign key (SoPX) references PhieuXuat(SoPX),
    foreign key (MaVTU) references VatTu(MaVTU)
);

create table CT_PhieuNhap(
	SoPN varchar(10) not null,
    MaVTU varchar(10) not null,
    DGNhap decimal(10,2) not null,
    SLNhap int not null,
    primary key(SoPN, MaVTU),
    foreign key (SoPN) references PhieuNhap(SoPN),
    foreign key (MaVTU) references VatTU(MaVTU)
);

create table CT_DonDH(
	SoDH varchar(10) not null,
    MaVTU varchar(10) not null,
    primary key(SoDH, MaVTU),
    foreign key (SoDH) references DonDH(SoDH),
    foreign key (MaVTU) references VatTU(MaVTU)
);

    