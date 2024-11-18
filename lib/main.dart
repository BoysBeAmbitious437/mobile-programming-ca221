import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/animal_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnimalProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manajemen Data Hewan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
