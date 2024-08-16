import 'package:cloud_firestore/cloud_firestore.dart';


class Savory{
  
  String? id;
  String? image;
  String? description;
  double? price;
  bool? selectSavory = false;


  Savory({this.id, this.image, this.description, this.price, this.selectSavory});


 
  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('stove/$id');

 


  Savory.fromDocument(DocumentSnapshot document){
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





 // DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('stove/$image');

  // Future<void> saveData() async {
  //   await firestoreRef.set(toMap());
    
  // }

}

List<Savory> listCardSavoryManager = [
  Savory(id:'hgnos27592', image: 'assets/images/esfiha.png',price: 6.50, description: 'Esfirra de Frango',),
  Savory(id: 'hsmcg83927',image: 'assets/images/esfiha.png',price: 6.50, description: 'Esfirra de Carne',),
  Savory(id: 'lsdkj83463',image: 'assets/images/coxinha.png',price: 5.00, description: 'Coxinha de Frango', ),
  Savory(id: 'bdhsj27364',image: 'assets/images/coxinha.png',price: 5.50, description: 'Coxinha de Frango/Catupiry', ),
  Savory(id: 'A2B5C7D9E1',image: 'assets/images/espetinho.png',price: 5.00, description: 'Espetinho de Frango', ),
  Savory(id: 'F3G8H1J4K0',image: 'assets/images/espetinho.png',price: 7.50, description: 'Espetinho de Frango/Queijo', ),
  Savory(id: 'L5M9N2O6P7',image: 'assets/images/assadofrango.png',price: 6.50, description: 'Pastel assado Frango/Catupiry', ),
  Savory(id: 'Q8R1S4T0U9',image: 'assets/images/assadocarne.png',price: 5.00, description: 'Assado de Carne', ),
  Savory(id: 'V3W7X0Y5Z2',image: 'assets/images/hamburguer.png',price: 7.50, description: 'Hamburguer assado', ),
  Savory(id: 'K3A8B2C7D9',image: 'assets/images/tortafrango.png',price: 7.00, description: 'Torta de Frango/Catupiry', ),
  Savory(id: 'F5G1H4J0E6',image: 'assets/images/joelho.png',price: 6.50, description: 'Joelho de Moça Presunto/Queijo',),
  Savory(id: 'L9M2N7O8P1',image: 'assets/images/paoqueijo.png',price: 3.00, description: 'Pão de Queijo', ),
  Savory(id: 'Q4R0S5T1U9',image: 'assets/images/pastelcarne.png',price: 5.00, description: 'Pastel Carne', ),
  Savory(id: 'V8W3X1Y7Z6',image: 'assets/images/pastelqueijo.png',price: 5.00, description: 'Pastel Queijo', ),
  Savory(id: 'M3N8O2P7Q1',image: 'assets/images/pastelpizza.png',price: 5.00, description: 'Pastel Pizza', ),
  Savory(id: 'R5S1T4U9V0',image: 'assets/images/croquete.png',price: 5.00, description: 'Croquete', ),
  Savory(id: 'W7X2Y8Z3A6', image: 'assets/images/salsicha.png',price: 5.00, description: 'Enrolado Salsicha', ),
  Savory(id: 'B5C1D4E9F0', image: 'assets/images/enroladinhoqueijo.png',price: 5.00, description: 'Enrolado Queijo', ),
  Savory(id: 'G7H2I8J3K6',image: 'assets/images/pastelportugues.png',price: 5.00, description: 'Pastel Português', ),
  Savory(id: 'JKR435TH37',image: 'assets/images/quibe.png',price: 5.00, description: 'Quibe', ),
];