import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../core/view_model/checkout_view_model.dart';
import '../../../core/view_model/controller.dart';
import '../../../core/view_model/home_view_model.dart';
import '../../login/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  int totalPrice = 0;

  Summary({super.key});

  int sumTotal() {
    for (var item in homeViewModel.productCarte) {
      totalPrice = int.parse(item.price) + totalPrice;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const SizedBox(
          height: 250,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: ListViewProducts(),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              text: 'TOTAL: ',
              fontSize: 14,
              color: Colors.grey,
            ),
            CustomText(
              text: '\$${sumTotal().toString()}',
              fontSize: 16,
              color: primaryColor,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomText(text: 'Shipping Address', fontSize: 20),
        ),
        GetBuilder<CheckoutViewModel>(
            builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      text: '${controller.street}'
                          ' , ${controller.city}'
                          ', ${controller.state}'
                          ' ${controller.country}'),
                ))
      ],
    );
  }
}

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.productCarte.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white,
                        ),
                        height: 120,
                        width: 120,
                        child: Image.network(
                          controller.productCarte[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(
                        text: controller.productCarte[index].name,
                        fontSize: 14,
                      ),
                      CustomText(
                        text:
                            '\$${controller.productCarte[index].price} x ${controller.productCarte[index].quantity}',
                        fontSize: 14,
                        color: primaryColor,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
