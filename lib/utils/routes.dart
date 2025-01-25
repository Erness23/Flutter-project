import 'package:ernes_technologies/screens/account/admin_screen.dart';
import 'package:ernes_technologies/screens/explore/explore_screen.dart';
import 'package:ernes_technologies/screens/authentication/login.dart';
import 'package:ernes_technologies/screens/authentication/sign_up.dart';
import 'package:get/get.dart';

//Transition myTransition = ;

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const Login()),
    // GetPage(name: "/homepage", page: () => HomePage()),
    GetPage(name: "/signup", page: () => const SignUp()),
    // GetPage(name: "/cart", page: () => Cart()),
    // GetPage(name: "/dashboard", page: () => Dashboard()),
    GetPage(name: "/explore", page: () => ExploreScreen()),
    // GetPage(name: "/televisions", page: () => Television()),
    // GetPage(name: "/computers", page: () => Computers()),
    // GetPage(name: "/gaming", page: () => Gaming()),
    // GetPage(name: "/smartphones", page: () => Smartphones()),
    // GetPage(name: "/audio", page: () => Audio()),
    // GetPage(name: "/accessories", page: () => Accessories()),
    GetPage(name: "/adminscreen", page: () => const AdminScreen()),
  ];
}
