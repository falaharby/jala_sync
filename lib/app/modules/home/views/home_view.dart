import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_verification/app/modules/home/views/webview_home.dart';
import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/app_badge.dart';
import 'package:jala_verification/app/widgets/list_patungan.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final patungan = Get.find<PatunganController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          patungan.getBenur();
          patungan.getPakan();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Riwayat Pembelian',
                      style: TextStyle(
                        color: Color(0xFF2A2A2A),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 18.20,
                              offset: Offset(0, 9),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                color: const Color(0xFFD9D9D9),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ORD123891283',
                                    style: TextStyle(
                                        color: Color(0xFF304FFE),
                                        fontSize: 12,
                                        height: 1.2),
                                  ),
                                  Text(
                                    'Nama Pesanan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Rp 25.000',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              )),
                              const SizedBox(
                                width: 12,
                              ),
                              AppBadge(
                                text: 'Aktif',
                                color: successGreen[500],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(24).copyWith(top: 0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Patungan Terbaru',
                        style: TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      patungan.listPakan.isNotEmpty
                          ? ListPatungan(
                              tipe: 'pakan',
                              name: patungan.listPakan.last.data['name'],
                              targetSaldo:
                                  patungan.listPakan.last.data['target_saldo'],
                              saldoSekarang: patungan
                                  .listPakan.last.data['saldo_sekarang'],
                              lokasi: patungan.listPakan.last.data['location'],
                              sisaHari: StringUtil.daysBetween(
                                DateTime.parse(
                                    patungan.listPakan.last.data['start_date']),
                                DateTime.parse(
                                    patungan.listPakan.last.data['end_date']),
                              ).toString(),
                              onTap: () {
                                Get.toNamed(
                                  Routes.BENUR,
                                  arguments: patungan.listPakan.last,
                                );
                              },
                            )
                          : const SizedBox(),
                      patungan.listBenur.isNotEmpty
                          ? ListPatungan(
                              tipe: 'benur',
                              name: patungan.listBenur.last.data['name'],
                              targetSaldo:
                                  patungan.listBenur.last.data['target_saldo'],
                              saldoSekarang: patungan
                                  .listBenur.last.data['saldo_sekarang'],
                              lokasi: patungan.listBenur.last.data['location'],
                              sisaHari: StringUtil.daysBetween(
                                DateTime.parse(
                                    patungan.listBenur.last.data['start_date']),
                                DateTime.parse(
                                    patungan.listBenur.last.data['end_date']),
                              ).toString(),
                              onTap: () {
                                Get.toNamed(
                                  Routes.BENUR,
                                  arguments: patungan.listBenur.last,
                                );
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _header(BuildContext context) {
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
                  'JL',
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      style: const ButtonStyle(
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // the '2023' part
                      ),
                      onPressed: () {
                        patungan.getBenur();
                        patungan.getPakan();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(width: 16,),
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
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -120,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(bottom: 24),
                child: const Text(
                  'Riwayat Pesanan',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => WebviewHome());
                },
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset(
                    'assets/herocard.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
