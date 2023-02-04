// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/screens/attendence.dart';
import 'package:graduation_project_admin/screens/exam_case.dart';
import 'package:graduation_project_admin/screens/login.dart';
import 'package:graduation_project_admin/screens/reports.dart';
import 'package:graduation_project_admin/screens/special_cases.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      ///
      ///background
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: GradientBackgound,
        ////
        ///
        ///
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "menu_title".tr,
                style: const TextStyle(fontSize: 25),
              ),
              Container(
                padding: const EdgeInsets.all(100),
                height: 550,
                width: 500,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 209, 226),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///
                      ///
                      ///
                      ///
                      InkWell(
                          onTap: () {
                            Get.to(() => const Attendence());
                          },
                          child: ContainerButton(
                              "take_attendence".tr, Colors.white)),

                      ///
                      ///
                      ///
                      ///
                      InkWell(
                          onTap: () {
                            Get.to(() => const Special_Cases());
                          },
                          child: ContainerButton(
                              "attendece_case".tr, Colors.white)),

                      ///
                      ///
                      ///
                      ///
                      InkWell(
                        onTap: () {
                          Get.to(() => const Exam_Cases());
                        },
                        child: ContainerButton("exams".tr, Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const Reports());
                        },
                        child: ContainerButton("report".tr, Colors.white),
                      ),
                    ]),
              ),

              ///
              ///

              /////
              ///
              ///
              ///
              ///
              InkWell(
                  onTap: () {
                    Get.to(() => const Login());
                  },
                  child: ContainerButton("exit".tr, Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
