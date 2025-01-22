import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';


class StatusMessage {

  bool statusSucces = false;

  StatusMessage({required this.statusSucces});

  
    
      void showMySnackBar({required BuildContext context, required String msg}) {
        final overlayState = Overlay.of(context);

        final overlayEntry = OverlayEntry(builder: (context) => Positioned(
          bottom: 20.0,
          
          child: Material(
                color: statusSucces ? Colors.green : Colors.red,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25, right: 25),
                    child: Text(msg,
                    style: TextStyle( 
                      color: Colors.white,
                      fontFamily: kfontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  ),
                  ),
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0), 
    
  ),
    
          )
          ),
        );
    
  
  
  
  overlayState.insert(overlayEntry);

    // Schedule removal after 4 seconds
    Future.delayed(const Duration(seconds: 3), () => overlayEntry.remove());
}
}