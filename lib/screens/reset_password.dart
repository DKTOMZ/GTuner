import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/screens/login.dart';

import '../const & control/auth/auth_control.dart';
import 'field_widgets.dart';

class ResetPassword extends GetWidget<AuthController> {
  ResetPassword({Key? key}) : super(key: key);

  final TextEditingController _resetpassemailcontroller =
      TextEditingController();

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
                    controller: _resetpassemailcontroller,
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
                          _resetpassemailcontroller.text,
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
