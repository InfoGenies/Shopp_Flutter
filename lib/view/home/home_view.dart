import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_text.dart';

import '../../core/view_model/controller.dart';
import '../../core/view_model/home_view_model.dart';
import 'component/category_view.dart';
import 'component/product_view.dart';
import 'component/search_text_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: homeViewModel,
      builder: (controller) => controller.isCategoryLoading.value == true
          ?  Center(child: Lottie.asset('assets/images/icons/loading.json'))
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      const SearchTextFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CategoryView(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const ProductView(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }


}
