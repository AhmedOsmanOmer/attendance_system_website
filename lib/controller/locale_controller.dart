import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/main.dart';
import 'package:graduation_project_admin/screens/login.dart';

class LocaleController extends GetxController {
  Locale initLocale =
      sharepref!.getString("code") == "ar" ? const Locale("ar") : const Locale("en");
  Locale? locale;
  changeLang(String code) {
    Locale locale = Locale(code);
    Get.updateLocale(locale);
    update();
    sharepref!.setString("code", code);
    Get.to(() => const Login());
  }
}
