SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE du_an_1;
USE du_an_1;

CREATE TABLE `danhmuc` (
                           `id` int(11) NOT NULL,
                           `ten_dm` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sanpham` (
                           `id` int(11) NOT NULL,
                           `ten_sp` varchar(255) COLLATE utf8_bin NOT NULL,
                           `gia` decimal NOT NULL,
                           `hinh_anh` varchar(255) COLLATE utf8_bin NOT NULL,
                           `id_dm` int(11) NOT NULL,
                           `mota` text COLLATE utf8_bin DEFAULT NULL,
                           `trangthai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `hoadonchitiet` (
                                 `id_hd` int(11) NOT NULL,
                                 `id_sp` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `hoadon` (
                          `id` int(11) NOT NULL,
                          `tong_tien` float,
                          `trangthai` tinyint(1) NOT NULL,
                          `id_nd` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `nguoidung` (
                             `id` int(11) NOT NULL,
                             `ten` varchar(255) COLLATE utf8_bin NOT NULL,
                             `dia_chi` varchar(255) COLLATE utf8_bin NOT NULL,
                             `email` varchar(255) COLLATE utf8_bin NOT NULL,
                             `mat_khau` varchar(255) COLLATE utf8_bin NOT NULL,
                             `SĐT` varchar(20) COLLATE utf8_bin NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `binhluan` (
                            `id` int(11) NOT NULL,
                            `noi_dung` varchar(255) COLLATE utf8_bin NOT NULL,
                            `id_nd` int(11) NOT NULL,
                            `ngay_binh_luan` datetime NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `danhmuc`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `sanpham`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Loai_HangHoa` (`id_dm`);

ALTER TABLE `hoadonchitiet`
    ADD KEY `FK_HD_HoaDonChiTiet` (`id_hd`),
  ADD KEY `FK_SP_HoaDonChiTiet` (`id_sp`);

ALTER TABLE `hoadon`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nguoidung_HoaDon` (`id_nd`);

ALTER TABLE `nguoidung`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `binhluan`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK_NguoiDung_BinhLuan` (`id_nd`);

ALTER TABLE `binhluan`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

ALTER TABLE `danhmuc`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1022;

ALTER TABLE `sanpham`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1096;

ALTER TABLE `nguoidung`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `binhluan`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1096;

ALTER TABLE `sanpham`
    ADD CONSTRAINT `FK_danhmuc_sanpham` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`) ON DELETE CASCADE;
COMMIT;
