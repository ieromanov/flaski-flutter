import 'package:flutter/material.dart';

import 'package:flaski/screens/LogInScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flaski',
			theme: ThemeData(
				primaryColor: Colors.blue[700],
				fontFamily: 'GoogleSans-Regular'
			),
			home: LogInScreen()
		);
	}
}