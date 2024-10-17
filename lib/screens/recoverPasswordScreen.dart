import 'package:flutter/material.dart';
import 'package:lanchonete_app/Utils/validators.dart';
import 'package:lanchonete_app/components/buttom.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:provider/provider.dart';

class RecoverPasswordScreen extends StatelessWidget {
  RecoverPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

   final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column( 
          children: [ 
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 60, right: 60),
              child: Text('Ops! Esqueceu sua senha? Informe seu email para redefinir!',
              style: TextStyle( 
                fontFamily: kfontFamily,
                fontSize: 30,
                color: Colors.black
              ),
              ),
            ),
              Padding(
                        padding: const EdgeInsets.only(top: 60, right: 50, left: 50, bottom: 50),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          
                          validator: (value){
                           if(!emailValid(value!))
                           return 'E-mail inválido';
                           return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            
                            labelText: 'Email',
                            
                            border: OutlineInputBorder( 
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                        ),
                      ),
                      Consumer<UserManager>(
                        builder: (_, usermanager, __){
                          return  Buttom(title: 'Enviar',
                         function: () async {
                             if(_formKey.currentState!.validate()){
                              await usermanager.sendPasswordResetEmail(_emailController.text);

                              Navigator.of(context).pop();
                        
                          }
                        }, color: Colors.blue);
                        },
                        
                      )
          ],
        ),
      ),
    );
  }
}