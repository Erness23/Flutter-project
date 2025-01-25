import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:http/http.dart' as http;

class UpdateProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProductController>(
      
      init: UpdateProductController(), 
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Update Product'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: controller
                      .category.value, 
                  onChanged: (value) {
                    controller.setCategory(value!);
                  },
                  items: [
                    'TVs',
                    'Audio',
                    'Computers',
                    'Accessories',
                    'Gaming',
                    'Phones'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(labelText: 'Category'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  initialValue: controller
                      .name.value, 
                  onChanged: (value) {
                    controller.setName(value);
                  },
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  initialValue: controller.price.value
                      .toString(), 
                  onChanged: (value) {
                    controller.setPrice(double.parse(value));
                  },
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  initialValue: controller.description
                      .value, 
                  onChanged: (value) {
                    controller.setDescription(value);
                  },
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 4,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    controller.updateProduct();
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UpdateProductController extends GetxController {
  
  var category = 'TVs'.obs; 
  var name = ''.obs;
  var price = 0.0.obs;
  var description = ''.obs;

  void setCategory(String value) {
    category.value = value; 
  }

  void setName(String value) {
    name.value = value;
  }

  void setPrice(double value) {
    price.value = value;
  }

  void setDescription(String value) {
    description.value = value;
  }

  void updateProduct() async {
    try {
      var url =
          Uri.parse('https://tujengeane.co.ke/electronics/updateProducts.php');
      var response = await http.put(
        url,
        body: {
          'category': category.value,
          'name': name.value,
          'price': price.value.toString(),
          'description': description.value,
        },
      );

      if (response.statusCode == 200) {
        // Product updated successfully
        Get.back();
        Get.snackbar('Success', 'Product updated successfully');
      } else {
        // Error updating product
        Get.snackbar('Error', 'Failed to update product');
      }
    } catch (e) {
      // Exception occurred
      Get.snackbar('Error', 'Failed to update product: $e');
    }
  }
}
