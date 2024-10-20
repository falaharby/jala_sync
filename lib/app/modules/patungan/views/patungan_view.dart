import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/list_patungan.dart';

import '../controllers/patungan_controller.dart';

class PatunganView extends GetView<PatunganController> {
  const PatunganView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.getBenur();
    controller.getPakan();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    tabMenu(
                        title: 'Benur',
                        selected: controller.tabIndex.value == 0,
                        index: 0),
                    tabMenu(
                        title: 'Pakan',
                        selected: controller.tabIndex.value == 1,
                        index: 1),
                    tabMenu(
                        title: 'Panen',
                        selected: controller.tabIndex.value == 2,
                        index: 2),
                  ],
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (controller.tabIndex.value == 0
                        ? controller.listBenur
                        : controller.tabIndex.value == 1
                            ? controller.listPakan
                            : [])
                    .length,
                itemBuilder: (context, index) {
                  final list = (controller.tabIndex.value == 0
                      ? controller.listBenur
                      : controller.tabIndex.value == 1
                          ? controller.listPakan
                          : []);
                  return ListPatungan(
                    name: list[index].data['name'],
                    targetSaldo: list[index].data['target_saldo'],
                    saldoSekarang: list[index].data['saldo_sekarang'],
                    lokasi: list[index].data['location'],
                    sisaHari: StringUtil.daysBetween(
                      DateTime.parse(list[index].data['start_date']),
                      DateTime.parse(list[index].data['end_date']),
                    ).toString(),
                    onTap: () {
                      Get.toNamed(Routes.BENUR,
                          arguments: list[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded tabMenu(
      {bool selected = false, required String title, required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.tabIndex.value = index;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: selected ? primaryColor : borderColor, width: 2)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: selected ? primaryColor : blackColor),
            ),
          ),
        ),
      ),
    );
  }

  Stack _header(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/header.png'),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).viewPadding.top,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'LO',
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // the '2023' part
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(bottom: 24),
                child: const Text(
                  'Cari Patungan',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 24, right: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 18.20,
                              offset: Offset(0, 9),
                              spreadRadius: 0,
                            )
                          ]),
                      child: TextField(
                        controller: searchController,
                        cursorHeight: 18,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.search,
                          ),
                          hintText: 'Cari disini..',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: hintColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 1.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 1.0,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 24),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 18.20,
                            offset: Offset(0, 9),
                            spreadRadius: 0,
                          )
                        ]),
                    child: const Icon(IconlyLight.filter),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
