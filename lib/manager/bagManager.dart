import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/bagCart.dart';

class BagManager extends ChangeNotifier{

  List<BagCart> listiItems = [];


  void addToBag(BagCart items){
    listiItems.add(items);
  }

  void totalBag(){
    double total = 0;
  }

}