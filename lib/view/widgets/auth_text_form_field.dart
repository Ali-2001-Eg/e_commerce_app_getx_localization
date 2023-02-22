import 'package:e_commerce_app_with_firebase/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/theme.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Function(String?) validator;
  final IconData prefixIcon;
  final String hint;
  final IconData suffixIcon;
  final bool hasSuffix;
  final Function()? onSuffixTap;

  const AuthTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    required this.textInputType,
    required this.validator,
    required this.prefixIcon,
    required this.hint,
    this.onSuffixTap,
    this.suffixIcon = Icons.remove_red_eye,
    this.hasSuffix = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: Icon(
          prefixIcon,
          size: 18,
          color: mainColor,
        ),
        suffixIcon: IconButton(
            onPressed: onSuffixTap,
            icon: hasSuffix ? Icon(suffixIcon) : Container()),
        label: Text(hint,style: GoogleFonts.lato(textStyle:  const TextStyle(

          fontSize: 15,
        )),),
        hintText: hint,
        hintStyle:  GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(5)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
