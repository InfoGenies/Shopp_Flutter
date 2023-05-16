import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../service/local/local_carte.dart';
import '../service/remote/home_services.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;

  ValueNotifier<bool> get isCategoryLoading => _isCategoryLoading;
  final ValueNotifier<bool> _isCategoryLoading = ValueNotifier(false);

  ValueNotifier<bool> get isProductLoading => _isProductLoading;
  final ValueNotifier<bool> _isProductLoading = ValueNotifier(false);

  final List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productModel = [];
  final RxList<ProductModel> _productCarte =
      List<ProductModel>.empty(growable: true).obs;

  final List<ProductModel> _productByCat = [];

  List<ProductModel> get productModel => _productModel;

  List<ProductModel> get productByCat => _productByCat;

  List<ProductModel> get productCarte => _productCarte;

  final LocalCarte _localCarteService = LocalCarte();

  @override
  void onInit() async {
    await _localCarteService.init();
    await getCategory();
    await getBestSellingProducts();
    super.onInit();
  }

  getCategory() async {
    _isCategoryLoading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromMap(value[i].data() as Map<String, dynamic>));
      }

      update();
    });
    _isCategoryLoading.value = false;
  }

  getBestSellingProducts() async {
    _isProductLoading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel
            .add(ProductModel.fromMap(value[i].data() as Map<String, dynamic>));
      }
      update();
    });
    _isProductLoading.value = false;
  }

  getProductsByCategory({required String categoryId}) async {
    _productByCat.clear();
    _isProductLoading.value = true;
    await HomeService().fetchProductsByCategory(categoryId).then((value) {
      for (int i = 0; i < value!.length; i++) {
        _productByCat
            .add(ProductModel.fromMap(value[i].data() as Map<String, dynamic>));
      }
      update();
    });
    _isProductLoading.value = false;
  }

  Future<void> addProductCarte({required ProductModel productModel}) async {
    await _localCarteService.assignProduct(value: productModel);
  }

  getProductsCarte() {
    if (_localCarteService.getProduct().isNotEmpty) {
      _productCarte.assignAll(_localCarteService.getProduct());
    }
  }

  Future<void> deleteProduct(int id) async {
    _localCarteService.deleteProduct(id);
    _productCarte.removeAt(id);
  }
}
