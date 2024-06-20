import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/buttom.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/helpers/validators.dart';

class RegisterScreen extends StatelessWidget {
  

  final _formKey = GlobalKey<FormState>();
    
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    TextEditingController _confirmController = TextEditingController();


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
                  child: Column( 
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          
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
                      Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          
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
                       Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
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
                      Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passController,
                          validator: (value){ 
                             if(value == null || value.isEmpty){return 'Inserir sua senha!';}
                            if(value.length > 8){return 'A senha deve conter 8 dígitos';}
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
                       Padding(
                        padding: const EdgeInsets.only( right: 50, left: 50, bottom: 46),
                        child: TextFormField(
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
                     
                     Buttom(
                      title: 'Cadastre-se', 
                      function: (){
                        if(_formKey.currentState!.validate()){
                          
                        }
                        
                  
                      }
                      ),
                    ],
                    ),
                ),
              ),
            )),
        ],
      ),
    );
  }
}

