import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SavoryCard extends StatelessWidget {
 
 final String image;
 final String title;
 final double price;
 
   SavoryCard({
    required this.image,
    required this.title,
    required this.price,
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
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Image.asset(image,
                
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 5),
                    child: Text(title,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                                      fontFamily: kfontFamily,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold
                    
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${'R\$' + price.toStringAsFixed(2)}', 
                        style: TextStyle(
                          fontSize: 16,
                           fontFamily: kfontFamily,
                                            color: Colors.green,
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          ],
        ),
      ),
    );
  }
}


List<SavoryCard> listSavory = [
  SavoryCard(image: 'assets/images/esfiha.png', title: 'Esfirra de Frango',price: 6.50,),
  SavoryCard(image: 'assets/images/esfiha.png', title: 'Esfirra de Carne',price: 6.50,),
  SavoryCard(image: 'assets/images/coxinha.png', title: 'Coxinha de Frango', price: 5.00),
  SavoryCard(image: 'assets/images/coxinha.png', title: 'Coxinha de Frango/Catupiry', price: 5.50),
  SavoryCard(image: 'assets/images/espetinho.png', title: 'Espetinho de Frango', price: 5.50),
  SavoryCard(image: 'assets/images/espetinho.png', title: 'Espetinho de Frango/Queijo', price: 7.50),
  SavoryCard(image: 'assets/images/assadofrango.png', title: 'Pastel assado Frango/Catupiry', price: 6.50),
  SavoryCard(image: 'assets/images/assadocarne.png', title: 'Assado de Carne', price: 5.00),
  SavoryCard(image: 'assets/images/hamburguer.png', title: 'Hamburguer assado', price: 7.50),
  SavoryCard(image: 'assets/images/tortafrango.png', title: 'Torta de Frango/Catupiry', price: 7.00),
  SavoryCard(image: 'assets/images/joelho.png', title: 'Joelho de Moça Presunto/Queijo', price: 6.50),
  SavoryCard(image: 'assets/images/paoqueijo.png', title: 'Pão de Queijo', price: 3.00),
  SavoryCard(image: 'assets/images/pastelcarne.png', title: 'Pastel Carne', price: 5.00),
  SavoryCard(image: 'assets/images/pastelqueijo.png', title: 'Pastel Queijo', price: 5.00),
  SavoryCard(image: 'assets/images/pastelpizza.png', title: 'Pastel Pizza', price: 5.00),
  SavoryCard(image: 'assets/images/croquete.png', title: 'Croquete', price: 5.00),
  SavoryCard(image: 'assets/images/salsicha.png', title: 'Enrolado Salsicha', price: 5.00),
  SavoryCard(image: 'assets/images/enroladinhoqueijo.png', title: 'Enrolado Queijo', price: 5.00),
  SavoryCard(image: 'assets/images/pastelportugues.png', title: 'Pastel Português', price: 5.00),
  SavoryCard(image: 'assets/images/quibe.png', title: 'Quibe', price: 5.00),
];