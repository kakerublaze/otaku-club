import 'package:get/get.dart';
import 'package:otakuclub/app/modules/anime/anime_screen.dart';
import 'package:otakuclub/app/modules/anime/anime_screen_binding.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_binding.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_screen.dart';
import 'package:otakuclub/app/modules/home/home_screen.dart';
import 'package:otakuclub/app/modules/home/home_screen_binding.dart';
import 'package:otakuclub/app/modules/main/main_screen.dart';
import 'package:otakuclub/app/modules/main/main_screen_binding.dart';
import 'package:otakuclub/app/modules/manga/manga_screen.dart';
import 'package:otakuclub/app/modules/manga/manga_screen_binding.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.mainPage,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.animeScreen,
      page: () => const AnimeScreen(),
      binding: AnimeBinding(),
    ),
    GetPage(
      name: Routes.mangaScreen,
      page: () => const MangaScreen(),
      binding: MangaBinding(),
    ),
    GetPage(
      name: Routes.animeDetailsScreen,
      page: () => const AnimeDetailsPage(),
      binding: AnimeDetailsPageBinding(),
    ),
  ];
}
