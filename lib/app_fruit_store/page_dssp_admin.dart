import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:phuchung_63130476/app_fruit_store/models.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:phuchung_63130476/app_fruit_store/page_them_sp_admin.dart';
import 'package:phuchung_63130476/app_fruit_store/page_capnhat_sp_admin.dart';
import 'package:phuchung_63130476/helper/storage_image_helper.dart';
import 'package:phuchung_63130476/helper/widget_connect_firebase.dart';

class FruitStoreAdmin extends StatelessWidget {
  const FruitStoreAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        builder: (context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: PageDSSP_Admin(),
        ),
        errorMessage: "Lỗi!!!",
        connectingMessage: "Đang kết nối !!!",
    );
  }
}

class PageDSSP_Admin extends StatelessWidget {
  const PageDSSP_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Danh Sách Trái Cây"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: StreamBuilder<List<FruitSnapshot>>(
          stream: FruitSnapshot.getAll(),
          builder: (context, snapshot){
            if(snapshot.hasError)
              return Center(child: Text("Lỗi!!!", style: TextStyle(color: Colors.red),),);
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            var list = snapshot.data!;
            return ListView.separated(
            itemBuilder: (context, index){
              var fruitSnap = list[index];
              return Slidable(
                  endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PageCapNhatSP_Admin(fruitSnapShot: fruitSnap,),));
                          },
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: "Cập nhật",
                        ),
                        SlidableAction(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Xóa",
                          onPressed: (context) async{
                            await deleteImage(folders: ["fruit_app"], fileName: "${fruitSnap.fruit.id}.jpg");
                            await fruitSnap.xoa();
                          },
                        ),
                      ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(fruitSnap.fruit.anh!)
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("id: ${fruitSnap.fruit.id}",),
                                Text("Tên: ${fruitSnap.fruit.ten}"),
                                Text("Giá: ${fruitSnap.fruit.gia}"),
                                Text("Mô tả: ${fruitSnap.fruit.mota?? ""}"),
                              ],
                            ),
                          )
                      ),
                    ],
                  )
              );
            },
            separatorBuilder: (context, index) => Divider(thickness: 1.5,),
            itemCount: list.length
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
           MaterialPageRoute(builder: (context) =>
           PageThemSP_Admin(),
           ));
        },
      ),
    );
  }
}
