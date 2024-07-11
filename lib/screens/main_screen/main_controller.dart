
import 'package:demo/config/app_config.dart';


class MainController extends GetxController {
  bool isLoading = true;
  MainModel? mainData;

  bool isDarkMode = false;

  @override
  void onInit() {
    isDarkMode = StorageHelper().isDark ?? Get.isDarkMode;
    super.onInit();
    callApi();
  }

  callApi() {
    isLoading = true;
    update();
    ApiManager.callGet(endPoint: ApiUtils.jokes).then((value) {
      mainData = MainModel.fromJson(value);

      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialogs.errorSnackBar(error.toString());
    });
  }
}
