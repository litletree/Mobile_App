import 'package:flutter/material.dart';
import 'package:phuchung_63130476/page_profile.dart';
import 'package:phuchung_63130476/page_test.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My App")
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              _buildButton(context, lable: "My Profile", destination: MyProfile()),
              SizedBox(height: 10),
              _buildButton(context, lable: "My Test", destination: MyTest()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String lable, required Widget destination}) { // sửa container thành widget
    return Container(
      width: 180,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => destination
            )
            );
          },
          child: Text(lable)
      ),
    );
  }
}