// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduation_project_admin/widget/widget.dart';
import 'package:http/http.dart' as http;

class Exam_Special_Controller extends GetxController {
  var id_ = "",
      first_name = "",
      second_name = "",
      third_name = "",
      last_name = "",
      specialization = "",
      index_no = "",
      year = "",
      payment_status = "",
      hall_name = "",
      hall_index = "";
  var url = "http://172.20.10.7/graduation_project";
  String imageUrl = "http://172.20.10.7/graduation_project/images/default.png";
  var visible = false;
/////
  ///
  ///
  Future exam_special_cases(id, context) async {
    var response =
        await http.post(Uri.parse("$url/exams.php"), body: {"id": id});
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
      payment_status = data['data']['payment_status'];
      hall_name = data['data']['hall_name'];
      hall_index = data['data']['hall_index'];
      visible = true;
    }
    if (data['status'] == "fail") {
      showAlertDialog(context, "warning".tr, "result_not_found".tr);

      //AwesomeDialog(context: context, title: "No Student Exist", width: 500)   .show();
      id_ = "";
      first_name = "";
      second_name = "";
      third_name = "";
      last_name = "";
      specialization = "";
      index_no = "";
      year = "";
      payment_status = "";
      hall_name = "";
      hall_index = "";
      imageUrl = "http://172.20.10.7/graduation_project/images/default.png";
      visible = false;
    }
    update();
  }
}
