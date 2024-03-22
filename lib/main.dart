import 'package:flutter/material.dart';
import 'package:phuchung_63130476/page_home.dart';
import 'package:phuchung_63130476/list_view/list_view.dart';
import 'package:phuchung_63130476/routing/my_route.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
