import 'package:ernes_technologies/constants.dart';
import 'package:ernes_technologies/widgets/customTextField.dart';
import 'package:ernes_technologies/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController secondNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          label: "DU App",
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
                          height: 250,
                          width: 250,
                        ),
                      ],
                    ),
                    const CustomText(
                      label: "Sign Up ",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
                    ),
                    const CustomText(
                      label: "Username",
                    ),
                    CustomTextField(
                      textFieldController: usernameController,
                      hintMessage: "Phone number or Email",
                      prefixIcon: const Icon(Icons.person),
                    ),

                    const CustomText(
                      label: "First Name",
                    ),
                    CustomTextField(
                        textFieldController: firstNameController,

                        // hintMessage: "Phone number or Email",
                        prefixIcon: const Icon(Icons.person)),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    const CustomText(
                      label: "Second Name",
                    ),
                    CustomTextField(
                      textFieldController: secondNameController,
                      // hintMessage: "Phone number or Email",
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const CustomText(
                      label: "Phone Number",
                    ),
                    CustomTextField(
                        textFieldController: phoneNumberController,
                        // hintMessage: "Phone number or Email",
                        prefixIcon: const Icon(Icons.phone)),
                    const CustomText(
                      label: "Email",
                    ),
                    CustomTextField(
                        textFieldController: emailController,
                        hintMessage: "example@yahoo.com",
                        prefixIcon: const Icon(Icons.person)),
                    const CustomText(
                      label: "Password",
                    ),
                    CustomTextField(
                      textFieldController: passwordController,
                      hintMessage: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                      isPassword: true,
                    ),
                    const CustomText(
                      label: "Confirm Password",
                    ),
                    CustomTextField(
                      textFieldController: confirmPasswordController,
                      hintMessage: "Re-enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () => Get.toNamed("/login"),
                      height: 50,
                      minWidth: 200,
                      color: primaryColor,
                      child: const Text("Complete Registration"),
                    ),
                    // CustomButton(
                    //   buttonName: "Complete Registration",
                    //   buttonColor: Colors.red,
                    //   action: () => Get.toNamed("/login"),
                    // ),
                    // const CustomButton(
                    //     buttonName: "Complete Signup", destinationScreen: Login())
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> serverSignUp() async {
  //   http.Response response;
  //   response = await http
  //       .post(Uri.parse("https://tujengeane.co.ke/electronics/signup.php"),body: );
  // }
}
