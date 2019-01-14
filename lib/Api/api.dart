import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flute/models/Products.dart';

class Api {
	final String apiKey = "a76633b8e5634ea48e1d40e903935d35";
	final String baseURL = "https://newsapi.org/v2/";

	@override
	Future<Products> getNews(String source, int pageNum, int pageSize) async {
	final url = "${baseURL}everything?sources=$source&page=$pageNum&pageSize=$pageSize&apiKey=$apiKey";
	final httpClient = new HttpClient();

	try {
		var request = await httpClient.getUrl(Uri.parse(url));
		var response = await request.close();

		if (response.statusCode == 200) {
			var json = await response.transform(UTF8.decoder).join();
			var data = JSON.decode(json);

			return Products.fromMap(data);
		} else {
			print("Failed http call.");
		}
	} catch (exception) {
		print(exception.toString());
	}
	return null;
  }
}