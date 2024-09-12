import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/modules/anime/anime_screen.dart';
import 'package:otakuclub/app/modules/explore/explore_screen.dart';
import 'package:otakuclub/app/modules/home/home_screen.dart';
import 'package:otakuclub/app/modules/news/news_list/news_screen.dart';

import '../profile/profile_screen.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  Rx<int> selectedIndex = 0.obs;
  List<Widget> tabs = [
    const HomeScreen(),
    const AnimeScreen(),
    const ExploreScreen(),
    const NewsScreen(),
    const ProfileScreen(),
    // const MangaScreen(),
  ];
}
