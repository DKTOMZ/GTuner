import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget {
  LoadingWidget({required this.info});
  final String info;

  Future get alertDialog {
    return Get.defaultDialog(
      barrierDismissible: false,
      middleText: info,
      content: Column(
        children: [
          CircularProgressIndicator(
            color: Colors.amber.shade700,
          ),
          Text(info),
        ],
      ),
    );
  }
}

class InteractiveWidget {
  InteractiveWidget(
      {required this.title,
      required this.info,
      required this.buttonAction,
      required this.titleColor});
  final String title;
  final String info;
  final Function() buttonAction;
  final Color titleColor;

  Future get alertDialog {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        titleStyle: TextStyle(color: titleColor, fontSize: 18),
        middleText: info,
        content: Column(
          children: [
            Text(info),
          ],
        ),
        textConfirm: 'Close',
        confirmTextColor: Colors.white,
        onConfirm: buttonAction,
        buttonColor: Colors.amber.shade700);
  }
}
