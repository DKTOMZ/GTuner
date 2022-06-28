import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:GTuner/control/auth/info_widgets.dart';
import 'package:GTuner/screens/home/home.dart';
import 'package:GTuner/screens/login.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  final String defaultStatus = 'No User';

  String? get user {
    if (_auth.currentUser == null) {
      return defaultStatus;
    } else {
      return _auth.currentUser!.email;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();
  final GlobalKey<FormState> loginFormkey = GlobalKey();
  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final GlobalKey<FormState> resetpasswordFormKey = GlobalKey();
  bool isValid = false;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) {
      isValid = false;
      return 'Email is empty';
    }
    if (!email.isEmail) {
      isValid = false;
      return 'Email is invalid';
    }
    if (email.isNotEmpty || email.isEmail) {
      isValid = true;
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      isValid = false;
      return 'Password is empty';
    }
    if (password.length < 6) {
      isValid = false;
      return 'Password is less than 6 characters';
    }
    if (password.isNotEmpty || password.length > 6) {
      isValid = true;
    }
    return null;
  }

  Future<void> createUser(String email, String password) async {
    if (!signupFormKey.currentState!.validate()) return;
    LoadingWidget(info: 'Registering...').alertDialog;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      await _auth.currentUser!
          .sendEmailVerification()
          .then((value) => InteractiveWidget(
                  title: 'Signup successful',
                  info: 'Check email for verification, then login',
                  buttonAction: () async {
                    await _auth.signOut();
                    Get.back();
                    Get.back();
                  },
                  titleColor: Colors.amber.shade700)
              .alertDialog);
    } on FirebaseAuthException catch (e) {
      InteractiveWidget(
              title: 'Sign up error',
              info: e.message.toString(),
              buttonAction: () {
                Get.back();
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    }
    isValid = false;
  }

  Future<void> login(String email, String password) async {
    if (!loginFormkey.currentState!.validate()) return;
    LoadingWidget(info: 'Logging in...').alertDialog;

    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (_auth.currentUser!.emailVerified) {
        Get.offAll(const Home());
      } else {
        await _auth.signOut();
        InteractiveWidget(
                title: 'Login error',
                info: 'Verify your email',
                buttonAction: () {
                  Get.back();
                  Get.back();
                },
                titleColor: Colors.red)
            .alertDialog;
      }
    } on FirebaseAuthException catch (e) {
      InteractiveWidget(
              title: 'Login error',
              info: e.message.toString(),
              buttonAction: () {
                Get.back();
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    }
    isValid = false;
  }

  Future<void> resetPassword(String email) async {
    if (!resetpasswordFormKey.currentState!.validate()) return;
    LoadingWidget(info: 'Sending reset link...').alertDialog;
    try {
      await _auth
          .sendPasswordResetEmail(email: email.trim())
          .then((value) => InteractiveWidget(
                  title: '!Password Reset email sent!',
                  info: 'Please check your email to reset password',
                  buttonAction: () async {
                    Get.back();
                    Get.back();
                  },
                  titleColor: Colors.amber.shade700)
              .alertDialog);
    } on FirebaseAuthException catch (e) {
      InteractiveWidget(
              title: 'Reset Password error',
              info: e.message.toString(),
              buttonAction: () {
                Get.back();
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    }
    isValid = false;
  }

  Future<void> signOut() async {
    if (_auth.currentUser!.providerData[0].providerId == 'google.com') {
      try {
        await _googleSignIn.disconnect();
      } catch (e) {
        InteractiveWidget(
            title: 'Logout error',
            info: e.toString(),
            buttonAction: () {
              Get.back();
            },
            titleColor: Colors.red);
      }
    }
    try {
      await _auth.signOut().then((value) => Get.offAll(Login()));
    } catch (e) {
      InteractiveWidget(
          title: 'Log out error',
          info: e.toString(),
          buttonAction: () {
            Get.back();
          },
          titleColor: Colors.red);
    }
  }

  Future<void> googleSignIn() async {
    final googleUser = await _googleSignIn.signIn().catchError((e) {
      InteractiveWidget(
              title: 'Google Signin error',
              info: 'Check network connection',
              buttonAction: () {
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    });

    final googleAuth = await googleUser!.authentication.catchError((e) {
      InteractiveWidget(
              title: 'Google Signin error',
              info: 'Check network connection',
              buttonAction: () {
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    });

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    LoadingWidget(info: 'Logging in...').alertDialog;

    try {
      await _auth
          .signInWithCredential(credential)
          .then((value) => Get.offAll(const Home()));
    } on FirebaseAuthException catch (e) {
      InteractiveWidget(
              title: 'Google Signin error',
              info: e.message.toString(),
              buttonAction: () {
                Get.back();
                Get.back();
              },
              titleColor: Colors.red)
          .alertDialog;
    }
  }
}
