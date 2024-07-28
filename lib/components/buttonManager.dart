import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:lanchonete_app/screens/sectionsManagerScreen.dart';
import 'package:provider/provider.dart';

class ButtonManager extends StatelessWidget {
  
  String? image;
  VoidCallback? function;

 
  ButtonManager({this.image, this.function});

  @override
  Widget build(BuildContext context) {

  
    

    

   
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 110,
          width: 110,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(image!,
            
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all( 
              color: Colors.black
            ), 
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



