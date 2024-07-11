import 'package:demo/config/app_config.dart';


class AppTextField extends StatelessWidget {
  final String? lableText;
  final String? hintText;
  final String? tag;
  final double? height;
  final bool isAuth;
  final String img;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? isDense;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final bool readOnly;
  final bool enabled;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextField(
      {super.key,
      this.lableText,
      this.hintText,
      this.tag,
      this.height,
      this.isAuth = false,
      this.img = '',
      this.controller,
      this.focusNode,
      this.hintStyle,
      this.contentPadding,
      this.style,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.maxLines = 1,
      this.onChanged,
      this.validator,
      this.maxLength,
      this.color,
      this.textAlign,
      this.borderRadius,
      this.prefixIcon,
      this.onTap,
      this.readOnly = false,
      this.isDense,
      this.enabled = true,
      this.counterText,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: TextFieldController()..setData(obscureText),
      tag: tag ?? (hintText ?? 'field'),
      builder: (controller1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: AppDecoration.cardDecoration(),
            margin: EdgeInsets.only(top: AppDimens.dimen6),
            child: Center(
                child: TextFormField(
              maxLines: maxLines,
              onTap: onTap,
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.start,
              style: style ?? Get.theme.textTheme.titleMedium,
              cursorColor: Get.theme.primaryColor,
              obscuringCharacter: '*',
              obscureText: controller1.isObscureText,
              keyboardType: keyboardType ?? TextInputType.text,
              onChanged: onChanged,
              validator: (value) {
                if (validator != null) {
                  controller1.validatorMsg = validator!.call(value!);
                  controller1.update();
                }
                return controller1.validatorMsg;
              },
              maxLength: maxLength,
              readOnly: readOnly,
              enabled: enabled,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: hintStyle ?? Get.theme.textTheme.labelLarge,
                  isDense: isDense,
                  counterText: counterText,
                  suffixIcon: obscureText
                      ? GestureDetector(
                          onTap: () {
                            controller1.isObscureText =
                                !controller1.isObscureText;
                            controller1.update();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Image.asset(
                              controller1.isObscureText
                                  ? AppImages.hideEye
                                  : AppImages.eyeIcons,
                              width: AppDimens.dimen20,
                              height: AppDimens.dimen20,
                            ),
                          ),
                        )
                      : suffixIcon,
                  prefixIcon: prefixIcon,
                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(
                          horizontal: AppDimens.dimenW40,
                          vertical: AppDimens.dimen20),
                  border: InputBorder.none,
                  errorText: '',
                  errorStyle: const TextStyle(
                      fontSize: 0, color: AppColors.primaryColor),
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none),
            ).paddingOnly(left: 5)),
          ),
          if (controller1.validatorMsg != null)
            Text(
              controller1.validatorMsg ?? '',
              style: Get.theme.textTheme.titleSmall
                  ?.copyWith(color: AppColors.redColor),
            ).paddingOnly(top: AppDimens.dimen6, left: AppDimens.dimen14)
        ],
      ),
    );
  }
}
