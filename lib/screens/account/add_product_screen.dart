import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final List<File> images = [];

  final List<String> categories = [
    'TVs',
    'Accessories',
    'Audio',
    'Gaming',
    'Phones',
    'Computers'
  ];
  String selectedCategory = 'TVs';

  Future<void> addProduct() async {
    try {
      var url =
          Uri.parse('https://tujengeane.co.ke/electronics/productPosting.php');
      var request = http.MultipartRequest('POST', url)
        ..fields['action'] = 'add_product'
        ..fields['name'] = nameController.text
        ..fields['description'] = descriptionController.text
        ..fields['price'] = priceController.text
        ..fields['category'] = selectedCategory;

      // Add images to the request
      for (var image in images) {
        request.files.add(http.MultipartFile(
          'images[]',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split('/').last,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        // Product added successfully
        Get.back();
      } else {
        // Error adding product
        Get.snackbar('Error', 'Failed to add product');
      }
    } catch (e) {
      // Exception occurred
      Get.snackbar('Error', 'Failed to add product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (value) {
                selectedCategory = value!;
              },
              items:
                  categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Pick images from gallery
                final pickedImages = await ImagePicker().pickMultiImage();
                if (pickedImages != null) {
                  // Clear existing images
                  images.clear();
                  // Add picked images to the images list
                  for (var image in pickedImages) {
                    images.add(File(image.path));
                  }
                }
              },
              child: const Text('Pick Images'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addProduct(); 
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
