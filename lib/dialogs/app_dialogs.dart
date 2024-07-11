import 'package:demo/config/app_config.dart';


class AppDialogs {
  static successSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.greenColor,
            content: Text(
              msg,
              style: TextStyle(
                  fontSize: FontDimen.dimen14, color: AppColors.secondaryColor),
            )),
      );
    }
  }

  static errorSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.redColor,
            content: Text(
              msg,
              style: TextStyle(
                  fontSize: FontDimen.dimen14, color: AppColors.primaryColor),
            )),
      );
    }
  }

  static showProcess() {
    return Get.dialog(
      barrierDismissible: false,
      AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: PopScope(canPop: false, child: AppWidgets.getLoadingView())),
    );
  }

  static showCommonDialog(Widget child,
      {bool isbottom = false, Function()? onTap}) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
                decoration:
                    AppDecoration.cardDecoration(),
                padding: EdgeInsets.all(AppDimens.dimen20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (!isbottom)
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: Get.theme.dividerColor,
                            )),
                      ),
                    child,
                    if (isbottom)
                      Row(
                        children: [
                          Expanded(
                              child: appButton(
                            AppStrings.no,
                            height: AppDimens.dimen50,
                            color: AppColors.secondaryColor,
                            textColor: AppColors.primaryColor,
                            onTap: () => Get.back(),
                          ).paddingSymmetric(horizontal: AppDimens.dimenW40)),
                          Expanded(
                              child: appButton(
                            AppStrings.yes,
                            height: AppDimens.dimen50,
                            onTap: () {
                              Get.back();
                              onTap?.call();
                            },
                          ).paddingSymmetric(horizontal: AppDimens.dimenW40)),
                        ],
                      )
                  ],
                )),
          ),
        );
      },
    );
  }

  // static showSuccessBottomSheet(String msg, Function() onTap,String btnTitle) =>
  //     showModalBottomSheet<void>(
  //       context: Get.context!,
  //       isDismissible: false,
  //       backgroundColor: AppColors.cardColor,
  //       builder: (BuildContext context) {
  //         return SizedBox(
  //           height: Appdimens.dimen350,
  //           child: Column(
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Image.asset(
  //                       AppImages.check,
  //                       height: Appdimens.dimen100,
  //                       width: Appdimens.dimen100,
  //                     ),
  //                     Text(
  //                       msg,
  //                       textAlign: TextAlign.center,
  //                       style: Get.theme.textTheme.headlineMedium!
  //                           .copyWith(color: AppColors.greenColor),
  //                     ).paddingSymmetric(vertical: Appdimens.dimen20),
  //                   ],
  //                 ),
  //               ),
  //               appButton(btnTitle)
  //                   .paddingSymmetric(vertical: Appdimens.dimen20)
  //                   .asButton(onTap: onTap)
  //             ],
  //           ).paddingAll(Appdimens.dimen20),
  //         );
  //       },
  // );
}
