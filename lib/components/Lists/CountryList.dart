import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
	final country;

	CountryList({Key key, this.country}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			child: ListView.builder(
				itemCount: country.length,
				padding: const EdgeInsets.all(15.0),
				itemBuilder: (context, i) {
					return Column(
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										Text(country[i], 
											style: TextStyle(
												fontSize: 20,
											),
										),
										Icon(Icons.navigate_next)
									],
								),
							),
							Divider(),
						]
					);
			}),
		);
	}
}