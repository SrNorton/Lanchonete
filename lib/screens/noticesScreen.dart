import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text( 
          'Avisos',
          style: TextStyle( 
            fontSize: 26,
            fontFamily: kfontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
            child: Container(
              child: TextFormField(
                decoration: InputDecoration( 
                  contentPadding: EdgeInsets.all(16),
                   enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                   ),
                ),
                maxLines: 2,
              ),
              height: 200,
              width: 400,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black
                ),
              ),
            ),
          ),
          Container(
                    height: 85,
                    width: MediaQuery.of(context).size.width - 45,
                    decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(50),
            color: kRedButtonColor,
            
                    ),
                    child: Center(
            child: Text('Enviar',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 20,
              fontFamily: kfontFamily,
              fontWeight: FontWeight.bold,
            ),
            ),
                    ),
                  ),
                  SizedBox(height: 110,),
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/images/megaphone.png'),
                  )
        ],
      ),
    );
  }
}