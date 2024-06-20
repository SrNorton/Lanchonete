import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class Buttom extends StatelessWidget {
 
  String title;
  VoidCallback function; 
   Buttom({
   required this.title,
   required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 300,
        height: 65,
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(40),
          color: KbuttomAccentColor,
        ),
        child: Center(
          child: Text(title,
          style: TextStyle( 
            color: Colors.white,
            fontSize: 30,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}