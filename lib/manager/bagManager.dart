import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/bagCart.dart';

class BagManager extends ChangeNotifier{

  List<BagCart> listiItems = [];

  
  
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
  }

  void removeFromBag(String id){
    listiItems.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  somarPrices(){
    double total = 0;
    
    listiItems.forEach((e) {
      total += e.price * e.quantity;
      
     });
     notifyListeners();
    return total.toString();
  }

  void addQuantity(String id){
    var indice = listiItems.indexWhere((e) => e.id == id);
    if(indice != -1){
      listiItems[indice].quantity++;
      
    }
    notifyListeners();
  }

  void removeQuantity(String id){
    var indice = listiItems.indexWhere((e) => e.id == id);
    if(indice != -1 && listiItems[indice].quantity > 1){
      listiItems[indice].quantity--;
    }
    notifyListeners();

  }
}