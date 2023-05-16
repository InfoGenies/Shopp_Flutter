import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../core/view_model/checkout_view_model.dart';
import '../../login/widgets/custom_text.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CheckoutViewModel>(
        init: Get.find<CheckoutViewModel>(),
        builder: (controller) => Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                RadioListTile<Delivery>(
                  value: Delivery.standardDelivery,
                  selected: true,
                  groupValue: controller.delivery,
                  onChanged: (value) {
                    controller.changeTimeValue(value!);
                  },
                  title: const CustomText(
                    text: "Standard Delivery",
                  ),
                  subtitle: const CustomText(text:
                    "Order will be delivered between 3 - 5 business days",
                    fontSize: 15,
                    color: Colors.black,
                    maxLine: 2,
                  ),
                  activeColor: primaryColor,
                  isThreeLine: true,
                ),
                RadioListTile<Delivery>(
                  value: Delivery.nextDayDelivery,
                  //selected: true,
                  groupValue: controller.delivery,
                  onChanged: (value) {
                    controller.changeTimeValue(value!);
                  },
                  title: const CustomText(
                    text: "Next Day Delivery",
                    fontSize: 18,
                  ),
                  subtitle: const CustomText(
                    text:
                    "Place your order before 6pm and your items will be delivered the next day",
                    fontSize: 15,
                    //color: Colors.grey,
                    maxLine: 2,
                    // letterSpacing: 1,
                  ),
                  activeColor: primaryColor,
                  isThreeLine: true,
                ),
                RadioListTile<Delivery>(
                  value: Delivery.nominatedDelivery,
                  //selected: true,
                  groupValue: controller.delivery,
                  onChanged: (value) {
                    controller.changeTimeValue(value!);
                  },
                  title: const CustomText(
                    text: "Nominated Delivery",
                    fontSize: 18,
                  ),
                  subtitle: const CustomText(
                    text:
                    "Pick a particular date from the calendar and order will be delivered on selected date",
                    fontSize: 15,
                    //color: Colors.grey,
                    maxLine: 2,
                  ),
                  activeColor: primaryColor,
                  isThreeLine: true,
                ),
              ],
            ),
          ),
        ));
  }
}