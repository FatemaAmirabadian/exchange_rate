import 'package:flutter/material.dart';
import './widgets/CurrencyWidget.dart';
import './widgets/CryptoWidget.dart';
import './widgets/ConvertWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currencies',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Currencies'),
        ),
        body: [const CurrencyWidget(), CryptoWidget(),const ConverterWidget()][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: (Icon(Icons.attach_money_outlined)), label: 'Currency'),
            NavigationDestination(icon: (Icon(Icons.currency_bitcoin)), label: 'Crypto'),
            NavigationDestination(icon: (Icon(Icons.currency_exchange)), label: 'converter'),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index){
            setState((){
                currentPageIndex = index;}
            );
          },
        ),
      ),
    );
  }
}






