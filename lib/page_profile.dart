import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? gioiTinh = "nam";
  String? phepTinh = "Cộng";
  List<String> phepTinhs = ["Cộng", "Trừ", "Nhân", "Chia","Tính Tiền"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset("assets/images/Malenia.jpg"),
                ),
              ),
              SizedBox(height: 15,),
              Text("Họ Tên: "),
              Text("Đỗ Phúc Hưng", style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Ngày sinh: "),
              Text("01/01/2003", style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("Giới Tính"),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Nam"),
                      leading: Radio(
                        value: "nam",// value = groupValue thì value được chọn
                        groupValue: gioiTinh,
                        onChanged: (value){
                          setState(() {
                            gioiTinh = value as String?;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("Nữ"),
                      leading: Radio(
                        value: "nữ",
                        groupValue: gioiTinh,
                        onChanged: (value){
                          setState(() {
                            gioiTinh = value as String?;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Text("Phép tính giỏi nhất của bạn"),
              DropdownButton<String>(
                isExpanded: true,
                value: phepTinh,
                items: phepTinhs.map(
                        (phepTinh) => DropdownMenuItem(
                      child: Text(phepTinh),
                      value: phepTinh,
                    )
                ).toList(),
                onChanged: (value){
                  setState(() {
                    phepTinh = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}