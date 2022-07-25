import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:get/get.dart';
import 'package:GTuner/control/auth/info_widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';

class TunerController extends GetxController {
  final _audioCapture = FlutterAudioCapture();
  final pitchDetector = PitchDetector(16000, 2000);
  final pitchHandler = PitchHandler(InstrumentType.guitar);
  var note = ''.obs;
  var status = 'Play something'.obs;
  var frequency = 0.0.obs;
  var diff = 0.0.obs;

  @override
  void onClose() async {
    await _audioCapture.stop();
    super.onClose();
  }

  ///Start recording audio
  Future<void> recordAudio() async {
    if (await Permission.microphone.request().isGranted ||
        await Permission.microphone.request().isLimited) {
      await _audioCapture.start(listener, onError,
          sampleRate: 16000, bufferSize: 2000);
    } else {
      InteractiveWidget(
          title: 'Permission failure',
          info: 'Please allow mic permission in app settings to tune guitar',
          buttonAction: () {
            Get.back();
          },
          titleColor: Colors.red);
    }
  }

  ///listen's for audio stream
  void listener(o) {
    var buffer = Float64List.fromList(o.cast<double>());
    final List<double> audioSample = buffer.toList();

    final result = pitchDetector.getPitch(audioSample);

    if (result.pitched) {
      final handledResult = pitchHandler.handlePitch(result.pitch);

      note.value = handledResult.note;
      frequency.value = handledResult.expectedFrequency;
      diff.value = handledResult.diffFrequency.truncateToDouble();
      status.value = handledResult.tuningStatus
          .toString()
          .replaceFirst('TuningStatus.', '');
    }
  }

  void onError(e) {}
}
