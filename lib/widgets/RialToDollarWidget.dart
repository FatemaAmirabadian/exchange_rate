import 'package:flutter/material.dart';
class RialToDollarWidget extends StatefulWidget {
  const RialToDollarWidget({super.key});

  @override
  State<RialToDollarWidget> createState() => _RialToDollarWidgetState();
}

class _RialToDollarWidgetState extends State<RialToDollarWidget> {
  TextEditingController rtdController = TextEditingController();
  double rial = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rial to dollar'),
      ),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            onChanged : (val) {
              setState(() {
                rtdController.text = val.toString();
              });
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "rial"
            ),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            setState(() {
              rial=double.parse(rtdController.text)/600000;
            });
          }, child: Text("convert")),
          SizedBox(height: 20,),
          Text("Rial :" +rial.toString())
        ],),
      ),
    );
  }
}