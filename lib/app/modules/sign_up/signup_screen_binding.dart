import 'signup_screen_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupScreenController>(
      () => SignupScreenController(),
    );
  }
}
