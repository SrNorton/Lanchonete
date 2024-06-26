



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/helpers/firebase_errors.dart';
import 'package:lanchonete_app/helpers/statusMessage.dart';
import 'package:lanchonete_app/models/userProfile.dart';
import 'package:provider/provider.dart';

class UserManager extends ChangeNotifier {

  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? firebaseUser;
  UserProfile? user;


  bool isLoading = false;


  setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }

 


  //LOGIN
  Future<void> singIn({required email, required password, required BuildContext context}) async {
    setLoading(true);

    try {
      final UserCredential result =  await auth.signInWithEmailAndPassword(email: email!, password: password!);

      await _loadCurrentUser(firebaseUser: result.user);

      
      

    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Login Efetuado com sucesso!');

    } on FirebaseAuthException catch (e){
      
      
      StatusMessage(statusSucces: false).showMySnackBar(context: context, msg: getErrorString(e));
    }
    setLoading(false);
  }



  //REGISTER
  Future<void> signUp({required UserProfile user ,required BuildContext context}) async {
    setLoading(true);
    try {
        final UserCredential result = await auth.createUserWithEmailAndPassword(
      email: user.email as String,
      password: user.password as String);

      firebaseUser = result.user;

      user.id = result.user!.uid;

      await user.saveData();

    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Cadastro Efetuado com sucesso!');


    } on FirebaseAuthException catch (e) {
      
      StatusMessage(statusSucces: false).showMySnackBar(context: context, msg: getErrorString(e));
      
    }
    setLoading(false);
  }


  Future<void> _loadCurrentUser({User? firebaseUser}) async {
      final User? currentUser = firebaseUser ?? await auth.currentUser;
      if(currentUser != null){
       final DocumentSnapshot docUser = await firestore.collection('users').doc(currentUser.uid).get();

       user = UserProfile.fromDocument(docUser);
      }
      notifyListeners();
  }
    
  
}