import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/bagManager.dart';
import 'package:provider/provider.dart';

class BotttomPaymentBagScreen extends StatefulWidget {
  const BotttomPaymentBagScreen({super.key});

  @override
  State<BotttomPaymentBagScreen> createState() => _BotttomPaymentBagScreenState();
}

class _BotttomPaymentBagScreenState extends State<BotttomPaymentBagScreen> {
  @override
  Widget build(BuildContext context) {

    var _totalPrice = context.watch<BagManager>().totalPrice ?? 0.00;

    return _totalPrice != 0.00 ? Container(
      height: 65,
      width: MediaQuery.of(context).size.width - 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kRedButtonColor,
      ),
      child: Center(
        child: Text(
                  'Pagar Pix R\$${_totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: kfontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    ) : Container();
  }
}
