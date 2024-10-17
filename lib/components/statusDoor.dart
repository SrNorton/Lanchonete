import 'package:flutter/material.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/userManager.dart';
import 'package:provider/provider.dart';

class StatusDoor extends StatefulWidget {
  const StatusDoor({
    super.key,
  });

  @override
  State<StatusDoor> createState() => _StatusDoorState();
}

class _StatusDoorState extends State<StatusDoor> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (_, usermanager, __){
        return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(usermanager.isOpen! ? 'Aberto' : 'Fechado' ,
            style: TextStyle( 
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: usermanager.isOpen! ? ktextGreen : Colors.red,
              fontFamily: kfontFamily,
            ),
            ),
          ),
          ),
      ],
    );
      });
  }
}

