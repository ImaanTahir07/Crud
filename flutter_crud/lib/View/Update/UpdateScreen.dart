import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_crud/View/Update/EditScreen.dart';

import '../../Model/ProductModel.dart';
import '../../Services/api.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
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
                    trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditScreen(data: pdata[index]),
                              ));
                        },
                        child: Icon(Icons.edit)));
              },
            );
          }
        },
      ),
    );
  }
}
