// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/screens/show_report.dart';
import 'package:graduation_project_admin/widget/widget.dart';
import 'package:http/http.dart' as http;

class Reports_Controller extends GetxController {
  String? dropdownvalue_1;
  var items_1 = ['IT', 'IS', 'FS', 'Ac', 'Low'];
  String? dropdownvalue_2;
  var items_2 = ['First', 'Second', 'Third', 'Fourth'];
  String? dropdownvalue_3;
  var items_3 = ['HCI', 'AI', 'CA', 'MIS'];
  var visible = true;
  var lec_num = 0;
  var url = "http://172.20.10.7/graduation_project";
  List lec_date = [];
  var date_visible = false;
////
  ///
  ///
  show_report(specialization, subject, year, context) async {
    if (dropdownvalue_1 == null) {
      ShowToast("pl_program".tr);
    } else if (dropdownvalue_2 == null) {
      ShowToast("pl_year".tr);
    } else if (dropdownvalue_3 == null) {
      ShowToast("pl_subject".tr);
    } else {
      var response = await http.post(Uri.parse("$url/reports.php"), body: {
        "specialization": specialization,
        "year": year,
        "subject": subject
      });
      var data = json.decode(response.body);
      if (data['status'] == "success") {
        lec_num = data['num'];

        for (var i = 0; i < data['num']; i++) {
          lec_date.add(data['data'][i]['date']);
        }

        Get.to(() => const Show_Report());
      } else {
        showAlertDialog(context, "warning".tr, "no_data".tr);
      }
    }
    update();
  }

  view() {
    date_visible = true;
    update();
  }

  show_dates(context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("date".tr),
      backgroundColor:const Color(0xFFC7BACB),
       scrollable: true,
      content: Container(
        height: 400,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: lec_num,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Center(
                child: Text("${lec_date[index]}"),
              ));
            }),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
