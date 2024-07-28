import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/buttom.dart';
import 'package:lanchonete_app/components/buttonManager.dart';
import 'package:lanchonete_app/components/cardSavoryManager.dart';
import 'package:lanchonete_app/components/savoryCard.dart';
import 'package:lanchonete_app/constants/constants.dart';

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

      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          SizedBox(height: 120,),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
          child: Container(
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
               itemBuilder: (BuildContext context, int index){
                return CardSavoryManager(
                  image: listCardSavoryManager[index].image,
                  description: listCardSavoryManager[index].description,
                  select: listCardSavoryManager[index].select,
                );
               }
               ),
          ),
        ),
        Buttom(title: 'ATUALIZAR', function: (){}, color: Colors.red)
        ],
      ),
    );
  }
}