import 'package:otakuclub/app/modules/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreenController>(
      () => ProfileScreenController(),
    );
  }
}
