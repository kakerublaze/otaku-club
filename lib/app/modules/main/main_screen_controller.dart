import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/modules/anime/anime_screen.dart';
import 'package:otakuclub/app/modules/home/home_screen.dart';
import 'package:otakuclub/app/modules/manga/manga_screen.dart';

class MainScreenController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  List<Widget> tabs = [
    const HomeScreen(),
    const AnimeScreen(),
    const Center(
      child: Text(
        "Explore",
        style: TextStyle(
          color: AppColor.white,
        ),
      ),
    ),
    const MangaScreen(),
    const Center(
      child: Text(
        "Profile",
        style: TextStyle(
          color: AppColor.white,
        ),
      ),
    ),
  ];
}
