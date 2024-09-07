import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/prepareCard.dart';
import 'package:lanchonete_app/components/savoryCard.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/appManager.dart';
import 'package:lanchonete_app/models/savory.dart';
import 'package:provider/provider.dart';

class SavoryScreen extends StatelessWidget {
  const SavoryScreen({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {




   

   

    return Column(
      children: [
      
         
         Container(
    
          height: 300,
          width: MediaQuery.of(context).size.width - 25,
          decoration: BoxDecoration(
            color: kcontrastColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Estufa',
                     style: TextStyle(
                color: kbaseColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: kfontFamily
                              ),
                    ),
                  
                  ],
                ),
              ),
                SizedBox(height: 30,),
                    SizedBox(
                      height: 162,
                      child: _buildSavorylist()
                    )
            ],
          ),
         ),
         SizedBox(height: 35,),
         PrepareCard(
          image: 'assets/images/lanche.png',
          width: 250,
          function: (){
            
            context.read<AppManager>().openSavoryModalbottom(context, true);
          } 
         ),
         Padding(
           padding: const EdgeInsets.only(left: 16),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text('Avisos',
               
               style: TextStyle(
                color: kbaseColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: kfontFamily
               ),),
             ],
           ),
         ),
         Consumer<AppManager>(
          builder: (_, appmanager,__){
            return Container(
          height: 100,
          width: 380,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
             border: Border.all(
          color: kbaseColor,
        ),
          ),
          child: Center(
            child: Text(appmanager.notices ?? 'Os avisos estão sendo carregados...',
            style: TextStyle( 
              color: kbaseColor,
              fontSize: 16,
              fontFamily: kfontFamily,
              fontWeight: FontWeight.bold
            
            ),
            ),
          ),
         );
          }
          ),
      ],
      
      
    );

    
  }
    Widget _buildSavorylist(){

          final FirebaseFirestore firestore = FirebaseFirestore.instance;


    Stream<QuerySnapshot> stoveStream = firestore.collection('stove').snapshots();


    return StreamBuilder(
      stream: stoveStream,
       builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text('Error');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator(
            color: ktextGreen,
          );
        }

        final List<Savory> savoryList = snapshot.data!.docs.map((DocumentSnapshot document) {
        // Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Savory.fromDocument(document);
      }).toList();

        return  ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: savoryList.length,
                        itemBuilder: (context, index){
                          return SavoryCard(
                            image: savoryList[index].image!,
                            title: savoryList[index].description!,
                            price: savoryList[index].price,
                            );
                        });
          
         
        
       },
       );
  }

  
  
}

