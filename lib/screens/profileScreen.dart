

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/components/buttonManager.dart';
import 'package:lanchonete_app/components/savoryCard.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:lanchonete_app/screens/noticesScreen.dart';
import 'package:lanchonete_app/screens/sectionsManagerScreen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    

    openDor(){
      context.read<UserManager>().openDoor();
    }


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
                  child: Row(
                    children: [ 
                      ButtonManager( 
                        image: 'assets/images/door.png',
                        function: openDor(),
                      ),
                      ButtonManager(
                        image: 'assets/images/tasks.png',
                        function:  ()async{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SectionsManagerScreen()));
                        }
                      ),
                      ButtonManager(
                        image: 'assets/images/megaphone.png',
                        function: ()async{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoticesScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton.icon(
                  onPressed: (){
                    usermanager.signOut(context);
                  } ,
                   icon: Icon(Icons.store_mall_directory_rounded),
                    label: Text( 'Sair',
                     style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      ),))
              )
            ],
          );
        }),
    );
  }
}

