import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Icon(
          Icons.error_outline,
          size: 150.0,
          color: Colors.red
        ),
      ),
    );
  }
}