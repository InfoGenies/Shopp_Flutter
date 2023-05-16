import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shope_app_flutter/view/profile/widget/edit_profile_view.dart';

import '../../core/view_model/auth_view_model.dart';
import '../../core/view_model/profile_view_model.dart';
import '../login/widgets/custom_text.dart';
import '../order_history/order_history_view.dart';
import 'widget/cards_view.dart';
import 'widget/notifications_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value == true
            ?  Center(
                child: Lottie.asset('assets/images/icons/loading.json'),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 58, right: 16, left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: const AssetImage(
                                'assets/images/profile_pic.png'),
                            foregroundImage:
                                controller.currentUser!.pic != 'default'
                                    ? NetworkImage(controller.currentUser!.pic)
                                    : null,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.currentUser!.name,
                                fontSize: 26,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CustomText(
                                text: controller.currentUser!.email,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomListTile(
                        iconName: '1',
                        title: 'Edit Profile',
                        onTapFn: () {
                          Get.to(const EditProfileView());
                        },
                      ),
                      CustomListTile(
                        iconName: '3',
                        title: 'Order History',
                        onTapFn: () {
                          Get.to(const OrderHistoryView());
                        },
                      ),
                      CustomListTile(
                        iconName: '4',
                        title: 'Cards',
                        onTapFn: () {
                           Get.to(()=>const CardsView());
                        },
                      ),
                      CustomListTile(
                        iconName: '5',
                        title: 'Notifications',
                        onTapFn: () {
                          Get.to(()=>const NotificationsView());
                        },
                      ),
                      CustomListTile(
                        iconName: '6',
                        title: 'Log Out',
                        onTapFn: () {
                          Get.find<AuthViewModel>().signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTapFn;

  const CustomListTile({
    super.key,
    required this.iconName,
    required this.title,
    required this.onTapFn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapFn,
          leading: Image.asset(
            'assets/images/icons/menu_icons/$iconName.png',
            height: 40,
            width: 40,
          ),
          title: CustomText(
            text: title,
            fontSize: 18,
          ),
          trailing: title == 'Log Out'
              ? null
              : const Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
