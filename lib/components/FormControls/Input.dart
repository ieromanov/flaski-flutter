import 'package:flutter/material.dart';

class Input extends StatefulWidget {

	const Input({
		Key key, 
		this.keyboardType, 
		this.secure, 
		this.placeholder, 
		this.label,
		this.validator,
		this.onSaved,
		this.margin,
	}): super(key: key);

	final TextInputType keyboardType;
	final bool secure;
	final String placeholder;
	final String label;
	final Function validator;
	final Function onSaved;
	final EdgeInsets margin;

	@override
	_InputState createState() => _InputState();
}

class _InputState extends State<Input> {
	@override
	Widget build(BuildContext context) {
		return Container(
			margin: widget.margin,
			child: Padding(
			padding: EdgeInsets.symmetric(horizontal: 20.0),
			child: TextFormField(
				obscureText: widget.secure,
				keyboardType: widget.keyboardType,
				decoration: new InputDecoration(
					hintText: widget.placeholder,
					labelText: widget.label,
					labelStyle: TextStyle(
						color: Colors.black
					),
					contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
				),
				validator: widget.validator,
				onSaved: widget.onSaved,
			),
			),
		);
	}
}