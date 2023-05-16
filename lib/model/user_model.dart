class UserModel {
  final String userId;

  final String email;

  final String name;

  final String pic;

  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic});

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
        userId: map['userId'],
        email: map['email'],
        name: map['name'],
        pic: map['pic']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
