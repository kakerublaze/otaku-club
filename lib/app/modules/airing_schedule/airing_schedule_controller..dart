import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:otakuclub/app/data/models/airing_schedule_response_model.dart';

class AiringScheduleController extends GetxController {
  Map<String, dynamic> getArgs = {};
  Map<String, List<AiringScheduleAnimeData>> weeklySchedule = {};
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  var selectedTabIndex = 0.obs;
  Map<String, List<AiringScheduleAnimeData>> groupByWeekday(
      List<AiringScheduleAnimeData> schedules) {
    Map<String, List<AiringScheduleAnimeData>> weeklySchedule = {
      'Monday': [],
      'Tuesday': [],
      'Wednesday': [],
      'Thursday': [],
      'Friday': [],
      'Saturday': [],
      'Sunday': [],
    };

    for (AiringScheduleAnimeData schedule in schedules) {
      String weekday = DateFormat('EEEE').format(
        schedule.airingAt ?? DateTime.now(),
      );
      if (weeklySchedule.containsKey(weekday)) {
        weeklySchedule[weekday]!.add(schedule);
      }
    }

    return weeklySchedule;
  }

  @override
  void onInit() {
    getArgs = Get.arguments;
    weeklySchedule = groupByWeekday(
      getArgs['airingDataList'],
    );
    super.onInit();
  }
}
