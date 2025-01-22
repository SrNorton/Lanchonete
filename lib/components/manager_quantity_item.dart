import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class managerQuantityItem extends StatefulWidget {

  String id;
  String quantity;


 managerQuantityItem({
  required this.id, required this.quantity,
    super.key,
  });

  @override
  State<managerQuantityItem> createState() => _managerQuantityItemState();
}

class _managerQuantityItemState extends State<managerQuantityItem> {
  @override
  Widget build(BuildContext context) {

   var _quantity = context.watch<BagManager>().getQuantity(widget.id);

    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        IconButton(icon: Icon(Icons.add_circle, color: Colors.blue,), onPressed: (){ 
          context.read<BagManager>().addQuantity(widget.id);
           setState(() {
        
      });
          
        }
        
         
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Text(_quantity.toString(),
          style: TextStyle(
            fontSize: 18,
          ),
          ),
        ),
       IconButton(icon: Icon(Icons.remove_circle,color: Colors.blue,), onPressed: (){
                    context.read<BagManager>().removeQuantity(widget.id);

           setState(() {
        
      });
       
       }
        
         
       
       ,),
      ],),
    );
  }
}