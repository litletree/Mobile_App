import 'package:flutter/material.dart';
import 'package:get/get.dart';
//GetX cập nhật trạng thái theo từng tag

class Controller extends GetxController{
  final _counter = 0.obs; //biến reactive RxInt
  int get counter => _counter.value;

  void tang(){
    _counter.value++;
    //_counter.refresh() : không cần gọi vì int là kiểu dữ liệu primitive
  }
  void giam(){
    _counter.value--;
  }
}

class PageGetxCounter extends StatelessWidget {
  PageGetxCounter({super.key});
  final c = Get.put(Controller());
  final d = Get.put(Controller(), tag: "tag"); //nếu thêm tag thì c và d sẽ là 2 thàn phần khác nhau

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  c.tang();
                  d.tang();
                },
                child: Text("+", style: TextStyle(fontSize: 20),),
            ),
            //Text("0",style: TextStyle(fontSize: 20),),
            GetX<Controller>(
                builder: (controller) => Text("GetX c: ${controller.counter}",style: TextStyle(fontSize: 20),),
            ),
            GetX<Controller>(
                tag: "tag",
                builder: (controller) => Text("GetX d: ${controller.counter}",style: TextStyle(fontSize: 20),),
            ),
            // biến c
            Obx(() => Text("Obx c: ${c.counter}",style: TextStyle(fontSize: 20),),),
            // biến d
            Obx(() => Text("Obx d: ${d.counter}",style: TextStyle(fontSize: 20),),),
            ElevatedButton(
                onPressed: (){
                  c.giam();
                  //d.giam();
                }
                , child: Text("-", style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PagePhone());
        },
        child: Icon(Icons.call),
      ),
    );
  }
}

class PagePhone extends StatelessWidget {
  const PagePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
