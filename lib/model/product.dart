import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  int id = 0;
  String title = "";
  dynamic price = 0.0;
  String description = "";
  String image = "";

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: (json['price']),
        description: json['description'],
        image: json['image']);
  }
}

Future<List<Product>> fetchProduct(http.Client client) async {
  final response = await client.get(Uri.http("fakestoreapi.com", "products"));
  List<dynamic> responseJson = json.decode(response.body);
  final listProduct = responseJson.map<Product>((json) {
    return Product.fromJson(json);
  }).toList();
  return listProduct;
}
