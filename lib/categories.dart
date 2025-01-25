import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

class Product {
  final String name;
  final String description;
  final double price;

  Product({required this.name, required this.description, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: FutureBuilder(
        future: _fetchProducts(category.name),
        //function that returns a Product list representing the products associated with the given category name.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data as List<Product>;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text(products[index].description),
                  trailing:
                      Text('\$${products[index].price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Product>> _fetchProducts(String categoryName) async {
    final response = await http.get(
      Uri.parse(
          'https://tujengeane.co.ke/electronics/categoryProducts.php?category=$categoryName'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
