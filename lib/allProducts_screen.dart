import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });
}

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductsController>(
      init: AllProductsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('All Products'),
          ),
          body: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(
                    'Category: ${product.category}\nPrice: \$${product.price.toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to update product screen
                        Get.to(() => UpdateProductScreen(product: product));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Call delete product method
                        controller.deleteProduct(product.id);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class AllProductsController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      var url =
          Uri.parse('https://tujengeane.co.ke/electronics/allProducts.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;
        products.value = jsonData
            .map((data) => Product(
                  id: data['id'],
                  name: data['name'],
                  category: data['category'],
                  price: double.parse(data['price']),
                  description: data['description'],
                ))
            .toList();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      var url = Uri.parse(
          'https://tujengeane.co.ke/electronics/deleteProduct.php?id=$productId');
      var response = await http.delete(url);

      if (response.statusCode == 200) {
        // Product deleted successfully
        products.removeWhere((product) => product.id == productId);
        Get.snackbar('Success', 'Product deleted successfully');
      } else {
        // Error deleting product
        Get.snackbar('Error', 'Failed to delete product');
      }
    } catch (e) {
      // Exception occurred
      Get.snackbar('Error', 'Failed to delete product: $e');
    }
  }
}

class UpdateProductScreen extends StatelessWidget {
  final Product product; // Define product property

  const UpdateProductScreen({super.key, required this.product}); // Constructor

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProductController>(
      init: UpdateProductController(
          product: product), // Initialize controller with product
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Update Product'),
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Your UI elements here
              ],
            ),
          ),
        );
      },
    );
  }
}

class UpdateProductController extends GetxController {
  final Product product; // Define product property

  UpdateProductController({required this.product}); // Constructor

  // Define controller properties and methods
}
