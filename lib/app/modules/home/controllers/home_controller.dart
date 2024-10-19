import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AuthRepositories _authRepositories;

  HomeController(this._authRepositories);

  Future logout() async {
    await _authRepositories.logout();
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
