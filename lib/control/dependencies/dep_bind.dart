import 'package:GTuner/control/home/tools/metronome/metronome.dart';
import 'package:get/get.dart';

import '../auth/auth_control.dart';
import '../home/tuner/tuner.dart';

///Dependencies injection
class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => TunerController(), fenix: true);
    Get.lazyPut(() => MetronomeController(), fenix: true);
  }
}
