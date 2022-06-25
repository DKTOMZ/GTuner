import 'package:get/get.dart';

import '../tuner/tuner.dart';
import 'auth_control.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<TunerController>(TunerController());
  }
}
