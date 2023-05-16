import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/model/product_model.dart';

import '../../login/widgets/custom_text.dart';

class OrderDetailed extends StatelessWidget {
  final List<ProductModel> product;

   OrderDetailed({Key? key, required this.product}) : super(key: key);
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
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
                        text: 'Order Detail',
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
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 0.53,
                    child:  AnimatedList(
                        key: listKey,
                        scrollDirection: Axis.vertical,
                        initialItemCount: product.length,
                        itemBuilder: (context, index, animation) {
                          final item = product[index];
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            child: cartItem(item, index, animation),
                          );
                        })
                ),
              ),
            
            ]));
  }

  cartItem(ProductModel product, int index, animation) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(animation),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.quantity.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  )
                ]),
          ),
        ]),
      ),
    );
  }
}
