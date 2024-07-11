import 'package:demo/config/app_config.dart';

class AppDecoration {
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Get.theme.cardColor,
     borderRadius: BorderRadius.circular(AppDimens.dimen20)
    );
  }
}
