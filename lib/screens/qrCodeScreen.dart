import 'package:flutter/material.dart';
import 'package:lanchonete_android_project/Utils/statusMessage.dart';
import 'package:lanchonete_android_project/components/buttom.dart';
import 'package:lanchonete_android_project/constants/constants.dart';
import 'package:lanchonete_android_project/manager/paymentManager.dart';
import 'package:lanchonete_android_project/screens/after_sales_screen.dart';

import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:clipboard/clipboard.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {

    var Qrcode = context.watch<MercadoPagoService>().imageQrcodeMercadoPago;

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
                  data: Qrcode!,
                  version: QrVersions.auto,
                  size: 100,
                ),
              ),
            ),
          ),
          SizedBox(height: 70,),
          Buttom(title: 'Copiar QRCode', function: () async {
            copyQrCode(Qrcode);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AfterSales()));
          }, color: Colors.red),
        ],
      ),
    );
  }

  void copyQrCode(String qrCode){
   
    FlutterClipboard.copy(qrCode).then(( value ) => StatusMessage(statusSucces: true).showMySnackBar(context: context, msg: 'QRcode copiado!'));
  }
}