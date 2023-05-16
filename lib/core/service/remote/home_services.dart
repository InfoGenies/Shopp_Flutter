import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('CategoryModel');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Product');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>?> fetchProductsByCategory(
      String categoryId) async {

    try {
      var value =
      await _productCollectionRef.where('idCat', isEqualTo: categoryId).get();
      return value.docs;
    }catch(e){
     print("the error of fetching is ${e.toString()} ");
    }
    return null;


  }
}
