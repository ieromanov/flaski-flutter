import 'package:flutter/material.dart';

import 'package:flaski/components/Lists/NewsList.dart';

class NewsScreen extends StatefulWidget {
	final title = 'News';
	@override
	_NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
	var activeScreen;
	
	@override
	Widget build(BuildContext context) {
		return newsList();
	}
}