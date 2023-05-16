import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../service/remote/firestore_user.dart';

class ProfileViewModel extends GetxController{

  UserModel? _currentUser;
  String? name, email, password, picUrl;

  UserModel? get currentUser => _currentUser;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  getCurrentUser() async {
    _loading.value = true;
    _currentUser = await getUserFromFirestore();
    _loading.value = false;
    update();
  }

  updateCurrentUser() async {
    try {
      UserModel userModel = UserModel(
        userId: _currentUser!.userId,
        email: email!,
        name: name!,
        pic: picUrl == null ? _currentUser!.pic : picUrl!,
      );
      await FirebaseAuth.instance.currentUser!.updateEmail(email!);
      await FirebaseAuth.instance.currentUser!.updatePassword(password!);
      FireStoreUser().addUserToFireStore(userModel);
      getCurrentUser();
      Get.back();
    } catch (error) {
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to update..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserModel> getUserFromFirestore() async {
    DocumentSnapshot documentSnapshot = await FireStoreUser().getUserFromFirestore();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel.fromMap(data);
  }

}