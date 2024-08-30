import 'package:flutter/material.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';

Widget getHeaderWidget({
  String? title,
  VoidCallback? onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title ?? '',
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      const Icon(
        Icons.arrow_forward,
        size: 26,
        color: AppColor.white,
      ).onTap(
        () {
          onTap;
        },
      ),
    ],
  );
}
