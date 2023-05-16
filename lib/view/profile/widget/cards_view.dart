

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/widgets/custom_text.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const CustomText(
                    text: 'Cards',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: CustomText(
                text: 'You don\'t have cards.',
                fontSize: 16,
                color: Colors.black54,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
