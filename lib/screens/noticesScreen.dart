import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/buttomSaveNotices.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/appManager.dart';

import 'package:provider/provider.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {

  TextEditingController _textNoticesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


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
      body: Form(
        key: _formKey,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Container(
                child: TextFormField(
                  validator: (value){
                    if (value!.length > 27) {
                      return 'Escreva uma mensagem mais curta!!';
                    }
                    return null;
                  },
                  controller: _textNoticesController,
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
            ButtonSaveNotices(
              function: () async {
                if(_formKey.currentState!.validate()){
               await context.read<AppManager>().createNotices(_textNoticesController.text, context);

                }
                _textNoticesController.clear();
              },
            ),
                    SizedBox(height: 110,),
                    Container(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/megaphone.png'),
                    )
          ],
        ),
      ),
    );
  }
}

