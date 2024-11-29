import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/editHours.dart';
import 'package:lanchonete_android_project/components/editMinutes.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class BagCart extends StatefulWidget {

  String? id;
  String? name;
  String? image;
  String? time;
  double price;
  int quantity;
  
  

   BagCart({
    this.id, this.name, this.image, this.time,required this.price, required this.quantity,
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
                          child: Text('Escolher horário',
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
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(icon: Icon(Icons.add_circle, color: Colors.blue,), onPressed: () { 
                      context.read<BagManager>().addQuantity(widget.id!);
                     },),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(widget.quantity.toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      ),
                    ),
                   IconButton(icon: Icon(Icons.remove_circle,color: Colors.blue,), onPressed: () {
                     context.read<BagManager>().removeQuantity(widget.id!);
                   },),
                  ],),
                )
          ],
        ),
      ),
    );
  }
}