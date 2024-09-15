import 'package:http/http.dart' as http;
import 'AppMessage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
class PasswordValidatorStrings implements FlutterPwValidatorStrings {
  @override
  final String atLeast = '  طول كلمة المرور 8 خانات على الاقل';
  @override
  final String uppercaseLetters = '  حرف كبير واحد على الاقل';
  @override
  final String numericCharacters = '  رقم واحد على الاقل';
  @override
  final String specialCharacters = '  رمز واحد على الاقل';
  @override
  final String normalLetters = '  حرف صغير واحد على الاقل';
  @override
  final String lowercaseLetters = '  حرف صغير واحد على الاقل';
}

class AppValidator {
//valid empty data============================================================
  static String? validatorEmpty(context, v) {
    if (v == null || v.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else {
      return null;
    }
  }

  //valid empty and not zero ============================================================
  static String? validatorEmptyAndNotZero(context, v) {
    if (v == null || v.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    if (v == '0') {
      return AppMessage.notZero;
    } else {
      return null;
    }
  }

  //valid userName data============================================================
  static String? validatorUserName(context, name) {
    final regExp = RegExp(r"[a-zA-Z@.-/#]");
    if (name.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (regExp.hasMatch(name) == false) {
      return AppLocalizations.of(context)!.englishOnlyValidation;
    } else if (name.length < 4) {
      return AppLocalizations.of(context)!.noLessThan4;
    } else {
      return null;
    }
  }

//valid name data============================================================
  static String? validatorName(context, name) {
    String pattern = r'^[\u0621-\u064A\040]+$';
    RegExp regExp = RegExp(pattern);
    if (name == null || name.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else {
      // if (regExp.hasMatch(name) == false) {
      //   return AppMessage.arabicOnlyValidation;
      // }
      if (name.length > 14) {
        return AppMessage.noMoreThan14;
      }
    }
  }

  //valid full name data============================================================
  static String? validatorFullName(context, name) {
    String pattern = r'^[\u0621-\u064A\040]+$';
    RegExp regExp = RegExp(pattern);
    if (name == null || name.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (regExp.hasMatch(name) == false) {
      return AppMessage.arabicOnlyValidation;
    } else {
      if (name.split(' ').length < 3 || name.endsWith(' ')) {
        return AppMessage.pleaseEnterFullName;
      }
    }
  }

//valid length data============================================================
  static String? validatorLength(context, v, length) {
    if (v.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    if (v.length > length) {
      return 'الحد الاقصى المسموح به هو $length خانات';
    }
    return null;
  }

  //valid email=============================================================
  static String? validatorEmail(context, email) {
    if (email.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    if (EmailValidator.validate(email.trim()) == false) {
      return AppLocalizations.of(context)!.invalidEmail;
    }
    return null;
  }

  //valid Password data============================================================
  static String? validatorConfirmPassword(context, confirmPassword, password) {
    if (confirmPassword == null || confirmPassword!.trim().isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    if (confirmPassword != password) {
      return AppLocalizations.of(context)!.noMatch;
    }
    return null;
  }

  //validate password ==========================================================
  static String? validatorPassword(context, String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value!.trim().isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (value.length < 8) {
      return AppLocalizations.of(context)!.invalidPasswordLength;
    } else if (regExp.hasMatch(value)) {
      return null;
    } else {
      return AppLocalizations.of(context)!.invalidPassword;
    }
    ;
  }

//valid Phone data============================================================
  static String? validatorPhone(context, phone) {
    final phoneRegExp = RegExp(r"^\s*[0-9]{10}$");
    if (phone.trim().isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    // if (phoneRegExp.hasMatch(phone) == false) {
    //   return AppMessage.invalidPhone;
    // }
    if (phone.startsWith('0')) {
      return AppMessage.startWithZero;
    }
    if (!phone.startsWith('5')) {
      return AppMessage.startWith5;
    }
    if (phone.length != 9) {
      return AppMessage.noLessThan9;
    }
    return null;
  }

  //valid Phone general============================================================
  static String? validatorPhoneGeneral(context, phone) {
    final phoneRegExp = RegExp(r"^\s*[0-9]{10}$");
    if (phone.trim().isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    }
    if (phone.startsWith('0')) {
      return AppMessage.startWithZero;
    }
    if (phone.length != 9) {
      return AppMessage.noLessThan9;
    }
    return null;
  }

  // description ============================================================
  static String? validatorDescription(context, desc) {
    if (desc.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (desc.length > 200) {
      return AppMessage.descriptionLength;
    } else if (desc.length < 80) {
      return AppMessage.descriptionMinLength;
    } else {
      return null;
    }
  }

  // description ============================================================
  static String? validatorGiftDescription(context, desc) {
    if (desc.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (desc.length > 200) {
      return AppMessage.descriptionLength;
    } else if (desc.length < 40) {
      return AppMessage.descriptionGiftMinLength;
    } else {
      return null;
    }
  }

  // subject ============================================================
  static String? validatorSubject(context, v) {
    if (v.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (v.length > 25) {
      return AppMessage.subjectLength;
    } else {
      return null;
    }
  }

  //valid userName data============================================================
  static String? validatorCouponName(context, name) {
    final regExp = RegExp(r"[a-zA-Z]");
    if (name.isEmpty) {
      return AppLocalizations.of(context)!.mandatoryTx;
    } else if (name.startsWith('0') ||
        name.startsWith('1') ||
        name.startsWith('2') ||
        name.startsWith('3') ||
        name.startsWith('4') ||
        name.startsWith('5') ||
        name.startsWith('6') ||
        name.startsWith('7') ||
        name.startsWith('8') ||
        name.startsWith('9')) {
      return AppMessage.shouldNotStartWithNumber;
    } else if (regExp.hasMatch(name) == false) {
      return AppMessage.englishOnlyCoupon;
    } else if (name.length < 4) {
      return AppLocalizations.of(context)!.noLessThan4;
    } else {
      return null;
    }
  }

  static String? validFullNameArabic(value) {
    String pattern = r'^[\u0621-\u064A\040]+$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty || value.toString().trim().isEmpty) {
      return 'حقل اجباري';
    } else {
      if (regExp.hasMatch(value) == false) {
        return "يجب ان يكون الاسم باللغة العربية";
      }
      // تحقق من أن الاسم لا يحتوي على مسافات مزدوجة
      String doubleSpacePattern = r'\s{2,}';
      RegExp doubleSpaceRegExp = RegExp(doubleSpacePattern);
      if (doubleSpaceRegExp.hasMatch(value)) {
        return 'يجب أن يحتوي الاسم على مسافة واحدة فقط بين كل كلمة والأخرى';
      }
      // تحقق من أن الاسم يحتوي على 3 مسافات على الأقل
      int spaceCount = value.split(' ').length - 1;
      if (spaceCount < 3) {
        return 'يجب كتابه الاسم رباعي';
      }

      // تحقق من وجود حرف بعد المسافة الثالثة
      List<String> parts = value.split(' ');
      if (parts.length < 4 || parts[3].isEmpty) {
        return "يجب كتابه الاسم رباعي";
      }
    }
    return null;
  }

  String? validUserName(value) {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (value.isEmpty) {
      return "حقل اجباري";
    }
    if (value.length < 4) {
      return "يجب ان يكون اسم المستخدم على الاقل 4 خانات";
    }
    return null;
  }

  //valid empty data============================================================
  static Future<bool> validateEmptyAndValidUrl(v) async {
    bool exist = false;
    await urlExist(v.contains('https://') || v.contains('http://')
            ? v.trim()
            : 'https://${v.trim()}')
        .then((v) {
      print(v);
      exist = v;
    });

    if (v == null || v.isEmpty) {
      return false;
    } else {
      print('${exist}0----------------------');
      return exist;
    }
  }

  ///=============================================================================
  static Future<bool> urlExist(String url) async {
    try {
      var response = await http.get(Uri.parse(url));

      return response.statusCode == 200 ? true : false;
    } catch (e) {
      return false;
    }
  }
}
