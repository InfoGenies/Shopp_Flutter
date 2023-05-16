import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../category/category_grid_view.dart';
import '../../login/widgets/custom_text.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 150,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.getProductsByCategory(categoryId: controller.categoryModel[index].id);
                Get.to(const CategoryGridView());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 8,
                  shadowColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                controller.categoryModel[index].image),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: controller.categoryModel[index].name,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
