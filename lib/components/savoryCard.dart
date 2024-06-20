import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SavoryCard extends StatelessWidget {
 
 final String image;
 final String title;
 
   SavoryCard({
    required this.image,
    required this.title,
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
                child: Image.asset(image),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: Text(title,
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


List<SavoryCard> listSavory = [
  SavoryCard(image: 'assets/images/esfiha.png', title: 'Esfiha de Frango'),
  SavoryCard(image: 'assets/images/coxinha.png', title: 'Coxinha de Frango'),
  SavoryCard(image: 'assets/images/espetinho.png', title: 'Espetinho de Queijo'),
  SavoryCard(image: 'assets/images/pastelcarne.png', title: 'Pastel de Carne'),
  SavoryCard(image: 'assets/images/assadocarne.png', title: 'Assado de Carne'),
];