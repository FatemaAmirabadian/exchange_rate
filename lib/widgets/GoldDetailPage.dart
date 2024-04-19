import 'package:flutter/material.dart';
import '../models/Gold_model.dart';

class GoldDetailPage extends StatelessWidget {
  final GoldInfo goldInfo;

  GoldDetailPage({required this.goldInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Container()), // Empty container to push title to the right
            Text(goldInfo.name),
          ],
        ),      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gold Name: ${goldInfo.name}'),
            Text('Current Price: ${goldInfo.name}'),
          ],
        ),
      ),
    );
  }
}
