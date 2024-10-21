import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String? id;
  double? value;
  List<String>? itens;
  
  String? name;
  String? email;
  String? phone;
  String? hourToSnack;
  String? minuteToSnack;

  Order({this.id, this.itens, this.value, this.name, this.email, this.phone, this.hourToSnack, this.minuteToSnack});


  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('order/$id');


   Order.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document['name'];
    itens = document['itens'];
    phone = document['phone'];
    email = document['email'];
    hourToSnack = document['hour'];
    minuteToSnack = document['minutes'];
  }



    Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }
 

  Map<String, dynamic> toMap(){
    return {
      
      'amount' : value.toString(),
      'itens' : itens,
      'name' : name,
      'phone' : phone,
      'hour': hourToSnack,
      'minutes' : minuteToSnack
    };
  }

}