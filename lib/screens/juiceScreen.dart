import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_android_project/components/juiceCard.dart';
import 'package:lanchonete_android_project/components/prepareCard.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/appManager.dart';
import 'package:lanchonete_android_project/models/juice.dart';

import 'package:provider/provider.dart';

class JuiceScreen extends StatefulWidget {
  const JuiceScreen({super.key});

  @override
  State<JuiceScreen> createState() => _JuiceScreenState();
}

class _JuiceScreenState extends State<JuiceScreen> {
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
                    Text('Sucos & vitaminas',
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
                      child: _builJuicelist()
                    )
                  
            ],
          ),
         ),
         SizedBox(height: 35,),
         PrepareCard(
          image: 'assets/images/frutas.png',
         width: 240,
         function: (){
            context.read<AppManager>().openSavoryJuiceModalbottom(context, false);

         },
         ),


      ],
    );

    
  }


  // _openSavoryModalbottom(BuildContext context){
  //   showModalBottomSheet(context: context, builder: (context){
  //       return SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height * 0.9,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [ 
  //                 Text('Selecione sua bebida',
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle( 
  //                   fontFamily: kfontFamily,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18
  //                 ),
  //                 ),
  //               SizedBox(height: 30,),
  //               Expanded(
  //                 child: GridView.builder(
  //                               scrollDirection: Axis.vertical,
  //                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 3,
  //                 childAspectRatio: 0.9, 
  //                 mainAxisSpacing: 50
  //                 ),
  //                 itemCount: listJuice.length,
  //                                itemBuilder: (context, index) {
  //                  return   CardClientChoice(
                    
  //                   id: listJuice[index].id,
  //                   image: listJuice[index].image,
  //                   price: listJuice[index].price,

                    
                    
                    
                    
  //                 );
  //                                },
                                
                                 
                  
                                 
  //                                ),
  //               ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         );
  //   });
  // }


   Widget _builJuicelist(){

          final FirebaseFirestore firestore = FirebaseFirestore.instance;


    Stream<QuerySnapshot> stoveStream = firestore.collection('juice').snapshots();


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

        final List<Juice> juiceList = snapshot.data!.docs.map((DocumentSnapshot document) {
        // Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return 
        Juice.fromDocument(document);
      }).toList();

        return  ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: juiceList.length,
                        itemBuilder: (context, index){
                          return JuiceCard(
                            image: juiceList[index].image!,
                            name: juiceList[index].description!,
                            price: juiceList[index].price!,
                            );
                        });
          
         
        
       },
       );
  }

}

