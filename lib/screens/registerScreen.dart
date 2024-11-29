import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/Utils/validators.dart';
import 'package:lanchonete_android_project/components/buttom.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/userManager.dart';
import 'package:lanchonete_android_project/models/userProfile.dart';

import 'package:provider/provider.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RegisterScreen extends StatelessWidget {
  
   


  final _formKey = GlobalKey<FormState>();
    
    final TextEditingController _nameController = TextEditingController();
    var _phoneController = new MaskedTextController(mask: '(00)000000000');
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();


  @override
  Widget build(BuildContext context) {

  



    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column( 
        children: [ 
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('assets/images/logowhite.png',
                height: 201,
                width: 200,
                ),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Consumer<UserManager>(
                    builder: (_, usermanager, __){
                      return Column( 
                    children: [
                      
                      
                      //NAME **********


                      Padding(
                        padding: const EdgeInsets.only(top: 60, right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          enabled: !usermanager.isLoading,
                          validator: (value){
                            if(value == null || value.isEmpty){return 'Informe o seu nome!';}
                            if(value.length > 10){return 'O nome deve ter 10 caracteres ou menos';}
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            
                            labelText: 'Name',
                            hintText: 'Seu primeiro nome',
                            border: OutlineInputBorder( 
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                        ),
                      ),

                      //PHONE 

                      Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          enabled: !usermanager.isLoading,
                          
                          validator: (value){
                           if(phoneValid(value!)
                           )
                            return 'EX (31)xxxxxxxxx!';
                           return null;
                          },
                          controller: _phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            
                            labelText: 'Phone',
                            hintText: '(xx)xxxxxxxxx',
                            border: OutlineInputBorder( 
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                        ),
                      ),

                      //EMAIL 

                       Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          enabled: !usermanager.isLoading,
                          
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

                      //PASSWORD 

                      Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          obscureText: true,
                          enabled: !usermanager.isLoading,

                          controller: _passController,
                          validator: (value){ 
                             if(value == null || value.isEmpty){return 'Inserir sua senha!';}
                            if(value.length < 6){return 'A senha deve conter no mínimo 6 dígitos';}
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

                      //CONFIRM

                       Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          enabled: !usermanager.isLoading,

                          obscureText: true,
                          validator: (value){
                            if(value == null || value.isEmpty){return 'Confirme a senha';}
                            if(_passController.text != _confirmController.text){return 'As senhas não são iguais!';}
                            return null;
                          },
                          controller: _confirmController,
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
                        usermanager.isLoading ? CircularProgressIndicator(
                      color: Colors.white,

                    ) :
                     
                     Buttom(
                      title: 'Cadastre-se', 
                    color: KbuttomAccentColor,

                      function: (){
                        if(_formKey.currentState!.validate()){
                          var user = UserProfile(
                            
                            name: _nameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            password: _passController.text,
                            confirmPass: _confirmController.text,
                            isAdmin: false
                          );
                          usermanager.signUp(user: user, context: context);
                        }
                        
                  
                      }
                      ),
                    ],
                    );
                    }
                    )
                ),
              ),
            )),
        ],
      ),
    );
  }
}

