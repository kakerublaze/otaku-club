import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/constants/app_images.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/main/main_screen_controller.dart';

import '../../routes/app_pages.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: controller.key,
          extendBodyBehindAppBar: true,
          extendBody: true,
          // backgroundColor: AppColor.transparent,
          appBar: PreferredSize(
            preferredSize: Size(
              Get.width,
              60,
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: AppBar(
                  backgroundColor: AppColor.black.withOpacity(
                    0.8,
                  ),
                  elevation: 0.0,
                  // centerTitle: true,
                  title: controller.selectedIndex.value == 0
                      ? const Text('Home')
                      : controller.selectedIndex.value == 1
                          ? const Text('Anime')
                          : controller.selectedIndex.value == 2
                              ? const Text('Explore')
                              // : controller.selectedIndex.value == 3
                              //     ? const Text('Manga')
                              : const Text('Username'),
                  titleTextStyle: const TextStyle(
                    color: AppColor.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  actions: [
                    if (controller.selectedIndex.value != 2 &&
                        controller.selectedIndex.value != 3)
                      const Icon(
                        Icons.search,
                        weight: 800,
                        size: 24,
                        color: AppColor.white,
                      ),
                    20.widthBox,
                    controller.selectedIndex.value == 3
                        ? IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: AppColor.white,
                              size: 30,
                            ),
                            onPressed: () {
                              controller.key.currentState!.openEndDrawer();
                            },
                          )
                        : const ImageHelper(
                            imagePath: AppImages.chatIcon,
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                            color: AppColor.white,
                          ).onTap(
                            () {
                              // Chat Section Redirect
                            },
                          ),
                    10.widthBox,
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              controller.tabs[controller.selectedIndex.value],
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 80,
                        width: Get.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.black.withOpacity(0.7),
                              AppColor.black.withOpacity(0.7),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 1.5,
                            color: AppColor.black.withOpacity(0.9),
                          ),
                        ),
                        child: BottomNavigationBar(
                          onTap: (index) {
                            controller.selectedIndex.value = index;
                            controller.selectedIndex.refresh();
                          },
                          elevation: 0.0,
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: AppColor.white,
                          unselectedItemColor: AppColor.white,
                          selectedLabelStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                          selectedFontSize: 16,
                          unselectedFontSize: 16,
                          showSelectedLabels: true,
                          showUnselectedLabels: true,
                          currentIndex: controller.selectedIndex.value,
                          backgroundColor: Colors.transparent,
                          items: <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: controller.selectedIndex.value == 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.white30,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.homeSelected,
                                        width: 24,
                                        height: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.home,
                                        width: 24,
                                        height: 24,
                                        color: AppColor.white,
                                      ),
                                    ),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: controller.selectedIndex.value == 1
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.white30,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.animeSelected,
                                        width: 24,
                                        height: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.anime,
                                        width: 24,
                                        height: 24,
                                        color: AppColor.white,
                                      ),
                                    ),
                              label: 'Anime',
                            ),
                            BottomNavigationBarItem(
                              icon: controller.selectedIndex.value == 2
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.white30,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.exploreSelected,
                                        width: 24,
                                        height: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.explore,
                                        width: 24,
                                        height: 24,
                                        color: AppColor.white,
                                      ),
                                    ),
                              label: 'Explore',
                            ),
                            // Manga is Hide --> Remember to change index of given below tab
                            // BottomNavigationBarItem(
                            //   icon: controller.selectedIndex.value == 3
                            //       ? Container(
                            //           decoration: BoxDecoration(
                            //             color: AppColor.white30,
                            //             borderRadius: BorderRadius.circular(
                            //               30,
                            //             ),
                            //           ),
                            //           padding: const EdgeInsets.only(
                            //             top: 5,
                            //             bottom: 5,
                            //             right: 20,
                            //             left: 20,
                            //           ),
                            //           child: Image.asset(
                            //             AppImages.mangaSelected,
                            //             width: 24,
                            //             height: 24,
                            //             color: Colors.white,
                            //           ),
                            //         )
                            //       : Container(
                            //           padding: const EdgeInsets.only(
                            //             top: 5,
                            //             bottom: 5,
                            //             right: 20,
                            //             left: 20,
                            //           ),
                            //           child: Image.asset(
                            //             AppImages.manga,
                            //             width: 24,
                            //             height: 24,
                            //             color: AppColor.white,
                            //           ),
                            //         ),
                            //   label: 'Manga',
                            // ),
                            BottomNavigationBarItem(
                              icon: controller.selectedIndex.value == 3
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.white30,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.profileSelected,
                                        width: 24,
                                        height: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Image.asset(
                                        AppImages.profile,
                                        width: 24,
                                        height: 24,
                                        color: AppColor.white,
                                      ),
                                    ),
                              label: 'Profile',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          endDrawer: Drawer(
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: AppColor.grey),
                    accountName: Text(
                      "\nAbhishek Mishra",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text("abhishekm977@gmail.com"),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 165, 255, 137),
                      child: Text(
                        "A",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: AppColor.white,
                        ),
                      ), //Text
                    ), //circleAvatar
                  ), //UserAccountDrawerHeader
                ), //Dra
                // werHeader
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed(Routes.editProfile);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: AppColor.red,
                  ),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(
                      color: AppColor.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
