import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/screens/homeScreen.dart';
import 'package:lanchonete_android_project/screens/profileScreen.dart';

class PageViewManager extends StatefulWidget {
  const PageViewManager({super.key});

  @override
  State<PageViewManager> createState() => _PageViewManagerState();
}

class _PageViewManagerState extends State<PageViewManager> {

  int startPage = 0;
  late PageController pc;

  @override
  void initState() {
    
    super.initState();
    pc = PageController(initialPage: startPage);
  }

  setPage(index){
    setState(() {
      startPage = index;
      
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView( 
        physics: NeverScrollableScrollPhysics(),
        controller: pc,
        children: [ 
          HomeScreen(),
          ProfileScreen(),
        ],

        onPageChanged: setPage,
      ),

       extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
        child: CustomNavigationBar(
          strokeColor: kbaseColor,
          currentIndex: startPage,
          selectedColor: Colors.black,
          unSelectedColor: Colors.grey[200],
          onTap: (index){
            pc.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.ease);
          },
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