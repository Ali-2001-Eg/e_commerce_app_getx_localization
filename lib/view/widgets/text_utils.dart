import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool underlined;
  final TextOverflow textOverFlow;
  const TextUtils(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.underlined = false,
      this.textOverFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverFlow,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        decoration: underlined ? TextDecoration.underline : TextDecoration.none,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,

      )),
    );
  }
}
