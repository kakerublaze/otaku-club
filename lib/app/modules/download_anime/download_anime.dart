// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:marquee/marquee.dart';
// import 'package:otakuclub/app/core/constants/app_colors.dart';
// import 'package:otakuclub/app/core/utils/extensions.dart';
// import 'package:otakuclub/app/modules/download_anime/download_anime_controller.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class DownloadAnimePage extends StatelessWidget {
//   const DownloadAnimePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(
//       DownloadAnimeController(),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(
//           Icons.arrow_back_ios,
//           size: 24,
//           weight: 800,
//           color: AppColor.white,
//         ).onTap(
//           () {
//             Get.back();
//           },
//         ).paddingOnly(
//           left: 10,
//         ),
//         centerTitle: false,
//         leadingWidth: 20,
//         title: SizedBox(
//           // width: Get.width * 0.7,
//           height: 30,
//           child: Marquee(
//             text: controller.getArguments['name'],
//             style: const TextStyle(
//               color: AppColor.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w800,
//             ),
//             scrollAxis: Axis.horizontal,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             blankSpace: 20.0,
//             velocity: 100.0,
//             pauseAfterRound: const Duration(seconds: 1),
//             startPadding: 10.0,
//             decelerationDuration: const Duration(milliseconds: 500),
//             decelerationCurve: Curves.easeOut,
//           ),
//         ),
//         actions: [
//           const Icon(
//             Icons.share,
//             size: 24,
//             weight: 800,
//             color: AppColor.white,
//           ),
//           20.widthBox,
//         ],
//       ),
//       body: WebViewWidget(
//         controller: controller.controller,
//       ),
//     );
//   }
// }
