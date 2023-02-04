// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/locale_controller.dart';
import 'package:graduation_project_admin/locale.dart';
import 'package:graduation_project_admin/screens/exam_case.dart';
import 'package:graduation_project_admin/screens/attendence.dart';
import 'package:graduation_project_admin/screens/login.dart';
import 'package:graduation_project_admin/screens/menu.dart';
import 'package:graduation_project_admin/screens/qr_code.dart';
import 'package:graduation_project_admin/screens/reports.dart';
import 'package:graduation_project_admin/screens/show_attendence.dart';
import 'package:graduation_project_admin/screens/show_report.dart';
import 'package:graduation_project_admin/screens/special_cases.dart';
import 'package:graduation_project_admin/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController lc = LocaleController();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: lc.locale == "en" ? "Lora": "Noto",
      ),
      locale: lc.initLocale,
      translations: MyLocale(),
      initialRoute: '/Start',
      routes: {
        "/Show_Report": (context) => const Show_Report(),
        '/Reports': (context) => const Reports(),
        '/Start': (context) => const Start(),
        '/Menu': (context) => const Menu(),
        '/Login': (context) => const Login(),
        '/Attendence': (context) => const Attendence(),
        '/Special_Cases': (context) => const Special_Cases(),
        '/Exam_Cases': (context) => const Exam_Cases(),
        '/Qr_Code': (context) => const Qr_Code(),
        '/Show_Attendence': (context) => const Show_Attendence()
      },
    );
  }
}
