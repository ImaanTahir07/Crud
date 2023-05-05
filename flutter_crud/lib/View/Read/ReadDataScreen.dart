import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_crud/Model/ProductModel.dart';

import '../../Services/api.dart';

class ReadDataScreen extends StatefulWidget {
  const ReadDataScreen({super.key});

  @override
  State<ReadDataScreen> createState() => _ReadDataScreenState();
}

class _ReadDataScreenState extends State<ReadDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read Data")),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.storage),
                  title: Text(pdata[index].name.toString()),
                  subtitle: Text(pdata[index].description.toString()),
                  trailing: Text(pdata[index].price.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
