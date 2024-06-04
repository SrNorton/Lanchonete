import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/screens/juiceScreen.dart';
import 'package:lanchonete_app/screens/savoryScreen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

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
                   child: Container(
                                 
                                   child: Image.asset('assets/images/shopp.png',
                                   height: 30,
                                  width: 30,
                                   ),
                                 ),
                 ),
              ],
      ),
      body: Column(
        
        children: [ 
          SizedBox(height: 40,),
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
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40,),
        child: CustomNavigationBar(
          strokeColor: kbaseColor,
          
          selectedColor: Colors.black,
          unSelectedColor: Colors.black,
          onTap: (index){},
          borderRadius: Radius.circular(50),
          isFloating: true,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home_outlined)),
            CustomNavigationBarItem(
              icon: Icon(Icons.person_outline)),
          ],
          ),
      )
    );
  }
}

