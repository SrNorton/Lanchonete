import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class EditHours extends StatefulWidget {
  const EditHours({super.key});

  @override
  State<EditHours> createState() => _EditHoursState();
}

class _EditHoursState extends State<EditHours> {
  @override
  Widget build(BuildContext context) {


    var _initiHours = context.watch<BagManager>().hours;

    return Row( 
      children: [ 
        _initiHours > 5 ?
        IconButton(onPressed: (){
          context.read<BagManager>().removeHours();
        }, icon: Icon(Icons.remove_circle)) : Container(),
        Center(child: Text(_initiHours.toString() + ' '+ 'Horas'),),
        _initiHours < 19 ? 
        IconButton(onPressed: (){
          context.read<BagManager>().addHours();

        }, icon: Icon(Icons.add_circle)) : Container(),

      ],
    );
  }
}