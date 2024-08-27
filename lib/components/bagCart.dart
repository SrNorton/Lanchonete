import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class BagCart extends StatefulWidget {

  String? name;
  String? image;
  String? time;
  String? price;
  

   BagCart({
    this.name, this.image, this.time, this.price, 
    super.key,
  });

  @override
  State<BagCart> createState() => _BagCartState();
}

class _BagCartState extends State<BagCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 30),
      child: Container(
        height: 220,
        width: 450,
        decoration: BoxDecoration( 
          color: kCardBagcolor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Container(
                height: 106,
                width: 115,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
    
                  child: Image.asset(widget.image!),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 25),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text( 
                      widget.name!,
                      style: TextStyle( 
                        fontFamily: kfontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/clock.png'),
                        ),
                        Text('15:30',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        ),
                      
                      ],
                    ),
                      SizedBox(height: 50,),
                        Text('Pedido Aceito',
                        style: TextStyle( 
                          fontFamily: kfontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                        ),
                        )
                  ],
                ),
              )),
          ],
        ),
      ),
    );
  }
}