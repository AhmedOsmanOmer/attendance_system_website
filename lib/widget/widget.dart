// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

BoxDecoration GradientBackgound = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
      Color(0xFF345696),
      Color(0xFFD18B8B),
      Color(0xFF345696),
    ]));

ContainerButton(String text, Color color) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: 200,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    child: Text(text),
  );
}

CustomDecoration(Widget widget) {
  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: DecoratedBox(
          decoration: const ShapeDecoration(
              color: Colors.white54,
              shape: RoundedRectangleBorder(
                  //side: BorderSide(width: 4.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: widget)));
}

ShowToast(String msg) {
  return Fluttertoast.showToast(
      webPosition: "center",
      webBgColor: "linear-gradient(to right, #0xFFC7BACB, #0xFFC7BACB)",
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.pink[50],
      textColor: Colors.white,
      fontSize: 50.0);
}

CircleImage(url, bool visible) {
  return Visibility(
    visible: visible,
    child: Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 150,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String title, String message) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
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

CustomText(String lb, String data, bool visible) {
  return Visibility(
    visible: visible,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            alignment: Alignment.center,
            height: 30,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70.withOpacity(0.5)),
            child: Text(lb,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF345696)))),
        const SizedBox(width: 10),
        Container(
            alignment: Alignment.center,
            height: 30,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70.withOpacity(0.5)),
            child: Text(data,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF345696)))),
      ],
    ),
  );
}

CustomText1(String lb, Widget widget, bool visible) {
  return Visibility(
    visible: visible,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            alignment: Alignment.center,
            height: 30,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70.withOpacity(0.5)),
            child: Text(lb,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black))),
        const SizedBox(width: 10),
        Container(
            alignment: Alignment.center,
            height: 30,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70.withOpacity(0.5)),
            child: widget),
      ],
    ),
  );
}
