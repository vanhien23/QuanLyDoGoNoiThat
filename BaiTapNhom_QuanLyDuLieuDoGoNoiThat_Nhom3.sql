--Date: 12 / 05 /2024
--Member: Nhóm Trưởng: Hà Văn Hiên
--					   Trần Trương Thành Trung
--					   Nguyễn Văn Dương	
-- Đề Tài: Quản Lý Dữ Liệu Đồ Gỗ Nội Thất


create database QuanLyDoGoNoiThat_Nhom3_CSC10616008

---tao bang LoaiGo
Create table LoaiGo  (
MaLoai char(10) not null,
TenLoai nvarchar(40), 
Primary key(MaLoai)
)
---tao bang DoGo
Create table DoGo (
MaDG char(10) not null,
TenDG nvarchar(40),
MaLoai char(10),
GiaBo money,
Primary key(MaDG)
)

---tao lien ket khoa ngoai giua 2 bang DOGO va LOAIGO - thuoc tinh: MaLoai 
alter table DoGo
add constraint fk_DG_LG_MaLoai
foreign key (MaLoai)
references LoaiGo(MaLoai)


---tao bang MauGo
CREATE TABLE MauGo (
MaMau char(10) not null,
TenMau nvarchar(40), 
Primary key(MaMau)
)

----tao bang ThanhPhan
create table ThanhPhan (
MaTP char(10) not null,
TenTP nvarchar(40),
KichThuoc nvarchar(40),
Primary key (MaTP)
)

--tao bang TuongThich
create table TuongThich (
MaLoai char(10) not null,
MaMau char(10) not null,
Primary key (MaLoai, MaMau)
)

----tao lien ket khoa ngoai giua 2 bang TuongThich và LoaiGo - thuoc tinh: MaLoai
alter table TuongThich
add constraint fk_TT_LG_MaLoai
foreign key (MaLoai)
references LoaiGo(MaLoai)

---tao lien ket khoa ngoai giua 2 bang TuongThich va MauGo - thuoc tinh: MaMau
alter table TuongThich
add constraint fk_TT_MG_MaMau
foreign key (MaMau)
references MauGo(MaMau)

---tao bang ThanhPhan_Loai
create table ThanhPhan_Loai (
MaTP char(10) not null,
MaLoai char(10) not null,
DonGia money,
Primary key(MaTP, MaLoai)
)

---tao lien ket khoa ngoai giua 2 bang ThanhPhan_Loai và ThanhPhan - thuoc tinh: MaTP
alter table ThanhPhan_Loai
add constraint fk_TPL_TT_MaTP
foreign key (MaTP)
references ThanhPhan(MaTP)

---Tao lien ket khoa ngoai giua 2 bang ThanhPhan_Loai va LoaiGo - thuoc tinh: MaLoai
alter table ThanhPhan_Loai
add constraint fk_TPL_LG_MaLoai
foreign key (MaLoai)
references LoaiGo(MaLoai)

---tao bang CauThanh_DoGo
create table CauThanh_DoGo (
MaTP char(10) not null,
MaDG char(10) not null,
SoLuong int,
Primary key (MaTP, MaDG),
 )

---tao lien ket khoa ngoai giua 2 bang CauThanh_DoGo va ThanhPhan - thuoc tinh: MaTP
alter table CauThanh_DoGo
add constraint fk_CTDG_LT_MaTP
foreign key (MaTP)
references ThanhPhan(MaTP)

---tao lien ket khoa ngoai giua 2 bang CauThanh_DoGo va DoGo - thuoc tinh: MaDG
alter table CauThanh_DoGo
add constraint fk_CTDG_DG_MaDoGo
foreign key (MaDG)
references  DoGo(MaDG)

set dateformat dmy
go
---them du lieu vao LoaiGo
insert into LoaiGo(MaLoai,TenLoai)
values('G01',N'Cẩm Lai')

insert into LoaiGo(MaLoai,TenLoai)
values('G02',N'Sưa Đỏ')

insert into LoaiGo(MaLoai,TenLoai)
values('G03',N'Ngọc Am')

insert into LoaiGo(MaLoai,TenLoai)
values('G04',N'Hoàng Đàn')

insert into LoaiGo(MaLoai,TenLoai)
values('G05',N'Tử Đàn')

insert into LoaiGo(MaLoai,TenLoai)
values('G06',N'Mun Sừng')

insert into LoaiGo(MaLoai,TenLoai)
values('G07',N'Đàn Hương')

insert into LoaiGo(MaLoai,TenLoai)
values('G08',N'Tử Đàn')



---them du lieu vao MauGo
insert into MauGo(MaMau,TenMau)
values('M01',N'Nâu hồng')

insert into MauGo(MaMau,TenMau)
values('M02',N'Nâu đỏ')

insert into MauGo(MaMau,TenMau)
values('M03',N'Vàng nhạt')

insert into MauGo(MaMau,TenMau)
values('M04',N'Nâu đỏ nhạt')

insert into MauGo(MaMau,TenMau)
values('M05',N'Đỏ')

insert into MauGo(MaMau,TenMau)
values('M06',N'Đen')

insert into MauGo(MaMau,TenMau)
values('M07',N'Vàng')

insert into MauGo(MaMau,TenMau)
values('M08',N'Đỏ hồng')



---them du lieu vao tuong thich
insert into TuongThich(MaLoai,MaMau)
values('G01','M01')

insert into TuongThich(MaLoai,MaMau)
values('G02','M02')

insert into TuongThich(MaLoai,MaMau)
values('G03','M03')

insert into TuongThich(MaLoai,MaMau)
values('G04','M04')

insert into TuongThich(MaLoai,MaMau)
values('G05','M05')

insert into TuongThich(MaLoai,MaMau)
values('G06','M06')

insert into TuongThich(MaLoai,MaMau)
values('G07','M07')

insert into TuongThich(MaLoai,MaMau)
values('G08','M08')




----them du lieu vao DoGo
insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T01',N'Giường','G01',30000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T02',N'Cửa','G02',20000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T03',N'Tượng Rồng','G03',10000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T04',N'Bộ bàn ghế','G04',40000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T05',N'Tượng Quán  m','G05',60000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T06',N'Ly','G06',30000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('T07',N'Tượng Tế Công','G07',20000000)

insert into DoGo(MaDG,TenDG,MaLoai,GiaBo)
values('CTT',N'Cóc Thiềm Thừ','G08',15000000)



-----them du lieu vao ThanhPhan
insert into ThanhPhan(MaTP,TenTP,KichThuoc)
values('TH',N'Thân','50x50x300')

insert into ThanhPhan(MaTP,TenTP,KichThuoc)
values('GO',N'Gốc','100x100x80')

insert into ThanhPhan(MaTP,TenTP,KichThuoc)
values('CA',N'Cành','20x20x100')

insert into ThanhPhan(MaTP,TenTP,KichThuoc)
values('NU',N'Nu','100x100x120')

---them du lieu vao ThanhPhan_Loai
insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('TH','G01',27000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('TH','G02',18000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('CA','G03',9000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('TH','G04',36000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('TH','G05',54000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('GO','G06',27000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('TH','G07',18000000)

insert into ThanhPhan_Loai(MaTP,MaLoai,DonGia)
values('NU','G08',13500000)

---them du lieu vao CauThanh_DoGo
insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('TH','T01',1)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('TH','T02',1)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('CA','T03',2)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('TH','T04',1)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('TH','T05',1)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('TH','T06',1)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('GO','T07',2)

insert into CauThanh_DoGo(MaTP,MaDG,SoLuong)
values('NU','CTT',2)

--Ràng buộc mặc định: NOT NULL cho MaLoai.
ALTER TABLE LoaiGo ALTER COLUMN MaLoai char(10) NOT NULL;
--Ràng buộc duy nhất: MaMau trong bang MauGo.
ALTER TABLE MauGo ADD CONSTRAINT unique_MaMau UNIQUE (MaMau);
--Ràng buộc kiểm tra: GiaBo trong bang Do_Go phải cao hơn 10% tổng đơn giá của từng thành phần cấu thành nên bộ đó với số lượng chuẩn.

--câu lệnh update
UPDATE CauThanh_DoGo
SET MaTP = 'TH'
WHERE SoLuong = 10;

UPDATE ThanhPhan_Loai
SET MaLoai = 'G03'
WHERE DonGia = 888888888;

--câu lệnh delete 
DELETE FROM CauThanh_DoGo WHERE MaDG  = 'T03';

DELETE FROM  ThanhPhan_Loai WHERE	MaTP ='NU'





--câu lệnh kết bảng
SELECT D.MaDG, LoaiGo.TenLoai
FROM DoGo D
INNER JOIN LoaiGo ON D.MaLoai = LoaiGo.MaLoai;

--câu lệnh gom nhóm
SELECT
LoaiGo.TenLoai,
COUNT(DoGo.MaDG) AS SoLuongDoGo
FROM LoaiGo
LEFT JOIN DoGo
ON LoaiGo.MaLoai = DoGo.MaLoai
GROUP BY
LoaiGo.TenLoai;

--câu lệnh truy vấn đơn giản ----

SELECT *
FROM DoGo

SELECT *
FROM ThanhPhan


SELECT *
FROM CauThanh_DoGo



------câu lệnh kết bảng------
SELECT D.MaDG, LoaiGo.TenLoai
FROM DoGo D
INNER JOIN LoaiGo ON D.MaLoai = LoaiGo.MaLoai;

SELECT T.MaMau, LoaiGo.MaLoai
FROM TuongThich T
INNER JOIN LoaiGo ON T.MaLoai = LoaiGo.MaLoai;

SELECT D.MaDG, LoaiGo.MaLoai
FROM DoGo D
INNER JOIN LoaiGo ON D.MaLoai = LoaiGo.MaLoai;

--câu lệnh gom nhóm------
SELECT LoaiGo.TenLoai,
COUNT(DoGo.MaDG) AS SoLuongDoGo
FROM LoaiGo
LEFT JOIN DoGo
ON LoaiGo.MaLoai = DoGo.MaLoai
GROUP BY
LoaiGo.TenLoai;


SELECT ThanhPhan_Loai.MaLoai,
COUNT(ThanhPhan.MaTP) AS SoLuongThanhPhan
FROM ThanhPhan_Loai
LEFT JOIN ThanhPhan
ON ThanhPhan_Loai.MaTP = ThanhPhan.MaTP
GROUP BY
ThanhPhan_Loai.MaLoai;


SELECT CauThanh_DoGo.MaDG,
COUNT(ThanhPhan.MaTP) AS SoLuongThanhPhan
FROM CauThanh_DoGo
LEFT JOIN ThanhPhan
ON CauThanh_DoGo.MaTP = ThanhPhan.TenTP
GROUP BY
CauThanh_DoGo.MaDG;


--câu lệnh truy vấn lồng
SELECT TenLoai,
  (
    SELECT
      COUNT(*)
    FROM DoGo
    WHERE
      MaLoai = LoaiGo.MaLoai
  ) AS SoLuongDoGo
FROM LoaiGo;


SELECT MaLoai,
  (
    SELECT
      COUNT(*)
    FROM ThanhPhan
    WHERE
      ThanhPhan_Loai.MaTP = ThanhPhan.MaTP
  ) AS SoLuongThanhPhan
FROM ThanhPhan_Loai;

SELECT LoaiGo.TenLoai, 
	COUNT(TuongThich.MaLoai) AS TuongThich
		FROM LoaiGo
			JOIN TuongThich ON LoaiGo.MaLoai = TuongThich.MaLoai
				GROUP BY LoaiGo.TenLoai;



















