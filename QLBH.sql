CREATE DATABASE QLBH;

CREATE TABLE HANGHOA (
    MaHang NVARCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50),
    DVT NVARCHAR(20)
);

CREATE TABLE KHACHHANG (
    MaKH NVARCHAR(10) PRIMARY KEY,
    HoKH NVARCHAR(50),
    TenKH NVARCHAR(50),
    DiaChi NVARCHAR(100),
    SoDT NVARCHAR(15)
);

CREATE TABLE HOADON (
    SoHD INT PRIMARY KEY,
    NgayHD DATE,
    MaKH NVARCHAR(10),
    CONSTRAINT fk_khachhang FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);

CREATE TABLE CHITIETHOADON (
    SoHD INT,
    MaHang NVARCHAR(10),
    SoLuong INT,
    DonGia INT,
    PRIMARY KEY (SoHD, MaHang),
    CONSTRAINT fk_hoadon FOREIGN KEY (SoHD) REFERENCES HOADON(SoHD),
    CONSTRAINT fk_hanghoa FOREIGN KEY (MaHang) REFERENCES HANGHOA(MaHang)
);

-- Nhập dữ liệu cho bảng HANGHOA
INSERT INTO HANGHOA (MaHang, TenHang, DVT)
VALUES
    ('TL001', N'Thuốc lá Prince', N'Gói'),
    ('TL002', N'Thuốc lá White Horse', N'Gói'),
    ('B001', N'Bánh Chocolate', N'Hộp'),
    ('NM001', N'Nước mắm Nam Ngư', N'Chai');

-- Nhập dữ liệu cho bảng KHACHHANG
INSERT INTO KHACHHANG (MaKH, HoKH, TenKH, DiaChi, SoDT)
VALUES
    ('KH001', N'Nguyễn Văn', N'Hải', N'16 Lê Lợi - ĐN', '0935688515'),
    ('KH002', N'Trần Anh', N'Khôi', N'8 Lê Duẩn - ĐN', '0905619034'),
    ('KH003', N'Lê Ngọc', N'Lan', N'2 Thanh Thủy - ĐN', '0905943847'),
    ('KH004', N'Ngô Minh', N'Tú', N'12 Hải Hồ - ĐN', '0905881456');

-- Nhập dữ liệu cho bảng HOADON
INSERT INTO HOADON (SoHD, NgayHD, MaKH)
VALUES
    (001, '2013-09-03', 'KH001'),
    (002, '2013-09-05', 'KH002'),
    (003, '2013-10-12', 'KH001');

-- Nhập dữ liệu cho bảng CHITIETHOADON
INSERT INTO CHITIETHOADON (SoHD, MaHang, SoLuong, DonGia)
VALUES
    (001, 'TL001', 10, 7000),
    (001, 'B001', 5, 45000),
    (002, 'TL002', 30, 20000),
    (002, 'B001', 15, 48000),
    (003, 'NM001', 2, 25000);

-- Câu 2 (1,5 điểm): Hãy viết lệnh SQL để liệt kê danh sách các hóa đơn có tổng thành tiền từ 5 triệu đồng trở lên,
--biết thành tiền = số lượng * đơn giá. Yêu cầu hiển thị các thông tin: SoHD, NgayHD, Họ tên KH, Tổng thành tiền.
SELECT HD.SoHD, HD.NgayHD, KH.MaKH, SUM(CT.SoLuong * CT.DonGia) AS TongThanhTien
FROM HOADON HD
INNER JOIN KHACHHANG KH ON HD.MaKH = KH.MaKH
INNER JOIN CHITIETHOADON CT ON HD.SoHD = CT.SoHD
GROUP BY HD.SoHD, HD.NgayHD, KH.MaKH
HAVING SUM(CT.SoLuong * CT.DonGia) >= 5000000;
--Câu 3 (1,5 điểm): Hãy tạo View có tên BangTongHop để lập bảng tính tiền theo yêu cầu dưới đây.
--View gồm có các trường sau: SoHD, MaHang, SoLuong, DonGia, ThanhTien, Thue, Thực Trả,  Trong đó:
		--Thành tiền = số lượng * đơn giá
		--Thuế được tính như sau:
		--	Nếu mặt hàng là thuốc lá tính thuế 30% thành tiền
		--	Các mặt hàng còn lại nếu số lượng > 20 tính thuế 10% thành tiền.
		--	Nếu số lượng >10 và <20 tính thuế 5% thành tiền.
		--	Còn lại được miễn thuế
		--Thực trả = thành tiền + Thuế
CREATE VIEW BangTongHop AS
SELECT CT.SoHD, CT.MaHang, CT.SoLuong, CT.DonGia, 
    CT.SoLuong * CT.DonGia AS ThanhTien,
    CASE
        WHEN H.DVT = N'Gói' THEN CT.SoLuong * CT.DonGia * 0.3
        WHEN CT.SoLuong > 20 THEN CT.SoLuong * CT.DonGia * 0.1
        WHEN CT.SoLuong > 10 AND CT.SoLuong <= 20 THEN CT.SoLuong * CT.DonGia * 0.05
        ELSE 0
    END AS Thue,
    CT.SoLuong * CT.DonGia + 
    CASE
        WHEN H.DVT = N'Gói' THEN CT.SoLuong * CT.DonGia * 0.3
        WHEN CT.SoLuong > 20 THEN CT.SoLuong * CT.DonGia * 0.1
        WHEN CT.SoLuong > 10 AND CT.SoLuong <= 20 THEN CT.SoLuong * CT.DonGia * 0.05
        ELSE 0
    END AS ThucTra
FROM CHITIETHOADON CT
INNER JOIN HANGHOA H ON CT.MaHang = H.MaHang;
--Câu 4 (1,5 điểm): Hãy viết lệnh SQL liệt kê ra khách hàng mua có số lượng lớn nhất của mỗi mặt hàng
--gồm các cột sau: Mã khách hàng, họ tên khách hàng và số lượng.
SELECT CHITIETHOADON.MaHang, KHACHHANG.MaKH, KHACHHANG.HoKH + ' ' + KHACHHANG.TenKH AS 'Họ tên khách hàng', MAX(CHITIETHOADON.SoLuong) AS 'Số lượng'
FROM CHITIETHOADON
LEFT JOIN HOADON ON CHITIETHOADON.SoHD = HOADON.SoHD
LEFT JOIN KHACHHANG ON HOADON.MaKH = KHACHHANG.MaKH
GROUP BY CHITIETHOADON.MaHang, KHACHHANG.MaKH, KHACHHANG.HoKH, KHACHHANG.TenKH;
--Câu 5 (1,5 điểm): Hiển thị danh sách khách hàng mua hàng vào vào tháng 9 năm 2013
--và có tổng số tiền của hóa đơn lớn hơn hoặc bằng 500000.
SELECT H.MaKH,TenKH, SUM(CT.SoLuong * CT.DonGia) AS TongSoTien
FROM HOADON H
INNER JOIN KHACHHANG K ON H.MaKH = K.MaKH
INNER JOIN CHITIETHOADON CT ON H.SoHD = CT.SoHD
WHERE YEAR(H.NgayHD) = 2013 AND MONTH(H.NgayHD) = 9
GROUP BY H.MaKH, TenKH
HAVING SUM(CT.SoLuong * CT.DonGia) >= 500000;
--Câu 6 (1 điểm): Hiển thị danh sách các mặt hàng bán được nhiều nhất
--từ ngày 01/09/2013 đến 31/10/2013
SELECT CT.MaHang, H.TenHang, SUM(CT.SoLuong) AS SoLuongBanDuoc
FROM CHITIETHOADON CT
LEFT JOIN HOADON HD ON CT.SoHD = HD.SoHD
LEFT JOIN HANGHOA H ON CT.MaHang = H.MaHang
WHERE HD.NgayHD BETWEEN '2013-09-01' AND '2013-10-31'
GROUP BY CT.MaHang, H.TenHang
ORDER BY SoLuongBanDuoc DESC;
--Câu 7 (1,5 điểm): Hãy viết lệnh SQL thực hiện các thao tác sau:
	--	Thêm một bản ghi mới vào bảng CHITIETHOADON; dữ liệu phù hợp nhưng không được nhập giá trị null.
	--	Thay đổi đơn giá của các mặt hàng là thuốc lá tăng lên 10%.
	--	Xóa các khách hàng chưa mua bất kì mặt hàng nào.
INSERT INTO CHITIETHOADON (SoHD, MaHang, SoLuong, DonGia)
VALUES
    (004, 'TL002', 5, 25000);

UPDATE CHITIETHOADON
SET DonGia = DonGia * 1.10
WHERE MaHang LIKE 'TL%';

DELETE FROM KHACHHANG
WHERE MaKH NOT IN (SELECT DISTINCT MaKH FROM HOADON);




