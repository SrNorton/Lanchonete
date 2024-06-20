import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class JuiceCard extends StatelessWidget {
  final String name;
  final String image;
  
  JuiceCard({
    required this.name,
    required this.image,
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
            Image.asset(image,
            height: 100,
            width: 100,
            ),
             SizedBox(height: 10,),
        
            Text(name,
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

List<JuiceCard> listJuice = [
  JuiceCard(name: 'Acerola', image: 'assets/images/acerola.png'),
  JuiceCard(name: 'Abacaxi', image: kimageAbacaxi),
  JuiceCard(name: 'Caju', image: 'assets/images/cajue.png'),
  JuiceCard(name: 'Laranja', image: 'assets/images/laranja.png'),
  JuiceCard(name: 'Maracuja', image: 'assets/images/maracuja.png'),
  JuiceCard(name: 'Morango', image: 'assets/images/morangos.png'),
  JuiceCard(name: 'Goiaba', image: 'assets/images/goiaba.png'),
];