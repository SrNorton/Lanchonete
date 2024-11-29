import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/cardSavoryManager.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/appManager.dart';
import 'package:lanchonete_android_project/models/savory.dart';

import 'package:provider/provider.dart';

class StoveManagerScreen extends StatefulWidget {
  const StoveManagerScreen({super.key});

  @override
  State<StoveManagerScreen> createState() => _StoveManagerScreenState();
}

class _StoveManagerScreenState extends State<StoveManagerScreen> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar( 
        title: Text( 
          'Gerencie a estufa',
          style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: Consumer<AppManager>(
        builder: (_, appmanager,__){
            return Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          SizedBox(height: 120,),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
          child: 
              Container(
            height: 480,
            width: 400,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9, 
                mainAxisSpacing: 50
                ),
                itemCount: listCardSavoryManager.length,
               itemBuilder: (context, index) {
                 return   CardSavoryManager(
                  
                  id: listCardSavoryManager[index].id,
                  image: listCardSavoryManager[index].image,
                  description: listCardSavoryManager[index].description,
                  price: listCardSavoryManager[index].price,
                  
                );
               },
              
               
                
               
               ),
          ),
            
        ),
        // Buttom(
        //   title:'ATUALIZAR', function: () async {
           
            
        // }, color: Colors.red)
       
        ],
      );
        }
        )
    );
  }
}

