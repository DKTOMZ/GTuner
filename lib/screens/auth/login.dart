import 'package:GTuner/control/home/screen_functions/unfocus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:GTuner/screens/auth/field_widgets.dart';
import 'package:GTuner/control/auth/auth_control.dart';
import 'package:GTuner/screens/auth/reset_password.dart';
import 'package:GTuner/screens/auth/signup.dart';

final TextEditingController loginemailcontroller = TextEditingController();
final TextEditingController loginpasswordcontroller = TextEditingController();

class Login extends GetWidget<AuthController> {
  const Login({Key? key}) : super(key: key);

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
                        controller: loginemailcontroller,
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
                        controller: loginpasswordcontroller,
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
                  Get.to(() => const ResetPassword());
                },
                child: Text(
                  'Forgot Password?',
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
                  controller.login(
                      loginemailcontroller.text, loginpasswordcontroller.text);
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
          Get.to(() => const SignUp());
        },
        child: Text(
          'SIGNUP',
          style: TextStyle(color: Colors.amber.shade700),
        ),
      ),
    ],
  );
}
