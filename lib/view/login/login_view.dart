import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_app_flutter/extension/string_extention.dart';
import 'package:shope_app_flutter/view/login/register_view.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_button.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_button_social.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_text.dart';
import 'package:shope_app_flutter/view/login/widgets/custom_text_form_field.dart';

import '../../constant.dart';
import '../../core/view_model/auth_view_model.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "Welcome,",
                        fontSize: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=> RegisterView());
                        },
                        child: const CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      } else if (!value.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: 'Password',
                    obsecureText: true,
                    textEditingController: passwordController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    text: 'SIGN IN',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Facebook',
                    onPress: () {
                      controller.signInWithFacebook();
                    },
                    imageName: 'assets/images/facebook.png',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Google',
                    onPress: () {
                      controller.signInWithGoogle();
                    },
                    imageName: 'assets/images/google.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
