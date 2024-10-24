import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class ButtomConfirmOrder extends StatelessWidget {
 
  String title;
  VoidCallback function; 
  Color color;
   ButtomConfirmOrder({
   required this.title,
   required this.function,
   required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 165,
        height: 50,
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(40),
          color: color,
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