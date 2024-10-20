import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

class ProfileController extends GetxController {
  final AuthRepositories _authRepositories;
  final PatunganRepositories _patunganRepositories;

  ProfileController(this._authRepositories, this._patunganRepositories);

  Future logout() async {
    await _authRepositories.logout();
  }

  List<Document> listHistory = <Document>[].obs;

  Future getHistory() async {
    listHistory.clear();
    final acc = await _authRepositories.getAccount();
    await _patunganRepositories.getPatunganByIdUser(acc.$id).then((res) {
      listHistory.addAll(res.documents);
    });
  }

  @override
  void onInit() {
    getHistory();
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
