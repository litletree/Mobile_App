import 'package:flutter/material.dart';
import 'package:phuchung_63130476/json_list/json_data.dart';

class PageListPhotos extends StatelessWidget {
  const PageListPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Photo>>(
        future: getHTTP_Contents(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            return Center(child: Text("Lại bị lỗi rồi"),);
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          List<Photo> list = snapshot.data!;
          return GridView.extent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: list.map(
                    (photo) => Image.network(photo.url!)
            ).toList(),
          );
        },
      ),
    );
  }
}