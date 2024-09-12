import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
// import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/themes/app_theme.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/dependecy_injector.dart';
import 'package:otakuclub/app/routes/app_pages.dart';
// import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector.init();

  // final os = await DeviceInfoPlugin().androidInfo;
  // final sdkVer = os.version.sdkInt;

  // Permission access;

  // if (sdkVer > 32) {
  //   access = Permission.videos;
  // } else {
  //   access = Permission.storage;
  // }
  // final storageStatus = await access.request();
  // final notificationStatus = await Permission.notification.request();
  // if (storageStatus.isGranted) {
  //   debugPrint('Storage Permission granted');
  // } else if (storageStatus.isDenied) {
  //   debugPrint('Permission denied');
  //   await Permission.storage.request();
  // } else if (storageStatus.isPermanentlyDenied) {
  //   debugPrint('Permission permanently denied');
  //   Get.showSnackbar(
  //     const GetSnackBar(
  //       message: 'Give Storage Permission',
  //       backgroundColor: AppColor.red,
  //     ),
  //   );
  //   await openAppSettings();
  // }

  // if (notificationStatus.isGranted) {
  //   debugPrint('Notification Permission granted');
  // } else if (notificationStatus.isDenied) {
  //   debugPrint('Permission denied');
  //   await Permission.storage.request();
  // } else if (notificationStatus.isPermanentlyDenied) {
  //   debugPrint('Permission permanently denied');
  //   Get.showSnackbar(
  //     const GetSnackBar(
  //       message: 'Give Notification Permission',
  //       backgroundColor: AppColor.red,
  //     ),
  //   );
  //   await openAppSettings();
  // }
  // await FlutterDownloader.initialize();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const MyApp().onTap(
      () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Otaku Club',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(
              1.0,
            ),
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
