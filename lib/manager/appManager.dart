

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/cardClienteChoice.dart';
import 'package:lanchonete_app/components/juiceCard.dart';
import 'package:lanchonete_app/constants/constants.dart';
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


  openSavoryModalbottom(BuildContext context, bool savory){
    showModalBottomSheet(context: context, builder: (context){
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  Text(savory ? 'Selecione seu salgado' : 'Selecione sua bebida',
                  textAlign: TextAlign.left,
                  style: TextStyle( 
                    fontFamily: kfontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  ),
                SizedBox(height: 30,),
                Expanded(
                  child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9, 
                  mainAxisSpacing: 50
                  ),
                  itemCount: savory ? listCardSavoryManager.length : listJuice.length,
                                 itemBuilder: (context, index) {
                   return savory ?  CardClientChoice(
                    
                    id: listCardSavoryManager[index].id,
                    image: listCardSavoryManager[index].image,
                    description: listCardSavoryManager[index].description,
                    price: listCardSavoryManager[index].price,
                    
                    
                  ) : CardClientChoice(
                    id: listJuice[index].id,
                    image: listJuice[index].image,
                    description: listJuice[index].description,
                    price: listJuice[index].price,

                  );
                                 },
                                
                                 
                  
                                 
                                 ),
                ),
                ],
              ),
            ),
          ),
          );
    });
  }

 


}