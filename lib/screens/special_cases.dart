// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/attendence_special_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Special_Cases extends StatefulWidget {
  const Special_Cases({Key? key}) : super(key: key);

  @override
  _Special_CasesState createState() => _Special_CasesState();
}

class _Special_CasesState extends State<Special_Cases> {
  ////
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: GradientBackgound,

            //
            //
            // Design ***************************************************
            //Header
            child: GetBuilder<Attendence_Special_Controller>(
                init: Attendence_Special_Controller(),
                builder: ((controller) => Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Visibility(
                          visible:controller.visible,

                          child: Container(
                            //padding: const EdgeInsets.only(left: 20),
                            height: 250,
                            width: 600,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(255, 222, 209, 226)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleImage(
                                    controller.imageUrl, controller.visible),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText("id".tr, controller.id_,
                                          controller.visible),
                                      CustomText(
                                          "name".tr,
                                          "${controller.first_name} ${controller.second_name} ${controller.third_name} ${controller.last_name}",
                                          controller.visible),
                                      CustomText(
                                          "specialization".tr,
                                          controller.specialization,
                                          controller.visible),
                                      CustomText("year".tr, controller.year,
                                          controller.visible),
                                      CustomText("index".tr, controller.index_no,
                                          controller.visible)
                                    ])
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(50),
                            height: 250,
                            width: 400,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 158, 135, 165)
                                            .withOpacity(0.9),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(255, 222, 209, 226)),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 40,
                                      color:
                                          const Color.fromARGB(255, 0, 38, 77),
                                      child: const Icon(
                                        Icons.numbers,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.id,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                          hintStyle: const TextStyle(
                                              color: Colors.white),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  15, 0, 0, 0),
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              255, 57, 81, 120),
                                          hintText: "form_hint".tr,
                                        ),
                                      ),
                                    ),
                                  ]),
                              //
                              //
                              //
                              const Padding(padding: EdgeInsets.only(top: 50)),
                              InkWell(
                                onTap: () async {
                                  controller.attendence_special_cases(
                                      controller.id.text, context);
                                },
                                child:
                                    ContainerButton("search".tr, Colors.white),
                              )
                            ])),
                        //
                        //
                        //
                        InkWell(
                            onTap: () {
                              controller.make_attendence(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("make_attendence".tr),
                            ))
                      ],
                    ))))));
  }
}
