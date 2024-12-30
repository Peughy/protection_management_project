import 'package:flutter/material.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/image.dart';
import 'package:protection_management_project/src/constants/size.dart';
import 'package:protection_management_project/src/constants/string.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  final  _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(pad),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 32,),
              Image(image: AssetImage(protectMain), width: 150, height: 150,),
               SizedBox(height: 100,),
              Text(textSigninPage, style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: mainColor),),
               SizedBox(height: pad,),
              Form(child: Column(
                key: _formKey,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Veuillez completer ce champs";
                      }
                      return null;
                    },
                    style: TextStyle(),
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Entrez votre adresse mail",
                      hintStyle: TextStyle(),
                      prefixIcon: Icon(Icons.mail),
                      labelText: "Entrez votre adresse mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius)
                      ),
                  )),
                   SizedBox(height: pad,),
                   TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: mdpController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Veuillez completer ce champs";
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      hintText: "Entrez votre mot de passe",
                      hintStyle: TextStyle(),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Entrez votre mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius)
                      ),
                  )),
                  SizedBox(height: pad,), 
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(mainColor),
                        padding: WidgetStatePropertyAll(const EdgeInsets.all(12)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)))
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){

                        }
                      }, child: Text("CONNEXION", style: TextStyle(color: whiteColor, fontSize: btnStartPageText),)),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}