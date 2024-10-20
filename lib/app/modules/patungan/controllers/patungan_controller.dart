import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

class PatunganController extends GetxController {
  final BenurRepositories _benurRepositories;
  final PakanRepositories _pakanRepositories;
  final PatunganRepositories _patunganRepositories;
  final AuthRepositories _authRepositories;

  PatunganController(this._benurRepositories,
      this._pakanRepositories, this._patunganRepositories, this._authRepositories);

  RxList<Document> listBenur = <Document>[].obs;
  RxList<Document> listPakan = <Document>[].obs;
  RxInt tabIndex = 0.obs;
  RxList<Document> listParticipant = <Document>[].obs;

  Future getBenur() async {
    listBenur.clear();
    await _benurRepositories.getListBenur().then((res) {
      listBenur.addAll(res.documents);
    });
  }

  Future getPakan() async {
    listPakan.clear();
    await _pakanRepositories.getListPakan().then((res) {
      listPakan.addAll(res.documents);
    });
  }

  Future getPartisipan(String orderId) async {
    listParticipant.clear();
    await _patunganRepositories.getPatunganByIdOrder(orderId).then((res) {
      listParticipant.addAll(res.documents);
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
