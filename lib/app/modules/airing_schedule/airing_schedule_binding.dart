import 'package:get/get.dart';
import 'package:otakuclub/app/modules/airing_schedule/airing_schedule_controller..dart';

class AiringScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiringScheduleController>(
      () => AiringScheduleController(),
    );
  }
}
