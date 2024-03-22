class Fruit{
  String id, ten;
  double gia;
  String? url;
  String? moTa;
  Fruit({required this.id, required this.ten,
    required this.gia, this.url, this.moTa});
}

class GioHang_item{
  String idSP;
  int sl;
  GioHang_item({required this.idSP, required this.sl});
}

Map<String, String> images = {
  "Tao": "https://blog.onelife.vn/wp-content/uploads/2023/07/373374a7-1-6.png",
  "Nho": "https://traicayhoabien.com/wp-content/uploads/2021/06/NHOXANH-nho-xanh-2-120.jpg",
  "Quyt": "https://traicay141.vn/upload/hinhthem/quytduong1111024x1024-6703.jpg",
  "Cam": "https://caogam.vn/sites/default/files/anh_bai_viet/tac-dung-cua-qua-cam-doi-voi-suc-khoe.jpg",
  "Mit": "https://cdn.chonongsanonline.com/uploads/all/bdDD4yggkRBWJu8xrUfTr97vrtFQpmYtSULlfH3l.jpg",
  "Buoi": "https://cayxanhdaiviet.vn/wp-content/uploads/2020/03/cay-buoi.jpg",
  "Oi": "https://cdn.baodongthap.vn/database/image/2015/12/02/cong-dung-bat-ngo2.jpg",
  "Thanh long": "https://congthuong-cdn.mastercms.vn/stores/news_dataimages/2023/022023/16/17/in_article/thanh-long-ruot-do20230216170904.png?rt=20230216170905",
  "Chom chom": "https://cdn.tgdd.vn/2022/07/CookDishThumb/tong-hop-10-cach-lam-banh-hanh-nhan-nuong-bang-lo-nuong-thom-thumb-620x620-1.jpg",
  "Du du": "https://hatgiongphuongnam.com/asset/upload/image/hat-giong-du-du-ruot-vang-1.2_.jpg?v=20190410",
};

class AppData{
  final List<Fruit> _dssp = [
    Fruit(id: "01", ten: "Táo", gia: 40000, url: images["Tao"], moTa: "Táo đỏ khác táo xanh"),
    Fruit(id: "02", ten: "Nho", gia: 60000, url: images["Nho"], moTa: "Nho ăn cho đẹp da"),
    Fruit(id: "03", ten: "Quýt", gia: 30000, url: images["Quyt"], moTa: "quýt ngọt"),
    Fruit(id: "04", ten: "Cam", gia: 45000, url: images["Cam"], moTa: "Cam để ép nước"),
    Fruit(id: "05", ten: "Mít", gia: 200000, url: images["Mit"], moTa: "Mít chia cho hàng xóm"),
    Fruit(id: "06", ten: "Bưởi", gia: 20000, url: images["Buoi"], moTa: "Bưởi để đơm"),
    Fruit(id: "07", ten: "Ổi", gia: 380000, url: images["Oi"], moTa: "không thích ăn ổi"),
    Fruit(id: "08", ten: "Thanh long", gia: 37500, url: images["Thanh long"], moTa: "Giải cứu thanh long"),
    Fruit(id: "09", ten: "Chôm chôm", gia: 79000, url: images["Chom chom"], moTa: "Chôm chôm đỏ"),
    Fruit(id: "10", ten: "Đu đủ", gia: 17000, url: images["Du du"], moTa: "đu đủ không thích ăn"),
  ];
  List<Fruit> get dssp => _dssp;
}

