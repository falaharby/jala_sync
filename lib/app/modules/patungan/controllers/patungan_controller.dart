import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';

class PatunganController extends GetxController {
  final BenurRepositories _benurRepositories;

  PatunganController(this._benurRepositories);

  RxList<Document> listBenur = <Document>[].obs;
  RxInt tabIndex = 0.obs;

  Future getBenur() async {
    listBenur.clear();
    await _benurRepositories.getListBenur().then((res) {
      listBenur.addAll(res.documents);
    });
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
