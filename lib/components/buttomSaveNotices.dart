import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';

class ButtonSaveNotices extends StatelessWidget {
  
  VoidCallback function;
  
  ButtonSaveNotices(
    {required this.function,}
    
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
          function,
      
      child: Container(
                height: 85,
                width: MediaQuery.of(context).size.width - 45,
                decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(50),
        color: kRedButtonColor,
        
                ),
                child: Center(
        child: Text('Enviar',
        style: TextStyle( 
          color: Colors.white,
          fontSize: 20,
          fontFamily: kfontFamily,
          fontWeight: FontWeight.bold,
        ),
        ),
                ),
              ),
    );
  }
}