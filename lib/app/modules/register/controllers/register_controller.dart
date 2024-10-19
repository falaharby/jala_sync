import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  AuthRepositories authRepositories;

  RegisterController(this.authRepositories);

  RxBool isLoading = false.obs;

  Future register({required String email, required String password, required String name}) async {
    try {
      isLoading.value = true;
      await authRepositories.register(email, password, name).then((_) {
        isLoading.value = false;
      });
     
    } catch(e) {
      isLoading.value = false;
      rethrow;
    }
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
