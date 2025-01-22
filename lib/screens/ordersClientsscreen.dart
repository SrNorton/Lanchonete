import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/buttomConfirmOrder.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/appManager.dart';
import 'package:lanchonete_android_project/models/order.dart';

import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();


  
}

class _OrdersScreenState extends State<OrdersScreen> {

    final FirebaseFirestore firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> stoveStream = firestore.collection('order').snapshots();

    return Scaffold(
       appBar: AppBar( 
        title: Text( 
          'Pedidos Clientes',
          style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: stoveStream,
         builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text('Error');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator(
            color: ktextGreen,
          );
        }

        final List<Orders> orderList = snapshot.data!.docs.map((DocumentSnapshot document) {
        // Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Orders.fromDocument(document);
      }).toList();

        return  ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: orderList.length,
                        itemBuilder: (context, index){
                          return CardClientOrder(
                            id: orderList[index].id,
                            name: orderList[index].name,
                            itens: orderList[index].itens,
                            orderStatus: orderList[index].orderAccepeted,
                            price: orderList[index].value.toString(),
                            hourToSnack: orderList[index].hourToSnack,
                            phone: orderList[index].phone
                          );
                        });
          
         
        
       },
         ),
    );
  }
}





class CardClientOrder extends StatefulWidget {
  String? id;
  String? name;
  List<String>? itens;
  bool? orderStatus = false;
  String? price;
  String? hourToSnack;
  String? phone;


  CardClientOrder({
    super.key,
    this.id,
    this.name,
    this.itens,
    this.orderStatus,
    this.price,
    this.hourToSnack,
    this.phone,
  });

  @override
  State<CardClientOrder> createState() => _CardClientOrderState();
}

class _CardClientOrderState extends State<CardClientOrder> {

  
  @override
  Widget build(BuildContext context) {

    changeOrderStatus(){
    setState(() {
      widget.orderStatus = !widget.orderStatus!;
    });

  }

    return Column( 
      children: [ 
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
          child: Container(
            height: 410,
            width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration( 
            
              border: Border.all(
              color: Colors.red,
              width: 2
                ),
          ),
          child: Column( 
            children: [ 
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Icon(Icons.person, 
                    size: 50,
                    color: Colors.black,
                    ),
                    SizedBox(width: 30,),
                    Text(widget.name!,
                    style: TextStyle( 
                     fontSize: 26,
                     fontFamily: kfontFamily,
                     fontWeight: FontWeight.bold,
        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 160,
                  
                  child: ListView.builder(
                    itemCount: widget.itens!.length,
                    itemBuilder: (context, index) => TextDescriptionItemOrder(
                      title: widget.itens![index],
                    )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row( 
                  children: [ 
                  Icon(Icons.alarm,
                  size: 35,
                  ),
                  Text(widget.hourToSnack!,
                  style: TextStyle( 
                         fontSize: 35,
                         fontFamily: kfontFamily,
                         fontWeight: FontWeight.bold,
                                  ),
                  ),
                  SizedBox(width: 113,),
                  Icon(Icons.attach_money,
                  size: 35,
                  color: ktextGreen,
                  ),
                  Text(widget.price!,
                   style: TextStyle( 
                         fontSize: 35,
                         color: ktextGreen,
                         fontFamily: kfontFamily,
                         fontWeight: FontWeight.bold,
                                  ),
                  )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 12),
                child: Row(children: [ 
                   Icon(Icons.phone,
                  size: 18,
                  ),
                  Text(widget.phone!, 
                  style: TextStyle( 
                    color: Colors.blue,
                    fontSize: 18
                  ),
                  ),
                  SizedBox(width: 47,),
                  ButtomConfirmOrder(
                    title: 'OK',
                    color: widget.orderStatus! ? Colors.green : Colors.red,
                    function: () async {
                      changeOrderStatus();
                      await context.read<AppManager>().acceptOrder(widget.id!, widget.orderStatus ?? false);
                    },
                  ),
                ],),
              ),
            ],
          ),
          ),
        ),
       
        
      ],
    );
  }
}

class TextDescriptionItemOrder extends StatelessWidget {

  String? title;
  TextDescriptionItemOrder({
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(title!,
         style: TextStyle( 
         fontSize: 22,
         fontFamily: kfontFamily,
         fontWeight: FontWeight.bold,
                  ),
        ),
      ),
    );
  }
}