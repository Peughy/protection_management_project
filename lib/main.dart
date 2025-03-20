import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protection_management_project/firebase_options.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/features/auth_manager/signin_page.dart';
import 'package:protection_management_project/src/features/protect_manager/protect_manager.dart';
import 'package:protection_management_project/src/features/validate_project/validate_project.dart';
import 'package:protection_management_project/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protection Management Projects',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark().copyWith(
          primary: mainColor
        ),
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const SigninPage(),
    );
  }
}
