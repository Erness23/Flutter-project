import 'dart:io';

import 'package:ernes_technologies/screens/productTrial.dart';
import 'package:ernes_technologies/screens/updateScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'add_product_screen.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the add product screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                );
              },
              child: const Text('Add Product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the update product screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProductScreen()),
                );
              },
              child: const Text('Update Product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the update product screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Products()),
                );
              },
              child: const Text('All Products'),
            ),
          ],
        ),
      ),
    );
  }
}
