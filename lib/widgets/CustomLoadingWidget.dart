import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String loadingText;

  const CustomLoadingWidget({Key? key, this.loadingText = 'Loading...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16.0),
          Text(
            loadingText,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
