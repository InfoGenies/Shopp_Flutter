import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../model/user_model.dart';
import '../../view/home/home_view.dart';
import '../service/remote/auth_service.dart';
import '../service/remote/firestore_user.dart';

class AuthViewModel extends GetxController {

  static AuthViewModel instance = Get.find();
  String? email, password, name;
  final authService = AuthService();
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    initialization() ;
    super.onInit();
    //_auth.authStateChanges() returns a Stream object that emits an event whenever the authentication state changes
    //bindStream allows you to listen for events on a Stream and react to them.
    _user.bindStream(authService.auth.authStateChanges());
  }
  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  Future<void> signInWithFacebook() async {
    try {
      await authService.signInWithFacebook().then((user) {
        saveUser(user!);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await authService.signInWithGoogle().then((user) {
        saveUser(user!);
        Get.offAll(HomeView());
      });
    } catch (e) {
      print("the error was in ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    try {
      await authService.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
      );
      UserCredential userCredential =
          await authService.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user.value = userCredential.user;
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      }
    }
  }

 void createAccountWithEmailAndPassword() async {
    try {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
      );
      print("the name is $name and email is $email and password is $password ") ;
      await authService.auth
          .createUserWithEmailAndPassword(email: email!,password: password!)
          .then((user) async {
        saveUser(user);
      });
      EasyLoading.dismiss();
      Get.offAll(const HomeView());
    } catch (e) {
      print(
          "the error of createAccountWithEmailAndPassword was in ${e.toString()}");
      EasyLoading.dismiss();

      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email.toString(),
      name:name == null ? user.user!.displayName! : name!,
      pic: user.user!.photoURL == null
          ? 'default'
          : "${user.user!.photoURL!}?width=400",    ) ;
    await FireStoreUser().addUserToFireStore(userModel);
  }
}
