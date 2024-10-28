import 'package:flutter/material.dart';
import 'package:lanchonete_app/components/buttom.dart';
import 'package:lanchonete_app/constants/constants.dart';
import 'package:lanchonete_app/manager/paymentManager.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
            child: Container(
              height: 430,
              width: MediaQuery.of(context).size.width -50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 5,
                  color: ktextGreen,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 80),
                child: QrImageView(
                  data: context.watch<MercadoPagoService>().imageQrcodeMercadoPago!,
                  version: QrVersions.auto,
                  size: 100,
                ),
              ),
            ),
          ),
          SizedBox(height: 70,),
          Buttom(title: 'Copiar QRCode', function: (){}, color: Colors.red),
        ],
      ),
    );
  }
}