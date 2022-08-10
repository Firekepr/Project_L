import 'package:flutter/material.dart';

class ProjectStyles {

  static TextStyle checkedItemTitle(bool isCheck) {
    return isCheck
        ? const TextStyle(color: Colors.white24, fontSize: 16.0)
        : const TextStyle(color: Colors.blue, fontSize: 16.0);
  }

  static TextStyle checkedItemContent(bool isCheck) {
    return isCheck
        ? const TextStyle(color: Colors.white24, fontSize: 14.0)
        : const TextStyle(color: Colors.white, fontSize: 14.0);
  }

  static Color checkBoxColor = Colors.green;

  static Color? listTileColor = Colors.grey[900];

  static Color? scaffoldColor = Colors.grey[600];

}