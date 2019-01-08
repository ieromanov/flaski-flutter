import 'package:flutter/material.dart';
import 'package:flaski/screens/NewsScreen.dart';
import 'package:flaski/screens/CountryScreen.dart';

class BottomTabNav extends StatefulWidget {
	@override
	BottomTabNavState createState() => BottomTabNavState();
}

class BottomTabNavState extends State<BottomTabNav> with SingleTickerProviderStateMixin {
	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
				length: 3,
				child: Scaffold(
					bottomNavigationBar: TabBar(
						indicatorColor: Colors.black,
						labelColor: Colors.black,
						tabs: <Widget>[
							Tab(icon: Icon(Icons.filter_1)),
							Tab(icon: Icon(Icons.filter_2)),
							Tab(icon: Icon(Icons.filter_3)),
						],
					),
					body: TabBarView(
						children: <Widget>[
							NewsScreen(),
							CountryScreen()
						],
					),
				),
			);
	}
}