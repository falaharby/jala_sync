import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginController extends GetxController {
  AuthRepositories _authRepositories;

  LoginController(this._authRepositories);

  RxBool isLoading = false.obs;

  Future login({required String email, required String password}) async{
   try {
      isLoading.value = true;
      await _authRepositories.login(email, password).then((_) {
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
