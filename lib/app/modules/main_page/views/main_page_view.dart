import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:jala_verification/app/modules/create_benur/views/create_benur_view.dart';
import 'package:jala_verification/app/modules/home/views/home_view.dart';
import 'package:jala_verification/app/modules/patungan/views/patungan_view.dart';
import 'package:jala_verification/app/modules/profile/views/profile_view.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Obx(
            () => ProsteIndexedStack(
              index: controller.pageIndex.value,
              children: [
                IndexedStackChild(
                  child: HomeView(),
                ),
                IndexedStackChild(
                  child: const PatunganView(),
                ),
                IndexedStackChild(
                  child: const SizedBox(),
                ),
                IndexedStackChild(
                  child: const SizedBox(),
                ),
                IndexedStackChild(
                  child: ProfileView(),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: borderColor))),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bottomBarItem(
                        title: 'Home',
                        icons: Icons.home,
                        index: 0,
                        selected: controller.pageIndex.value == 0,
                      ),
                      bottomBarItem(
                        title: 'Patungan',
                        icons: Icons.workspaces_rounded,
                        index: 1,
                        selected: controller.pageIndex.value == 1,
                      ),
                      const Expanded(child: SizedBox()),
                      bottomBarItem(
                        title: 'Riwayat',
                        icons: Icons.history_edu_outlined,
                        index: 3,
                        selected: controller.pageIndex.value == 3,
                      ),
                      bottomBarItem(
                        title: 'Profile',
                        icons: Icons.person,
                        index: 4,
                        selected: controller.pageIndex.value == 4,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -15,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CREATE_BENUR);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Expanded bottomBarItem(
      {required String title, required IconData icons, required int index, bool selected = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.pageIndex.value = index;
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(
                icons,
                color: selected ? primaryColor : greyIconColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style:  TextStyle(
                  fontSize: 12,
                  color: selected ? primaryColor : blackColor,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
