class CategoryModel {
  final String id ;
  final String name;
  final String image;

  CategoryModel({required this.id,required this.name, required this.image});

//  The fromMap method is used to deserialize a Firestore document snapshot into a CategoryModel object.
  factory CategoryModel.fromMap(Map<dynamic, dynamic> map) {
    return CategoryModel(id: map['id'],name: map['name'], image: map['image']);
  }

  //  the toJson method is used to serialize a CategoryModel object into a Map<String, dynamic> object, which can then be stored in Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
