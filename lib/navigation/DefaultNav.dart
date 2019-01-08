import 'package:flutter/material.dart';

import 'package:flaski/screens/NewsScreen.dart';
import 'package:flaski/screens/CountryScreen.dart';
import 'package:flaski/screens/ErrorScreen.dart';

import 'package:flaski/screens/SearchScreen.dart';

class DefaultNav extends StatefulWidget {
	@override
	_DefaultNavState createState() => _DefaultNavState();
}

class _DefaultNavState extends State<DefaultNav> {
	NavigationItem activeScreen;
	List<NavigationItem> _recentPages = [];
	final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

	final SearchDemoSearchDelegate delegate = SearchDemoSearchDelegate();
	int _lastIntegerSelected;

	@override
	void initState() {
		super.initState();

		if(activeScreen == null || _recentPages.length == 0) activeScreen = NavigationItem(title: 'News', screen: NewsScreen());
	}

	onNavigation(String navTitle) {
		Navigator.of(context).pop();

		if (navigationItems.containsKey(navTitle)) {
			setState(() {
				_recentPages.add(activeScreen);
				activeScreen = navigationItems[navTitle];
			});
		} else {
			_scaffoldKey.currentState.showSnackBar(const SnackBar(
				content: Text("Error")
			));
		}
	}

	Future<bool> onWillPop() async {
		if (_recentPages.length == 0) {
			return true;
		} else {
			setState(() {
				activeScreen = _recentPages[_recentPages.length - 1];
				_recentPages.removeLast();
			});
			return false;
		}
	}

	@override
	Widget build(BuildContext context) {
		return WillPopScope(
			onWillPop: onWillPop,
			child: Scaffold(
				key: _scaffoldKey,
				appBar: AppBar(
					backgroundColor: Colors.white,
					elevation: 0.0,
					title: Text(
						activeScreen.title,
						style: TextStyle(
							fontSize: 20,
							color: Colors.black
						),
					),
					iconTheme: new IconThemeData(color: Colors.black),
					centerTitle: true,
					actions: <Widget>[
						IconButton(
							tooltip: 'Search',
							icon: const Icon(Icons.search),
							onPressed: () async {
								final int selected = await showSearch<int>(
									context: context,
									delegate: delegate,
								);
							if (selected != null && selected != _lastIntegerSelected) {
								setState(() {
									_lastIntegerSelected = selected;
								});
							}
							},
						),
					],
				),
				body: activeScreen.screen,
				drawer: Drawer(
					child: ListView(
						padding: EdgeInsets.zero,
						children: <Widget>[
							DrawerHeader(
								margin: EdgeInsets.zero,
								padding: EdgeInsets.zero,
								child: Image.asset(
									'assets/images/drawer-bg.jpg',
									width: double.infinity,
									fit: BoxFit.cover,
								)
							),
							ListTile(
								leading: Icon(Icons.local_library),
								title: Text('News'),
								onTap: () => onNavigation('News'),
							),
							ListTile(
								leading: Icon(Icons.location_on),
								title: Text('Country'),
								onTap: () => onNavigation('Country'),
							),
							ListTile(
								leading: Icon(Icons.location_on),
								title: Text('Error'),
								onTap: () => onNavigation('Error'),
							),
						],
					),
				),
			),
		);
	}
}

Map<String, NavigationItem> navigationItems = {
	"News": NavigationItem(title: 'News', screen: NewsScreen()),
	"Country": NavigationItem(title: 'Country', screen: CountryScreen()),
	"Error": NavigationItem(title: 'Error', screen: ErrorScreen()),
};

class NavigationItem {
	final String title;
	final Widget screen;

	NavigationItem({this.title, this.screen});
}