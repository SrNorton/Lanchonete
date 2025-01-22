import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class RemoveFromBagScreen extends StatefulWidget {
  String id;
  
   RemoveFromBagScreen({
    required this.id,
    super.key,
  });

  @override
  State<RemoveFromBagScreen> createState() => _RemoveFromBagScreenState();
}

class _RemoveFromBagScreenState extends State<RemoveFromBagScreen> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { 
        context.read<BagManager>().removeFromBag(widget.id);
        setState(() {
          
        });
        
       },
      child: Text('Remover',
      style: TextStyle( 
      fontFamily: kfontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.red
    
      ),
                           
    ),
    );
  }
}

