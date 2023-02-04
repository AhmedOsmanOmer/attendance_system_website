// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/screens/attendence.dart';
import 'package:graduation_project_admin/screens/menu.dart';
import 'package:graduation_project_admin/screens/qr_code.dart';
import 'package:graduation_project_admin/widget/widget.dart';
import 'package:http/http.dart' as http;

class Attendence_Controller extends GetxController {
  String? dropdownvalue_1;
  var items_1 = ['IT', 'IS', 'FS', 'Ac', 'Low'];
  String? dropdownvalue_2;
  var items_2 = ['First', 'Second', 'Third', 'Fourth'];
  String? dropdownvalue_4;
  var items_4 = ['HCI', 'AI', 'CA', 'MIS'];
  String? dropdownvalue_3;
  var items_3 = [
    "07:30 - 09:30",
    "10:00 - 12:00",
    "12:00 - 02:00",
    "02:00 - 04:00"
  ];

  TextEditingController qr_value_ = TextEditingController();
  ///////
  //////////
  ///
  ///
  var url = "http://172.20.10.7/graduation_project";
  DateTime initDate = DateTime.now();
  var newDate = "select_date".tr;
  /////
  //////
  ///
  List<DataRow> table_data = [];
  /////
  ///
  ///
  ///
  Future gen_Qr(specialization, subject, year, qr_Value, time, context) async {
    if (dropdownvalue_1 == null) {
      ShowToast("pl_program".tr);
    } else if (dropdownvalue_2 == null) {
      ShowToast("pl_year".tr);
    } else if (dropdownvalue_4 == null) {
      ShowToast("pl_subject".tr);
    } else if (dropdownvalue_3 == null) {
      ShowToast("pl_time".tr);
    } else if (newDate == "Select Date") {
      ShowToast("pl_date".tr);
    } else if (newDate == "تاريخ المحاضرة") {
      ShowToast("pl_date".tr);
    } else if (qr_value_.text == "") {
      ShowToast("pl_qr".tr);
    } else {
      var response = await http.post(Uri.parse("$url/system.php"), body: {
        "specialization": specialization,
        "year": year,
        "qr_value": qr_Value,
        "subject": subject,
        "date": newDate,
        "time": time
      });
      var data = json.decode(response.body);

      if (data == "system_on") {
        showAlertDialog(context, "warning".tr, "system_al_on".tr);
        // AwesomeDialog(context: context, title: "System already ON", width: 500)  .show();
      }
      if (data == "success") {
        Get.to(const Qr_Code(), arguments: [qr_value_.text]);
      }
    }
  }

  ///
  ///
  ///
  ///System off
  system_Off(specialization, year, context) async {
    if (dropdownvalue_1 == null) {
      ShowToast("pl_program".tr);
    } else if (dropdownvalue_2 == null) {
      ShowToast("pl_year".tr);
    } else {
      var response = await http.post(Uri.parse("$url/system_off.php"), body: {
        "specialization": specialization,
        "year": year,
      });
      var data = json.decode(response.body);

      if (data == "system_off") {
        showAlertDialog(context, "warning".tr, "system_al_off".tr);

        // AwesomeDialog(context: context, title: "System already off", width: 500)   .show();
      }
      if (data == "success") {
        Get.to(const Menu());
        ShowToast("system_off_success".tr);
      }
    }
  }

///////
  ///
  ///
  ///
  dateTimePicker(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (date == null) return;
    //dateTime = newDate;

    newDate = "${date.year}/${date.month}/${date.day}";
    update();
    print(newDate);
  }

  show_attendence(specialization, year, context) async {
    if (dropdownvalue_1 == null) {
      ShowToast("pl_program".tr);
    } else if (dropdownvalue_2 == null) {
      ShowToast("pl_year".tr);
    } else {
      var response =
          await http.post(Uri.parse("$url/show_attendence.php"), body: {
        "specialization": specialization,
        "year": year,
      });
      var data = json.decode(response.body);
      if (data['status'] == "success") {
        return data;
      } else {
        //AwesomeDialog(context: context, title: "No Data", width: 500).show();
        Get.to(() => const Attendence());
        showAlertDialog(context, "warning".tr, "no_data".tr);
      }
    }
  }

  fill_table(context) {
    FutureBuilder(
        future: show_attendence(dropdownvalue_1, dropdownvalue_2, context),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            for (var i = 0; i < snapshot.data!.length + 1; i++) {
              table_data.add(DataRow(cells: [
                DataCell(Text("${snapshot.data['data'][i]['id']}")),
                DataCell(Text(
                    "${snapshot.data['data'][i]['first_name']} ${snapshot.data['data'][i]['second_name']} ${snapshot.data['data'][i]['third_name']} ${snapshot.data['data'][i]['last_name']}")),
                DataCell(snapshot.data['data1'][i]['status'] == "1"
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.error_sharp)),
              ]));
              update();
            }
            return const Text("");
          } else {
            return const CircularProgressIndicator();
          }
        });
    update();
  }

  var tableData = [];
  DataRow getDataRow(index, data) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
            Text(data['data'][index]['id'])), //add name of your columns here
        DataCell(Text(
            "${data['data'][index]['first_name']} ${data['data'][index]['second_name']} ${data['data'][index]['third_name']} ${data['data'][index]['last_name']}")),
        DataCell(data['data1'][index]['status'] == "1"
            ? const Icon(Icons.check_circle) //(Icons.check_circle)
            : const Icon(Icons.circle))
      ],
    );
  }
}
