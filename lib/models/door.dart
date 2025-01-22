import 'package:cloud_firestore/cloud_firestore.dart';

class Door {
  bool? isOpen;

  Door.fromDocument(DocumentSnapshot data){
    isOpen = data['status'];
  }

  
}