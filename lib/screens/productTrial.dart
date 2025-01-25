import 'dart:convert';

import 'package:ernes_technologies/controllers/login_controller.dart';
import 'package:ernes_technologies/controllers/product_controller.dart';
import 'package:ernes_technologies/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
//wrap row with sized box and set its height to 100
            return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "https://tujengeane.co.ke/electronics/pimages/${productController.productList[index].pimage}",
                      width: 100,
                      height: 100),
                  const SizedBox(width: 5),
//Wrap column with expanded
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(productController.productList[index].pname,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        productController.productList[index].pdescription,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                        maxLines: 3,
                      ),
                    ],
                  ),
                  Text(productController.productList[index].price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )),
//MaterialButton(onPressed: onPressed)
// MaterialButton(){onPressed:(){createOrder(productController.productList[index].id,productController.productList[index].price);
// },child:Text("Order"),color:Colors.blue}
                ]);
          },
          itemCount: productController.productList.length,
        ));
  }

  Future<void> getProducts() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://tujengeane.co.ke/electronics/getproducts.php"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var productResponse = serverResponse['products'];
      var productList = productResponse
          .map((product) => ProductModel.fromJson(product))
          .toList();
      productController.updateProductList(productList);
    } else {
      print("Error occurred");
    }
  }

  Future<void> createOrder(productID, amount) async {
    http.Response response;
    var body = {
      'productID': productID,
      'amount': amount(),
      'userID': loginController.userID.value,
    };
    response = await http.post(
        Uri.parse("https://tujengeane.co.ke/electronics/createorder.php"),
        body: body);
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp = serverResponse['success'];
      if (signedUp == 1) {
        Get.offAndToNamed("/login");
        print("Order created");
      } else {
        print("Order not created");
      }
    }
  }
}
