import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class EditMinutes extends StatefulWidget {
  const EditMinutes({super.key});

  @override
  State<EditMinutes> createState() => _EditMinutesState();
}

class _EditMinutesState extends State<EditMinutes> {
  @override
  Widget build(BuildContext context) {
    var _initMinutes = context.watch<BagManager>().minutes;

    return Row(
      children: [ 
          _initMinutes > 0 ?
        IconButton(onPressed: (){
          context.read<BagManager>().removeMinutes();
        }, icon: Icon(Icons.remove_circle)) : Container(),
        Center(child: Text(_initMinutes.toString() + ' '+ 'Minutos'),),
        _initMinutes < 59 ? 
        IconButton(onPressed: (){
          context.read<BagManager>().addMinutes();

        }, icon: Icon(Icons.add_circle)) : Container(),

      ],
    );
  }
}