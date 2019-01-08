import 'package:flutter/material.dart';

class SearchDemoSearchDelegate extends SearchDelegate<int> {
	final List<int> _data = List<int>.generate(100001, (int i) => i).reversed.toList();
	final List<int> _history = <int>[42607, 85604, 66374, 44, 174];

	@override
	Widget buildLeading(BuildContext context) {
		return BackButton(
			color: Colors.black
		);
	}

	@override
	Widget buildSuggestions(BuildContext context) {
		final Iterable<int> suggestions = query.isEmpty
			? _history
			: _data.where((int i) => '$i'.startsWith(query));

		return _SuggestionList(
			query: query,
			suggestions: suggestions.map<String>((int i) => '$i').toList(),
			onSelected: (String suggestion) {
				query = suggestion;
				showResults(context);
			},
		);
	}

	@override
	Widget buildResults(BuildContext context) {
		return ListView(
			children: <Widget>[
				Text('This integer'),
				Text('Next integer'),
				Text('Previous integer'),
			],
		);
	}

	@override
	List<Widget> buildActions(BuildContext context) {
		return <Widget>[
				IconButton(
					tooltip: 'Clear',
					icon: const Icon(Icons.clear),
					color: Colors.black,
					onPressed: () {
						query = '';
						showSuggestions(context);
					}
				)
			];
		}
}

class _SuggestionList extends StatelessWidget {
	const _SuggestionList({this.suggestions, this.query, this.onSelected});

	final List<String> suggestions;
	final String query;
	final ValueChanged<String> onSelected;

	@override
	Widget build(BuildContext context) {
	final ThemeData theme = Theme.of(context);
		return ListView.builder(
			itemCount: suggestions.length,
			itemBuilder: (BuildContext context, int i) {
				final String suggestion = suggestions[i];
				return ListTile(
					leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
					title: RichText(
						text: TextSpan(
							text: suggestion.substring(0, query.length),
							style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
							children: <TextSpan>[
								TextSpan(
									text: suggestion.substring(query.length),
									style: theme.textTheme.subhead,
								),
							],
						),
					),
					onTap: () {
						onSelected(suggestion);
					},
				);
			},
		);
	}
}