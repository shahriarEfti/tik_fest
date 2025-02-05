import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

void showToast({required String message}) {

  Color backgroundColor = _getRandomColor();

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor.withOpacity(1),
    textColor: Colors.blueAccent,
    fontSize: 16.0,
    webPosition: 'center',
  );
}

Color _getRandomColor() {

  List<Color> colors = [

    Colors.white,
  ];


  return colors[Random().nextInt(colors.length)];
}
