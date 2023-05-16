import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/extension/string_extention.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_button.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_text.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_text_form_field.dart';

import '../../core/view_model/auth_view_model.dart';
import '../../core/view_model/controller.dart';
import 'login_view.dart';

class RegisterView extends GetView<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  title: 'Name',
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidName) {
                      return "Please enter valid Name";
                    }
                    return null;
                  },onSaved: (value){
                  authViewModel.name = value ;
                },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  title: 'Email',
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },onSaved: (value){
                  authViewModel.email = value ;
                },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  title: 'Password',
                  obsecureText: true,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },onSaved: (value){
                  authViewModel.password = value ;
                },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      authViewModel.createAccountWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN Up',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
