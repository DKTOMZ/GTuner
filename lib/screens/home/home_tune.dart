import 'package:GTuner/control/home/tuner/tuner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final tuner = Get.find<TunerController>();

Widget tune() => Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Obx(() => Text(
                  tuner.note.value,
                  style: TextStyle(
                      color: Colors.amber.shade700,
                      fontSize: 90,
                      fontWeight: FontWeight.bold),
                )),
            Obx(() => Text(
                  tuner.status.value == 'undefined'
                      ? 'Play something'
                      : tuner.status.value,
                  style: TextStyle(
                      fontSize: 30,
                      color: (tuner.status.value == 'tuned' ||
                              tuner.status.value == 'Play something')
                          ? Colors.green
                          : Colors.red),
                )),
            Obx(() => Text(
                  tuner.diff.value.toString(),
                  style: const TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
