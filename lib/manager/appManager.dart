

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/models/notices.dart';
import 'package:lanchonete_app/models/savory.dart';

class AppManager extends ChangeNotifier{ 

  AppManager(){
    _readNotices();
    
  }


  String? notices;

  bool? loadingAppManager;
  Savory? savory;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  



  Future<void> createNotices(String mensage) async { 
    try {
    await firestore.collection('notices').doc('U3iyDQjawnnLUV6rNU86').update({mensage : mensage});
      
    } catch (e) {
      print('Erro na classe AppManager $e');
    }
  }


  Future<void> _readNotices() async {
    await firestore.collection('notices').snapshots().listen((snapshot) {
      for (DocumentSnapshot doc in  snapshot.docs) {
        var data = Notices.fromDocument(doc);
        notices = data.mensage;
      }
     });
     notifyListeners();
  }


   

  


  Future<void> deleteItemStove(String itemId) async {
    try {
      await firestore.collection('stove').doc(itemId).delete();
      
    } catch (e) {
      print('ocorreu um problema $e');
      
    }
  }


  Future<void> insertItemStove({required Savory savory}) async {
    loadingAppManager = true;
     
     
           try {
      await savory.saveData();
      print('sucesso');
    } catch (e) {
      print('ocorreu um problema $e');
    }
      
    loadingAppManager = false;
  
  
   
  }

 


}