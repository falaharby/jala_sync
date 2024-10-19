import 'package:jala_verification/app/routes/app_pages.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

class InitialScreenController extends GetxController {
  final AuthRepositories _authRepositories;

  InitialScreenController(this._authRepositories);

  void initScreen() async {
    final isLoggedIn = await _authRepositories.isValid();
    Future.delayed(const Duration(seconds: 3), () {
      if(isLoggedIn) {
        Get.offAllNamed(Routes.MAIN_PAGE);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
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
