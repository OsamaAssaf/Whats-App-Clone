import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'modules/authinticate/policy_agree_page.dart';
import 'shared/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xff0a6850),
        ),
        textTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
        ),
      ),
      home: const PolicyAgree(),
    );
  }
}
