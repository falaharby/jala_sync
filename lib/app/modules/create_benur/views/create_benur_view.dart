import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/app_button.dart';
import 'package:jala_verification/app/widgets/app_text_field.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

import '../controllers/create_benur_controller.dart';

class CreateBenurView extends GetView<CreateBenurController> {
  CreateBenurView({super.key});

  final TextEditingController targetController = TextEditingController();
  final TextEditingController tipeController = TextEditingController();
  final TextEditingController pakanController = TextEditingController();
  final TextEditingController benurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Buat Patungan'),
          // centerTitle: false,
          ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Buat Patungan',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _pilihType(),
                      controller.type.value == 'pakan'
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  children: [
                                    _pilihPakan(),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Obx(() {
                                      if (controller.selectedPakanId.value !=
                                          '') {
                                        final data = controller.listProductPakan
                                            .where((e) =>
                                                e['id'].toString() ==
                                                controller
                                                    .selectedPakanId.value)
                                            .firstOrNull;
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 16),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              _infoField(
                                                'Kode Produk',
                                                data['product_code'],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              _infoField(
                                                'Nama Vendor',
                                                data['vendor_name'],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              _infoField(
                                                'Kode Vendor',
                                                data['vendor_code'],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              _infoField(
                                                'Package',
                                                data['package'],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              _infoField(
                                                'Net Price',
                                                "Rp${StringUtil.price(data['net_price'])}",
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return const SizedBox(
                                        height: 8,
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(
                              height: 16,
                            ),
                      controller.type.value == 'benur'
                          ? Column(
                              children: [
                                _pilihBenur(),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      AppTextField(
                        controller: targetController,
                        hintText: 'Masukkan target terkumpul',
                        labelText: 'Target Terkumpul',
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Periode',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              var results = await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(
                                  calendarType: CalendarDatePicker2Type.range,
                                ),
                                dialogSize: const Size(325, 400),
                                value: [
                                  controller.startDate.value != ''
                                      ? DateTime.parse(
                                          controller.startDate.value)
                                      : null,
                                  controller.endDate.value != ''
                                      ? DateTime.parse(controller.endDate.value)
                                      : null,
                                ],
                                borderRadius: BorderRadius.circular(15),
                              );
                              controller.startDate.value =
                                  (results?.first).toString();
                              controller.endDate.value =
                                  (results?.last).toString();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: borderColor,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.startDate.value != ''
                                          ? '${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(controller.startDate.value))} - ${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(controller.endDate.value))}'
                                          : 'Masukkan periode',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              controller.startDate.value != ''
                                                  ? blackColor
                                                  : hintColor),
                                    ),
                                  ),
                                  const Icon(
                                    IconlyLight.calendar,
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
            child: AppButtonWidget(
              onTap: () async {
                await controller.createPatunganPakan(int.parse(targetController.text));
                Get.offAllNamed(Routes.MAIN_PAGE);
              },
              text: 'Simpan',
              textSize: 16,
              padding: const EdgeInsets.all(10),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Row _infoField(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ":",
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            subtitle,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Column _pilihType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tipe Produk',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: DropdownMenu<String>(
            controller: tipeController,
            requestFocusOnTap: true,
            enableFilter: true,
            hintText: "Pilih tipe produk",
            expandedInsets: EdgeInsets.zero,
            onSelected: (String? value) {
              controller.type.value = value ?? '';
            },
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              filled: true,
              fillColor: whiteColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints.tight(const Size.fromHeight(40)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: borderColor,
                    width: 1.0,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: borderColor,
                    width: 1.0,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  )),
            ),
            dropdownMenuEntries: [
              {
                'type': 'pakan',
              },
              {
                'type': 'benur',
              },
              {
                'type': 'panen',
              }
            ].map<DropdownMenuEntry<String>>((value) {
              return DropdownMenuEntry<String>(
                value: value['type'].toString(),
                label:
                    toBeginningOfSentenceCase(value['type'] ?? '').toString(),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Column _pilihPakan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pakan',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => SizedBox(
            height: 40,
            child: DropdownMenu<String>(
              controller: pakanController,
              requestFocusOnTap: true,
              enableFilter: true,
              hintText: "Pilih Pakan",
              expandedInsets: EdgeInsets.zero,
              onSelected: (String? value) {
                controller.selectedPakanId.value = value ?? '';
              },
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                filled: true,
                fillColor: whiteColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 1.0,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 1.0,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )),
              ),
              enableSearch: true,
              // searchCallback: ,
              menuHeight: 500,
              dropdownMenuEntries: controller.listProductPakan
                  .where((e) =>
                      e['product_name'].contains(controller.queryPakan.value))
                  .map<DropdownMenuEntry<String>>((value) {
                return DropdownMenuEntry<String>(
                    value: value['id'].toString(),
                    label: value['product_name'],
                    trailingIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rp${StringUtil.price(value['net_price'])}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          value['package'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                    labelWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value['product_name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Wrap(
                          children: [
                            Text(
                              value['vendor_name'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: subtitleColor,
                              ),
                            ),
                            Text(
                              ' - ' + value['area_gudang'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: subtitleColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Column _pilihBenur() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Benur',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => SizedBox(
            height: 40,
            child: DropdownMenu<String>(
              controller: benurController,
              requestFocusOnTap: true,
              enableFilter: true,
              hintText: "Pilih Benur",
              expandedInsets: EdgeInsets.zero,
              onSelected: (String? value) {},
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                filled: true,
                fillColor: whiteColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 1.0,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 1.0,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )),
              ),
              enableSearch: true,
              // searchCallback: ,
              searchCallback: (entries, query) {},
              menuHeight: 500,
              dropdownMenuEntries: controller.listProductBenur
                  .where((e) =>
                      e['fry_brand'].contains(controller.queryBenur.value))
                  .map<DropdownMenuEntry<String>>((value) {
                return DropdownMenuEntry<String>(
                    value: value['id'].toString(),
                    label: value['fry_brand'],
                    labelWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value['fry_brand'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          value['vendor_name'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
