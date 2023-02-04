// ignore_for_file: camel_case_types, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/login_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<Login_Controller>(
            init: Login_Controller(),
            builder: (controller) => Stack(
                  children: [
                    //
                    //
                    //Background   *****************************************************
                    Container(
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
                ]))
                        ),
                    //
                    //
                    //
                    //Login Button
                    Positioned(
                        top: MediaQuery.of(context).size.height * 9 / 13,
                        left: MediaQuery.of(context).size.width * 3.9 / 10,
                        child: InkWell(
                          onTap: () async {
                            await controller.login(controller.username,
                                controller.password, context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 199, 193, 193),
                            ),
                            alignment: Alignment.center,
                            width: 300,
                            height: 80,
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "login_button".tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    //
                    ////
                    //////Form ****************************************************
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(50),
                              height: 270,
                              width: 450,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 158, 135, 165)
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
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 48,
                                          width: 40,
                                          color: Colors.white,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: controller.username,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                  color: Colors.black),
                                              border: InputBorder.none,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 0),
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "username".tr,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          height: 48,
                                          width: 40,
                                          child: const Icon(
                                            Icons.password,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: controller.password,
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                  color: Colors.black),
                                              border: const OutlineInputBorder(
                                                  borderSide:  BorderSide()),
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 0),
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "password".tr,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(height: 15),
                                  Text(
                                    "log_error".tr,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),

                    /// Form End *****************************************
                    ///
                    ///
                    /// Avatar
                    Positioned(
                        top: MediaQuery.of(context).size.height * 1 / 5,
                        left: MediaQuery.of(context).size.width * 6 / 13,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("images/logo2.jpg"),
                          maxRadius: 50,
                          //backgroundColor: Color.fromARGB(255, 0, 38, 77),
                        )),
                  ],
                )));
  }
}
