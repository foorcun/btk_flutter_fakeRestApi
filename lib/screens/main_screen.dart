import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/data.api/category_api.dart';
import 'package:http_demo/models/category.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: CategoryApi.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Beklenmeyen bir hata oluştu..."),
              );
            } else if (snapshot.hasData) {
              List<Category> data = snapshot.data as List<Category>;
              return ListView.builder(
                  // itemCount: 2,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index].categoryName),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
