import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

class OrderController extends GetxController {
  final AuthRepositories _authRepositories;
  final PatunganRepositories _patunganRepositories;
  final PakanRepositories _pakanRepositories;
  final BenurRepositories _benurRepositories;

  OrderController(this._authRepositories, this._patunganRepositories, this._pakanRepositories,this._benurRepositories);

  RxString state = 'detail'.obs; // detail or order
  RxString totalOrder = ''.obs;

  RxList listProductBenur = [].obs;
  RxList listProductPakan = [].obs;


  Future createPatungan({required String orderId, required int total, required int totalSekarang, required String tipe}) async {
    final acc = await _authRepositories.getAccount();
    final res = await _patunganRepositories.createPatungan(
      userId: acc.$id,
      orderId: orderId,
      userName: acc.name,
      total: total,
      tipe: tipe,
    ).then((_) async {
      if(tipe == 'pakan') {
        await _pakanRepositories.updateOrderPakan(orderId: orderId, saldoSekarang: total + totalSekarang);
      } else {
         await _benurRepositories.updateOrderBenur(orderId: orderId, saldoSekarang: total + totalSekarang);
      }
    });
    return res;
  }


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
