import 'package:flutter/material.dart';
import 'package:phuchung_63130476/app_state/page_counter.dart';
import 'package:phuchung_63130476/list_view/list_view.dart';
import 'package:phuchung_63130476/page_profile.dart';
import 'package:phuchung_63130476/page_test.dart';
import 'package:phuchung_63130476/routing/my_route.dart';
import 'package:phuchung_63130476/app_state/changenotifier_counter.dart';
import 'package:phuchung_63130476/list_provider/giohang_app.dart';
import 'package:phuchung_63130476/getx/get_counter.dart';
import 'package:phuchung_63130476/app_fruit_store/page_home_fruit_store.dart';

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
              SizedBox(height: 10,),
              _buildButton(context, lable: "My List View", destination: PageListView()),
              SizedBox(height: 10,),
              _buildButton(context, lable: "My First Page", destination: FirstPage()),
              SizedBox(height: 10,),
              _buildButton(context, lable: "Counter Provider", destination: CounterProvider()),
              SizedBox(height: 10,),
              _buildButton(context, lable: "Fruit Store", destination: AppStore()),
              SizedBox(height: 10,),
              _buildButton(context, lable: "GetX Demo", destination: PageGetxCounter()),
              SizedBox(height: 10,),
              _buildButton(context, lable: "Fruit Market", destination: FruitStoreApp()),
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