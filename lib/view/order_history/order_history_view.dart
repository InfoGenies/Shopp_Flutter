
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../core/view_model/checkout_view_model.dart';
import '../login/widgets/custom_text.dart';
import 'widget/order_detailed.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({Key? key}) : super(key: key);

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
                    text: 'Order History',
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
          Expanded(
            child: GetBuilder<CheckoutViewModel>(
              init: Get.find<CheckoutViewModel>(),
              builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(()=> OrderDetailed(product:controller.orders[index].products));
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: controller.orders[index].date,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: controller.orders[index].orderStatus.name,
                                    color: Colors.red.shade300,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              CustomText(
                                text: "Street: ${controller.orders[index].adress.street}",
                              ),
                              CustomText(
                                text: "City: ${controller.orders[index].adress.city}",
                              ),
                              CustomText(
                                text:"State: ${controller.orders[index].adress.state}" ,
                              ),
                              CustomText(
                                text:"Country: ${controller.orders[index].adress.country}" ,
                              ),
                              CustomText(
                                text: "Phone: ${controller.orders[index].adress.phone.toString()}",
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomText(
                                    text: 'Total Billed',
                                    color: primaryColor,
                                  ),
                                  CustomText(
                                    text:
                                    '\$${controller.orders[index].totalCost}',
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.orders.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
