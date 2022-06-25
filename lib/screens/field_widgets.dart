import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signup/control/auth/auth_control.dart';

final Color homeColor = HexColor('#2d585b');

class CommonTxtField extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPass;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputAction inputaction;

  const CommonTxtField(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isPass,
      required this.controller,
      required this.validator,
      required this.inputaction})
      : super(key: key);

  @override
  State<CommonTxtField> createState() => _CommonTxtFieldState();
}

class _CommonTxtFieldState extends State<CommonTxtField> {
  final _authcontrol = Get.find<AuthController>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.inputaction,
      validator: widget.validator,
      onChanged: (text) => setState(() => widget.validator(text)),
      obscureText: widget.isPass ? _isObscure : false,
      autocorrect: true,
      enableSuggestions: !widget.isPass,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Colors.amber.shade600,
          ),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: Icon(
                    _authcontrol.isValid ? Icons.check_circle_sharp : null,
                    color: Colors.amber.shade600),
              ),
              widget.isPass
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.amber.shade600))
                  : const SizedBox(),
            ],
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.amber, width: 2),
          ),
          labelText: widget.text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 0,
              ))),
      keyboardType: widget.isPass
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}

class CommonButton extends StatelessWidget {
  final String btntext;
  final Function() onPressed;

  const CommonButton({
    Key? key,
    required this.btntext,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber.shade700),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black;
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.amber;
              }
              return Colors.amber.shade700;
            }),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        onPressed: onPressed,
        child: Text(
          btntext,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
