import 'package:GTuner/screens/tools/tools_metronome.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
import 'package:soundpool/soundpool.dart';

class MetronomeController extends GetxController {
  Soundpool pool1 = Soundpool.fromOptions();
  int? accentSound;
  int? normalSound;
  Rx<int> count = 0.obs;
  ReliableIntervalTimer? timer;

  @override
  void onInit() async {
    super.onInit();
    accentSound =
        await rootBundle.load("sounds/click1.wav").then((ByteData soundData) {
      return pool1.load(soundData);
    });
    normalSound =
        await rootBundle.load("sounds/click2.wav").then((ByteData soundData) {
      return pool1.load(soundData);
    });
  }

  @override
  void onClose() {
    pool1.dispose();
    super.onClose();
  }

  void playClick() {
    if (count.value == beats || count.value > beats) {
      count.value = 0;
    }
    if (count.value == 0) {
      pool1.play(accentSound!);
    } else {
      pool1.play(normalSound!);
    }
    count.value++;
  }

  void start() {}

  void stop() {}
}
