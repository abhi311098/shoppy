import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDesign extends StatelessWidget {
  String? text;
  double? fontSize;
  int? maxLines;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;

  TextDesign(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textScaleFactor: 0.85,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 100,
      style: GoogleFonts.lato(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
      ),
    );
  }
}
