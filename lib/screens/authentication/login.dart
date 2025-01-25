import 'dart:convert';

import 'package:ernes_technologies/constants.dart';
import 'package:ernes_technologies/widgets/customTextField.dart';
import 'package:ernes_technologies/widgets/custom_button.dart';
import 'package:ernes_technologies/widgets/custom_text.dart';
import 'package:ernes_technologies/screens/authentication/forgot_password.dart';
import 'package:ernes_technologies/screens/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final TextEditingController passwordController = TextEditingController();
final TextEditingController usernameController = TextEditingController();

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          label: "Ernes Electronics",
          labelColor: appWhiteColor,
        ),
        backgroundColor: primaryColor,
        foregroundColor: appWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green,
                Colors.purple,
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo-no-background.png",
                          height: 300,
                          width: 300,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 25)),
                    const CustomText(
                      label: "Login Screen",
                      fontWeight: FontWeight.bold,
                      labelColor: Colors.black,
                      fontSize: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    ),
                    const CustomText(
                      label: "Username",
                      fontSize: 20,
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextField(
                        textFieldController: usernameController,
                        hintMessage: "Phone number or Email",
                        prefixIcon: const Icon(Icons.person)),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      label: "Password",
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextField(
                      textFieldController: passwordController,
                      hintMessage: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.check_box_outline_blank_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          label: "remember me?",
                          fontWeight: FontWeight.bold,
                          labelColor: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        CustomButton(
                          buttonName: "Login",
                          buttonColor: Colors.red,
                          action: () {
                            remoteLogin();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          label: "Don't have an account?",
                          labelColor: Colors.black,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                            // const SignIn();
                          },
                          child: const Text("Sign Up",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                        // const SignIn();
                      },
                      child: const Text("Forgot password",
                          style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> remoteLogin() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://tujengeane.co.ke/electronics/login.php?email=${usernameController.text.trim()}&password=${passwordController.text.trim()}"));
//syntax textController.text.trim
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
//Navigate to Dashboard
        print("Login Success");
      } else {
        print("Email or Password invalid");
      }
    } else {
      print("Server Error! ${response.statusCode}");
    }
  }
}
