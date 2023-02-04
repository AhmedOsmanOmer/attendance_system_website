// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/widget/widget.dart';
import 'package:http/http.dart' as http;

class Attendence_Special_Controller extends GetxController {
  TextEditingController id = TextEditingController();
  var id_ = "",
      first_name = "",
      second_name = "",
      third_name = "",
      last_name = "",
      specialization = "",
      index_no = "",
      year = "";
  var url = "http://172.20.10.7/graduation_project";
  String imageUrl = "http://172.20.10.7/graduation_project/images/default.png";
  var visible = false;

  ///
  ///
  Future attendence_special_cases(id, context) async {
    var response = await http
        .post(Uri.parse("$url/attendence_special_cases.php"), body: {"id": id});
    var data = json.decode(response.body);

    if (data['status'] == "success") {
      ShowToast("result_found".tr);
      id_ = data['data']['id'];
      first_name = data['data']['first_name'];
      second_name = data['data']['second_name'];
      third_name = data['data']['third_name'];
      last_name = data['data']['last_name'];
      specialization = data['data']['specialization'];
      index_no = data['data']['index_no'];
      year = data['data']['year'];
      imageUrl = data['data']['image_url'];
      visible = true;
      //
      update();
    }
    if (data['status'] == "fail") {
      showAlertDialog(context, "warning".tr, "result_not_found".tr);
      //AwesomeDialog(context: context, title: "No Student Exist", width: 500).show();
      id_ = "";
      first_name = "";
      second_name = "";
      third_name = "";
      last_name = "";
      specialization = "";
      index_no = "";
      year = "";
      imageUrl = "http://172.20.10.7/graduation_project/images/default.png";
      visible = false;
      update();
    }
    update();
  }

  //Attendence_Controller ac = Attendence_Controller();
  make_attendence(context) async {
    var response = await http.post(Uri.parse("$url/make_attendence_admin.php"),
        body: {"id": id.text, "specialization": specialization, "year": year});

    var data = json.decode(response.body);
    if (data['status'] == "success") {
      ShowToast("atttendence_success".tr);
    } else if (data['status'] == "system_off") {
      showAlertDialog(context, "warning".tr, "s_off".tr);
    } else if (data['status'] == "twice_attendence") {
      ShowToast("attendence_twice".tr);
    }
    update();
  }
}
