import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class JuiceCard extends StatelessWidget {
  const JuiceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 142,
      child: Center(
        child: Column( 
         
          children: [ 
            Image.asset('assets/images/acerola.png',
            height: 100,
            width: 100,
            ),
             SizedBox(height: 10,),
        
            Text('Acerola',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: ktextGreen,
            ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration( 
        color: Colors.transparent,
      ),
    );
  }
}