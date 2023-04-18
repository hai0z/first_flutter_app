import 'package:flutter/material.dart';
import 'model/product.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class ProductCard extends StatelessWidget {
  final List<Product> listProduct;
  const ProductCard({super.key, required this.listProduct});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
          children: listProduct
              .map((e) => SizedBox(
                  width: MediaQuery.of(context).size.width / 2.0,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: InkWell(
                    child: Card(
                        child: Column(
                      children: [
                        Image.network(
                          e.image,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(e.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    )),
                  )))
              .toList()),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        home: const ProductScreen());
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchProduct(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          return snapshot.hasData
              ? ProductCard(listProduct: snapshot.data as List<Product>)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
