// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class DownloadAnimeController extends GetxController {
//   WebViewController controller = WebViewController();
//   Map<String, dynamic> getArguments = {};

//   @override
//   void onInit() {
//     getArguments = Get.arguments;
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onNavigationRequest: (NavigationRequest request) async {
//             // Handle unknown URL schemes or other redirects
//             if (request.url.startsWith('http')) {
//               return NavigationDecision.navigate;
//             } else {
//               // If it's not a standard HTTP/HTTPS URL, try launching in external browser
//               if (await canLaunchUrl(
//                 Uri.parse(
//                   request.url,
//                 ),
//               )) {
//                 await launchUrl(
//                   Uri.parse(
//                     request.url,
//                   ),
//                 );
//                 return NavigationDecision.prevent;
//               } else {
//                 // If URL can't be launched, prevent navigation
//                 return NavigationDecision.prevent;
//               }
//             }
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Page finished loading: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('Page resource error: ${error.description}');
//           },
//           onHttpError: (HttpResponseError error) {
//             debugPrint('HTTP error: ${error.response}');
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(getArguments['url']));

//     super.onInit();
//   }
// }
