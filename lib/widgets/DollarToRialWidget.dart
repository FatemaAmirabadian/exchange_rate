import 'package:flutter/material.dart';

class DollarToRialWidget extends StatefulWidget {
  const DollarToRialWidget({super.key});

  @override
  State<DollarToRialWidget> createState() => _DollarToRialWidgetState();
}

class _DollarToRialWidgetState extends State<DollarToRialWidget> {
  TextEditingController dtrController = TextEditingController();
  double dollar = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dollar to rial'),
      ),
      body: Container(padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            onChanged : (val) {
              setState(() {
                dtrController.text = val.toString();
              });
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "dollar"
            ),),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            setState(() {
              dollar=double.parse(dtrController.text)*600000;
            });
          }, child: const Text("convert")),
          const SizedBox(height: 20,),
          Text("Rial :${dollar.round()}")
        ],),
      ),
    );
  }
}

