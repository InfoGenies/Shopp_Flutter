

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../core/view_model/controller.dart';
import '../../model/product_model.dart';
import '../login/widgets/custom_button.dart';
import '../login/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  final  ProductModel model ;
  const DetailsView({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Hero(
                tag: model.id,
                child: Image.network(
                  model.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: model.sized,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(model.color),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model.description,
                        fontSize: 18,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: "PRICE ",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: ' \$ ${model.price}',
                        color: primaryColor,
                        fontSize: 18,
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onPress: () {
                        homeViewModel.addProductCarte(productModel: model) ;
                      },
                      text: 'Add',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
