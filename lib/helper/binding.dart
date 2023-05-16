import 'package:get/get.dart';

import '../core/network_viewmodel.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/checkout_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/profile_view_model.dart';
import '../core/view_model/select_image_view_model.dart';

class Binding extends Bindings{
  // here we juste improve our performance
  @override
  void dependencies() {
   Get.lazyPut(() =>  AuthViewModel());
   Get.lazyPut(() =>  ControlViewModel());
   Get.lazyPut(() =>  HomeViewModel());
   Get.lazyPut(() =>  CheckoutViewModel(),fenix:true );
   Get.lazyPut(() =>  ProfileViewModel());
   Get.lazyPut(() =>  SelectImageViewModel());
   Get.lazyPut(() =>  NetworkViewModel());
  }
  
}