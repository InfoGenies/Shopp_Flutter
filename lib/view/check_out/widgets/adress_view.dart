import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/checkout_view_model.dart';
import '../../login/widgets/custom_text.dart';
import '../../login/widgets/custom_text_form_field.dart';

class AdressView extends StatelessWidget {

 const AdressView({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/check.png"),
                      const CustomText(
                          text:
                              "Billing address is the same as delivery address")
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 24),
                  child: Form(
                    key: CheckoutViewModel.formKey,
                    child: GetBuilder<CheckoutViewModel>(
                      init: Get.find<CheckoutViewModel>(),
                      builder: (controller) => Column(
                        children: [
                          CustomTextFormField(
                            title: 'Street',
                            hint: '21, Tahrir Street',
                            validation: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Please enter valid street name.';
                              }
                            },
                              onSaved: (value) {
                                controller.street = value;
                              }
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            title: 'City',
                            hint: 'Downtown Cairo',
                            validation: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Please enter valid city name.';
                              }
                            },
                              onSaved: (value) {
                                controller.city = value;
                              }
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  title: 'State',
                                  hint: 'Cairo',
                                  validation: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter valid state name.';
                                    }
                                  },
                                    onSaved: (value) {
                                      controller.state = value;
                                    }
                                ),
                              ),
                              const SizedBox(
                                width: 36,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  title: 'Country',
                                  hint: 'Egypt',
                                  validation: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter valid city name.';
                                    }
                                  },
                                    onSaved: (value) {
                                      controller.country = value;
                                    }
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            title: 'Phone Number',
                            hint: '+20123456789',
                            textInputType: TextInputType.phone,
                            validation: (value) {
                              if (value!.isEmpty || value.length < 10) {
                                return 'Please enter valid number.';
                              }
                            },
                              onSaved: (value) {
                                controller.phone = value;
                              }
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
