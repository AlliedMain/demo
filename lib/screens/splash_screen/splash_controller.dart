import 'package:demo/config/app_config.dart';
import 'package:demo/screens/main_screen/main_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkData();
    super.onInit();
  }

  void checkData() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // if (StorageHelper().isLoggedIn) {
        Get.off(() => MainScreen());
        // } else {
        // Get.off(LoginScreen());
        // }
      },
    );
  }
}
