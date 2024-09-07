import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/components/editHours.dart';
import 'package:lanchonete_app/components/editMinutes.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/bagManager.dart';
import 'package:provider/provider.dart';

class BagCart extends StatefulWidget {

  String? id;
  String? name;
  String? image;
  String? time;
  double price;
  
  

   BagCart({
    this.id, this.name, this.image, this.time,required this.price,
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
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/clock.png'),
                        ),
                        SizedBox(width: 8,),
                        
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context,
                            barrierDismissible: false,
                             builder: (BuildContext context){
                              
                              return Container(
                                child: AlertDialog( 
                                  title:  Text('Escolha o horário para lanchar',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                          ),
                          ),  
                          actions: [ 
                            EditHours(),
                            SizedBox(height: 15,),
                            EditMinutes(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ 
                                GestureDetector(
                                  onTap: (){
                                     Navigator.pop(context);
                                  },
                                  child: Text('OK',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blue
                                  ),
                                  ),
                                ),
                               
                              ],
                            ),
                            
                          ],
                                ),
                              );
                             });
                          },
                          child: Text('Escolha seu horário',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                          ),
                          ),
                        ),
                      
                      ],
                    ),
                      SizedBox(height: 24,),
                     
                        GestureDetector(
                          onTap: (){
                            context.read<BagManager>().removeFromBag(widget.id!);
                          },
                          child: 
                          Text('Remover item',
                          style: TextStyle( 
                            fontFamily: kfontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red
                          ),
                          ),
                        ),
                        
                  ],
                ),
              )),
          ],
        ),
      ),
    );
  }
}