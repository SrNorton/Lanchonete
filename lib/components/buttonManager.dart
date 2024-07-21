import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:provider/provider.dart';

class ButtonManager extends StatelessWidget {
  int? index;
  String? image;
  Future? function;

 
  ButtonManager({this.index, this.image, this.function});

  @override
  Widget build(BuildContext context) {

   final data = Provider.of<UserManager>(context);

    switch (index) {
      case 0:
        function = data.openDoor();
        break;
      default:
        function = data.loadAllRequests();
    }

    

   
    return GestureDetector(
      onTap: () async {
        await function;
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 110,
          width: 110,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(image!,
            
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all( 
              color: Colors.black
            ), 
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

List<ButtonManager> buttonsManagerList = [ 
  ButtonManager(image: 'assets/images/door.png',),
  ButtonManager(image: 'assets/images/tasks.png',),
  ButtonManager(image: 'assets/images/megaphone.png',),
];

