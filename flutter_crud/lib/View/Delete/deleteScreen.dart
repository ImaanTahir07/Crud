import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Model/ProductModel.dart';
import '../../Services/api.dart';
import '../Update/EditScreen.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Data")),
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
                    trailing: GestureDetector(
                        onTap: () {
                          Api.deleteProduct(pdata[index].id);
                          pdata.removeAt(index);
                          setState(() {});
                        },
                        child: Icon(Icons.delete)));
              },
            );
          }
        },
      ),
    );
  }
}
