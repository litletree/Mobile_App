import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter/material.dart';
import 'package:phuchung_63130476/json_list/json_data.dart';

void main(){
  test("Do Phuc Hung", ()async{
    await getHTTP_Contents();
    print("Test xong");
  });
  test("Hai Test", ()async{
    List<Photo>? list = await getHTTP_Contents();
    print(list![0].title);
  });
}