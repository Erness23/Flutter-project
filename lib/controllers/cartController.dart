import 'package:ernes_technologies/categories.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }

  // double getTotalPrice() {
  //   return cartItems.fold<double>(
  //       0, (previousValue, element) => previousValue + element.price);
  // }
}
