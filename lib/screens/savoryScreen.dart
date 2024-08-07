import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/prepareCard.dart';
import 'package:lanchonete_app/components/savoryCard.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:provider/provider.dart';

class SavoryScreen extends StatelessWidget {
  const SavoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
         
         Container(
    
          height: 300,
          width: MediaQuery.of(context).size.width - 25,
          decoration: BoxDecoration(
            color: kcontrastColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Estufa',
                     style: TextStyle(
                color: kbaseColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: kfontFamily
                              ),
                    ),
                  
                  ],
                ),
              ),
                SizedBox(height: 30,),
                    SizedBox(
                      height: 162,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listSavory.length,
                        itemBuilder: (context, index){
                          return SavoryCard(
                            image: listSavory[index].image, 
                            title: listSavory[index].title,
                            price: listSavory[index].price,
                            );
                        }),
                    )
            ],
          ),
         ),
         SizedBox(height: 35,),
         PrepareCard(
          image: 'assets/images/lanche.png',
          width: 250,
         ),
         Padding(
           padding: const EdgeInsets.only(left: 16),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text('Avisos',
               
               style: TextStyle(
                color: kbaseColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: kfontFamily
               ),),
             ],
           ),
         ),
         Consumer<AppManager>(
          builder: (_, appmanager,__){
            return Container(
          height: 100,
          width: 380,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
             border: Border.all(
          color: kbaseColor,
        ),
          ),
          child: Center(
            child: Text(appmanager.notices ?? 'Os avisos estão sendo carregados...',
            style: TextStyle( 
              color: kbaseColor,
              fontSize: 16,
              fontFamily: kfontFamily,
              fontWeight: FontWeight.bold
            
            ),
            ),
          ),
         );
          }
          ),
      ],
      
    );
  }
}

