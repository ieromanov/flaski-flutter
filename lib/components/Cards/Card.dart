import 'package:flutter/material.dart';

import 'package:flaski/helpers/News.dart';

class NewsCard extends StatefulWidget {

	final News article;

	NewsCard({this.article});

	@override
	_NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
	bool hasData (data) {
		if (data != null) return true;
		return false;
	}
	
	@override
	Widget build(BuildContext context) {
		return Container(
			height: 180.0,
			margin: const EdgeInsets.only(top: 20.0),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.all(Radius.circular(5.0)),
				boxShadow: [
					BoxShadow(
						color: Colors.black,
						blurRadius: 10.0,
						spreadRadius: 0.1
					),
				],
				image: new DecorationImage(
					image: new NetworkImage(widget.article.imageUrl),
					colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
					fit: BoxFit.cover,
				),
			),
			child: Column(
				mainAxisSize: MainAxisSize.max,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Padding(
						padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
						child: Text(
							hasData(widget.article.title) ? widget.article.title : 'Загаловок',
							style: TextStyle(
								color: Colors.white,
								fontSize: 16.0,
							)
						),
					),
					Text(
						hasData(widget.article.author) ? widget.article.author : 'Автор',
						style: TextStyle(
							color: Colors.white,
							fontSize: 12.0,
							letterSpacing: 0.5,
						)
					),
				],
			),
		);
	}
}
