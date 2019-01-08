import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flaski/components/Lists/CountryList.dart';

class CountryScreen extends StatefulWidget {
  final title = 'Country'; 
	@override
	_CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

	Future<List> fetchCountry() async {
		final response = await http.get('https://newsapi.org/v2/sources?apiKey=a76633b8e5634ea48e1d40e903935d35');

		List country = json.decode(response.body)['sources'].toList();

		List arr = [];

		for(Map c in country){
			if (!arr.contains(c['country'])) {
				arr.add(c['country']);
			}
		}

		return arr;
	}

	@override
	Widget build(BuildContext context) {
		return FutureBuilder<List>(
			future: fetchCountry(),
			builder: (context, snapshot) {
			if (snapshot.hasError) print(snapshot.error);
	
			return snapshot.hasData
				? CountryList(country: snapshot.data)
				: Center(child: CircularProgressIndicator());
			},
		);
	}
}
