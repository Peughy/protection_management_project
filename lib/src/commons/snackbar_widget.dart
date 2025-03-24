import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SnackbarWidget {
  String text;
  Color? color = Colors.red;
  SnackbarWidget({required this.text, this.color});

  dynamic snackbarWidget(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: SelectableText(
          showCursor: true,
          text,
          style: GoogleFonts.roboto(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        )));
  }
}
