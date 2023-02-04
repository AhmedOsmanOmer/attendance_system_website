import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/reports_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: GradientBackgound,

            //
            //
            // Design ***************************************************
            //Header
            child: GetBuilder<Reports_Controller>(
                init: Reports_Controller(),
                builder: (controller) => Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Text(
                            "report".tr,
                            style: const TextStyle(fontSize: 50),
                          ),

                          ///
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC7BACB),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            height: 430,
                            width: 450,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ///
                                  ///
                                  //*************** DropDownButton    1*/
                                  CustomDecoration(
                                    DropdownButton(
                                        alignment: Alignment.center,
                                        hint: Text("select_program".tr),
                                        isExpanded: true,
                                        underline: Container(),
                                        value: controller.dropdownvalue_1,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                        items: controller.items_1
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            controller.dropdownvalue_1 =
                                                newValue!;
                                          });
                                        }),
                                  ),
                                  //
                                  ///
                                  //////
                                  //*************** DropDownButton    1*/
                                  CustomDecoration(DropdownButton(
                                      alignment: Alignment.center,
                                      hint: Text("select_year".tr),
                                      isExpanded: true,
                                      underline: Container(),
                                      value: controller.dropdownvalue_2,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                      ),
                                      items: controller.items_2
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          controller.dropdownvalue_2 =
                                              newValue!;
                                        });
                                      })),
                                  /////
                                  ///
                                  ///
                                  //Subject
                                  CustomDecoration(DropdownButton(
                                      alignment: Alignment.center,
                                      hint: Text("select_subject".tr),
                                      isExpanded: true,
                                      underline: Container(),
                                      value: controller.dropdownvalue_3,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                      ),
                                      items: controller.items_3
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          controller.dropdownvalue_3 =
                                              newValue!;
                                        });
                                      })),
                                  InkWell(
                                    onTap: () {
                                      controller.show_report(
                                          controller.dropdownvalue_1,
                                          controller.dropdownvalue_3,
                                          controller.dropdownvalue_2,
                                          context);
                                      //  print(controller.lec_date);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("show_report".tr,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black)),
                                          const Icon(Icons.book)
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ])))));
  }
}
