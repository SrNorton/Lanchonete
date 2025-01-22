import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/bagCart.dart';
import 'package:lanchonete_android_project/models/order.dart';

class BagManager extends ChangeNotifier{

   

  List<BagCart> listiItems = [];

  
  double? totalPrice;
  int _inithours = 5;
  int _initMinutes =0;

  int get hours {
    return _inithours;
  }

  int get minutes {
    return _initMinutes;
  }


  addHours(){
    _inithours++;
    notifyListeners();
  }

  removeHours(){
    _inithours --;
    notifyListeners();
  }

  addMinutes(){
    _initMinutes ++;
    notifyListeners();
  }

  removeMinutes(){
    _initMinutes --;
    notifyListeners();
  }

  void addToBag(BagCart items){
    int indice = listiItems.indexWhere((produto) => produto.id == items.id);

    if(indice != -1){
      listiItems[indice].quantity++;
    } else {
      listiItems.add(items);
    }
    
    somarPrices();
    notifyListeners();

  }

  void removeFromBag(String id){
    listiItems.removeWhere((e) => e.id == id);
    somarPrices();
    notifyListeners();
  }

  somarPrices()  {
    double total = 0;
    
    listiItems.forEach((e) {
      total += e.price * e.quantity;

      
     });
     totalPrice = total;
     notifyListeners();
    return total;
  }

  void addQuantity(String id){
    var indice = listiItems.indexWhere((e) => e.id == id);
    if(indice != -1){
      listiItems[indice].quantity++;
      
    }
    somarPrices();
    notifyListeners();
  }



  void removeQuantity(String id){
    var indice = listiItems.indexWhere((e) => e.id == id);
    if(indice != -1 && listiItems[indice].quantity > 1){
      listiItems[indice].quantity--;
    }
    somarPrices();
    notifyListeners();

  }

  int getQuantity(String id) {
  
  var indice = listiItems.indexWhere((e) => e.id == id);
  if (indice != -1) {
   
    return listiItems[indice].quantity;
  }
  
  return 0;
}

  Future<void> saveOrderToFirebase(Orders order) async {
    try {
     await order.saveData();
     print('order salve into firebase');
    } catch (e) {
      print('error salve order type $e');
    }
  }

}