import 'package:GTuner/control/home/screen_functions/unfocus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/auth/auth_control.dart';
import 'field_widgets.dart';

final TextEditingController resetpassemailcontroller = TextEditingController();

class ResetPassword extends GetWidget<AuthController> {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocusKeyboard(context);
      },
      child: WillPopScope(
        onWillPop: () async {
          controller.isValid = false;
          return true;
        },
        child: Scaffold(
          backgroundColor: homeColor,
          appBar: AppBar(
            backgroundColor: homeColor,
            shadowColor: Colors.transparent,
            title: const Text('Forgot Password'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.resetpasswordFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTxtField(
                    text: 'Enter registered email address',
                    icon: Icons.person_outline,
                    isPass: false,
                    controller: resetpassemailcontroller,
                    validator: controller.emailValidator,
                    inputaction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonButton(
                      btntext: 'RESET PASSWORD',
                      onPressed: () {
                        controller.resetPassword(
                          resetpassemailcontroller.text,
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
