import 'package:flutter/material.dart';
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
            children: [ 
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 25),
                child: Text('Olá ${usermanager.user!.name}',
                style: TextStyle( 
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: kfontFamily,
                ),
                ),
              )
            ],
          );
        }),
    );
  }
}