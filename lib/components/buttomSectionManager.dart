import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class ButtonSectionManager extends StatelessWidget {
  String? title;
  VoidCallback? function;
  
  ButtonSectionManager({
    this.title, this.function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
        child: Container(
          child: Center(
            child: Text(title!,
            style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
                      ),
            ),
          ),
          height: 100,
          width: 400,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(25),
              border: Border.all(
        color: Colors.red,
        width: 2
                ),
          ),
        ),
      ),
    );
  }
}