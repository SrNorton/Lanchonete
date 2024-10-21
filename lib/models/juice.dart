import 'package:cloud_firestore/cloud_firestore.dart';

class Juice{
  
  String? id;
  String? image;
  String? description;
  double? price;
  bool? selectJuice = false;


  Juice({this.id, this.image, this.description, this.price, this.selectJuice});


 
  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('juice/$id');

 


  Juice.fromDocument(DocumentSnapshot document){
    id = document.id;
    image = document['image'];
    description = document['description'];
    price = double.parse(document['price']);
  }


   Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }
 

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'image' : image,
      'description' : description,
      'price': price.toString()
    };
  }





 

}



