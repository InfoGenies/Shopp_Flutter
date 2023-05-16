
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../core/view_model/home_view_model.dart';
import '../../details/details_view.dart';
import '../../login/widgets/custom_text.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Hero(
                            tag:  controller.productModel[index].id ,
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "${controller.productModel[index].price} \$",
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
