
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lanchonete_android_project/manager/appManager.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:lanchonete_android_project/manager/paymentManager.dart';
import 'package:lanchonete_android_project/manager/userManager.dart';
import 'package:lanchonete_android_project/screens/after_sales_screen.dart';
import 'package:lanchonete_android_project/screens/loginScreen.dart';


import 'package:provider/provider.dart';

Future<void> main() async {

await dotenv.load(fileName: ".env",);
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   
  
  runApp(const MyApp());


  
  
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
            ),
          ChangeNotifierProvider(
            create: (_)=> BagManager(),
            lazy: false,
            ),
          ChangeNotifierProvider(
            create: (_)=> MercadoPagoService(),
            lazy: false,
            )
       
         
      ],
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lanchonete',
        theme: ThemeData(
        
          
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

