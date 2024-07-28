import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/buttom.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/helpers/validators.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:lanchonete_app/models/userProfile.dart';
import 'package:lanchonete_app/screens/registerScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
 
  final _formKey = GlobalKey<FormState>();
    
   final TextEditingController _emailController = TextEditingController();
   final  TextEditingController _passController = TextEditingController();


   




  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column( 
        children: [ 
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Image.asset('assets/images/logowhite.png',
              height: 231,
              width: 230,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration( 
                color: kbaseColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                )
              ),
              child: Form(
                key: _formKey,
                child: Consumer<UserManager>(
                  builder: (_, userManager, __){ 
                    return Column( 
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, right: 50, left: 50, bottom: 50),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        enabled: !userManager.isLoading,
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
                    Padding(
                      padding: const EdgeInsets.only( right: 50, left: 50, bottom: 65),
                      child: TextFormField(
                        enabled: !userManager.isLoading,
                        obscureText: true,
                        controller: _passController,
                        validator: (value){ 
                           if(value == null || value.isEmpty){return 'Inserir sua senha!';}
                          if(value.length > 8){return 'A senha possui 8 dígitos';}
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          
                          labelText: 'Senha',
                          
                          border: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(40)
                          )
                        ),
                        
                      ),
                    ),
                    userManager.isLoading ? CircularProgressIndicator(
                      color: Colors.white,

                    ) :
                    Buttom(
                      title:  'Entre',
                    color: KbuttomAccentColor,

                      function: (){
                         
                        if(_formKey.currentState!.validate()){
                          userManager.signIn(
                         email: _emailController.text,
                         password: _passController.text,
                         context: context,
                           
                          );
                        }
                        
                  
                      
                      }
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 8, bottom: 8),
                     child: Center(
                       child: const Text('Ou',
                        style: TextStyle(
                          fontFamily: kfontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black
                        ),
                        ),
                     ),
                   ),
                    userManager.isLoading ? CircularProgressIndicator(
                      color: Colors.white,
                      
                    ) :
                   Buttom(
                    title: 'Cadastre-se', 
                    color: KbuttomAccentColor,
                    function: (){ 
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder:(context) {
                          return RegisterScreen();
                        },)
                      );

                     
                    }
                    ),
                  ],
                  );
                  })
              ),
            )),
        ],
      ),
    );
  }
}

