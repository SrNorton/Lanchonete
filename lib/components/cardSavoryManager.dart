import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSavoryManager extends StatefulWidget {
  String? image;
  String? description;
  bool select = false;
  
  
  CardSavoryManager({
    this.image,
    this.description,
    required this.select,
    super.key});

  @override
  State<CardSavoryManager> createState() => _CardSavoryManagerState();
}

class _CardSavoryManagerState extends State<CardSavoryManager> {
 changeSelect(){

  setState(() {
     widget.select = !widget.select;
  });
  
     
      print('o valor de select é ${widget.select}');
    }

  @override
  Widget build(BuildContext context) {

   



    return GestureDetector(
      onTap: changeSelect,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                height: 110,
                width: 110,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(widget.image!,
                  
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all( 
                    color: widget.select ? Colors.green : Colors.grey,
                    width: widget.select ? 3 : 1,
                  ), 
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  height: 110,
                  width: 110,
                  child: Center(
                    child: Text(widget.description!,
                          softWrap: true,
                                  
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}



List<CardSavoryManager> listCardSavoryManager = [
  CardSavoryManager(image: 'assets/images/esfiha.png', description: 'Esfirra de Frango',select : false),
  CardSavoryManager(image: 'assets/images/esfiha.png', description: 'Esfirra de Carne',select : false),
  CardSavoryManager(image: 'assets/images/coxinha.png', description: 'Coxinha de Frango', select : false),
  CardSavoryManager(image: 'assets/images/coxinha.png', description: 'Coxinha de Frango/Catupiry', select : false),
  CardSavoryManager(image: 'assets/images/espetinho.png', description: 'Espetinho de Frango', select : false),
  CardSavoryManager(image: 'assets/images/espetinho.png', description: 'Espetinho de Frango/Queijo', select : false),
  CardSavoryManager(image: 'assets/images/assadofrango.png', description: 'Pastel assado Frango/Catupiry', select : false),
  CardSavoryManager(image: 'assets/images/assadocarne.png', description: 'Assado de Carne', select : false),
  CardSavoryManager(image: 'assets/images/hamburguer.png', description: 'Hamburguer assado', select : false),
  CardSavoryManager(image: 'assets/images/tortafrango.png', description: 'Torta de Frango/Catupiry', select : false),
  CardSavoryManager(image: 'assets/images/joelho.png', description: 'Joelho de Moça Presunto/Queijo',select : false),
  CardSavoryManager(image: 'assets/images/paoqueijo.png', description: 'Pão de Queijo', select : false),
  CardSavoryManager(image: 'assets/images/pastelcarne.png', description: 'Pastel Carne', select : false),
  CardSavoryManager(image: 'assets/images/pastelqueijo.png', description: 'Pastel Queijo', select : false),
  CardSavoryManager(image: 'assets/images/pastelpizza.png', description: 'Pastel Pizza', select : false),
  CardSavoryManager(image: 'assets/images/croquete.png', description: 'Croquete', select : false),
  CardSavoryManager(image: 'assets/images/salsicha.png', description: 'Enrolado Salsicha', select : false),
  CardSavoryManager(image: 'assets/images/enroladinhoqueijo.png', description: 'Enrolado Queijo', select : false),
  CardSavoryManager(image: 'assets/images/pastelportugues.png', description: 'Pastel Português', select : false),
  CardSavoryManager(image: 'assets/images/quibe.png', description: 'Quibe', select : false),
];