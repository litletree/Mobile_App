import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phuchung_63130476/widgets/dropdown_button.dart';
import 'package:phuchung_63130476/widgets/radio_button.dart';
import 'package:phuchung_63130476/widgets/wrapper_data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // properties của class
  StringWrapper phepTinh = StringWrapper(value: "Cộng");
  List<String> phepTinhs = ["Cộng", "Trừ", "Nhân", "Chia", "Tính Tiền"];
  StringWrapper hocBong = StringWrapper(value: "Rồi");
  List<String> hocBongs = ["Rồi", "Chưa"];
  StringWrapper buoiHoc = StringWrapper(value: "Một");
  StringWrapper gioiTinh = StringWrapper(value: "Nam");
  DateTime? ngaySinh = DateTime(2003, 01, 01);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("My Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Malenia.jpg"),
                ),
                accountName: Text("Đỗ Phúc Hưng"),
                accountEmail: Text("hung.dp.63cntt@ntu.edu.vn"),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => InboxPage(),)
                );
              },
              leading: Icon(Icons.inbox),
              title: Text("Inbox"),
              trailing: Text("10"),
            )
          ],
        ),
      ),
      body: _buildBody(context, index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: Colors.blue,),
              icon: Icon(Icons.home, color: Colors.grey,),
              label: "Home"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.sms, color: Colors.blue,),
              icon: Icon(Icons.sms, color: Colors.grey,),
              label: "SMS"

          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.phone, color: Colors.blue,),
              icon: Icon(Icons.phone, color: Colors.grey,),
              label: "Phone"
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  _buildBody(BuildContext context, int index) {
    switch (index) {
      case 0:
        return _buildHome(context);
      case 1:
        return _buildSMS(context);
    }
  }

  _buildHome(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 400,
                height: 300,
                child: Image.asset("assets/images/Malenia.jpg"),
              ),
            ),
            SizedBox(height: 15,),
            Text("Họ Tên: "),
            Text("Đỗ Phúc Hưng", style: TextStyle(fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Giới Tính"),
            MyGroupRadio(
              labels: ["Nam", "Nữ"],
              groupValue: gioiTinh,
            ),
            Text("Phép tính giỏi nhất của bạn"),
            MyDropdownButton(
              labels: phepTinhs,
              value: phepTinh,
              itemBuilder: (label) =>
                  Row(
                    children: [
                      Icon(Icons.emoji_food_beverage),
                      SizedBox(width: 30,),
                      Text(label)
                    ],
                  ),
            ),
            Text("Ngày sinh"),
            Row(
              children: [
                Expanded(child: Text(
                    "${ngaySinh?.day ?? 1}/${ngaySinh?.month ?? 1}/${ngaySinh
                        ?.year ?? 2003}")),
                IconButton(
                    onPressed: () async {
                      DateTime? d = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050),
                      );
                      if (d != null) {
                        setState(() {
                          ngaySinh = d;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month)
                ),
                SizedBox(width: 20,)
              ],
            ),
            Text("Nhận học bổng chưa"),
            MyDropdownButton(
              labels: hocBongs,
              value: hocBong,
              itemBuilder: (label) =>
                  Row(
                    children: [
                      Icon(Icons.emoji_events),
                      SizedBox(width: 30,),
                      Text(label)
                    ],
                  ),
            ),
            Text("Thực hành mấy buổi rồi"),
            MyGroupRadio(
              labels: ["Một", "Hai", "Chưa Buổi nào"],
              groupValue: buoiHoc,
            ),
          ],
        ),
      ),
    );
  }

  _buildSMS(BuildContext context) {
    return Text("SMS");
  }

}

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
