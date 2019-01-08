import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flaski/components/Cards/Card.dart';
import 'package:flaski/helpers/News.dart';

Widget newsList () {
	Future<List<News>> fetchNews() async {
		final response = await http.get('https://newsapi.org/v2/top-headlines?sources=google-news-ru&apiKey=a76633b8e5634ea48e1d40e903935d35');

		final articles = json.decode(response.body)['articles'];

		return articles.map<News>((article) => News.fromJson(article)).toList();
	}

	return FutureBuilder<List<News>>(
		future: fetchNews(),
		builder: (context, snapshot) {
		if (snapshot.hasError) print(snapshot.error);

		return snapshot.hasData ?
			Container(
				child: ListView.builder(
					itemCount: snapshot.data.length,
					padding: const EdgeInsets.all(15.0),
					itemBuilder: (context, i) {
						return NewsCard(article: snapshot.data[i]);
					}
				),
			) :
			Center(child: CircularProgressIndicator(
				backgroundColor: Colors.black,
			));
		},
	); 
}