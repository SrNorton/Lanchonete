import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class JuiceCard extends StatelessWidget {
  final String? id;
  final String name;
  final String image;
  final double price;
  final String? description;
  
  
  JuiceCard({
    this.id,
    required this.name,
    required this.image,
    required this.price,
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
  JuiceCard(id: 'A1B2C3D4',name: 'Acerola', image: 'assets/images/acerola.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'Z9Y8X7W6',name: 'Abacaxi', image: kimageAbacaxi, description: 'Com água', price: 5.50),
  JuiceCard(id: '5F4E3D2C',name: 'Caju', image: 'assets/images/cajue.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'M3N4P5Q6',name: 'Maracuja', image: 'assets/images/maracuja.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'R7S8T9U0',name: 'Morango', image: 'assets/images/morangos.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'V2W3X4Y5',name: 'Goiaba', image: 'assets/images/goiaba.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'B5C6D7E8',name: 'Manga', image: 'assets/images/manga.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'F1G2H3J4',name: 'Graviola', image: 'assets/images/graviola.png', description: 'Com água', price: 5.50),
  JuiceCard(id: 'VK9L8M7N6',name: 'Limão', image: 'assets/images/limoes.png', description: 'Com água', price: 5.50),

  JuiceCard(id: '7Q2X9P8Y',name: 'Acerola', image: 'assets/images/acerola.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'B3Z5T8V1',name: 'Abacaxi', image: kimageAbacaxi, description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'F9H4K2M6',name: 'Caju', image: 'assets/images/cajue.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'R1W5E9A3',name: 'Maracuja', image: 'assets/images/maracuja.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'D7G2J4L6',name: 'Morango', image: 'assets/images/morangos.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'S0U5N1M4',name: 'Goiaba', image: 'assets/images/goiaba.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'X2C8F1V5',name: 'Manga', image: 'assets/images/manga.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'P6T0H3R9',name: 'Graviola', image: 'assets/images/graviola.png', description: 'Com Leite', price: 6.50),
  JuiceCard(id: 'Z4B8D1W6',name: 'Limão', image: 'assets/images/limoes.png', description: 'Com Leite', price: 6.50),



];