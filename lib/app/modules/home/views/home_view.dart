import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/widgets/app_badge.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      //   actions: [
      //     GestureDetector(
      //       onTap: () async {
      //         try {
      //           await controller.logout();
      //           Get.offAllNamed(Routes.LOGIN);
      //         } catch (e) {
      //           print(e);
      //         }
      //       },
      //       child: const Padding(
      //         padding: const EdgeInsets.all(12.0),
      //         child: Icon(
      //           Icons.logout,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(
              height: 100,
            ),
            const Text('Pesanan Kamu'),
          ],
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
          bottom: -75,
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
      ],
    );
  }
}
