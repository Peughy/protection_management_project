import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/commons/navigation_page.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/constants/string.dart';
import 'package:protection_management_project/src/features/validate_project/validate_project.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // media size
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: pad, vertical: pad*2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(protectMain), width: 250, height: 250,),
            SizedBox(
              width: mediaSize.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(mainColor),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(btnPad)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)))
                ),
                onPressed: (){
                  NavigationPage.changePage(context, const ValidateProject());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(btnStartPage, style: GoogleFonts.roboto(color: whiteColor, fontSize: btnStartPageText, fontWeight: FontWeight.bold)),
                  SizedBox(width: btnSpaceStartPage,),
                  FaIcon(FontAwesomeIcons.arrowRight, color: whiteColor, size: iconSizeStartPage,)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}