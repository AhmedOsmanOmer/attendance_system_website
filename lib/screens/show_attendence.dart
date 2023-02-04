// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_admin/controller/attendence_controller.dart';
import 'package:graduation_project_admin/widget/widget.dart';

class Show_Attendence extends StatefulWidget {
  const Show_Attendence({super.key});

  @override
  State<Show_Attendence> createState() => _Show_AttendenceState();
}

class _Show_AttendenceState extends State<Show_Attendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: GradientBackgound,
            child: Column(children: [
              GetBuilder<Attendence_Controller>(
                  init: Attendence_Controller(),
                  builder: (controller) => Center(
                        child: FutureBuilder(
                          future: controller.show_attendence(
                              controller.dropdownvalue_1,
                              controller.dropdownvalue_2,
                              context),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              //controller.tableData = snapshot.data;
                              if (snapshot.data!.length != 0) {
                                return Container(
                                    padding: const EdgeInsets.all(30),
                                    width: 700,
                                    height: 600,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFC7BACB)),
                                    alignment: Alignment.topCenter,
                                    child: DataTable(
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            "id".tr,
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          numeric: false,
                                          tooltip: "ID",
                                        ),
                                        DataColumn(
                                          label: Text(
                                            "name".tr,
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          numeric: false,
                                          tooltip: "Name",
                                        ),
                                        DataColumn(
                                          label: Text(
                                            "attendence".tr,
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          numeric: false,
                                          tooltip: "#",
                                        ),
                                      ],
                                      rows: List.generate(
                                        snapshot.data['data'].length,
                                        (index) => controller.getDataRow(
                                          index,
                                          snapshot.data,
                                        ),
                                      ),
                                      showBottomBorder: true,
                                    ));
                              } else {
                                return Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      SizedBox(
                                        // ignore: sort_child_properties_last
                                        child: CircularProgressIndicator(),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(40),
                                        child: Text('No Data Found...'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    SizedBox(
                                      // ignore: sort_child_properties_last
                                      child: CircularProgressIndicator(),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(40),
                                      child: Text('No Data Found...'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ))
            ])));
  }
}

                           
                          
                        /*child: Container(
                            padding: const EdgeInsets.all(30),
                            width: 500,
                            height: 600,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFFC7BACB)),
                            alignment: Alignment.center,*/
                                /*FutureBuilder(
                                    future: controller.show_attendence(
                                        controller.dropdownvalue_1,
                                        controller.dropdownvalue_2,
                                        context),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                            itemCount: snapshot.data!.length + 1,
                                            itemBuilder: (context, i) {
                                              return ListTile(
                                                  leading: Container(
                                                    padding:
                                                        const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                50),
                                                        color:
                                                            const Color.fromARGB(
                                                                255,
                                                                242,
                                                                238,
                                                                243)),
                                                    child: Text(
                                                        "${snapshot.data['data'][i]['id']}"),
                                                  ),
                                                  title: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                50),
                                                        color:
                                                            const Color.fromARGB(
                                                                255,
                                                                242,
                                                                238,
                                                                243)),
                                                    child: Text(
                                                        "${snapshot.data['data'][i]['first_name']} ${snapshot.data['data'][i]['second_name']} ${snapshot.data['data'][i]['third_name']} ${snapshot.data['data'][i]['last_name']}"),
                                                  ),
                                                  trailing: snapshot.data['data1']
                                                              [i]['status'] ==
                                                          "1"
                                                      ? const Text(
                                                          "✔") //(Icons.check_circle)
                                                      : const Text(
                                                          "✖") // Icon(Icons.error_sharp),
                                                  );
                                            });
                                      } else {
                                        return const CircularProgressIndicator();
                                      }
                                    })),
                      ),
                    )));
  }
}*/
