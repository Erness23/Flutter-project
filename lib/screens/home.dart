import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ernes_technologies/screens/dashboard.dart';
import 'package:ernes_technologies/controllers/homeController.dart';
import 'package:ernes_technologies/screens/account/account.dart';
import 'package:ernes_technologies/screens/explore/explore_screen.dart';
import 'package:ernes_technologies/screens/productTrial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart_button.dart';
import 'cart_screen.dart';

HomeController homeController = Get.put(HomeController());

var screenList = [
  const Dashboard(),
  ExploreScreen(),
  const Products(),
  AccountScreen(),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blue,
          items: const [
            CurvedNavigationBarItem(
                child: Icon(Icons.home, color: Colors.white), label: 'Home'),
            CurvedNavigationBarItem(
                child: Icon(Icons.category_rounded, color: Colors.white),
                label: 'Categories'),
            CurvedNavigationBarItem(
                child: Icon(Icons.history, color: Colors.white),
                label: 'History'),
            CurvedNavigationBarItem(
                child: Icon(Icons.person, color: Colors.white),
                label: 'Account'),
          ],
          onTap: (index) {
            homeController.setSelectedPage(index);
          },
        ),
        body: Obx(() =>
            Container(child: screenList[homeController.selectedPage.value])),
        floatingActionButton: CartButton(),
      ),
    );
  }
}
