// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/app_button.dart';
import 'package:jala_verification/app/widgets/app_text_field.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  OrderView({super.key});

  final Document produk = Get.arguments;
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.state.value = 'detail';

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 28,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              color: primaryColor,
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
              ),
            ),
          ),
          title: Obx(
            () => Text(
              controller.state.value == 'detail'
                  ? 'Detail Produk'
                  : 'Pesanan Anda',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  child: Obx(
                    () => controller.state.value == 'detail'
                        ? _detailState()
                        : _orderState(),
                  ),
                ),
              ),
            ),
            _bottomWidget(context)
          ],
        ));
  }

  Column _detailState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gabung Sekarang',
          style: TextStyle(
            color: Color(0xFF182230),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Silakan pilih jumlah kuota yang ingin Anda tambahkan. Semakin banyak Anda berkontribusi, semakin besar potensi penghematan biaya!',
          style: TextStyle(
            color: Color(0xFF182230),
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Form(
          key: formKey,
          child: AppTextField(
            controller: totalController,
            hintText: 'Masukkan jumlah kuota',
            labelText: 'Masukkan jumlah kuota yang ingin anda isi',
            onChanged: (val) {
              controller.totalOrder.value = val;
            },
            validator: (text) {
              final int sisa =
                  produk.data['target_saldo'] - produk.data['saldo_sekarang'];
              if (int.parse(text ?? '0') > sisa) {
                return 'Maksimal jumlah kuota sekarang adalah ${StringUtil.price(sisa)}kg';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  Column _orderState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pesanan Anda',
          style: TextStyle(
            color: Color(0xFF182230),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                produk.data['name'],
                style: const TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '18.000',
                    style: TextStyle(
                      color: Color(0xFF182230),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'x30',
                    style: TextStyle(
                      color: Color(0xFF182230),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Text(
                '50.000',
                style: TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: borderColor,
          height: 32,
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Laco',
                style: TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Text(
                '50.000',
                style: TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Service Fee',
                style: TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Text(
                '10.000',
                style: TextStyle(
                  color: Color(0xFF182230),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: borderColor,
          height: 32,
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Total',
                style: TextStyle(
                    color: Color(0xFF182230),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Text(
                '65.000',
                style: TextStyle(
                    color: Color(0xFF182230),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _bottomWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 102,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Color(0xFFEFF4FF)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/provider.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 78,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'JALA memastikan keamanan transaksi Anda!',
                                      style: TextStyle(
                                        color: Color(0xFF182230),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Dana Anda hanya akan disalurkan ke pihak supplier setelah produk diterima sesuai dengan kesepakatan. Kepercayaan Anda, prioritas kami.',
                              style: TextStyle(
                                color: Color(0xFF344054),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
              .copyWith(bottom: 24),
          decoration: const BoxDecoration(
            color: whiteColor,
            border: Border(
              top: BorderSide(color: borderColor, width: 1),
            ),
          ),
          child: Obx(
            () => AppButtonWidget(
              onTap: () async {
                if (controller.state.value == 'detail') {
                  if (formKey.currentState!.validate()) {
                    controller.state.value = 'order';
                  }
                } else if (controller.state.value == 'order') {
                  // buy here
                  await controller.createPatungan(
                      orderId: produk.$id,
                      total: int.parse(totalController.text),
                      totalSekarang: produk.data['saldo_sekarang']);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Image.asset(
                                'assets/checkmark-circle.png',
                                width: 60,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Pembayaran Berhasil!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF182230),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Dana Anda telah berhasil kami terima dan disimpan sementara oleh sistem kami hingga produk atau jasa diterima. Anda dapat memantau status pengiriman di halaman detail.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF344054),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xFFF7F7F7),
                                ),
                                child: Column(
                                  children: [
                                    _invoiceDetail(
                                      context,
                                      title: 'Nominal',
                                      value: '650.000',
                                    ),
                                    const SizedBox(height: 10),
                                    _invoiceDetail(
                                      context,
                                      title: 'Waktu',
                                      value: '19 Oktober 2024, 10:30 WIB',
                                    ),
                                    const SizedBox(height: 10),
                                    _invoiceDetail(
                                      context,
                                      title: 'Nomor Referensi',
                                      value: 'TRX-12345678',
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: borderColor,
                                height: 32,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(20).copyWith(top: 0),
                                child: AppButtonWidget(
                                  text: 'Kembali ke Home',
                                  textSize: 16,
                                  fontWeight: FontWeight.w500,
                                  onTap: () {
                                    Get.offAllNamed(Routes.MAIN_PAGE);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              isDisabled: controller.totalOrder.value == '',
              text: controller.state.value == 'detail' ? 'Proses' : 'Bayar',
              textSize: 16,
              padding: const EdgeInsets.all(10),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _invoiceDetail(BuildContext context,
      {required String title, required String value}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
