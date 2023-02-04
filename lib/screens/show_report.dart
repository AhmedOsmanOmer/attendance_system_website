// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/reports_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Show_Report extends StatefulWidget {
  const Show_Report({super.key});

  @override
  State<Show_Report> createState() => _Show_ReportState();
}

class _Show_ReportState extends State<Show_Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: GradientBackgound,
            child: GetBuilder<Reports_Controller>(
                init: Reports_Controller(),
                builder: (controller) => Center(
                    child: Container(
                        padding: const EdgeInsets.all(30),
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFFC7BACB)),
                        alignment: Alignment.center,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "report1".tr,
                                style: const TextStyle(fontSize: 50),
                              ),
                              CustomText1(
                                  "specialization".tr,
                                  Text(controller.dropdownvalue_1!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF345696))),
                                  controller.visible),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText1(
                                  "year".tr,
                                  Text(controller.dropdownvalue_2!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF345696))),
                                  controller.visible),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText1(
                                  "sub".tr,
                                  Text(controller.dropdownvalue_3!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF345696))),
                                  controller.visible),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText1(
                                  "lec".tr,
                                  Text(controller.lec_num.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF345696))),
                                  controller.visible),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText1(
                                  "lec_date".tr,
                                  InkWell(
                                    onTap: () {
                                      controller.show_dates(context);
                                    },
                                    child: Text("cl_to_se".tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color(0xFF345696))),
                                  ),
                                  controller.visible),
                            ]))))));
  }
}
