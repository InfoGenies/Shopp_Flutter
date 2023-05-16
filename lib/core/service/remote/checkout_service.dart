import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../../../model/Order_model.dart';
import '../../../model/current_adress.dart';
import '../../../model/product_model.dart';

class Checkout {
  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Orders');

  Future<void> addOrderToFirestore(String totalCost, CurrentAdress adress,
      List<ProductModel> products) async {
    var order = OrderModel(
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
      products: products,
      adress: adress,
      totalCost: totalCost,
    );

    return await _ordersCollection.doc().set(order.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    var orders =
    await _ordersCollection.orderBy('date', descending: true).get();
    return orders.docs;
  }
}
