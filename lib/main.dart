import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:lanchonete_app/screens/bagScreen.dart';

import 'package:lanchonete_app/screens/homeScreen.dart';
import 'package:lanchonete_app/screens/loginScreen.dart';
import 'package:lanchonete_app/screens/noticesScreen.dart';
import 'package:lanchonete_app/screens/pageView.dart';
import 'package:lanchonete_app/screens/profileScreen.dart';
import 'package:lanchonete_app/screens/registerScreen.dart';
import 'package:lanchonete_app/screens/sectionsManagerScreen.dart';
import 'package:lanchonete_app/screens/stoveManagerScreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());


  // FirebaseFirestore.instance.collection('pedidos').add({'name': 'Glauber'});
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (_)=> UserManager(),
          lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_)=> AppManager(),
            lazy: false,
            )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lanchonete',
        theme: ThemeData(
        
          
          useMaterial3: true,
        ),
        home: StoveManagerScreen(),
      ),
    );
  }
}

