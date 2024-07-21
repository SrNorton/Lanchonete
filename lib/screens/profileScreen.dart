

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/components/buttonManager.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserManager>(
        builder: (_, usermanager,__){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 25),
                child: Text('Olá ${usermanager.user!.name ?? ''}',
                style: TextStyle( 
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: kfontFamily,
                ),
                ),
              ),
              SizedBox(height: 110,
              // child: Text(usermanager.isOpen! ? 'Você abriu a lanchonete' : 'Você fechou a lanchonete',
              // style: TextStyle( 
              //   color: usermanager.isOpen! ? ktextGreen : Colors.red,
              //   fontSize: 18,
              // ),
              // ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonsManagerList.length,
                    itemBuilder: (context, index) {
                      return ButtonManager(
                        index: buttonsManagerList[index].index,
                        image: buttonsManagerList[index].image,
                        
                          
                        
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
    );
  }
}

