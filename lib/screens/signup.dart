import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:GTuner/screens/field_widgets.dart';
import 'package:GTuner/control/auth/auth_control.dart';
import '../control/screen_functions/unfocus.dart';

class SignUp extends GetWidget<AuthController> {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _signupemailcontroller = TextEditingController();
  final TextEditingController _signuppasswordcontroller =
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
            title: const Text('Sign Up'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTxtField(
                    text: 'Enter email address',
                    icon: Icons.person_outline,
                    isPass: false,
                    controller: _signupemailcontroller,
                    validator: controller.emailValidator,
                    inputaction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTxtField(
                    text: 'Enter Password',
                    icon: Icons.lock_outline,
                    isPass: true,
                    controller: _signuppasswordcontroller,
                    validator: controller.passwordValidator,
                    inputaction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonButton(
                      btntext: 'SIGNUP',
                      onPressed: () {
                        unfocusKeyboard(context);
                        controller.createUser(_signupemailcontroller.text,
                            _signuppasswordcontroller.text);
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
