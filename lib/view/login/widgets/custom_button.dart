import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function() onPress;

  const CustomButton(
      {Key? key,
      required this.onPress,
      this.text = 'Write text ',
      this.color = primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: onPress ,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // <-- Radius
            ),
            padding: const EdgeInsets.all(10),
            backgroundColor: primaryColor),
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
