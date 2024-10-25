import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  String? id;
  double? value;
  List<String>? itens;
  
  String? name;
  bool? orderAccepeted;
  String? email;
  String? phone;
  String? hourToSnack;
  

  Orders({this.id, this.itens, this.value, this.name, this.orderAccepeted, this.email, this.phone, this.hourToSnack,});


  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('order/$id');


   Orders.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document['name'] as String;
    orderAccepeted = document['status'] as bool;
    itens = List<String>.from(document['itens'] as List<dynamic>);
    value = double.parse(document['amount']);
    phone = document['phone'] as String;
    
    hourToSnack = document['hour'] as String;
    
  }



    Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }
 

  Map<String, dynamic> toMap(){
    return {
      
      'amount' : value.toString(),
      'itens' : itens,
      'status' : orderAccepeted ?? false,
      'name' : name,
      'phone' : phone,
      'hour': hourToSnack,
      
    };
  }

}