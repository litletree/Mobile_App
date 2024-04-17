import 'dart:ffi';
import 'package:flutter/material.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang 1"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPageTest())
                  );
                }, 
                child: Text("Toi trang 2")
            )
          ],
        ),
      ),
    );
  }
}

class SecondPageTest extends StatefulWidget {
  const SecondPageTest({super.key});

  @override
  State<SecondPageTest> createState() => _SecondPageTestState();
}

class _SecondPageTestState extends State<SecondPageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang 2"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async{
                  Navigator.of(context).pop();
                },
                child: Text("Ve trang 1")
            )
          ],
        ),
      ),
    );
  }
}


