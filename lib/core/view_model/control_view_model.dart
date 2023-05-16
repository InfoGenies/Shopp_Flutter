import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/cart/cart_view.dart';
import '../../view/home/home_view.dart';
import '../../view/profile/profile_view.dart';

class ControlViewModel extends GetxController {
  static ControlViewModel instance = Get.find();
  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;
  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = const HomeView();
          break;
        }
      case 1:
        {
          currentScreen = const CartView();
          break;
        }
      case 2:
        {
          currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
