class News {
	final String title;
	final String imageUrl;
	final String author;
	final String publishedAt;

	News({this.title, this.imageUrl, this.author, this.publishedAt});

	factory News.fromJson(Map<String, dynamic> json) {
		return News(
			title: json['title'],
			imageUrl: json['urlToImage'],
			author: json['author'],
			publishedAt: json['publishedAt']
		);
	}
}