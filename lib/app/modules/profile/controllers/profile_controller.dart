import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';

class ProfileController extends GetxController {
  final AuthRepositories _authRepositories;

  ProfileController(this._authRepositories);

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
