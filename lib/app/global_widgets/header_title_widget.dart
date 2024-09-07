import 'package:flutter/material.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';

Widget getHeaderWidget({
  String? title,
  VoidCallback? onTap,
  bool? showArrow,
  double? fontSize,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title ?? '',
        style: TextStyle(
          color: AppColor.white,
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      if (showArrow ?? true)
        const Icon(
          Icons.arrow_forward,
          size: 26,
          color: AppColor.white,
          weight: 800,
        ).onTap(
          () {
            if (onTap != null) {
              onTap(); // This invokes the onTap callback
            }
          },
        ),
    ],
  );
}
