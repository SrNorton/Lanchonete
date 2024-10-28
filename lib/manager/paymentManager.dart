
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lanchonete_app/models/order.dart';
import 'package:lanchonete_app/models/paymentStatus.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart'; // Adicione a dependência uuid no seu pubspec.yaml

class MercadoPagoService  extends ChangeNotifier{

  late PaymentStatus paymentStatus;
  String? imageQrcodeMercadoPago;

   String mercadoPagoAccessToken = dotenv.env['MERCADOPAGO_ACCESS_TOKEN']!;
 // Substitua pelo seu token de acesso

  Future<Map<String, dynamic>> criarPagamento(Orders order) async {
    var url = 'https://api.mercadopago.com/v1/payments';
    
    var idempotencyKey = Uuid().v4(); // Gera um UUID único

    var body = jsonEncode({
      "transaction_amount": order.value,
      "description": "Compra Rickelmy Lanches",
      "payment_method_id": "pix",
      "payer": {
        'first_name': order.name,
        'phone' : {
        
        "number": order.phone
      },
        "email": order.email // Email do comprador
      }
    });

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'X-Idempotency-Key': idempotencyKey, 
        'Authorization': 'Bearer $mercadoPagoAccessToken'
      },
      body: body,
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var json = PaymentStatus.fromJson(data);
      paymentStatus = json;
      print('Esse é o id do pagamento ${paymentStatus.id ?? ''}');
      imageQrcodeMercadoPago = data["point_of_interaction"]['transaction_data'][ "qr_code"];
      print('olha o qr code aqui minha gente ${data["point_of_interaction"]['transaction_data'][ "qr_code"]}');
      await getPaymentData(paymentStatus.id!);
      return data;
    } else {
      throw Exception('Falha ao criar pagamento: ${response.body}');
      
    }
    
  }

  Future <void> getPaymentData(int paymentID) async {
    var url = Uri.parse("https://api.mercadopago.com/v1/payments/$paymentID");

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mercadoPagoAccessToken',
    };

     final response = await http.get(url, headers: headers);

     if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print('Esta é a descrição do produto comprado ${data["description"]}');
        return data;
     } else {
      throw Exception(
        'Falha ao criar pagamento: ${response.statusCode}'
      );
     }
  }


}