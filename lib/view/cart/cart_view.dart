import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../core/view_model/controller.dart';
import '../../model/product_model.dart';
import '../check_out/check_out_view.dart';
import '../details/details_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with TickerProviderStateMixin {
  int totalPrice = 0;

  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  sumTotal() {
    for (var item in homeViewModel.productCarte) {
      totalPrice = int.parse(item.price) + totalPrice;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.getProductsCarte();
    sumTotal();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Center(
              child: Text('My Cart', style: TextStyle(color: Colors.black))),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.53,
                child: homeViewModel.productCarte.isNotEmpty
                    ? Obx(() => AnimatedList(
                        key: listKey,
                        scrollDirection: Axis.vertical,
                        initialItemCount: homeViewModel.productCarte.length,
                        itemBuilder: (context, index, animation) {
                          final item = homeViewModel.productCarte[index];
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            child: Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      onPressed: (context) {
                                        totalPrice = totalPrice -
                                            (int.parse(item.price.toString()) *
                                                item.quantity);
                                        homeViewModel.deleteProduct(index);
                                        listKey.currentState?.removeItem(
                                            index,
                                            (context, animation) => cartItem(
                                                item, index, animation));
                                      }),
                                ],
                              ),
                              child: cartItem(item, index, animation),
                            ),
                          );
                        }))
                    : Container(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                    color: Colors.grey.shade400,
                    dashPattern: const [10, 10],
                    padding: const EdgeInsets.all(0),
                    child: Container()),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Total', style: TextStyle(fontSize: 20)),
                    Text('\$ $totalPrice',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {
                    checkoutViewModel.totalPrice = totalPrice.toString();
                    checkoutViewModel.checkouts.assignAll(homeViewModel.productCarte);
                    Get.to(CheckOutView());
                  },
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.green[600],
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              )
            ]));
  }

  cartItem(ProductModel product, int index, animation) {
    return GestureDetector(
      onTap: () {

        Get.to(DetailsView(
          model: product,
        ));
      },
      child: SlideTransition(
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
                  ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if (product.quantity > 1) {
                        product.quantity--;
                        totalPrice = totalPrice - int.parse(product.price);
                      }
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade400,
                    size: 30,
                  ),
                ),
                Center(
                  child: Text(
                    product.quantity.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                ),
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: Colors.yellow[700],
                  onPressed: () {
                    setState(() {
                      product.quantity++;
                      totalPrice = totalPrice + int.parse(product.price);
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

/*
class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: homeViewModel.productCarte.length,
      itemBuilder: (context, index) {
        final product = homeViewModel.productCarte[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text(product.description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              homeViewModel.deleteProduct(index);
            },
          ),
        );
      },
    ));
  }

  @override
  void initState() {
    homeViewModel.getProductsCarte();
    super.initState();

  }
}
*/
