import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text( 
          'Sacola',
          style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox( 
            height: 50,
          ),
          Padding(
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

                        child: Image.asset('assets/images/espetinho.png'),
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
                            'Espetinho de Frango',
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
          ),
            Padding(
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
                        child: Image.asset('assets/images/laranja.png'),
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
                            'Suco de Laranja',
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
                    height: 85,
                    width: MediaQuery.of(context).size.width - 45,
                    decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(50),
            color: kRedButtonColor,
            
                    ),
                    child: Center(
            child: Text('Pagar Pix R\$ 10.00',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 20,
              fontFamily: kfontFamily,
              fontWeight: FontWeight.bold,
            ),
            ),
                    ),
                  ),
          ),
        ],
      ),
      
    );
  }
}