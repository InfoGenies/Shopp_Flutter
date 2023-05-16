import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final void Function() onPress;

  const CustomButtonSocial(
      {Key? key,
      required this.text,
      required this.imageName,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50, // Set the desired color
      ),
      child: TextButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // <-- Radius
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(imageName),
              const SizedBox(
                width: 100,
              ),
              CustomText(
                text: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
