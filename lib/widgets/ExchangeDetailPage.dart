import 'package:flutter/material.dart';
import '../models/Exchange_model.dart';

class ExchangeDetailPage extends StatelessWidget {
  final CurrencyInfo currencyInfo;
  final Exchange exchange;

  ExchangeDetailPage({required this.currencyInfo,required this.exchange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Container()), // Empty container to push title to the right
            Text(currencyInfo.persianName,),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${currencyInfo.persianName}'),
            Text('${exchange.currentPrice}'),
            Text('${currencyInfo.country}'),
            Text('${exchange.createdAt.toString()}'),
          ],
        ),
      ),
    );
  }
}
