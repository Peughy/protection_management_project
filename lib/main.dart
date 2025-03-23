import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protection_management_project/firebase_options.dart';
import 'package:protection_management_project/src/constants/color.dart';
import 'package:protection_management_project/src/constants/notifier.dart';
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
    return ValueListenableBuilder(valueListenable: isDarkModeNotifier, builder: (context, isDark, child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: isDark ? ColorScheme.dark().copyWith(
          primary: mainColor
        ) : ColorScheme.light().copyWith(
          primary: mainColor
        ),
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light
      ),
      home: const SigninPage(),
    );
    },);
  }
}
