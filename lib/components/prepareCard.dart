import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';

class PrepareCard extends StatelessWidget {

  final String image;
  final double width;
  final VoidCallback function;
  PrepareCard({
    required this.image,
    required this.width,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: function,
            child: Container(
             height: 55,
             width: 140,
             child: Center(
               child: Text('Preparar',
               style: TextStyle(
                 fontFamily: kfontFamily,
                 color: Colors.white,
                 fontSize: 22,
                 fontWeight: FontWeight.bold
               ),
               ),
             ),
             decoration: BoxDecoration(
               color: KbuttomColor,
               borderRadius: BorderRadius.circular(35),
             ),
            ),
          ),
          Expanded(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                 child: Image.asset(image,
                 
                 width: width,
                 ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

