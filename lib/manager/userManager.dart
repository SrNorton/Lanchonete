



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lanchonete_android_project/Utils/firebase_errors.dart';
import 'package:lanchonete_android_project/Utils/statusMessage.dart';
import 'package:lanchonete_android_project/models/door.dart';
import 'package:lanchonete_android_project/models/userProfile.dart';
import 'package:lanchonete_android_project/screens/loginScreen.dart';
import 'package:lanchonete_android_project/screens/pageView.dart';

class UserManager extends ChangeNotifier {

  UserManager() {
    _loadCurrentUser();
    checkStatusDoor();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? firebaseUser;
  UserProfile? user;


  bool isLoading = false;
  bool? isOpen = false;
  bool? checkOrderwasAccept = false;
  

  bool get isLoggedIn => user != null;


  setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }

 


  //LOGIN
  Future<void> signIn({required email, required password, required BuildContext context}) async {
    setLoading(true);

    try {
      final UserCredential result =  await auth.signInWithEmailAndPassword(email: email!, password: password!);

      await _loadCurrentUser(firebaseUser: result.user);

      
      

    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Login Efetuado com sucesso!');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> PageViewManager()));

    } on FirebaseAuthException catch (e){
      
      
      StatusMessage(statusSucces: false).showMySnackBar(context: context, msg: getErrorString(e));
    }
    setLoading(false);
  }

  //signout
  Future<void> signOut(BuildContext context) async {
    try {
    await auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));

    print('você se desconectou');
      
    } catch (e) {
      print('erro no signout $e');
    }
     
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
      await _loadCurrentUser(firebaseUser: result.user);


    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Cadastro Efetuado com sucesso!');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> PageViewManager()));



    } on FirebaseAuthException catch (e) {
      
      StatusMessage(statusSucces: false).showMySnackBar(context: context, msg: getErrorString(e));
      
    }
    setLoading(false);
  }

  //LoadUser
  Future<void> _loadCurrentUser({User? firebaseUser}) async {
      final User? currentUser = firebaseUser ?? await auth.currentUser;
      if(currentUser != null){
       final DocumentSnapshot docUser = await firestore.collection('users').doc(currentUser.uid).get();

       user = UserProfile.fromDocument(docUser);
       
      
       final docAdmin = await firestore.collection('admins').doc(user!.id).get();
       if(docAdmin.exists){
        user!.isAdmin = true;
       }
     

      }
      notifyListeners();
  }

  
 



  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
         print('Email de redefinição de senha enviado com sucesso!');
    } on FirebaseAuthException catch (e) {
       print(e.message);
    }
  }




    
  bool get adminEnabled => user != null && user!.isAdmin != null;

  
  
 

  Future<void> checkStatusDoor() async {


   
    await firestore.collection('door').snapshots().listen((snapshot) { 
      for (final DocumentSnapshot doc in snapshot.docs) {
       
        var data = Door.fromDocument(doc);
        isOpen = data.isOpen;


    

      }
      
    });

    
    notifyListeners();
    
  }


  //open door
  Future<void> openDoor(BuildContext context) async {

    try {
        await  firestore.collection('door').doc('AtU8C5OmkJdaJRkKnyws').set({'status': !isOpen!});

    StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'Porta atualizada!');

    } catch (e) {
      
    }
    
  

    

    notifyListeners();

  }

  Future<void> checkOrderStatus() async {
    var id = await user!.id;
    final docOrderStatus = await firestore.collection('order').doc(id).get();
    if(docOrderStatus.exists){
      final Map<String, dynamic> data = docOrderStatus.data() as Map<String, dynamic>;
      checkOrderwasAccept = data['status'];
      print('este é o status do pedido $checkOrderwasAccept');
    }

  }


  Future<void> loadAllRequests(UserProfile user) async {
      await user.saveData();
    
  }
}