import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_texts.dart';
import '../../core/utils/helpers/image_helper.dart';
import '../../routes/app_pages.dart';
import 'login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageHelper(
                    imagePath: AppImages.appIcon,
                    color: AppColor.red,
                    height: AppSizes.size100,
                    width: AppSizes.size100,
                  ),
                  Text(
                    AppTexts.appName,
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: Container(
                  color: AppColor.white,
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        'Login to your account',
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      20.heightBox,
                      buildTextField(
                        hintText: 'Enter Username',
                        name: 'name',
                        prefixIcon: const Icon(Icons.person),
                      ),
                      10.heightBox,
                      buildTextField(
                        hintText: 'Enter Password',
                        name: 'password',
                        obscureText: controller.hidePassword(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.hidePassword.toggle();
                          },
                          icon: controller.hidePassword()
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      40.heightBox,
                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.mainPage);
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(AppColor.black),
                          fixedSize: WidgetStateProperty.all<Size>(
                            const Size(double.maxFinite, 60),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      10.heightBox,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Don\'t have an account? ',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                  color: AppColor.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Get.offAllNamed(Routes.signUpPage);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextField({
    required String name,
    required String hintText,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: AppColor.white,
        enabledBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        focusedErrorBorder: _buildOutlineInputBorder(),
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        focusColor: AppColor.white,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: const TextStyle(
          color: AppColor.grey,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}
