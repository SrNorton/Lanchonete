import 'package:flutter/material.dart';

class StatusMessage {

  bool statusSucces = false;

  StatusMessage({required this.statusSucces});
    
      void showMySnackBar({required BuildContext context, required String msg}) {
  final snackBar = SnackBar(
    backgroundColor: statusSucces ? Colors.green : Colors.red,
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0), 
  ),
    content: Text(msg),
  
  );
   Duration(seconds: 4);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
}