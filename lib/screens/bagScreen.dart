import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/bagCart.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/bagManager.dart';
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
      body: Consumer<BagManager>(
        builder: (_, bagManager,__){
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
                );
              })
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
        ],
      );
        })
      
    );
  }
}

