-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2022 at 10:34 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `slide_name` varchar(100) NOT NULL,
  `imageurl` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `commentid` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bookid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `hienthi` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`commentid`, `noidung`, `ten`, `email`, `bookid`, `date`, `hienthi`) VALUES
(1, 'Sách rất hay!!', 'Hoàng Việt', 'hoangvietnguyen@gmail.com', 000044, '2022-01-02 17:58:03', 0),
(2, 'Nếu bạn muốn có một cuốn sách đọc cho nhanh, cuốn sách này không dành cho bạn. Nếu bạn chỉ yêu thích kết thúc có hậu, cuốn sách này cũng không dành cho bạn. Nếu bạn không thích những bối cảnh siêu nhiên, cuốn sách này cũng không dành cho bạn.', 'Hoàng Nam', 'hoangnam@gmail.com', 000044, '2022-01-02 17:58:49', 0),
(9, 'Sách rất hay. Nên đọc!!', 'Quốc Huy', 'huy@gmail.com', 000044, '2022-01-03 10:29:49', 0),
(12, 'Web rất đẹp', 'Ajax', 'ajax@gmail.com', 000044, '2022-01-03 10:34:16', 0),
(13, 'hay lắm', 'viet', 'viet@gmail.com', 000047, '2022-01-12 15:49:16', 0),
(14, 'Sách rất hay!!!', 'viet', 'viet@gmail.com', 000055, '2022-01-14 09:42:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `bookname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bookimageurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bookdescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bookpages` int(11) DEFAULT 0,
  `bookweight` float DEFAULT 0,
  `releasedate` date DEFAULT NULL,
  `nxbid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `categoryid` int(2) UNSIGNED ZEROFILL NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,0) UNSIGNED DEFAULT 0,
  `timestamp` datetime DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `bookname`, `bookimageurl`, `bookdescription`, `bookpages`, `bookweight`, `releasedate`, `nxbid`, `categoryid`, `quantity`, `price`, `timestamp`, `type`) VALUES
(000044, 'Ma bùn lưu manh', 'ma-bun-luu-manh-mt.jpg', '', 55, 52, '2021-12-08', 000024, 19, 2, '55000', '2021-12-20 09:40:11', 1),
(000046, 'Lập kế hoạch kinh doanh hiệu quả', 'lap-ke-hoach-kinh-doanh-hieu-qua.jpg', 'a', 100, 100, '2021-12-06', 000021, 19, 100, '119000', '2021-12-28 17:20:26', 1),
(000047, 'Bank 4.0 - Giao Dịch Mọi Nơi, Không Chỉ Là Ng', 'bank-4.0.jpg', 'Kirito, nhân vật chính, là người đầu tiên trong số game thủ SAO biết chấp nhận chân tướng ấy. Và ở hiện trường của trò chơi - một thành nổi khổng lồ mang tên Aincrad, cậu ta dần dà hiển lộ được tài năng trong vai trò game thủ solo. Kirito vốn định duy trì tình trạng chiến đấu đơn độc đầy mạo hiểm đó cho đến khi đạt mục tiêu là vươn tới tầng cao nhất để phá đảo game, nhưng sau lời mời giàu sức thuyết phục của nữ kiếm sĩ Asuna, cậu quyết định sát cánh cùng cô. Cuộc gặp gỡ ấy đã tạo nên bước ngoặt có thể gọi là định mệnh đối với Kirito…', 568, 350, '2015-01-03', 000017, 34, 56, '103000', '2022-01-02 03:49:59', 1),
(000048, 'Bộ Sách 500 Câu Chuyện Đạo Đức ', 'bo-sach-500-cau-chuyen-dao-duc.jpg', '', 300, 290, '2022-01-11', 000022, 24, 200, '210000', '2022-01-02 03:51:25', 1),
(000049, 'Lịch Sử Ung Thư - Hoàng Đế Của Bách Bệnh', 'ung-thu-hoang-de-cua-bach-benh.jpg', '', 800, 290, '2022-01-10', 000020, 27, 190, '90000', '2022-01-02 03:52:34', 1),
(000050, 'Cuốn Sách Khám Phá : Trời Đêm Huyền Diệu', 'troi-dem-huyen-dieu.jpg', '', 902, 180, '2021-12-08', 000017, 20, 211, '195000', '2022-01-02 03:55:02', 1),
(000051, 'Combo Mẹ Con Sư Tử - Bồ Tát Ngàn Tay Ngàn Mắt', 'combo-me-con-su-tu-bo-tat-ngan-tay-ngan-mat.jpg', '', 200, 100, '2021-12-08', 000018, 27, 902, '315000', '2022-01-02 03:57:47', 2),
(000052, 'Chuyện Nghề và Chuyện Đời - Bộ 4 cuốn', 'combo-chuyen-nghe-chuyen-doi.jpg', '', 800, 197, '2021-12-06', 000022, 21, 200, '340000', '2022-01-02 04:00:05', 2),
(000053, 'Combo Osho: Hạnh Phúc Tại Tâm, Can Đảm Biến', 'combo-hanh-phuc-sang-tao.jpg', '', 144, 255, '2015-01-03', 000018, 24, 244, '120000', '2022-01-02 04:01:14', 2),
(000054, 'Combo Giáo Dục và Ý Nghĩa Cuộc Sống', 'combo-giao-duc-va-y-nghia-cuoc-song.jpg', '', 800, 1345, '2022-01-11', 000023, 39, 100, '240000', '2022-01-02 04:02:26', 2),
(000055, 'Đường Mây Trong Cõi Mộng', 'duong-may-trong-coi-mong.jpg', '', 400, 210, '2022-01-10', 000018, 26, 24, '99000', '2022-01-02 04:05:49', 3),
(000056, 'Muôn Kiếp Nhân Sinh', 'muon-kiep-nhan-sinh.jpg', '', 2344, 190, '2021-12-15', 000022, 24, 12, '245000', '2022-01-02 04:06:47', 3),
(000057, 'Đường Mây Trên Đất Hoa', 'duong-may-tren-dat-hoa.jpg', '', 52, 124, '2015-01-03', 000020, 26, 23, '123000', '2022-01-02 04:08:52', 3),
(000058, 'Đại dịch trên  những con đường tơ lụa', 'dai-dich-tren-con-duong-to-lua.jpg', '', 245, 123, '2022-01-14', 000022, 22, 234, '340000', '2022-01-02 04:09:58', 4),
(000059, 'Suối nguồn và cái tối hiện trong từng cá thể', 'suoi-nguon-va-cai-toi-trong-tung-ca-the.jpg', '', 210, 90, '2021-12-06', 000020, 20, 100, '200000', '2022-01-02 04:10:56', 4),
(000060, 'Hào quan của vua Gia Long trong mắt Michel', 'vua-gia-long.jpg', '', 398, 187, '2017-08-07', 000018, 25, 56, '195000', '2022-01-02 04:12:05', 5),
(000061, 'Cám  ơn vì đã được thương', 'cam-on-vi-da-duoc-thuong.jpg', '', 23, 167, '2015-01-03', 000017, 20, 23, '56000', '2022-01-02 04:12:58', 4),
(000062, 'Ngoại Giao Của Chính Quyền Sài Gòn', 'ngoai-giao-cua-chinh-quyen-sai-gon.jpg', '', 290, 100, '2022-01-09', 000022, 19, 20, '200000', '2022-01-14 03:58:45', 3),
(000063, 'ComBo Dinh Dưỡng Xanh -  Thực Dược Xanh', 'combo-dinh-duong-than-duoc-xanh.jpg', '', 1900, 134, '2021-12-15', 000022, 20, 567, '1200000', '2022-01-14 04:01:20', 2),
(000064, 'ComBo Ăn Xanh Để Khỏe - Sống Lành Để Trẻ', 'combo-an-xanh-song-lanh.jpg', '', 234, 240, '2021-12-06', 000023, 29, 600, '1490000', '2022-01-14 04:02:41', 2),
(000065, 'ComBo Lược Sử Loài Người - Lược Sử Trung Gian', 'combo-luoc-su-loai-nguoi.jpg', '', 267, 400, '2015-01-03', 000018, 25, 166, '230000', '2022-01-14 04:04:43', 2),
(000066, 'ComBo Lược Sử Loài Người-Lược Sử Trung Gian', 'combo-luoc-su-loai-nguoi.jpg', '', 267, 400, '2015-01-03', 000018, 25, 166, '230000', '2022-01-14 04:04:43', 2),
(000067, 'Lịch Sử Thế Giới', 'lich-su-the-gioi.jpg', '', 200, 100, '2021-12-08', 000021, 25, 100, '300', '2022-01-14 04:07:47', 1),
(000068, 'Những Câu Chuyện Về Tính Lương Thiện', 'bo-sach-nhung-cau-chuyen-cho-con-thanh-nguoi-tu-te.jpg', '', 100, 100, '2021-12-06', 000020, 23, 100, '230000', '2022-01-14 04:09:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(2) UNSIGNED ZEROFILL NOT NULL,
  `categoryname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `categoryname`, `parent`) VALUES
(19, 'Sách kinh tế - kỹ năng', 1),
(20, 'Nghệ thuật sống - tâm lý', 1),
(21, 'Sách văn học Việt Nam', 1),
(22, 'Sách văn học nước ngoài', 1),
(23, 'Sách thiếu nhi', 1),
(24, 'Sách giáo dục - gia đình', 1),
(25, 'Sách lịch sử', 1),
(26, 'Sách văn hóa - nghệ thuật', 1),
(27, 'Sách khoa học - triết học', 1),
(28, 'Sách tâm linh, tôn giáo', 1),
(29, 'Sách y học - thực dưỡng', 1),
(34, 'Kinh tế - chính trị', 19),
(35, 'Sách khởi nghiệp', 19),
(36, 'Tài chính kế toán', 19),
(37, 'Quản lí nhân sự', 19),
(38, 'Sách kỹ năng làm việc', 19),
(39, 'Sách kỹ năng làm việc', 19);

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
--

CREATE TABLE `danhgia` (
  `id` int(11) DEFAULT NULL,
  `danhgia` varchar(200) NOT NULL,
  `sosao` int(11) NOT NULL,
  `userid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `bookid` int(6) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noidungsach`
--

CREATE TABLE `noidungsach` (
  `chuong` varchar(100) NOT NULL,
  `idsach` int(6) UNSIGNED ZEROFILL NOT NULL,
  `noidung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `noidungsach`
--

INSERT INTO `noidungsach` (`chuong`, `idsach`, `noidung`) VALUES
('Bạn không cần phải là một thiên tài', 000046, 'HÃY TÌM MỘT CỘNG ĐỒNG TÀI NĂNG\r\nTôi thích ý tưởng cộng đồng tài năng, vì nó tạo chỗ đứng cho tất cả chúng ta trong quá trình sáng tạo: những kẻ không tự coi mình là thiên tài. Bạn không nhất thiết phải tài ba hay thông minh xuất chúng để trở thành một mắt xích giá trị trong một cộng đồng tài năng, vấn đề là bạn đóng góp được gì – những ý tưởng bạn chia sẻ, chất lượng các mối liên hệ do bạn tạo ra, và những cuộc đàm luận do bạn khởi đầu. Nếu quên hai chữ thiên tài đi và cố nghĩ xem mình có thể đóng góp gì cho một cộng đồng tài năng, chúng ta sẽ điều chỉnh được những kỳ vọng của bản thân và của xã hội nơi chúng ta muốn được họ chấp nhận. Chúng ta có thể ngừng hỏi mọi người làm được gì cho ta, mà bắt đầu tự hỏi chúng ta làm được gì cho họ.\r\nHÃY LÀ KẺ NGHIỆP DƯ\r\nDân nghiệp dư có thể không được đào tạo bài bản, nhưng họ dành cả đời để học hỏi và chú trọng học ở môi trường mở để mọi người rút kinh nghiệm từ thất bại và thành công của họ.\r\nĐôi khi, những kẻ a-ma-tơ có nhiều điều để dạy chúng ta hơn cả các chuyên gia.\r\nThế giới đang đổi thay chóng mặt, nó biến tất cả chúng ta thành a-ma-tơ. Ngay cả với những kẻ nhà nghề, cách tốt nhất để sự nghiệp phát triển là giữ lại tinh thần a-ma-tơ và sẵn sàng chấp nhận sự vô danh, bất ổn.\r\nBẠN KHÔNG THỂ NGHE THẤY GIỌNG MÌNH NẾU KHÔNG DÙNG ĐẾN NÓ\r\nNghe có vẻ hơi cực đoan, nhưng trong thời đại ngày nay, nếu sản phẩm của bạn không được đưa lên mạng thì coi như nó không tồn tại. Chúng ta đều có cơ hội sử dụng tiếng nói và nêu ra quan điểm của mình, nhưng rất nhiều người lại lãng phí nó. Nếu muốn mọi người biết về những gì bạn đang làm và những thứ bạn quan tâm, bạn phải chia sẻ chúng.\r\nĐỌC CÁO PHÓ\r\nCáo phó không thực sự nói về cái chết; chúng nói về cuộc sống. “Mỗi bản cáo phó luôn tóm ợc người đó anh hùng và cao cả ra sao,” nghệ sĩ Maira Kalman viết. Đọc về người chết và những gì họ làm với cuộc sống của họ khiến tôi muốn đứng dậy và làm gì đó tốt đẹp cho cuộc sống của chính tôi. Nghĩ về cái chết mỗi sáng khiến tôi muốn sống.\r\nHãy thử nghiệm: Bắt đầu đọc cáo phó vào mỗi sáng. Lấy cảm hứng từ những người đã trải nghiệm cuộc sống trước bạn – họ đều bắt đầu là một tay mơ, sau đó đến đích bằng cách dám dấn thân và sử dụng những gì họ có. Hãy noi theo những tấm gương đó.\r\n\r\n'),
('Công nghệ mới chỉ nên được coi là bàn đạp hướng đến mục tiêu, chứ không phải là mục tiêu.', 000058, 'Những công ty từ-tốt-trở-thành-vĩ-đại áp dụng công nghệ mới chủ yếu để tạo đà cho hướng đi của họ, chứ không phải để định hướng. Họ coi công nghệ chỉ là phương tiện để đạt được mục tiêu, chứ không phải là mục tiêu.\r\n\r\n Các công ty cùng tiềm năng khác thường cảm thấy công nghệ mới là một mối đe dọa, và lo sợ sẽ không theo kịp xu hướng, do đó hối hả trang bị công nghệ mà không có một kế hoạch tổng thể.\r\n\r\nNgược lại, các công ty từ-tốt-trở-thành-vĩ-đại suy tính cẩn thận liệu một công nghệ nào đó có thể giúp họ tiến nhanh hơn trên con đường đã chọn không. Nếu có, họ sẽ đi tiên phong áp dụng công nghệ đó, ngược lại họ sẽ bỏ qua hoặc chỉ theo mặt bằng chung của ngành.\r\n\r\nWalgreens, một chuỗi nhà thuốc lớn, là một ví dụ điển hình cho việc công nghệ mới nên được khai thác như thế nào.\r\n\r\nỞ thời kỳ đầu bùng nổ thương mại điện tử, công ty dược online Drugstore.com được ra mắt trong cơn sốt thị trường. Walgreens bị nhận định  tụt hậu trong việc triển khai kinh doanh trực tuyến, công ty mất 40% giá trị cổ phiếu, do đó sức ép lúc này là phải nhanh chóng thực thi công nghệ này.\r\n\r\nThay vì chịu thua, Walgreens tìm cách phối hợp hình thức trực tuyến với chiến lược nòng cốt của công ty: Làm cho việc mua bán trở nên tiện lợi hơn từ đó kiếm được lợi nhuận lớn hơn trên mỗi khách hàng.\r\n\r\nChỉ 1 năm sau, họ cho ra đời trang Walgreens.com, tăng tính cạnh tranh cho chiến lược ban đầu thông qua các hình thức như kê đơn online. Trong khi Drugstore.com dần dần thua lỗ gần hết tiền trong vòng 1 năm thì Walgreens không những hồi phục mà còn tăng gần gấp đôi giá cổ phiếu.\r\n\r\n'),
('Lãnh đạo cấp độ 5 đem lại những tiến triển thành công từ bình thường thành vĩ đại.', 000058, 'Tất cả các công ty từ-tốt-thành-vĩ đại đều có một điểm chung gọi là lãnh đạo cấp độ 5.\r\n\r\n Những nhà lãnh đạo cấp độ 5 không chỉ là những cá nhân xuất sắc hay những nhà quản lý đơn thuần họ còn mang khát khao chung của cả công ty. Đồng thời, họ cũng là một cá nhân khiêm tốn. Họ say mê thành tựu, và muốn công ty tiếp tục hoạt động tốt sau khi họ nghỉ. Không hề quan tâm đến cái tôi cá nhân, những nhà lãnh đạo cấp độ 5 là những người giản dị và mộc mạc. San sẻ trách nhiệm trong thành công của công ty, nhưng họ hạ thấp vai trò của mình trong thành công ấy, tuy nhiên khi có thiếu sót họ nhanh chóng gánh vác trách nhiệm.\r\n\r\nVí dụ như Darwin Smith, người đã biến Kimberly-Clark trở thành công ty hàng hóa giấy tiêu dùng hàng đầu trên thế giới. Ông không muốn tạo dựng hình ảnh bản thân như một người hùng hay một người nổi tiếng. Ông ăn mặc như một người nông dân, dành thời gian nghỉ lễ làm việc ở nông trại tại Wisconsin và coi những người thợ sửa ống nước hay thợ điện là bạn.\r\n\r\nNgược lại, 2 trong số 3 CEO của các công ty tiềm năng ngang hàng lại có cái tôi quá lớn, đến nỗi gây hại tới thành công lâu dài của công ty. Điều đó thể hiện rõ rệt trong việc kế thừa và phát huy thành công.\r\n\r\nVí dụ như Stanley Gault, CEO thành công nhưng cũng độc đoán có tiếng của công ty Rubbermaid, sau khi nghỉ ông ta để lại một đội ngũ quản lý quá hời hợt khiến cho dưới thời người kế nhiệm, Rubbermaid từ một công ty được ngưỡng mộ nhất trên tạp chí Fortune trở thành công ty bị đối thủ mua lại chỉ sau 5 năm.\r\n\r\n'),
('Mở cửa căn phòng của những kỳ quan', 000049, 'ĐỪNG TRỞ THÀNH KẺ ĐẦU CƠ TÍCH TRỮ\r\nChúng ta đều có những bộ sưu tập quý giá của riêng mình. Chúng có thể là những căn phòng kỳ diệu hữu hình, chẳng hạn như các giá sách trong phòng khách đựng đầy tiểu thuyết, đĩa hát, phim ảnh, hoặc các bảo tàng ở dạng vô hình trong tâm trí con người. Đầu óc chúng ta ghi lại ký ức về những nơi ta từng đến, những người ta từng gặp, và những kinh nghiệm ta tích góp. Tất cả chúng ta đều mang theo bên mình những thứ kỳ diệu và tuyệt vời mà chúng ta bắt gặp trong quá trình sống và làm việc. Những ghi chép trong tâm trí đó hình thành sở thích của mỗi người và sở thích tác động đến công việc.\r\nKHÔNG CÓ CÁI GỌI LÀ THÚ VUI TỘI LỖI\r\nKhi bạn chia sẻ thị hiếu và ảnh hưởng của mình, hãy can đảm thừa nhận tất cả. Đừng từ bỏ niềm vui thích chỉ vì quá hà khắc với bản thân. Đừng giống như những gã kém cỏi trong tiệm băng đĩa, tranh cãi về việc ban nhạc punk rock nào mới là “thứ thiệt”. Đừng cố tỏ ra tân thời hay sành điệu. Cứ cởi mở và chân thành về những gì bạn thích là cách tốt nhất để kết nối với những người có sở thích giống bạn.\r\nLUÔN CÔNG NHẬN SỰ ĐÓNG GÓP CỦA NGƯỜI KHÁC\r\nNếu chia sẻ sản phẩm của người khác, bạn phải có nhiệm vụ đảm bảo người đó nhận được sự vinh danh xứng đáng. Việc ghi nguồn tham khảo trong thời đại sao chép, dẫn lại, đăng lại ngày nay nghe có vẻ phù phiếm, nhưng đó là việc đáng làm và nên làm. Lúc nào bạn cũng nên chia sẻ sản phẩm của người khác như thể đó là sản phẩm của chính mình, đối xử với nó bằng thái độ quan tâm, trân trọng.\r\n\r\n'),
('Mỗi ngày chia sẻ một vài điều nho nhỏ', 000046, 'GỬI ĐI THÔNG ĐIỆP MỖI NGÀY\r\nHình thức chia sẻ không quan trọng. Thông điệp hằng ngày có thể là bất cứ thứ gì bạn muốn – một bài blog, một email, một câu trên Twitter, một video trên YouTube, hoặc bất cứ thứ gì mang tính truyền thông đại chúng. Chẳng có kế hoạch mẫu nào có thể phù hợp cho tất cả mọi người.\r\nTất nhiên đừng để việc chia sẻ lấn chiếm quá nhiều thời gian làm việc thực sự. Nếu bạn gặp khó khăn trong việc cân đối hai điều này, hãy đặt đồng hồ khoảng 30 phút. Khi kết thúc khoảng thời gian này, hãy thoát khỏi Internet và quay lại làm việc.\r\nBÀI KIỂM TRA “THẾ THÌ CÓ GÌ ĐẶC BIỆT”?\r\nĐừng bao giờ quên áp dụng bài kiểm tra “Thế thì có gì đặc biệt?” trước khi chia sẻ bất cứ thứ gì. Đừng nghĩ quá nhiều, chỉ cần tin vào cảm giác của mình. Nếu bạn không chắc có nên chia sẻ thứ gì đó hay không, hãy cứ để nó lại trong vòng 24 giờ. Hãy lôi nó ra vào ngày hôm sau và nhìn nó theo hướng mới. Tự hỏi “Liệu nó có hữu ích và thú vị không?” Để dành không có gì sai trái cả. Nút tạm lưu bản nháp cũng giống như một liều thuốc phòng bệnh – có thể lúc này bạn không cảm thấy dễ chịu, nhưng sáng hôm sau, bạn sẽ thấy may mắn vì mình đã uống liều thuốc đó.\r\nBIẾN LƯU LƯỢNG THÀNH TRỮ LƯỢNG\r\nBạn phải lật lại những ý tưởng cũ để xem trước đó bạn nghĩ gì. Một khi coi chia sẻ là một phần của công việc hằng ngày, bạn sẽ để ý thấy những đề tài và xu hướng dần xuất hiện trong các bài chia sẻ của bạn. Bạn sẽ tìm thấy những hình mẫu trong lưu lượng. Khi phát hiện ra những hình mẫu này, hãy thu thập những mảnh nhỏ đó và biến chúng thành thứ lớn lao và quan trọng hơn. Bạn có thể biến lưu lượng thành trữ lượng.\r\nXÂY DỰNG MỘT TÊN TUỔI (TÊN MIỀN) TỐT\r\nViệc sở hữu không gian riêng thú vị ở chỗ bạn có thể làm gì với nó tùy thích. Tên miền thuộc về bạn. Hãy tạo dựng một tên miền hay, giữ cho nó sạch sẽ, và cuối cùng nó sẽ chính là tiền bạc của bạn. Dù mọi người có xuất hiện hay không thì bạn cũng vẫn đang ở đó, làm công việc của mình, và sẵn sàng chờ bất cứ khi nào họ đến.\r\n\r\n'),
('Một phương thức mới', 000047, 'Nếu hệ thống cũ đó chính là sản phẩm của 100 năm lịch sử marketing – được thiết kế cho phù hợp với nhu cầu của những tập đoàn của thế kỷ XX – và rồi đến hệ tư tưởng khởi nguồn từ thời điểm chuyển giao sang thiên niên kỷ mới. Nó bắt đầu và xoay chuyển để đáp ứng nhu cầu của một loại hình doanh nghiệp mới – với nhà marketing riêng của nó.'),
('Những công ty từ-tốt-đến-vĩ-đại đã chuyển mình như thế nào', 000056, 'Cuốn sách bán chạy trước đó của Jim Collins Xây dựng để Trường tồn giải thích cách  các công ty lớn có thể duy trì hiệu suất cao và giữ vững vị thế. Tuy nhiên, không phải công ty nào cũng lớn mạnh. Do đó, một câu hỏi đặt ra là: Các công ty đi từ tốt đến vĩ đại như thế nào? Tại sao họ có thể làm nên sự khác biệt trong khi các đối thủ cạnh tranh chỉ có thể ở mức bình thường.\r\n\r\n Để trả lời những câu hỏi này, Jim Collins cùng nhóm nghiên cứu đã tìm hiểu ba nhóm doanh nghiệp công của Mỹ trong dự án kéo dài 5 năm:\r\n\r\nNhững công ty từ-tốt-đến-vĩ-đại, là những công ty chỉ tăng trưởng ở mức bằng hoặc thấp hơn hiệu suất trung bình của thị trường chứng khoán trong 15 năm, trước khi chuyển mình để trở nên “vĩ đại”, hay nói cách khác là tạo ra lợi nhuận tích lũy cao hơn ít nhất 3 lần thị trường chứng khoán chung trong 15 năm.\r\n\r\nNhững công ty cùng tiềm năng, là những công ty chỉ duy trì ở mức bình thường hoặc thậm chí thu nhỏ lại mặc dù họ gần như có cùng cơ hội như các công ty từ-tốt-đến-vĩ-đại trong giai đoạn chuyển đổi.\r\n\r\nNhững công ty phát triển không bền vững, là những công ty chuyển đổi từ-tốt-đến-vĩ-đại trong thời gian ngắn nhưng rồi lại trượt dốc xuống dưới mức trung bình của thị trường chứng khoán sau khi vươn lên.\r\n\r\nTrong quá trình nghiên cứu, Collins và nhóm của ông đã tìm hiểu hơn 6000 bài báo và 2000 trang phỏng vấn các giám đốc nhằm tìm ra những yếu tố nào khiến các công ty từ-tốt-đến-vĩ-đại làm nên sự khác biệt, và từ đó giúp các công ty khác làm tương tự.\r\n\r\n'),
('Phương pháp', 000060, 'Điều duy nhất mà bạn có thể chắc chắn là nếu bạn đứng yên, bạn sẽ thất bại. Chúng ta cần phải thoát khỏi một suy nghĩ đã kéo dài quá lâu.\r\n \r\n\r\nVào những năm 1980, Phá vỡ giới hạn đầu tiên của chúng tôi đã làm cho hiệu đồng hồ Tay Heuer nâng cao vị thế của thương hiệu qua chiến dịch thể thao bằng khẩu hiệu “Đừng bỏ cuộc dưới áp lực”. Phá vỡ giới hạn của Nextel thể hiện qua câu “Những người khác nói, chúng tôi làm” miêu tả Nextel là một công ty của những người làm việc.\r\n\r\nTrong những năm gần đây, Phá vỡ giới hạn đã trải rộng ở Mỹ như “Nghĩ khác” cho Apple, “Thay đổi” cho Nissan và “Không có gì là không thể” cho Adidas. Ở Pháp, chúng tôi đã có ảnh hưởng sâu rộng đến McDonald’s và ngành đường sắt của Pháp. Ở Hàn Quốc là với SKTelecom…\r\n\r\nKết quả là, sự tiến hóa dần dần, hàng loạt các điều chỉnh. Những thay đổi mang tính quyết định. Niềm tin của chúng tôi rằng những gì trong quá khứ là thành quả của trực giác và cơ hội, thì hiện tại phải là nền tảng của một phương pháp có hệ thống.\r\n\r\nHằng năm, ở nhiều thành phố trên thế giới, chúng tôi tổ chức những ngày Phá vỡ giới hạn.\r\n\r\nBước đầu của ngày Phá vỡ giới hạn là các bài tập khởi động, giúp khách hàng nhận ra các quy ước và kích thích khách hàng mong muốn thách thức những quy ước này. Tiếp đến là khám phá tầm nhìn, tức là đi trước thời gian và cố gắng hình dung điều gì trong tương lai có thể trở thành hiện thực cho thương hiệu hoặc công ty. Sau đó là những bài tập trả lời câu hỏi “Cái gì - Nếu”. Rồi đóng vai các nhân vật Richard Branson hoặc Steve Jobs, họ phải suy nghĩ như các nhân vật đó. Bài tập cuối cùng là “tiêu đề” - là cách tưởng tượng của chúng tôi để tóm tắt sự tiến bộ trong ngày, sau đó bỏ phiếu để đưa ra những đề nghị trong tiến trình mà khách hàng nên theo.\r\n\r\nMột ngày Phá vỡ giới hạn quét đi những mảnh vụn quá khứ của những người tham dự. Trong suốt thời gian ngắn ngủi này, họ để lại những gì họ biết, và sử dụng quá khứ để hướng dẫn cho tương lai thay vì vẫn bị đông cứng trong đó.\r\n\r\nTrong một bối cảnh không ổn định hiện nay, các thương hiệu phải thường xuyên tiến hóa để phù hợp. Nếu bạn không thay đổi gì trong công ty, bạn chắc chắn sẽ thất bại. Và bạn cũng chắc chắn thất bại nếu thay đổi mọi thứ. Chìa khóa dẫn đến thành công nằm trong năng lực của bạn xác định ranh giới rõ ràng giữa những gì cần phải thay đổi và những gì không.\r\n\r\nTrên thực tế, chúng tôi như là một chất xúc tác hơn là nhà cung cấp giải pháp. Bản thân chúng tôi không tìm kiếm giải pháp, chúng tôi chỉ giúp khách hàng tìm ra chúng.\r\n\r\nKhách hàng của chúng tôi, công ty Mars, một công ty sản xuất thức ăn cho chó, đã mời hơn 200 nhà quản lý tham gia những ngày Phá vỡ giới hạn. Chúng tôi mải mê với những hình ảnh, ngôn ngữ, bao bì, mùi, vị và bất cứ thứ gì khác có liên quan đến những con chó và chế độ dinh dưỡng của chúng.\r\n\r\nCụm từ “Vì tình yêu dành cho chó” trở thành tuyên ngôn của công ty. Bản tuyên ngôn gọi là Niềm tin được in và phát hành với nội dung: Mọi thứ mà chúng ta làm vì tình yêu với những chú chó. Công ty tung ra chương trình bảo hiểm sức khỏe cho mọi chú chó của nhân viên.\r\n\r\nCông ty Mars đã chấp nhận Phá vỡ giới hạn tới mức biến nó thành một trong những phương pháp luận nội bộ của mình. Phá vỡ giới hạn trở thành một phần của cách mà công ty nghĩ về việc kinh doanh của họ. Điều này biến công ty thành một kiểu mẫu về tình yêu chó, và những người chơi chủ chốt trên thị trường nhanh chóng theo cho kịp họ.'),
('Sản phẩm', 000052, 'Tôi không tin rằng Phá vỡ giới hạn lại bị giới hạn trong một giai đoạn đặc biệt nào đó. Khái niệm này sẽ tiến hóa kịp thời, cùng với ý thức và công nghệ mới, nhưng nền tảng của nó vẫn không thay đổi. “Viễn cảnh của hôm nay sẽ là những quy ước của ngày mai”.\r\n \r\n\r\nNgày 24/1/1984, Công ty máy tính Apple giới thiệu Macintosh. Bộ phim quảng cáo 60 giây đã gây một ấn tượng sâu sắc, nó đã cho thấy sự mờ nhạt giữa quảng cáo thương mại và giải trí. Những năm 1980 là những năm đầy vinh quang của quảng cáo. Rõ ràng là chúng tôi không ở trong ngành sáng tạo nghệ thuật vị nghệ thuật, nhưng những bộ phim 30 giây hoặc 60 giây ấy là những kiệt tác trong ý nghĩa hoàn chỉnh nhất của thuật ngữ trên là một sự thật.\r\n\r\nKhi mọi thứ phải rút lại 30 giây, tài năng cũng chưa phải là đủ. Trong quá trình sản xuất phim, người quảng cáo phải vùi mình vào văn hóa điện ảnh như là một cách hoàn thiện kỹ thuật của mình. Cần phải tò mò, như Renoir đã nói: “Bạn chỉ có thể học vẽ bằng cách dạo quanh các viện bảo tàng”.\r\n\r\nMối quan tâm về ngành quảng cáo đã làm cho tôi trở thành một loại “nhà côn trùng học của phim ảnh”. Chúng ta đã thấy, cứ 10 hoặc 15 năm, phong cách thống trị của quảng cáo đã tiến hóa qua hàng loạt các phá vỡ, phạm vi diễn đạt đã được nhân lên gấp nhiều lần, đưa đến tính sáng tạo đa dạng của ngày nay.\r\n\r\nNhững người làm quảng cáo đã hiểu rằng chỉ “nói” thôi chưa đủ, có minh họa thì hiệu quả hơn nhiều. Những quảng cáo minh họa làm chúng tôi say đắm, như ma thuật, tuy nhiên chúng rất thật.\r\n\r\nNhưng quảng cáo minh họa không phải ngày nào cũng tưởng tượng ra được, quảng cáo minh họa hết hơi và được thay bằng các phim giải thích lợi ích của sản phẩm. “Ý tưởng chào bán” được tóm gọn chỉ trong một câu như một khẩu hiệu. Đôi khi ý tưởng chào bán mạnh hơn cả nhãn hiệu.\r\n\r\nCông chúng dần hiểu ra rằng quảng cáo có thể có cả sự thông minh và nhạy cảm. Phim quảng cáo của Bill Bernbach đã tạo cảm hứng cho từng người làm việc trong ngành này, mỗi con người sáng tạo đầy tài năng trong giới quảng cáo là hậu duệ tinh thần của ông ấy.\r\n\r\nNgày nay, có cách truyền đạt nào là trội hơn hết thảy? Có người quay lại kiểu mà họ cảm thấy quen thuộc và thoải mái. Một số khác tạo những vở kịch ngắn, hoặc một kiểu bản tuyên ngôn v.v… Theo tôi, bạn cần phải không bó mình theo chỉ một phong trào mới được. Chúng tôi hướng đến chủ nghĩa chiết trung, được gọi là “cái thang”, công cụ đó gồm 6 hộp: vị trí nhớ đầu tiên, thuộc tính, quyền lợi, lãnh thổ, giá trị và vai trò.\r\n\r\nKhi bắt đầu chiến dịch quảng cáo nào, chúng tôi luôn tự hỏi: “Tôi muốn chiến dịch thể hiện nó ở mức độ nào của cái thang?”. Chọn lựa cách nào là do chiến lược quyết định, chứ không do việc thực hiện.\r\n\r\nCác bộ phim quảng cáo sẽ luôn là những phương tiện chuyển tải cảm xúc tốt nhất, vì chúng kết hợp hình ảnh, âm thanh và chuyển động.\r\n\r\nApple, Adidas và Pedigree sẽ không bao giờ ở được vị trí của chúng ngày hôm nay nếu không có chương trình quảng cáo trên T.V. Internet sẽ có ảnh hưởng không lường trước được, kỹ thuật làm phim cũng đã trở nên thành thục hơn. Internet cho phép chúng ta thử nghiệm nhiều hơn và đo lường kết quả ít tốn kém hơn. Các phương tiện truyền thông tương tác đã từng được dự đoán là đánh dấu sự kết thúc của quảng cáo trên truyền hình, thật ra sẽ đóng góp thêm để bảo vệ tuổi thọ của nó. Trước đây người tiêu dùng bị lệ thuộc, bây giờ thì chính người tiêu dùng là người quyết định. Quyền lực đã đổi tay. Đây là một bước ngoặt.\r\n\r\nThế hệ trẻ hôm nay luôn luôn được kết nối và thường xuyên làm nhiều việc cùng lúc: gọi điện thoại cho bạn bè, chơi trò chơi trên mạng bằng máy điện tử, nghe nhạc, cập nhật trang nhật ký trên mạng, cùng lúc đó tải nhạc số xuống... Sự chú ý của giới trẻ hướng đến những tín hiệu tức thì nhiều hơn.'),
('Sự khích lệ có thể ảnh hưởng tới túi tiền, lòng tự hào, và lương tâm của bạn', 000044, 'Tại thời điểm này, chắc chắc có vô số người đang mong muốn có thể tác động lên hành vi của bạn: tiêu biểu như các nhà chính trị, cảnh sát, vị bác sĩ, ông chủ, cha mẹ, hay chính người bạn đời của bạn.\r\nMặc dù chiến thuật được sử dụng có thể sẽ khác nhau, từ việc đe dọa hay hối lộ, cho tới việc quyến rũ hay lừa lọc, tất cả những chiêu bài này đều có một điểm chung: chúng dựa trên sự khích lệ.\r\n\r\nSự khích lệ, hiểu đơn giản là cách thức để thúc giục con người việc tốt nhiều lên hoặc làm việc xấu ít đi.\r\n\r\nSự khích lệ có thể chia làm ba nhóm chính: kinh tế, xã hội và đạo đức.\r\n\r\nVà những khích lệ được đánh giá là thành công nhất – tức là những khuyến khích mà đạt được sự thay đổi mình mong muốn trong hành vi của người bị tác động – thì đều kết hợp được cả 3 thành phần trên.\r\n\r\nVấn đề tội phạm chính là một lĩnh vực mà sự khích lệ chiếm một vị trí tối quan trọng. Con người luôn có thừa những thời cơ để thực hiện hành vi gian lận, đánh cắp, hay lừa bịp. Vì vậy, việc khám phá xem điều gì khiến họ đã kiềm chế được bản thân khỏi những cám dỗ ấy hẳn là một điều thú vị đáng để tìm hiểu.\r\n\r\nNhững rủi ro về việc phải đi tù, hay những tổn thất liên quan đến công ăn việc làm, nhà cửa và sự tự do, về bản chất, đều là những vấn đề kinh tế. Tất nhiên, những điều trên chắc chắn đã hình thành một sự khuyến khích lớn lao, chống lại mọi hành vi phạm tội.\r\n\r\nỞ đó cũng có có một sự khích lệ mạnh mẽ khác về đạo đức, bởi vì chẳng ai muốn làm những việc mà chính họ cảm thấy sai trái cả.\r\n\r\nVà cuối cùng, trong lĩnh vực ấy cũng tồn tại cả sự khích lệ tích cực về mặt xã hội, khi mọi người không muốn bị đánh giá hay nhìn nhận bởi người khác khi làm sai việc gì đó. Trên thực tế, sẽ tùy thuộc vào loại hình tội phạm, mà sự khích lệ về mặt xã hội này có thể hữu dụng hơn cả những hình phạt về kinh tế.\r\n\r\nChính sự kết hợp của ba loại hình khích lệ này đã “động viên” con người để họ không sa ngã vào những hành vi phạm tội.\r\n\r\n'),
('Sự khích lệ là một thứ phụ thuộc vào bối cảnh: những thứ hiệu quả vào ngày nắng chưa chắc đã hoạt độ', 000044, 'Bạn từng cướp ngân hàng chưa? Chắc hẳn là chưa rồi, bởi vì có rất nhiều thứ làm bạn chỉ nghĩ tới việc đi cướp thôi đã nản chí rồi (đơn cử như đi tù, tổn thất uy thế xã hội, lương tâm tội lỗi).\r\nThế nhưng, tại sao vẫn có những người đã cướp ngân hàng dù cho những suy nghĩ trên đã hiển hiện trong đầu của họ?\r\n\r\nLà bởi vì cá nhân khác nhau sẽ phản ứng khác nhau đối với cùng một loại kích thích.\r\n\r\n \r\n\r\nĐiều này khá hiển nhiên rồi, nhưng điều đáng ngạc nhiên ở đây là, ngay cả khi xét riêng một cá nhân, thì anh ta cũng phản ứng khác nhau với cùng một thứ khích lệ trong những hoàn cảnh khác nhau.\r\n\r\nXét xem những dữ liệu mà Paul Feldman đã thu thập, ông là người kinh doanh bánh mỳ vòng, chuyên bán cho các nhân viên văn phòng. Ông luôn để một cái hộp tiền cùng với những chiếc bánh để khách hàng có thể trả tiền và nhét vào đó, cuối ngày, ông đi một vòng để lượm tất cả số tiền cùng thức ăn còn thừa.\r\n\r\nMỗi khách hàng đều có chung một “động cơ” để trả tiền – đó là mong muốn trở thành trung thực và được nhìn nhận là trung thực – vì thế, sự sai khác trong tỉ lệ trả tiền từng ngày và ở từng địa điểm khác nhau đã hé lộ nhiều khuynh hướng thú vị về sự trung thực khi hoàn cảnh thay đổi.\r\n\r\nYếu tố quan trọng quyết định mức độ trung thực của khách hàng dường như chính là tâm trạng cá nhân, thứ mà có thể bị tác động bởi những yếu tố khác. Thời tiết đóng một vai trò quan trọng, khi tỉ lệ trả tiền sẽ cao hơn và những ngày nắng ấm trái mùa, và thấp hơn vào những ngày giá lạnh trái mùa.\r\n\r\nNhững kì nghỉ căng thẳng như Giáng sinh hay Lễ tạ ơn làm giảm đột ngột tỉ lệ thanh toán trong khi đó những kì nghỉ dư dả thoải mái hơn thì lại làm tăng tỉ lệ trả tiền.\r\n\r\nTương tự như vậy, không khí nơi làm việc cũng đóng góp một phần quan trọng, vì những nhân viên ở trong những văn phòng vui vẻ có nhiều khả năng là sẽ thanh toán tiền.\r\n\r\nĐồng thời, cũng có những đợt tỉ lệ trả tiền gia tăng đồng bộ như sự kiện ngày 9/11 hàng năm, mà theo như tác giả là do có một làn sóng đồng cảm bao trùm.\r\n\r\nBài học ở đây là sự khuyến khích mà hiệu quả đối với một vài người, trong vài hoàn cảnh chưa chắc sẽ có tác động đối với những người đó trong những hoàn cảnh khác, vì còn phụ thuộc vào những hoàn cảnh vĩ mô, vi mô hay hoàn cảnh cá nhân của chính người đó tác động lên tâm trạng của họ.'),
('Tăng trưởng siêu tốc là gì?', 000047, 'Không có ngành kinh doanh nào giống như ngành kinh doanh giải trí. Nhưng xét cho cùng, nó là một ngành công nghiệp mà mỗi đội ngũ marketing – dù đang trong ngành kinh doanh nào – giả vờ như đang ở đó khi họ giới thiệu sản phẩm mới. Tôi cho rằng bất kỳ ai đang marketing hay tung ra những bộ phim mới đều ảo tưởng rằng chúng sắp trở thành bom tấn. Và chính sự ảo tưởng này đã định hình và điều khiển mọi quyết định về marketing mà họ đưa ra.\r\n\r\nViệc này nghe có vẻ hay nhưng thật ra rất sai lầm.\r\n\r\nÝ tưởng đầu tiên của họ là khai trương rầm rộ, giới thiệu quy mô lớn, họp báo hay phủ sóng trên các phương tiện thông tin đại chúng. Họ mặc định với ý nghĩ là “cần phải có một ngân quỹ dành cho quảng cáo”. Họ muốn thảm đỏ và những ngôi sao. Nguy hiểm nhất là họ cho rằng họ cần có càng nhiều khách hàng càng tốt trong một khoảng thời gian ngắn ngủi (mà chắc chắn là không thể thực hiện được) – và nếu không được như vậy ngay lập tức, họ sẽ coi tất cả là thất bại. Ảo tưởng của họ là họ phải trở thành Người máy biến hình chứ không phải Phù thủy rừng Blair.'),
('Tăng trưởng siêu tốc là gì?', 000056, 'Không có ngành kinh doanh nào giống như ngành kinh doanh giải trí. Nhưng xét cho cùng, nó là một ngành công nghiệp mà mỗi đội ngũ marketing – dù đang trong ngành kinh doanh nào – giả vờ như đang ở đó khi họ giới thiệu sản phẩm mới. Tôi cho rằng bất kỳ ai đang marketing hay tung ra những bộ phim mới đều ảo tưởng rằng chúng sắp trở thành bom tấn. Và chính sự ảo tưởng này đã định hình và điều khiển mọi quyết định về marketing mà họ đưa ra.\r\n\r\nViệc này nghe có vẻ hay nhưng thật ra rất sai lầm.\r\n\r\nÝ tưởng đầu tiên của họ là khai trương rầm rộ, giới thiệu quy mô lớn, họp báo hay phủ sóng trên các phương tiện thông tin đại chúng. Họ mặc định với ý nghĩ là “cần phải có một ngân quỹ dành cho quảng cáo”. Họ muốn thảm đỏ và những ngôi sao. Nguy hiểm nhất là họ cho rằng họ cần có càng nhiều khách hàng càng tốt trong một khoảng thời gian ngắn ngủi (mà chắc chắn là không thể thực hiện được) – và nếu không được như vậy ngay lập tức, họ sẽ coi tất cả là thất bại. Ảo tưởng của họ là họ phải trở thành Người máy biến hình chứ không phải Phù thủy rừng Blair.'),
('Thành công đến từ những tác động nhỏ gia tăng dần theo đúng hướng.', 000050, 'Khi nhìn lại, các công ty từ-tốt-trở-thành-vĩ-đại có vẻ như trải qua một quá trình thay da đổi thịt bất ngờ và hoành tráng. Tuy nhiên, ngay tại thời điểm đó chính các công ty cũng không nhận thức được rằng bản thân họ đang trong quá trình thay đổi: không cờ hoa khẩu hiểu, không tổ chức sự kiện giới thiệu rềnh rang hay chương trình bài bản.\r\n\r\n Thay vào đó, thành công họ là đóng góp của những động lực nhỏ đi đúng định hướng chiến lược – ý tưởng con nhím. Giống như đẩy bánh xe, mỗi người góp một chút sức nhỏ cho đến khi đạt đủ vận tốc để tạo bước đột phá. Niềm tin kiên định vào thuyết con nhím đã đem lại thành quả là vòng tuần hoàn động lực và tiến bộ.\r\n\r\nVí dụ như Nucor, nhà máy sản xuất thép tăng trưởng vượt thị trường chứng khoán chung gấp 5 lần. Sau khi vượt qua nguy cơ phá sản năm 1965, Nucor nhận ra rằng họ có thể sản xuất thép với chất lượng tốt hơn và giá thành rẻ hơn các nhà sản xuất khác bằng cách sử dụng máy cán mini, một hình thức sản xuất thép giá rẻ và linh hoạt hơn. Họ xây một nhà máy cán thép mini, tìm kiếm thêm khách hàng, xây một nhà máy khác, có thêm nhiều khách hàng và cứ tiếp tục vậy.\r\n\r\nNăm 1975, CEO Ken Iverson nhận ra rằng nếu cứ tiếp tục phát triển theo hướng đó, họ có thể trở thành nhà máy thép có lợi nhuận cao nhất nước Mỹ. Phải mất đến 2 thập niên, nhưng cuối cùng mục tiêu đó cũng đạt được.\r\n\r\nCác công ty cạnh tranh không cố gắng tạo dựng động lực theo một hướng, thay vào đó, họ cố gắng thay đổi vận mệnh công ty bằng những giao dịch vội vàng và những lần thâu tóm đột ngột. Từ những kết quả ảm đạm đó, họ bị nản lòng và buộc phải nỗ lực thay đổi một lần nữa, chứ không để bánh đà kịp lấy tốc độ.'),
('Tìm ra một “ý tưởng con nhím” đơn giản sẽ cho ta một lộ trình rõ ràng.', 000050, 'Hãy tưởng tượng một con cáo xảo quyệt đang đuổi bắt một con nhím, nó nghĩ ra cách tấn công bất ngờ và áp dụng chiến thuật đánh lén mỗi ngày để cắn xé con mồi. Con nhím chỉ áp dụng một chiến thuật đáp trả: cuộn tròn thành một quả bóng gai không thể phá vỡ. Áp dụng triệt để kế sách đơn giản này chính là lý do con nhím chiến thắng mỗi ngày.\r\n\r\n Những công ty từ-tốt-đến-vĩ-đại đều tìm được Khái niệm con nhím cho chính mình bằng cách tự hỏi 3 câu hỏi sau:\r\n\r\n– Lĩnh vực nào chúng ta có thể làm tốt nhất?\r\n\r\n– Lĩnh vực nào chúng ta đam mê?\r\n\r\n– Những chỉ số kinh tế quan trọng nào chúng ta nên tập trung vào?\r\n\r\nTại điểm giao cắt của những câu hỏi này, sau 4 năm tranh luận và lặp đi lặp lại, những công ty từ-tốt-đến-vĩ-đại cuối cùng đã tìm ra ý tưởng con nhím của riêng mình. Sau thời điểm đó, mọi quyết định được đưa ra trong công ty đều dựa trên thuyết đó, và thành công đã tìm đến.\r\n\r\nLấy ví dụ là chuỗi nhà thuốc Walgreens. Họ quyết định rằng họ sẽ trở thành nhà thuốc tốt nhất và tiện lợi nhất với lợi nhuận cao mỗi lượt khách hàng. Đó chính là ý tưởng con nhím của họ, và bằng cách theo đuổi chiến lược này, họ đã vượt lên thị trường chứng khoán chung gấp 7 lần.\r\n\r\nĐối thủ của họ, nhà thuốc Eckerd, vì thiếu một ý tưởng con nhím đơn giản, họ phát triển thiếu đồng bộ theo nhiều hướng sai lầm, cuối cùng phải chấm dứt hoạt động.'),
('Tư duy quá trình, đừng tư duy sản phẩm', 000046, 'HÃY NHÌN VÀO PHÍA SAU SÂN KHẤU\r\nKhi dẹp cái tôi sang một bên và chia sẻ quá trình làm việc của bản thân, chúng ta tạo điều kiện cho mọi người phát triển mối quan hệ với chúng ta và sản phẩm. Chính điều đó giúp chúng ta bán được nhiều sản phẩm hơn.\r\nGHI CHÉP LẠI TẤT CẢ NHỮNG GÌ BẠN LÀM\r\nDù có định chia sẻ nó hay không thì việc ghi chép tài liệu và quay lại quá trình làm việc cũng có những giá trị riêng: bạn sẽ có cái nhìn về công việc của mình rõ ràng hơn và cảm giác mình đang ngày càng tiến bộ. Và khi đã sẵn sàng để chia sẻ, bạn sẽ có vô số tài liệu để lựa chọn.'),
('Tuyển đúng người vào đúng vị trí là nền tảng của các công ty vĩ đại.', 000058, 'Câu hỏi “Ai” phải được ưu tiên trước khi đặt câu hỏi “Cái gì”. Để biến một công ty từ bình thường trở thành vĩ đại, phải bắt đầu bằng việc tuyển được đúng người và đào thải những người không phù hợp, thậm chí phải bắt đầu trước khi xác định hướng đi.\r\n\r\n Những người phù hợp cuối cùng sẽ tìm được con đường đến với thành công. Khi Dick Cooley tiếp nhận vị trí CEO của công ty Wells Fargo, ông nhận ra rằng ông sẽ không bao giờ có thể hiểu được ảnh hưởng của việc bãi bỏ quy định trong ngành ngân hàng.\r\n\r\nNhưng, ông suy luận rằng nếu ông có những nhân viên tốt nhất và sáng giá nhất trong công ty, họ sẽ tìm được hướng đi để vượt lên. Ông đã đúng. Warren Buffet về sau gọi các giám đốc của Wells Fargo là “Đội ngũ quản lý kinh doanh tốt nhất” khi công ty đạt được thành công vang dội.\r\n\r\nNhững công ty từ-bình-thường-trở-thành-vĩ-đại tập trung vào việc tìm những người có phong cách làm việc phù hợp hơn là khả năng chuyên môn, vì họ cho rằng những người phù hợp thì có thể đào tạo và hướng dẫn.\r\n\r\nTìm được đúng người, công ty không cần phải lo lắng đến việc làm thế nào để khích lệ họ. Họ tập trung vào việc trả lương cho ai, thay vì trả lương như thế nào, và tạo một môi trường để những người chăm chỉ phát triển và những người lười biếng sẽ ra đi. Ở cấp quản lý cao, người quản lý một là sẽ từ bỏ ngay từ đầu hoặc sẽ ở lại lâu dài.\r\n\r\nNhững công ty từ-bình-thường-trở-thành-vĩ-đại không bao giờ tuyển nhầm người dù nhu cầu vị trí đó là rất gấp gáp, nhưng lại tuyển càng nhiều người phù hợp càng tốt, dù chưa có công việc gì cụ thể cho họ làm.\r\n\r\nKhi một công ty từ-bình-thường-trở-thành-vĩ-đại nhận thấy đã tuyển nhầm người, họ sẽ hành động ngay lập tức. Hoặc là họ sẽ sa thải người đó hoặc là điều chuyển sang vị trí phù hợp hơn. Trì hoãn và giữ lại những người không phù hợp sẽ làm cả tổ chức thấy nản lòng.'),
('Đừng tự biến mình thành cỗ máy spam', 000049, 'IM LẶNG VÀ LẮNG NGHE\r\n“Cộng đồng viết lách không thiếu những người kém cỏi, chỉ muốn có bài đăng lên tạp chí dù chẳng bao giờ đọc cuốn tạp chí mà họ muốn được đăng bài,” nhà văn Dan Chaon nói. “Những kẻ đó đáng bị từ chối (đương nhiên là họ sẽ bị từ chối), và chúng ta chẳng việc gì phải cảm thông khi họ than vãn rằng không ai đoái hoài gì đến tác phẩm của họ.”\r\nTôi gọi những người đó là cỗ máy spam. Họ ở khắp mọi nơi và tồn tại ở mọi ngành nghề. Họ không muốn trả phí mà chỉ muốn nhận được phần của mình. Họ không muốn nghe ý tưởng của bạn mà chỉ muốn người khác nghe ý kiến của họ. Họ không muốn vào các buổi biểu diễn, mà chỉ nhét tờ rơi vào tay bạn trên vỉa hè và ra sức mời gọi bạn đến với họ. Bạn nên cảm thấy thương hại cho những kẻ ảo tưởng như thế. Đôi khi, họ không hiểu được một điều cơ bản rằng thế giới chẳng nợ chúng ta điều gì hết.\r\nTất nhiên, bạn không cần phải là máy móc mới trở thành cỗ máy spam – tôi đã chứng kiến rất nhiều người thú vị và thành đạt dần trở thành như vậy. Thế giới chỉ còn xoay quanh họ và công việc của họ. Họ không có thời gian để quan tâm đến bất cứ thứ gì khác ngoại trừ bản thân.\r\nBẠN MUỐN TRÁI TIM, KHÔNG PHẢI CHỈ LÀ ÁNH MẮT\r\nĐừng tỏ ra lập dị. Đừng lãng phí thời gian của người khác. Đừng đòi hỏi quá nhiều. Và đừng bao giờ yêu cầu mọi người theo dõi bạn.\r\nNHẬN DẠNG NHỮNG NGƯỜI “CÙNG HỘI CÙNG THUYỀN”\r\nKhi công khai về bản thân và công việc, bạn sẽ gặp được những người cùng lĩnh vực một cách tự nhiên. Đó là những người thực sự ngang hàng với bạn – những người có cùng đam mê, cùng sứ mệnh, những người chia sẻ sở thích chung.\r\nNgười như thế không nhiều, nhưng họ vô cùng, vô cùng quan trọng. Hãy làm những việc có thể để nuôi dưỡng mối quan hệ với những người đó. Hãy tán dương họ trước mọi người. Mời họ hợp tác. Cho họ xem sản phẩm của bạn trước tiên. Gọi điện cho họ và chia sẻ bí mật. Giữ họ ở càng gần càng tốt.\r\nGẶP GỠ NGOÀI ĐỜI THỰC\r\nGặp gỡ mọi người trên mạng là trải nghiệm tuyệt vời, nhưng biến họ thành những người bạn đời thực còn tuyệt vời hơn.\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `nxb`
--

CREATE TABLE `nxb` (
  `nxbid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `nxb` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `nxb`
--

INSERT INTO `nxb` (`nxbid`, `nxb`) VALUES
(000017, 'Nhà xuất bảng Thanh Niên'),
(000018, 'Nhà xuất bảng Văn hóa nghệ thuật'),
(000019, 'Nhà xuất bản Tôn giáo'),
(000020, 'Nhà xuất bản Kim Đồng'),
(000021, 'Nhà xuất bản Triết học'),
(000022, 'Nhà xuất bản Giáo dục'),
(000023, 'Nhà xuất bản Kỹ năng sống'),
(000024, 'Nhà xuất bản Kinh tế - Chính trị');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `userid` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `orderstatus` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalmoney` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `receivername` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `userid`, `orderstatus`, `timestamp`, `address`, `totalmoney`, `receivername`, `phone`) VALUES
(000079, 000030, '1', '2021-12-29 17:40:15', '144', '119,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000080, 000030, '0', '2021-12-29 22:22:07', '144', '119,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000081, 000030, '1', '2021-12-29 22:23:43', '144', '55,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000082, 000030, '0', '2021-12-29 23:53:30', '144', '174,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000083, 000030, '0', '2021-12-30 17:30:53', '144', '66,550.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000084, 000030, '0', '2021-12-30 17:38:59', '144', '439,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000085, 000030, '0', '2021-12-30 22:13:20', '144', '110,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000086, 000030, '0', '2022-01-03 08:23:21', '144', '195,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000087, 000030, '0', '2022-01-14 10:18:58', '144', '493,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252'),
(000088, 000030, '0', '2022-01-14 10:31:28', '144', '653,000.00 đ', 'Nguyễn Hoàng Việt', '0768570252');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetails`
--

CREATE TABLE `ordersdetails` (
  `qtyordered` int(11) NOT NULL,
  `amount` double NOT NULL,
  `orderid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `bookid` int(6) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ordersdetails`
--

INSERT INTO `ordersdetails` (`qtyordered`, `amount`, `orderid`, `bookid`) VALUES
(2, 119000, 000079, 000046),
(1, 119000, 000080, 000046),
(1, 55000, 000081, 000044),
(1, 119000, 000082, 000046),
(1, 55000, 000082, 000044),
(1, 55000, 000083, 000044),
(4, 55000, 000084, 000044),
(1, 119000, 000084, 000046),
(2, 55000, 000085, 000044),
(1, 195000, 000086, 000050),
(2, 195000, 000087, 000050),
(1, 103000, 000087, 000047),
(1, 103000, 000088, 000047),
(1, 90000, 000088, 000049),
(2, 230000, 000088, 000068);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(6) UNSIGNED ZEROFILL NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isadmin` int(4) NOT NULL DEFAULT 0,
  `isdisable` int(4) NOT NULL DEFAULT 0,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `male` int(4) NOT NULL DEFAULT 1,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `isadmin`, `isdisable`, `fullname`, `phone`, `email`, `male`, `address`, `dob`) VALUES
(000021, 'admin', 1, 0, 'admin', '', 'admin@localhost', 1, '', '0000-00-00'),
(000023, '$2y$10$Gj/0jSpjFEobcR1FJyvCAufuui29cMxP5Pan2P2KKgRsM9S0WHG4e', 0, 0, 'Quoc Tuan', '0125865325', 'tuanquocle054@gmail.com', 1, NULL, NULL),
(000026, '$2y$10$A.3IfDhR3fXvrd7RFSNdxegui6QwvdnkfD9uylv2nXZHFz7s6wqyK', 0, 0, 'Quoc Tuan', '0254882681', 'tuanquocle@gmail.com', 1, NULL, NULL),
(000028, '$2y$10$KIGzsTdXMXBLup25fAXK7e/e/mUm.UsgNAnvWucvgePbxXHdktk8G', 0, 0, 'Le Quoc Tuan', '0254882681', 'admin@gmail.com', 1, NULL, NULL),
(000029, '$2y$10$S5.ckdp02sCWXVeDzC8dJ.deco5HGt9BemNrzgCOMh/NkNiuk.t7i', 0, 0, 'Viet', '0123456789', 'viet@gmail.com', 1, NULL, NULL),
(000030, '$2y$10$zFhforvmly.QabgEWXAAX.ZnSwOFNUAm0gi3GT4FoTLnq05OEmTnO', 1, 0, 'Nguyễn Hoàng Việt', '0768570252', 'hoangvietnguyen2602@gmail.com', 0, 'huế', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`commentid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`) USING BTREE,
  ADD KEY `fkIdx_37` (`nxbid`) USING BTREE,
  ADD KEY `fkIdx_40` (`categoryid`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`) USING BTREE;

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD UNIQUE KEY `userid` (`userid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noidungsach`
--
ALTER TABLE `noidungsach`
  ADD PRIMARY KEY (`chuong`,`idsach`),
  ADD KEY `idsach` (`idsach`);

--
-- Indexes for table `nxb`
--
ALTER TABLE `nxb`
  ADD PRIMARY KEY (`nxbid`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`) USING BTREE,
  ADD KEY `fkIdx_58` (`userid`) USING BTREE;

--
-- Indexes for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD KEY `fkIdx_87` (`orderid`) USING BTREE,
  ADD KEY `fkIdx_90` (`bookid`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `commentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nxb`
--
ALTER TABLE `nxb`
  MODIFY `nxbid` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `FK_37` FOREIGN KEY (`nxbid`) REFERENCES `nxb` (`nxbid`),
  ADD CONSTRAINT `FK_40` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`);

--
-- Constraints for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `tk_usersid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD CONSTRAINT `FK_87` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  ADD CONSTRAINT `FK_90` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
