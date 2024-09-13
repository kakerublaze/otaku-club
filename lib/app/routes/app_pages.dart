import 'package:get/get.dart';
import 'package:otakuclub/app/modules/airing_schedule/airing_schedule_binding.dart';
import 'package:otakuclub/app/modules/airing_schedule/airing_schedule_screen.dart';
import 'package:otakuclub/app/modules/anime/anime_screen.dart';
import 'package:otakuclub/app/modules/anime/anime_screen_binding.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_binding.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_screen.dart';
import 'package:otakuclub/app/modules/explore/explore_list/explore_list_binding.dart';
import 'package:otakuclub/app/modules/explore/explore_list/explore_list_screen.dart';
// import 'package:otakuclub/app/modules/download_anime/download_anime.dart';
import 'package:otakuclub/app/modules/explore/explore_screen.dart';
import 'package:otakuclub/app/modules/explore/explore_screen_binding.dart';
import 'package:otakuclub/app/modules/home/home_screen.dart';
import 'package:otakuclub/app/modules/home/home_screen_binding.dart';
import 'package:otakuclub/app/modules/login/login_screen.dart';
import 'package:otakuclub/app/modules/login/login_screen_binding.dart';
import 'package:otakuclub/app/modules/main/main_screen.dart';
import 'package:otakuclub/app/modules/main/main_screen_binding.dart';
import 'package:otakuclub/app/modules/manga/manga_screen.dart';
import 'package:otakuclub/app/modules/manga/manga_screen_binding.dart';
import 'package:otakuclub/app/modules/news/news_details/news_details_binding.dart';
import 'package:otakuclub/app/modules/news/news_details/news_details_screen.dart';
import 'package:otakuclub/app/modules/profile/profile_screen_binding.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:otakuclub/app/modules/video_player/video_player_binding.dart';
import 'package:otakuclub/app/modules/video_player/video_player_screen.dart';

import '../modules/profile/edit_profile.dart';
import '../modules/profile/profile_screen.dart';
import '../modules/sign_up/signup_screen.dart';
import '../modules/sign_up/signup_screen_binding.dart';

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
    GetPage(
      name: Routes.videoPlayer,
      page: () => const VideoPlayerScreen(),
      binding: VideoPlayerBinding(),
    ),
    // GetPage(
    //   name: Routes.downloadAnime,
    //   page: () => const DownloadAnimePage(),
    //   binding: VideoPlayerBinding(),
    // ),
    GetPage(
      name: Routes.explore,
      page: () => const ExploreScreen(),
      binding: ExploreBindings(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.exploreList,
      page: () => const ExploreListScreen(),
      binding: ExploreListBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.newsDetails,
      page: () => const NewsDetailsScreen(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: Routes.airingSchedule,
      page: () => const AiringScheduleScreen(),
      binding: AiringScheduleBinding(),
    ),
  ];
}
