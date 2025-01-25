import 'package:ernes_technologies/constants.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_2/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback action;
  final String buttonName;
  final Color color;
  final double buttonWidth;
  final double buttonHeight;
  final Widget? destinationScreen;
  Color buttonColor;

  CustomButton({
    super.key,
    required this.buttonName,
    this.color = primaryColor,
    this.buttonHeight = 50,
    this.buttonWidth = 200,
    this.destinationScreen,
    required this.buttonColor,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //     onPressed: action,
    //     child: CustomText(
    //       label: "Login",
    //     ));
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen!),
        );
      },
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appWhiteColor,
          ),
        ),
      ),
    );
  }
}
