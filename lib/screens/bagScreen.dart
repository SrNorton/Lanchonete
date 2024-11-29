
import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/bagCart.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:lanchonete_android_project/manager/paymentManager.dart';
import 'package:lanchonete_android_project/manager/userManager.dart';
import 'package:lanchonete_android_project/models/order.dart';
import 'package:lanchonete_android_project/screens/qrCodeScreen.dart';

import 'package:provider/provider.dart';

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
      body: Consumer2<BagManager, UserManager>(
        builder: (_, bagManager, usermanager,__){
          return Column(
        children: [
          SizedBox( 
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 520,
            child: ListView.builder(
              itemCount: bagManager.listiItems.length,
              itemBuilder: (context, index){
                return BagCart(
                  id: bagManager.listiItems[index].id,
                  name: bagManager.listiItems[index].name,
                  image: bagManager.listiItems[index].image,
                  price: bagManager.listiItems[index].price,
                  quantity: bagManager.listiItems[index].quantity,
                );
              })
          ),
          
         
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              onTap: () async {
                
                 
                var order = Orders(
                  id: usermanager.user!.id,
                  name: usermanager.user!.name ?? '',
                  phone: usermanager.user!.phone ?? '',
                  email: usermanager.user!.email ?? '',
                  value: bagManager.totalPrice,
                  itens: bagManager.listiItems.map((e) => '${e.quantity} - ${e.name ?? ''}').toList(),
                   
                   
                  hourToSnack: '${bagManager.hours.toString()} : ${bagManager.minutes.toString()}',
                  

                );

               await bagManager.saveOrderToFirebase(order);
                await context.read<MercadoPagoService>().criarPagamento(order);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeScreen()));

               
               
              },
              child: Container(
                      height: 85,
                      width: MediaQuery.of(context).size.width - 45,
                      decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(50),
              color: kRedButtonColor,
              
                      ),
                      child: Center(
              child: Text('Pagar Pix  R\$ ${bagManager.somarPrices() ?? '0.0'}',
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
          ),
        ],
      );
        })
      
    );
  }
}

