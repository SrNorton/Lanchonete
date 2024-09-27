import 'package:flutter/material.dart';
import 'package:lanchonete_app/Utils/statusMessage.dart';
import 'package:lanchonete_app/components/bagCart.dart';
import 'package:lanchonete_app/manager/bagManager.dart';
import 'package:lanchonete_app/models/savory.dart';
import 'package:provider/provider.dart';

class CardClientChoice extends StatefulWidget {
  
  final String? id;
  final String? image;
  final double price;
  final String? description;
  
 
  
  CardClientChoice({
    
    this.id,
    this.image,
    required this.price,
    this.description,
    
   
    
    super.key});

  @override
  State<CardClientChoice> createState() => _CardSavoryManagerState();
}

class _CardSavoryManagerState extends State<CardClientChoice> {
  bool select = false;

    
 


  


@override
  Widget build(BuildContext context) {

   
  
    changeSelect(){
      setState(() {
         select = !select;

     
      });
     
       var item = BagCart(
        
        id: this.widget.id,
        image : this.widget.image,
        price : this.widget.price,
        name: this.widget.description,
        quantity: 1,
      );

      if(select){
        StatusMessage(statusSucces: true).showMySnackBar(
        context: context, msg: 'Adicionado à sacola');
        context.read<BagManager>().addToBag(item);
     
      } else {
        
      }

     

    }

   
       
    

    



    return GestureDetector(
      onTap: changeSelect,
        
       
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                height: 110,
                width: 110,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(widget.image!,
                  
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all( 
                    color: select ? Colors.green : Colors.grey,
                    width: select ? 3 : 1,
                  ), 
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  height: 110,
                  width: 110,
                  child: Center(
                    child: Text(widget.description!,
                          softWrap: true,
                                  
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
