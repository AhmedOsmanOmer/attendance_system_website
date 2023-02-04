// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_Code extends StatelessWidget {
  const Qr_Code({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
        floatingActionButton: InkWell(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('a_y'.tr),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Get.back();
                              },
                              child: Text('yes'.tr)),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('No'.tr))
                        ],
                      ));
            },
            child: Container(
              alignment: Alignment.center,
              height: 40.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: const Color(0xFFC7BACB),
                  borderRadius: BorderRadius.circular(50)),
              child: Text("attendance_approval".tr),
            )),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: QrImage(
              data: data[0],
              version: QrVersions.min,
              size: 750.0,
            ),
          ),
        ));
  }
}
