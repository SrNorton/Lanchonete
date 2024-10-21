import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/buttomSectionManager.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:lanchonete_app/screens/juiceManagerScreen.dart';
import 'package:lanchonete_app/screens/stoveManagerScreen.dart';
import 'package:provider/provider.dart';

class SectionsManagerScreen extends StatefulWidget {
  const SectionsManagerScreen({super.key});

  @override
  State<SectionsManagerScreen> createState() => _SectionsManagerScreenState();
}

class _SectionsManagerScreenState extends State<SectionsManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar( 
        title: Text( 
          'Gerencie seções',
          style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column( 
        
        children: [ 
          SizedBox(height: 100,),
          ButtonSectionManager(
            title: 'Sucos disponiveis',
              function: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> JuiceManagerScreen()));
            },
          ),
        
          ButtonSectionManager(
            title: 'Estufa',
            function: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StoveManagerScreen()));
            },
          ),

            ButtonSectionManager(
            title: 'Limpar estufa',
              function: () async {
              await context.read<AppManager>().deleteAllStoveItems(context);
            },
          ),

            ButtonSectionManager(
            title: 'Limpar Sucos',
              function: () async {
              await context.read<AppManager>().deleteAllJuicesItems(context);
            },
          ),

        ],
      ),
    );
  }
}

