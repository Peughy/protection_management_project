import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SnackbarWidget {
  String text;
  SnackbarWidget({required this.text});

  dynamic snackbarWidget(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: SelectableText(
          showCursor: true,
          text,
          style: GoogleFonts.roboto(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        )));
  }
}
