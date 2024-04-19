import 'dart:convert';
import 'package:http/http.dart' as http;

class RssResource{
  String id, name;
  String startDescriptionRegrex, endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;

  RssResource({
    required this.id,
    required this.name,
    required this.startDescriptionRegrex,
    required this.endDescriptionRegrex,
    required this.startImageRegrex,
    required this.endImageRegrex,
    required this.resourceHeaders,
  });
}

List<RssResource> rssResources = [
  RssResource(
    id: "vnexpress", name: "VN Express",
      startDescriptionRegrex:"</a></br>", endDescriptionRegrex: "",
      startImageRegrex:'<img src="', endImageRegrex: '"',
    resourceHeaders:{
      "Trang chủ" : "https://vnexpress.net/rss/tin-moi-nhat.rss",
      "Thế giới" : "https://vnexpress.net/rss/the-gioi.rss",
      "Du lịch" : "https://vnexpress.net/rss/du-lich.rss",
      "Khoa học" : "https://vnexpress.net/rss/khoa-hoc.rss",
      "Thể thao" : "https://vnexpress.net/rss/the-thao.rss",
      "Giáo dục" : "https://vnexpress.net/rss/giao-duc.rss",
      "Sức khỏe" : "https://vnexpress.net/rss/suc-khoe.rss",
      "Kinh doanh": "https://vnexpress.net/rss/kinh-doanh.rss",
    }
  ),
  RssResource(
      id: "DanTri", name: "Dân trí",
      startDescriptionRegrex:"</a></br>", endDescriptionRegrex: "",
      startImageRegrex:"<img src='", endImageRegrex: "'",
      resourceHeaders:{
        "Trang chủ" : "https://dantri.com.vn/rss/home.rss",
        "Xã hội" : "https://dantri.com.vn/rss/xa-hoi.rss",
        "Giáo dục" : "https://dantri.com.vn/rss/giao-duc.rss",
        "Kinh doanh" : "https://dantri.com.vn/rss/kinh-doanh.rss",
        "Văn hóa" : "https://dantri.com.vn/rss/van-hoa.rss",
        "Du lịch" : "https://dantri.com.vn/rss/du-lich.rss",
        "Pháp luật" : "https://dantri.com.vn/rss/phap-luat.rss",
        "Giải trí" : "https://dantri.com.vn/rss/giai-tri.rss",
      }
  ),
];
