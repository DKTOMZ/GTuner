import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_signup/screens/field_widgets.dart';
import 'package:login_signup/control/auth/auth_control.dart';
import 'package:login_signup/screens/reset_password.dart';
import 'package:login_signup/screens/signup.dart';

import '../control/screen_functions/unfocus.dart';

class Login extends GetWidget<AuthController> {
  Login({Key? key}) : super(key: key);

  final TextEditingController _loginemailcontroller = TextEditingController();
  final TextEditingController _loginpasswordcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocusKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: homeColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Text(
                  'Learn Guitar the Fun Way!',
                  style: TextStyle(color: Colors.amber.shade600, fontSize: 22),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image(
                    image: AssetImage('images/logos.png'),
                    height: 220,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: controller.loginFormkey,
                  child: Column(
                    children: [
                      CommonTxtField(
                        text: 'Enter email',
                        icon: Icons.person_outline,
                        isPass: false,
                        controller: _loginemailcontroller,
                        validator: controller.emailValidator,
                        inputaction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTxtField(
                        text: 'Enter password (length: 6 or more)',
                        icon: Icons.lock_outline,
                        isPass: true,
                        controller: _loginpasswordcontroller,
                        validator: controller.passwordValidator,
                        inputaction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              TextButton(
                onPressed: () {
                  controller.isValid = false;
                  Get.to(() => ResetPassword());
                },
                child: Text(
                  'Forgot Password?',
                  selectionColor: Colors.amber,
                  style: TextStyle(color: Colors.amber.shade700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommonButton(
                btntext: 'LOGIN',
                onPressed: () {
                  unfocusKeyboard(context);
                  controller.login(_loginemailcontroller.text,
                      _loginpasswordcontroller.text);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              signUp(controller),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                  onPressed: () {
                    controller.googleSignIn();
                  },
                  icon: const FaIcon(FontAwesomeIcons.google),
                  color: Colors.white,
                  iconSize: 40,
                  tooltip: 'Google sign in',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  color: Colors.blue,
                  iconSize: 40,
                  tooltip: 'Facebook sign in',
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row signUp(controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Dont have an account? ',
        style: TextStyle(color: Colors.white70),
      ),
      TextButton(
        onPressed: () {
          controller.isValid = false;
          Get.to(() => SignUp());
        },
        child: Text(
          'SIGNUP',
          selectionColor: Colors.amber,
          style: TextStyle(color: Colors.amber.shade700),
        ),
      ),
    ],
  );
}
