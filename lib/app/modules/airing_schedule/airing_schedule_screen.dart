import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: AppColor.white,
          weight: 800,
        ),
        leadingWidth: 60,
        titleSpacing: 0,
        title: const Text(
          'Airing Schedule',
          style: TextStyle(
            color: AppColor.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
          ),
          20.heightBox,
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: controller.days.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        controller.days[index].toUpperCase().substring(0, 3),
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      const Text(
                        "DAY",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    DefaultTabController(
      length: controller.days.length,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            weight: 800,
            color: AppColor.white,
          ).onTap(
            () {
              Get.back();
            },
          ),
          leadingWidth: 60,
          titleSpacing: 0,
          title: const Text(
            'Airing Schedule',
            style: TextStyle(
              color: AppColor.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(
              Get.width,
              100,
            ),
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: GetBuilder<AiringScheduleController>(
                builder: (_) {
                  return Obx(
                    () {
                      return TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        indicatorColor: Colors.transparent,
                        labelPadding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        onTap: (value) {
                          controller.selectedTabIndex.value = value;
                        },
                        tabs: List.generate(
                          controller.days.length,
                          (index) => buildCustomTab(
                            controller.days[index],
                            controller.selectedTabIndex.value == index,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          elevation: 0,
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
