import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String idCat;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String sized;

  @HiveField(6)
  final String price;

  @HiveField(7)
   int quantity;

  @HiveField(8)
  final int color;

  ProductModel(
      {required this.id,
      required this.idCat,
      required this.name,
      required this.image,
      required this.description,
      required this.sized,
      required this.price,
      required this.quantity,
      required this.color});

  factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductModel(
        id: map['id'],
        idCat: map['idCat'],
        name: map['name'],
        image: map['image'],
        description: map['description'],
        sized: map['sized'],
        price: map['price'],
        quantity: map['quantity'],
        color: map['color']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idCat': idCat,
      'name': name,
      'image': image,
      'description': description,
      'sized': sized,
      'price': price,
      'quantity': quantity,
      'color': color
    };
  }
}
