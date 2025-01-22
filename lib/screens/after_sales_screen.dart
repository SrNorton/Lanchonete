import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/buttom.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/screens/homeScreen.dart';
import 'package:lanchonete_android_project/screens/pageView.dart';

class AfterSales extends StatefulWidget {
  const AfterSales({super.key});

  @override
  State<AfterSales> createState() => _AfterSalesState();
}

class _AfterSalesState extends State<AfterSales> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column( 
        children: [ 
          SizedBox(height: 300,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 200,
              child: Image.asset('assets/images/coxinha_feliz.png'),
            ),
          ),
          SizedBox(height: 30,),

          Center(
            child: Text('Obrigado por lanchar com a gente!!',
            style: TextStyle(
                              fontFamily: kfontFamily,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
            ),
          ),
          SizedBox(height: 50,),

          Buttom(title: 'Voltar', function: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> PageViewManager()));
          }, color: kbaseColor)
        ],
      ),
    );
  }
}