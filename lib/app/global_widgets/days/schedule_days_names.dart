import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';

Widget buildCustomTab(
  String day,
  bool selected,
) {
  // Split the day into two parts: e.g., "MON" and "DAY"
  String upperPart = day.substring(0, 3).toUpperCase();
  String lowerPart = "DAY";

  return Container(
    width: 80,
    height: 80,
    margin: const EdgeInsets.only(
      bottom: 15,
    ),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      border: Border.all(
        color: selected ? AppColor.blue : AppColor.white,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          upperPart,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        5.heightBox,
        const Divider(
          height: 1,
        ),
        5.heightBox,
        Text(
          lowerPart,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ],
    ),
  ).paddingOnly(
    left: day == 'Monday' ? 0 : 10,
    right: 10,
  );
}
