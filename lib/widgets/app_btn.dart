import 'package:demo/config/app_config.dart';

Widget appButton(String title,
    {Color? color,
    Color? textColor,
    double? width,
    double? height,
    Function()? onTap,
    BorderRadiusGeometry? borderRadius,
    bool isShowBottom = true}) {
  return SizedBox(
    width: width ?? double.infinity,
    height: height ?? AppDimens.dimen70,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(AppDimens.dimen24), // <-- Radius
          ),
          disabledBackgroundColor: color ?? AppColors.primaryColor,
          backgroundColor: color ?? AppColors.primaryColor),
      child: Text(
        title,
        style: Get.theme.textTheme.displayLarge!
            .copyWith(color: AppColors.secondaryColor),
      ),
    ),
  );
}
