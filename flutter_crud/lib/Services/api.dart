import 'dart:convert';

import 'package:flutter_crud/Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.0.104/api/";

  // post method

  static addProduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final response = await http.post(url, body: pdata);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // get method

  static getProduct() async {
    List<Product> products = [];
    var url = Uri.parse("${baseUrl}get_product");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        data['products'].forEach((value) => {
              products.add(Product(
                  name: value['pname'],
                  description: value['pdesc'],
                  price: value['pprice'],
                  id: value['id'].toString()))
            });

        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // update method
  static updateData(id, body) async {
    var url = Uri.parse('${baseUrl}update/$id');

    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to update Data");
    }
  }

  // delete method

  static deleteProduct(id) async {
    var url = Uri.parse('${baseUrl}delete/:$id');

    final response = await http.delete(url);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to delete");
    }
  }
}
