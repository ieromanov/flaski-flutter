import 'package:flaski/components/FormControls/Input.dart';
import 'package:flaski/navigation/DefaultNav.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

	final _loginForm = GlobalKey<FormState>();
	bool _autoValidate = false;
	String _email;
	String _password;

	@override
	Widget build(BuildContext context) {
		return Form(
			key: _loginForm,
			autovalidate: _autoValidate,
			child: Column(
				children: <Widget>[
					Input(
						margin: EdgeInsets.only(bottom: 25.0),
						keyboardType: TextInputType.emailAddress,
						secure: false,
						placeholder: "test@test.com",
						label: 'Email',
						validator: (String arg) {
							if(arg.length < 3)
								return 'Name must be more than 2 charater';
							else
								return null;
						},
						onSaved: (String val) {
							_email = val;
						},
					),
					Input(
						secure: true,
						placeholder: "********",
						label: 'Password',
						validator: (String arg) {
							if(arg.length < 6)
								return 'Name must be more than 6 charater';
							else
								return null;
						},
						onSaved: (String val) {
							_email = val;
						},
					),
					ButtonBar(
						children: <Widget>[
							RaisedButton(
								child: Text('LogIn'),
								onPressed: () => _validateForm(),
								color: Colors.black,
								textColor: Colors.white,
							),
							RaisedButton(
								child: Text('SignIn'),
								onPressed: () => _validateForm(),
								color: Colors.black,
								textColor: Colors.white,
							)
						],
					)
				],
			),
		);
	}


	void _validateForm () {
		if (_loginForm.currentState.validate()) {
			_loginForm.currentState.save();
			Navigator.push(
				context,
				MaterialPageRoute(
					builder: (context) => DefaultNav(),
				),
			);
		} else {
			setState(() {
				_autoValidate = true;
			});
		}
	}
}