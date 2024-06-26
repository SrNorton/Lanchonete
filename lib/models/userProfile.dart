

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String? id;
   String? name;
   String? phone;
   String? email;
   String? password;
   String? confirmPass;

  UserProfile({this.id, this.name,this.phone,this.email, this.password, this.confirmPass});

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  UserProfile.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document['name'];
    phone = document['phone'];
    email = document['email'];
  }

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'phone' : phone,
      'email' : email,
    };
  }
}