import '../constant.dart';
import 'current_adress.dart';
import 'product_model.dart';

class OrderModel {
  OrderEnums orderStatus;
  final String date;

  final String totalCost;
  final CurrentAdress adress;
  final List<ProductModel> products;

  OrderModel(
      {this.orderStatus = OrderEnums.PLACED,
      required this.date,
      required this.totalCost,
      required this.adress,
      required this.products});

  factory OrderModel.fromMap(Map<dynamic, dynamic> map) {
    return OrderModel(
        date: map["date"],
        orderStatus: OrderEnums.values
            .firstWhere((e) => e.toString() == map['orderStatus']),
        totalCost: map['totalCost'],
        adress: CurrentAdress.fromMap(map['adress']),
        products: List<ProductModel>.from(
            map['products'].map((product) => ProductModel.fromMap(product))));
  }

// to save in firestore
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'orderStatus': orderStatus.toString(),
      'totalCost': totalCost,
      'adress': adress.toJson(),
      'products': products.map((product) => product.toJson()).toList()
    };
  }
}
