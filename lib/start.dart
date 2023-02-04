import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/locale_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF345696),
                  Color(0xFFD18B8B),
                  Color(0xFF345696),
                ])),
            child: Center(
                child: GetBuilder<LocaleController>(
                    init: LocaleController(),
                    builder: ((controller) => Container(
                      height: 350,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 199, 193, 193)
                      ),
                      child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Please Select Language",
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 30),
                              const Text("الرجاء اختيار اللغة",
                                  style: TextStyle(fontSize: 20,fontFamily:'Noto')),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        controller.changeLang("en");
                                      },
                                      child: ContainerButton(
                                          "English", Colors.white)),
                                  const SizedBox(width: 40),
                                  InkWell(
                                      onTap: () {
                                        controller.changeLang("ar");
                                      },
                                      child: ContainerButton(
                                          "العربية",Colors.white)),
                                ],
                              ),
                            ],
                          ),
                    ))))));
  }
}
