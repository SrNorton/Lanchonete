import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/cardJuiceManager.dart';
import 'package:lanchonete_app/components/juiceCard.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:provider/provider.dart';

class JuiceManagerScreen extends StatefulWidget {
  const JuiceManagerScreen({super.key});

  @override
  State<JuiceManagerScreen> createState() => _JuiceManagerScreenState();
}

class _JuiceManagerScreenState extends State<JuiceManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text( 
          'Gerencie as bebidas',
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
                itemCount: listJuice.length,
               itemBuilder: (context, index) {
                 return   CardJuiceManager(
                  
                  id: listJuice[index].id,
                  image: listJuice[index].image,
                  description: listJuice[index].name,
                  price: listJuice[index].price,
                  
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