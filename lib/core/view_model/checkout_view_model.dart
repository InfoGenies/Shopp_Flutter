import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/model/current_adress.dart';
import 'package:shope_app_flutter/model/product_model.dart';

import '../../constant.dart';
import '../../model/Order_model.dart';
import '../service/remote/checkout_service.dart';

class CheckoutViewModel extends GetxController {
  static CheckoutViewModel instance = Get.find();

  static final formKey = GlobalKey<FormState>();
  String? street, city, state, country, phone, totalPrice;

  int get index => _index;
  int _index = 0;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProductModel> _checkouts = [];
  List<OrderModel> _orders = [];

  List<ProductModel> get checkouts => _checkouts;

  List<OrderModel> get orders => _orders;

  Pages get pages => _pages;
  Pages _pages = Pages.deliveryTime;

  Delivery get delivery => _delivery;
  Delivery _delivery = Delivery.standardDelivery;


  @override
  void onInit() async {
   await _getCheckoutsFromFireStore() ;
    super.onInit();

  }

  void changeIndex(int i) {
    _index = i;
    if (index == 0) {
      _pages = Pages.deliveryTime;
    } else if (_index == 1) {
      _pages = Pages.addAddress;
    } else if (_index == 2) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        _pages = Pages.summary;
      } else {
        _index = i - 1;
        _pages = Pages.addAddress;
      }
    } else if (_index == 3) {
      var address = CurrentAdress(
          street: street!,
          city: city!,
          state: state!,
          country: country!,
          phone: int.parse(phone!));
      Checkout().addOrderToFirestore(totalPrice!, address, _checkouts);
      Get.back();
      _index = 0;
    }
    update();
  }

  void changeTimeValue(Delivery changedValue) {
    _delivery = changedValue;
    update();
  }

  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    _orders.clear();
    List<QueryDocumentSnapshot> checkoutsSnapshot =
        await Checkout().getOrdersFromFirestore();
    for (var order in checkoutsSnapshot) {
      _orders.add(OrderModel.fromMap(order.data() as Map<String, dynamic>));
    }
    print("the size of the liste is ${_orders.length}");
    _isLoading = false;
    update();
  }

  Color getColor(int index) {
    if (index == _index) {
      return Colors.black;
    } else if (index < _index) {
      return Colors.black;
    } else {
      return todoColor;
    }
  }
}
