import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lanchonete',
      theme: ThemeData(
      
        
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

