create database quan_ly_ban_hang;

use quan_ly_ban_hang;

CREATE TABLE khach_hang (
    ma_khach_hang VARCHAR(5) PRIMARY KEY,
    ho_va_ten_lot VARCHAR(50),
    ten VARCHAR(50),
    dia_chi VARCHAR(255),
    email VARCHAR(50),
    dien_thoai VARCHAR(13)
);

CREATE TABLE san_pham (
    ma_san_pham INT PRIMARY KEY AUTO_INCREMENT,
    ten_sp VARCHAR(50),
    mo_ta VARCHAR(255),
    so_luong INT CHECK (so_luong >= 0),
    don_gia DECIMAL(15 , 2 ) CHECK (don_gia >= 0)
);

CREATE TABLE hoa_don (
    ma_hoa_don INT PRIMARY KEY AUTO_INCREMENT,
    ngay_mua_hang DATE,
    ma_khach_hang VARCHAR(5),
    trang_thai VARCHAR(30),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang)
);

CREATE TABLE hoa_don_chi_tiet (
    ma_hoa_don_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hoa_don INT,
    ma_san_pham INT,
    so_luong INT,
    FOREIGN KEY (ma_hoa_don)
        REFERENCES hoa_don (ma_hoa_don),
    FOREIGN KEY (ma_san_pham)
        REFERENCES san_pham (ma_san_pham)
);

insert into khach_hang (ma_khach_hang, ho_va_ten_lot, ten, dia_chi, email, dien_thoai) values
('KH001', 'Nguyen Van', 'An', 'Hà Nội', 'an.nguyen@example.com', '0912345678'),
('KH002', 'Tran Thi', 'Binh', 'TP. HCM', 'binh.tran@example.com', '0923456789'),
('KH003', 'Le Hoang', 'Chau', 'Đà Nẵng', 'chau.le@example.com', '0934567890'),
('KH004', 'Pham Thanh', 'Dung', 'Hải Phòng', 'dung.pham@example.com', '0945678901'),
('KH005', 'Hoang Minh', 'Anh', 'Cần Thơ', 'anh.hoang@example.com', '0956789012');

insert into san_pham (ten_sp, mo_ta, so_luong, don_gia) values
('Laptop Dell', 'Laptop cấu hình mạnh', 10, 15000000),
('Điện thoại Samsung', 'Điện thoại thông minh', 20, 8000000),
('Tai nghe Sony', 'Tai nghe không dây', 15, 2000000),
('Bàn phím Logitech', 'Bàn phím cơ', 30, 1200000),
('Chuột gaming Razer', 'Chuột chuyên game', 25, 900000);

insert into hoa_don (ngay_mua_hang, ma_khach_hang, trang_thai) values
('2016-05-01', 'KH001', 'Đã thanh toán'),
('2016-05-05', 'KH002', 'Chưa thanh toán'),
('2016-05-10', 'KH003', 'Đã thanh toán'),
('2016-05-15', 'KH004', 'Chưa thanh toán'),
('2016-05-20', 'KH005', 'Đã thanh toán');

insert into hoa_don_chi_tiet (ma_hoa_don, ma_san_pham, so_luong) values
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 4, 3),
(3, 5, 1),
(4, 1, 2),
(1, 2, 1),
(5, 3, 1),
(1, 4, 2),
(1, 5, 1);

SELECT 
    COUNT(ma_khach_hang) AS 'so luong khach hang'
FROM
    khach_hang;

select max(don_gia) as "Don gia lon nhat"
from san_pham;

SELECT 
    MIN(so_luong) AS 'So luong thap nhat'
FROM
    san_pham;

SELECT 
    SUM(so_luong) AS 'Tong so luong san pham'
FROM
    san_pham;

SELECT 
    *
FROM
    hoa_don
WHERE
    YEAR(ngay_mua_hang) = 2016
        AND MONTH(ngay_mua_hang) = 12
        AND trang_thai = 'Chưa thanh toán';
        
SELECT 
    ma_hoa_don, COUNT(ma_san_pham) AS 'so loai san pham'
FROM
    hoa_don_chi_tiet
GROUP BY ma_hoa_don;

SELECT 
    ma_hoa_don, COUNT(ma_san_pham) AS 'so loai san pham'
FROM
    hoa_don_chi_tiet
GROUP BY ma_hoa_don
HAVING COUNT(ma_san_pham) >= 5;

SELECT 
    ma_hoa_don, ngay_mua_hang, ma_khach_hang
FROM
    hoa_don
ORDER BY ngay_mua_hang DESC;