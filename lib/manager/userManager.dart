

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/helpers/firebase_errors.dart';
import 'package:lanchonete_app/helpers/statusMessage.dart';
import 'package:lanchonete_app/models/userProfile.dart';
import 'package:provider/provider.dart';

class UserManager extends ChangeNotifier {

  

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> singIn({required UserProfile user, required BuildContext context}) async {

    try {
      final UserCredential result =  await auth.signInWithEmailAndPassword(email: user.email!, password: user.password!);

    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Login Efetuado com sucesso!');
    } on FirebaseAuthException catch (e){
      
      
      StatusMessage(statusSucces: false).showMySnackBar(context: context, msg: getErrorString(e));
    }
  }
    
  
}