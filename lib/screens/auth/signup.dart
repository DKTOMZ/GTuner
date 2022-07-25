import 'package:GTuner/control/home/screen_functions/unfocus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:GTuner/screens/auth/field_widgets.dart';
import 'package:GTuner/control/auth/auth_control.dart';

final TextEditingController signupemailcontroller = TextEditingController();
final TextEditingController signuppasswordcontroller = TextEditingController();

class SignUp extends GetWidget<AuthController> {
  const SignUp({Key? key}) : super(key: key);

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
                    controller: signupemailcontroller,
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
                    controller: signuppasswordcontroller,
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
                        controller.createUser(signupemailcontroller.text,
                            signuppasswordcontroller.text);
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
