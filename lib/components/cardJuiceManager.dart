import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:lanchonete_app/models/juice.dart';
import 'package:lanchonete_app/models/savory.dart';
import 'package:provider/provider.dart';

class CardJuiceManager extends StatefulWidget {
  
  String? id;
  String? image;
  double price;
  String? description;
 
  
  CardJuiceManager({
    
    this.id,
    this.image,
    required this.price,
    this.description,
   
    
    super.key});

  @override
  State<CardJuiceManager> createState() => _CardJuiceManagerState();
}

class _CardJuiceManagerState extends State<CardJuiceManager> {
  bool select = false;



  


@override
  Widget build(BuildContext context) {

   final data = Provider.of<AppManager>(context);
  
    changeSelect(){
      setState(() {
         select = !select;
     
      });
     
       var itemJuice = Juice(
        
        id : this.widget.id,
        image : this.widget.image,
        price : this.widget.price,
        description: this.widget.description,
        selectJuice: select,
      );

      if(select){
      data.insertItemJuice( juice: itemJuice);

      } else {
        data.deleteJuice(itemJuice.id!);
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
