import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/airing_schedule_response_model.dart';
import 'package:otakuclub/app/global_widgets/days/schedule_days_names.dart';
import 'package:otakuclub/app/modules/airing_schedule/airing_schedule_controller..dart';

class AiringScheduleScreen extends StatelessWidget {
  const AiringScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AiringScheduleController(),
    );
    return DefaultTabController(
      length: controller.days.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Airing Schedule'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              color: Colors.transparent,
              child: TabBar(
                isScrollable: true, // allows scrolling if tabs are many
                indicatorColor:
                    Colors.transparent, // Remove the default indicator
                tabs:
                    controller.days.map((day) => buildCustomTab(day)).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: controller.days.map(
            (day) {
              List<AiringScheduleAnimeData> scheduleList =
                  controller.weeklySchedule[day] ?? [];

              return scheduleList.isNotEmpty
                  ? ListView.builder(
                      itemCount: scheduleList.length,
                      itemBuilder: (context, index) {
                        AiringScheduleAnimeData anime = scheduleList[index];
                        return ListTile(
                          title: Text(
                            anime.title?.english ??
                                anime.title?.native ??
                                anime.title?.romaji ??
                                anime.title?.userPreferred ??
                                'No Title',
                          ),
                          subtitle: Text(
                              'Airing at: ${anime.airingAt ?? 'Unknown Time'}'),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No schedule available for $day',
                      ),
                    );
            },
          ).toList(),
        ),
      ),
    );
  }
}
