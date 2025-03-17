import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/size.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    return Form(child: ListView(
        padding: EdgeInsets.all(12),
        children: [
          SizedBox(height: pad,),
          Align(
            alignment: Alignment.center,
            child: Text("AJOUT DE PROJET", style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold, color: mainColor),)),
          SizedBox(height: pad,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Veuillez completer ce champs";
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
              hintText: "Entrez le nom du projet",
              hintStyle: TextStyle(),
              labelText: "Entrez le nom du projet",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius)
              ),
          )),
           SizedBox(height: pad,),
          TextFormField(
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Veuillez completer ce champs";
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
              hintText: "Entrez la description du projet",
              hintStyle: TextStyle(),
              labelText: "Entrez la description du projet",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius)
              ),
          )),
          SizedBox(height: pad,),
          InputDatePickerFormField(
            initialDate: DateTime.now(),
            fieldHintText: "Entrez la date de debut du projet",
            fieldLabelText: "Entrez la date de debut du projet",
            firstDate: DateTime(2024), lastDate: DateTime(2027)),
          SizedBox(height: pad,),
          InputDatePickerFormField(
            fieldHintText: "Entrez la date de fin du projet",
            fieldLabelText: "Entrez la date de fin du projet",
            firstDate: DateTime(2024), lastDate: DateTime(2027)),
          SizedBox(height: pad,),
          SizedBox(width: MediaQuery.of(context).size.width,
          child: ElevatedButton(onPressed: (){},
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
            backgroundColor: WidgetStatePropertyAll(mainColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)))),
           child: Text("AJOUTER", style: GoogleFonts.montserrat(fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold),)),)
        ],
      ));
  }
}