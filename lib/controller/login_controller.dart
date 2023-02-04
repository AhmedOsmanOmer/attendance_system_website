// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project_admin/screens/menu.dart';
import 'package:graduation_project_admin/widget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Login_Controller extends GetxController {
  var url = "http://172.20.10.7/graduation_project";
  bool isLoading = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(TextEditingController username, TextEditingController password,
      context) async {
    var response = await http.post(Uri.parse("$url/login.php"),
        body: {"username": username.text, "password": password.text});
    var data = json.decode(response.body);

    if (data == "success") {
      Get.to(const Menu(), arguments: [username.text]);
    }
    if (data == "fail") {
      /*AwesomeDialog(
              context: context, title: "Wrong username or password", width: 500)
          .show();*/
      showAlertDialog(context, "warning".tr, "wrong_login".tr);
    }
    update();
  }
}
