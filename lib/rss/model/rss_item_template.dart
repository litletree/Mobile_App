class RSSItem{
  static late String startDesCriptionRegrex, endDescriptionRegrex;
  static late String startImageRegrex, endImageRegrex;
  String? title;
  String? pubDate;
  String? description;
  String? link;
  String? imageUrl;

  RSSItem.empty();

  RSSItem getFromJson(Map<String, dynamic> json){
    title = json['title'];
    pubDate = json['pubDate'];
    description = _getDescription(json['description']);
    link = json['link'];
    imageUrl = _getImageUrl(json['description']);
    return this;
  }

  String _getDescription(String rawDescription){
    int start = rawDescription.indexOf(startDesCriptionRegrex) +
    startDesCriptionRegrex.length;
    if(start >= startDesCriptionRegrex.length){
      if(endDescriptionRegrex.length > 0){
        int end = rawDescription.indexOf(endDescriptionRegrex, start);
        return rawDescription.substring(start, end);
      }
      return rawDescription.substring(start);
    }
    return "";
  }

  String? _getImageUrl(String rawDescription){
    int start = rawDescription.indexOf(startImageRegrex) +
        startImageRegrex.length;
    if(start >= startImageRegrex.length){
      if(endImageRegrex.length > 0){
        int end = rawDescription.indexOf(endImageRegrex, start);
        return rawDescription.substring(start, end);
      }
      return rawDescription.substring(start);
    }
    return null;
  }
}