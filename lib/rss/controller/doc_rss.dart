
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

void main() async{
  final response = await http.get(Uri.parse("https://dantri.com.vn/rss/home.rss"));
  if(response.statusCode == 200){
    //print(response.body);
    final xml2Json = Xml2Json();
    xml2Json.parse(utf8.decode(response.bodyBytes));
    String rssJson = xml2Json.toParker();
    //print(rssJson);
    Map<String, dynamic> jsonData = jsonDecode(rssJson);
    var testData = jsonData["rss"]["channel"]["item"][0];
    //print(testData);
    print(testData['title']);
    print(testData['link']);
    print(testData['description']);
    print(testData['pubDate']);
    //return (jsonData["rss"]["channel"]["item"]);
  }
}