import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

class OrderController extends GetxController {
  final AuthRepositories _authRepositories;
  final PatunganRepositories _patunganRepositories;
  final PakanRepositories _pakanRepositories;

  OrderController(this._authRepositories, this._patunganRepositories, this._pakanRepositories);

  RxString state = 'detail'.obs; // detail or order
  RxString totalOrder = ''.obs;


  Future createPatungan({required String orderId, required int total, required int totalSekarang}) async {
    final acc = await _authRepositories.getAccount();
    final res = await _patunganRepositories.createPatungan(
      userId: acc.$id,
      orderId: orderId,
      userName: acc.name,
      total: total,
    ).then((_) async {
      await _pakanRepositories.updateOrderPakan(orderId: orderId, saldoSekarang: total + totalSekarang);
    });
    return res;
  }


  @override
  void onInit() {
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
