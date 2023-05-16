import 'package:hive/hive.dart';
import 'package:shope_app_flutter/model/product_model.dart';

class LocalCarte {
  late Box<ProductModel> _productBox;

  Future<void> init() async {
    _productBox =
        await Hive.openBox<ProductModel>('Product'); // Creation box and OPen it
  }

  Future<void> assignProduct({required ProductModel value}) async {
    await _productBox.add(value);
  }
  Future<void> deleteProduct(int index) async {
    final key = _productBox.keyAt(index);

    await _productBox.delete(key);
  }


  List<ProductModel> getProduct() => _productBox.values.toList();
}
