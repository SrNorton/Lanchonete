import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/juiceCard.dart';
import 'package:lanchonete_app/components/prepareCard.dart';
import 'package:lanchonete_app/constants/constants.dart';

class JuiceScreen extends StatefulWidget {
  const JuiceScreen({super.key});

  @override
  State<JuiceScreen> createState() => _JuiceScreenState();
}

class _JuiceScreenState extends State<JuiceScreen> {
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
                    Text('Sucos & vitaminas',
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
                JuiceCard(),
                  
            ],
          ),
         ),
         SizedBox(height: 35,),
         PrepareCard(image: 'assets/images/frutas.png',
         width: 240,
         ),


      ],
    );

    
  }
}

