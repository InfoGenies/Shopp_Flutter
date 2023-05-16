import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/view_model/home_view_model.dart';
import '../details/details_view.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => controller.isProductLoading == true
            ?  Center(child: Lottie.asset('assets/images/icons/loading.json'))
            : Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.grey.shade200,
                  elevation: 0,
                  title: const Center(child: Text("Product",style: TextStyle(color: Colors.black))),
                ),
                body: (controller.productByCat.isNotEmpty)
                    ? SafeArea(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: controller.productByCat
                                .map((item) => InkWell(
                                      onTap: () {
                                        Get.to(DetailsView(
                                          model: item,
                                        ));
                                      },
                                      child: Card(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        child: Hero(
                                          tag: item.id,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        item.image),
                                                    fit: BoxFit.cover)),
                                            child: Transform.translate(
                                              offset: const Offset(50, -50),
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 65,
                                                        vertical: 63),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: const Icon(
                                                  Icons.bookmark_border,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/product_not_found.png'),
                          const SizedBox(height: 10),
                          const Text('Products Not Found!')
                        ],
                      ),
              ));
  }
}
