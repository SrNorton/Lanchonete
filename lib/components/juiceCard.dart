import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class JuiceCard extends StatelessWidget {
  final String? id;
  final String name;
  final String image;
  final String? description;
  
  
  JuiceCard({
    this.id,
    required this.name,
    required this.image,
    this.description,
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
  JuiceCard(id: 'A1B2C3D4',name: 'Acerola', image: 'assets/images/acerola.png', description: 'Com água ou Leite'),
  JuiceCard(id: 'Z9Y8X7W6',name: 'Abacaxi', image: kimageAbacaxi, description: 'Com água ou Leite'),
  JuiceCard(id: '5F4E3D2C',name: 'Caju', image: 'assets/images/cajue.png', description: 'Com água ou Leite'),
  JuiceCard(id: 'G8H7J6K5',name: 'Laranja', image: 'assets/images/laranja.png', description: 'Com água ou Leite'),
  JuiceCard(id: 'M3N4P5Q6',name: 'Maracuja', image: 'assets/images/maracuja.png', description: 'Com água ou Leite'),
  JuiceCard(id: 'R7S8T9U0',name: 'Morango', image: 'assets/images/morangos.png', description: 'Com água ou Leite'),
  JuiceCard(id: 'V2W3X4Y5',name: 'Goiaba', image: 'assets/images/goiaba.png', description: 'Com água ou Leite'),
];