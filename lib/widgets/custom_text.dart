// import 'dart:ffi';

import 'package:ernes_technologies/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool mandatory;
  const CustomText({
    super.key,
    required this.label,
    this.labelColor = primaryColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.mandatory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              color: labelColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
        mandatory
            ? Text(
                "*",
                style: TextStyle(
                    color: labelColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight),
              )
            : Container(),
      ],
    );
    // return SizedBox(
    //   child: Text(
    //     label,
    //     style: TextStyle(
    //       color: lableColor,
    //       fontSize: fontSize,
    //       fontWeight: fontWeight,
    //     ),
    //   ),
    // );
  }
}
