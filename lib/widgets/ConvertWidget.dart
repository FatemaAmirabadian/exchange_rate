import 'package:flutter/material.dart';
import 'RialToDollarWidget.dart';
import 'DollarToRialWidget.dart';

class ConverterWidget extends StatefulWidget {
  const ConverterWidget({super.key});

  @override
  State<ConverterWidget> createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Converter')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DollarToRialWidget()));
              }, child: const Text('Dollar To Rial')),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RialToDollarWidget()));
              }, child: const Text('Rial To Dollar'))
            ],
          )
      ),
    );
  }}
