import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/bagCart.dart';

class BagManager extends ChangeNotifier{

  List<BagCart> listiItems = [];

  
  
  int _inithours = 0;
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
    listiItems.add(items);
    somarPrices();
  }

  void removeFromBag(String id){
    listiItems.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  somarPrices(){
    double total = 0;
    
    listiItems.forEach((e) {
      total += e.price;
      
     });
     notifyListeners();
    return total.toString();
  }

  void totalBag(){
    double total = 0;
  }

}