import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/models/notices.dart';

class AppManager extends ChangeNotifier{ 

  AppManager(){
    _readNotices();
  }


  String? notices;

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

}