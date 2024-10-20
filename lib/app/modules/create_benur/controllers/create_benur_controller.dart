import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

class CreateBenurController extends GetxController {
  RxString type = ''.obs;
  RxList listProductBenur = [].obs;
  RxList listProductPakan = [].obs;
  RxString selectedPakanId = ''.obs;
  RxString selectedBenurId = ''.obs;
  RxString queryBenur = ''.obs;
  RxString queryPakan = ''.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;

  final AuthRepositories _authRepositories;
  final PatunganRepositories _patunganRepositories;
  final PakanRepositories _pakanRepositories;
  final BenurRepositories _benurRepositories;

  CreateBenurController(this._authRepositories, this._patunganRepositories,
      this._pakanRepositories, this._benurRepositories);

  Future getListProductBenur() async {
    listProductBenur.clear();
    final String response = await rootBundle.loadString('assets/benur.json');
    final data = await json.decode(response);
    listProductBenur.addAll(data['data_benur']);
  }

  Future getListProductPakan() async {
    listProductBenur.clear();
    final String response = await rootBundle.loadString('assets/pakan.json');
    final data = await json.decode(response);
    listProductPakan.addAll(data['pakan']);
  }

  Future createPatunganPakan(int target) async {
    final sess = await _authRepositories.cachedSession;
    final selectedPakan = listProductPakan
        .where((e) => e['id'].toString() == selectedPakanId.value)
        .firstOrNull;
    _pakanRepositories
        .createOrderPakan(
      creatorId: sess?.$id ?? '',
      location: selectedPakan['area_gudang'],
      productName: selectedPakan['product_name'],
      startDate: startDate.value,
      endDate: endDate.value,
      saldoSekarang: 0,
      targetSaldo: target,
    )
        .then((res) {
      // _patunganRepositories.createPatungan(
      //   userId: sess?.$id ?? '',
      //   orderId: res.$id,
      //   userName: sess?.clientName ?? '',
      //   total: 0,
      // );
    });
  }


  Future createPatunganBenur(int target) async {
    final sess = await _authRepositories.cachedSession;
    final selectedBenur = listProductBenur
        .where((e) => e['id'].toString() == selectedBenurId.value)
        .firstOrNull;
    
        _benurRepositories.createOrderBenur(
      creatorId: sess?.$id ?? '',
      location: 'Jawa',
      productName: selectedBenur['fry_brand'],
      startDate: startDate.value,
      endDate: endDate.value,
      saldoSekarang: 0,
      targetSaldo: target,
    );
  }


  @override
  void onInit() {
    getListProductBenur();
    getListProductPakan();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
