import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SavoryCard extends StatelessWidget {
 
 String? image;
 String? title;
 
   SavoryCard({
    this.image,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 35),
      child: Container(
        height: 160,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                radius: 50,
                child: Image.asset('assets/images/esfiha.png'),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: Text('Esfiha de Frango',
                    style: TextStyle(
                      fontSize: 20,
                                      fontFamily: kfontFamily,
                                      color: Colors.green,
                    
                    ),
                    ),
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}