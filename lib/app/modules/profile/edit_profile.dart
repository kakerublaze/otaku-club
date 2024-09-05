import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/modules/profile/profile_screen_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          weight: 800,
          color: AppColor.white,
        ).onTap(
          () {
            Get.back();
          },
        ),
        centerTitle: false,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColor.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            GestureDetector(
              onTap: () {
                controller.pickImage();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
                child: const Icon(
                  Icons.image,
                  size: 40,
                ),
              ),
            ),
            40.heightBox,
            buildTextField(
              hintText: 'Enter Full Name',
              name: 'name',
            ),
            10.heightBox,
            buildTextField(
              hintText: 'Enter Username',
              name: 'name',
            ),
            10.heightBox,
            buildTextField(
              hintText: 'Enter email',
              name: 'name',
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          fixedSize: WidgetStateProperty.all<Size>(
            const Size(double.maxFinite, 50),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField({
    required String name,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      style: const TextStyle(
        color: AppColor.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: keyboardType,
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
        hintStyle: const TextStyle(
          color: AppColor.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColor.white),
    );
  }
}
