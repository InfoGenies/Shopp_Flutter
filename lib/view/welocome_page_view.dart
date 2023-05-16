import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../core/network_viewmodel.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/controller.dart';
import 'login/login_view.dart';

class WelcomePage extends GetWidget<AuthViewModel> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (authViewModel.user == null)
          ? LoginView()
          : Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
                  Get.find<NetworkViewModel>().connectionStatus.value == 2
              ? GetBuilder<ControlViewModel>(
                  builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: bottomNavigationBar(),
                  ),
                )
              : NoInternetConnection();

    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Account"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:
              Lottie.asset('assets/images/icons/no_internet_connection.json'),
        ),
      ),
    );
  }
}
