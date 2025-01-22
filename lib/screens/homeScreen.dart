import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/components/statusDoor.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/screens/bagScreen.dart';
import 'package:lanchonete_android_project/screens/juiceScreen.dart';
import 'package:lanchonete_android_project/screens/savoryScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> tabs = [
    Tab(child: Text('Salgados',
    style: TextStyle( 
      fontFamily: kfontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    )),
    Tab(child: Text('Bebidas',
    style: TextStyle( 
      fontFamily: kfontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    )),
   
  ];


 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Rickelmy Lanches',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: kfontFamily
                  ),
                  ),
          ],
        ),
              actions: [
                 Padding(
                   padding: const EdgeInsets.only(right: 25),
                   child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context)=> BagScreen()));
                    },
                     child: Container(
                                   
                                     child: Image.asset('assets/images/shopp.png',
                                     height: 30,
                                    width: 30,
                                     ),
                                   ),
                   ),
                 ),
              ],
      ),
      
      body: Column(
        
        children: [ 
          StatusDoor(),
         Expanded(
          flex: 1,
           child: DefaultTabController(
                   length: tabs.length,
                   child: Column( 
            children: [ 
               TabBar(
                 splashBorderRadius: BorderRadius.circular(25),
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                   tabs: tabs,
                   dividerColor: Colors.transparent,
                 ),
                 SizedBox(height: 10,),

                 Expanded(
                   flex: 2,
                   child: TabBarView(
            children: [
              SavoryScreen(),
              
              JuiceScreen(),
           
            ],
                   ),)
            ],
                   ),
                 ),
         ),
      ],),
     
    );
  }
}

