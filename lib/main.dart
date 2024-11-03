import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/pages/main_page.dart';
import 'package:tugaspertemuan03/resources/colors.dart';
import 'package:tugaspertemuan03/resources/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
