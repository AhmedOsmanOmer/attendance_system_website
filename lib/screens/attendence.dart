// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/attendence_controller.dart';
import 'package:graduation_project_admin/screens/show_attendence.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    ///////
    ///
    ///Back Button
    return Scaffold(
        //
        //
        //
        //Gradient Wallpaper
        body: Container(
      decoration: GradientBackgound,

      //
      //
      // Design ***************************************************
      //Header
      child: GetBuilder<Attendence_Controller>(
        init: Attendence_Controller(),
        builder: (controller) => Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const SizedBox(height: 0),
              Text("please_select".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 25)),
              //
              ///
              //////
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFC7BACB),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 430,
                width: 450,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            items: controller.items_1.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                controller.dropdownvalue_1 = newValue!;
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
                          items: controller.items_2.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.dropdownvalue_2 = newValue!;
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
                          value: controller.dropdownvalue_4,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          items: controller.items_4.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.dropdownvalue_4 = newValue!;
                            });
                          })),

                      /////
                      ///dropdown Button 3
                      ///
                      CustomDecoration(DropdownButton(
                          alignment: Alignment.center,
                          hint: Text("select_time".tr),
                          isExpanded: true,
                          underline: Container(),
                          value: controller.dropdownvalue_3,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          items: controller.items_3.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.dropdownvalue_3 = newValue!;
                            });
                          })),
                      ////
                      //////
                      ///Date Button
                      ///
                      InkWell(
                          onTap: () {
                            controller.dateTimePicker(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 380,
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(controller.newDate),
                          )), // const Color(0xFFC7BACB))),
                      //
                      //
                      ///QR Code Value
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: controller.qr_value_,
                        decoration: InputDecoration(
                          hintText: "qr_value".tr,
                        ),
                      ),
                      //
                      //
                      //QR Button **********************************************
                      InkWell(
                          onTap: () async {
                            await controller.gen_Qr(
                                controller.dropdownvalue_1,
                                controller.dropdownvalue_4,
                                controller.dropdownvalue_2,
                                controller.qr_value_.text,
                                controller.dropdownvalue_3,
                                context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "system_on".tr,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const Icon(Icons.qr_code)
                              ],
                            ),
                          )),
                    ]),
              ),
              //
              //
              ///show attendence **************************************************
              InkWell(
                onTap: () {
                  Get.to(() => const Show_Attendence());
                },
                child: ContainerButton(
                    "show_attendence".tr, const Color(0xFFC7BACB)),
              ),
              /////
              ///
              ///
              InkWell(
                onTap: () {
                  controller.system_Off(controller.dropdownvalue_1,
                      controller.dropdownvalue_2, context);
                },
                child:
                    ContainerButton("system_off".tr, const Color(0xFFC7BACB)),
              ),
            ])),
      ),
    ));
  }
}
