import 'package:demo/utils/app_strings.dart';

class AppValidation {
  static String? validatesPassword(String? value) {
    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validatePasswordMsg;
    }
    return null;
  }

  static String? validatesEmail(String? value) {
    String pattern =
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})([ ]{0,10})$";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validateEmailMsg;
    }
    return null;
  }

  static String? validatesWebsiteLink(String? value) {
    String pattern =
        r"[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validateWebsiteMsg;
    }
    return null;
  }

  static String? validatesPhone(String? value) {
    String pattern = r"^[0-9 ()]{4,16}$";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validatePhoneMsg;
    }
    return null;
  }

  static String? validatesCPassWord(String? value, String? oldPass) {
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!(value == oldPass)) {
      return AppStrings.validateCPassMsg;
    }
    return null;
  }

  static String? checkEmpty(String? value) {
    if (value!.trim().isEmpty) {
      return AppStrings.fieldIsRequired;
    }
    return null;
  }
}
