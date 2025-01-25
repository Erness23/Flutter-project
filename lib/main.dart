import 'package:ernes_technologies/allProducts_screen.dart';
import 'package:ernes_technologies/screens/account/account.dart';
import 'package:ernes_technologies/screens/home.dart';
import 'package:ernes_technologies/screens/authentication/login.dart';
import 'package:ernes_technologies/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
