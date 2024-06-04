import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/prepareCard.dart';
import 'package:lanchonete_app/components/savoryCard.dart';
import 'package:lanchonete_app/constants/constants.dart';

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
                    SavoryCard(),
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
         Container(
          height: 100,
          width: 380,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
             border: Border.all(
          color: kbaseColor,
        ),
          ),
          child: Center(
            child: Text('Tem pão de queijo quentinho!',
            style: TextStyle( 
              color: kbaseColor,
              fontSize: 16,
              fontFamily: kfontFamily,
              fontWeight: FontWeight.bold
            
            ),
            ),
          ),
         ),
      ],
      
    );
  }
}

