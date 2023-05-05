import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_crud/View/Create/createScreen.dart';
import 'package:flutter_crud/View/Read/ReadDataScreen.dart';
import 'package:flutter_crud/View/Update/UpdateScreen.dart';

import '../Services/api.dart';
import 'Delete/deleteScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Node Crud"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateScreen(),
                      ));

                  // Api.addProduct({"name": "Emaan", "quantity": 7, "price": 85});
                },
                child: Text("Create")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadDataScreen(),
                      ));
                },
                child: Text("Read")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateScreen(),
                      ));
                },
                child: Text("Update")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteScreen(),
                      ));
                },
                child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
