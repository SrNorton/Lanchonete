import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:lanchonete_app/models/savory.dart';
import 'package:provider/provider.dart';

class CardSavoryManager extends StatefulWidget {
  
  String? id;
  String? image;
  double price;
  String? description;
 
  
  CardSavoryManager({
    
    this.id,
    this.image,
    required this.price,
    this.description,
   
    
    super.key});

  @override
  State<CardSavoryManager> createState() => _CardSavoryManagerState();
}

class _CardSavoryManagerState extends State<CardSavoryManager> {
  bool select = false;



  


@override
  Widget build(BuildContext context) {

   final data = Provider.of<AppManager>(context);
  
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
      data.insertItemStove(savory: itemSavory);

      } else {
        data.deleteItemStove(itemSavory.id!);
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





   
  







    // Future<void> insertSavoryToStove(Savory savory) async {
    //   try {
       
        
    //   await savory.saveData();
   
        
    //   } catch (e) {
    //     print('ocorreu um erro no arquivo cardsavorymanager $e');
    //   }
    // }

    // Future<void> deleteSavoryFromStove() async {
    //   try {
    //   await firestore.collection('stove').doc(widget.id).delete();
        
    //   } catch (e) {
    //     print('erro ao deletar salgado da estufa $e');
    //   }
    // }

  




