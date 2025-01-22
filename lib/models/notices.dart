import 'package:cloud_firestore/cloud_firestore.dart';

class Notices {
  String? mensage;
 
  Notices.fromDocument(DocumentSnapshot data){
    mensage = data['mensage'];
  }
}