import 'package:flutter/material.dart';

import 'package:flaski/components/Form/LoginForm.dart';

class LogInScreen extends StatefulWidget {
	@override
	_LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
					backgroundColor: Colors.white,
					elevation: 0.0,
					title: Text(
						'LogIn',
						style: TextStyle(
							fontSize: 20,
							color: Colors.black
						),
					),
					iconTheme: new IconThemeData(color: Colors.black),
					centerTitle: true,
				),
			body: LoginForm()
		);
	}
}