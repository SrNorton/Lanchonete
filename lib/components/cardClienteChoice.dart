import 'package:flutter/material.dart';
import 'package:lanchonete_app/helpers/statusMessage.dart';
import 'package:lanchonete_app/models/savory.dart';

class CardClientChoice extends StatefulWidget {
  
  final String? id;
  final String? image;
  final double? price;
  final String? description;
  
 
  
  CardClientChoice({
    
    this.id,
    this.image,
    this.price,
    this.description,
    
   
    
    super.key});

  @override
  State<CardClientChoice> createState() => _CardSavoryManagerState();
}

class _CardSavoryManagerState extends State<CardClientChoice> {
  bool select = false;

    OverlayEntry?  _overlayEntry;
 


  


@override
  Widget build(BuildContext context) {

   
  
    changeSelect(){
      setState(() {
         select = !select;

     
      });
     
       var itemSavory = Savory(
        
        id : this.widget.id,
        image : this.widget.image,
        price : this.widget.price,
        description: this.widget.description,
        selectSavory: select,
      );

      if(select){
        StatusMessage(statusSucces: true).showMySnackBar(
        context: context, msg: 'Adicionado à sacola');
        
     
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
