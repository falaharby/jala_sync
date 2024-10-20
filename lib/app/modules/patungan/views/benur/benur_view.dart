import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/app_badge.dart';
import 'package:jala_verification/app/widgets/app_button.dart';
import 'package:jala_verification/app/widgets/participant_widget.dart';

class BenurView extends StatelessWidget {
  BenurView({super.key});

  final Document benur = Get.arguments;
  final controller = Get.find<PatunganController>();

  @override
  Widget build(BuildContext context) {
    controller.getPartisipan(benur.$id);

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
        title: const Text(
          'Detail Produk',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 246,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFD9D9D9),
                  ),
                  _content(context)
                ],
              ),
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD0D0D0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(
                    IconlyLight.call,
                    size: 20,
                    color: Color.fromARGB(255, 116, 116, 116),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: AppButtonWidget(
                    onTap: () {
                      Get.toNamed(Routes.ORDER, arguments: benur);
                    },
                    text: 'Gabung',
                    textSize: 16,
                    padding: const EdgeInsets.all(10),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerContent(),
            _creator(),
            _rule(),
            _partisipan(),
          ],
        ),
      ),
    );
  }

  Padding _partisipan() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Partisipan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(
            () => Column(
                children: controller.listParticipant
                    .map((e) => ParticipantWidget(
                          name: e.data['user_name'] ?? '',
                          location: benur.data['location'],
                          total: e.data['total'],
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Column _rule() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Persyaratan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '1. Pengambilan Franco wajib minimum 10 ton. Franco merupakan syarat dalam penyerahan barang dimana harga ditentukan berdasarkan perhitungan bahwa semua ongkos meliputi kondisi barang hingga sampai di lokasi tujuan yang ditanggung oleh pihak penjual.\n2. Dibawah pengambilan 10 ton wajin mengambil Loco. Loco adalah ketentuan dalam transaksi perdagangan yang menunjukkan bahwa tanggung jawab penjual hanya sampai pada titik tertentu, biasanya di gudang atau tempat penyimpanan penjual. biaya ongkir ditanggung oleh pembeli (ongkir kurang lebih 8 jt)',
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }

  Column _headerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBadge(
          text: 'Terverifikasi',
          color: Color(0xFFEAEBFF),
          textColor: primaryColor,
        ),
        const SizedBox(height: 4),
        Text(
          benur.data['name'] ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${StringUtil.price(benur.data['saldo_sekarang'] ?? 0)}kg',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'kuota terpenuhi dari ${StringUtil.price(benur.data['target_saldo'] ?? 0)}kg',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF898989),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: (benur.data['saldo_sekarang'] ?? 0) /
              (benur.data['target_saldo'] ?? 0),
          borderRadius: BorderRadius.circular(24),
          backgroundColor: secondaryColor,
          color: primaryColor,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Periode',
              style: TextStyle(
                color: Color(0xFF5A5A5A),
                fontSize: 12,
              ),
            ),
            Text(
              '${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(benur.data['start_date']))} - ${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(benur.data['end_date']))}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Area',
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Jawa',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harga',
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Rp${StringUtil.price(0)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Package',
                    style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '25kg',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _creator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/jala.png',
            width: 42,
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JALA Tech',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Creator',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
