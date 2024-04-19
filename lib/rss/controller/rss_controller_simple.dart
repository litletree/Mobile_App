import 'package:get/get.dart';
import 'package:phuchung_63130476/rss/model/rss_resource.dart';
import '../model/rss_item_template.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class SimpleControllerRss extends GetxController{
  List<RssResource> _resource = rssResources;
  RssResource _current = rssResources[0];
  String? rssUrl;
  String? _resourceHeaders;
  var _rssList = <RSSItem>[];

  List<RSSItem> get rssList => _rssList;
  String get resourceName => _current.name;
  String? get resourceHeaders => _resourceHeaders;
  List<String> get headerResource => _current.resourceHeaders.keys .toList();


  static SimpleControllerRss get instance => Get.find<SimpleControllerRss>();


  @override
  void onInit() {
    super.onInit();
    if(rssUrl == null)
      rssUrl = _current.resourceHeaders.values.toList()[0];
    if(_resourceHeaders == null)
      _resourceHeaders = _current.resourceHeaders.keys.toList()[0];
    _setRegrex();
  }


  @override
  void onReady() {
    super.onReady();
    readRss();
  }

  void _setRegrex(){
    RSSItem.startDesCriptionRegrex = _current.startDescriptionRegrex;
    RSSItem.endDescriptionRegrex = _current.endDescriptionRegrex;
    RSSItem.startImageRegrex = _current.startImageRegrex;
    RSSItem.endImageRegrex = _current.endImageRegrex;
  }

  Future<List<dynamic>?> _fetchRSS(String rssUrl) async{
    final response = await http.get(Uri.parse(rssUrl));
    if(response.statusCode==200){
      final xml2Json = Xml2Json();
      xml2Json.parse((utf8.decode(response.bodyBytes)));
      var rssJson = xml2Json.toParker();
      Map<String,dynamic> jsonData = jsonDecode(rssJson);
      return(jsonData["rss"]["channel"]["item"]);
    }
    return Future.error("Loi doc rss");

  }
  Future<void> readRss() async {
    _fetchRSS(rssUrl!)
        .then(
            (value) {
          _rssList = value?.map((rssMap) => RSSItem.empty().getFromJson(rssMap)).toList()??[];
          print(rssList[0].link);
          update(["ListRss"]);
        })
        .catchError((error) {
      print(error);
    });
  }
}

class RssBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(SimpleControllerRss());
  }

}