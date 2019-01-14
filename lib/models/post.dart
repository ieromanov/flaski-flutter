import 'package:equatable/equatable.dart';

class Post extends Equatable {
	final String title;
	final String imageUrl;
	final String author;
	final String publishedAt;

	Post({this.title, this.imageUrl, this.author, this.publishedAt});

	@override
	String toString() => 'Post { id: $title }';

	factory Post.fromJson(Map<String, dynamic> json) {
		return Post(
			title: json['title'],
			imageUrl: json['urlToImage'],
			author: json['author'],
			publishedAt: json['publishedAt']
		);
	}

	Post.fromMap(Map<String, dynamic>  map) :
		title = map['title'],
		imageUrl = map['urlToImage'],
		author = map['author'],
		publishedAt = map['publishedAt'];
}