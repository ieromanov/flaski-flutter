import 'package:flaski/models/post.dart';

class News {
  final List<Post> news;
  final int totalNews;
  final int pageNum;
  final int pageSize;

  News({this.news, this.totalNews, this.pageNum, this.pageSize});

  News.fromMap(Map<String, dynamic> map)
      : news = new List<Post>.from(map['sources'].map((post) => new Post.fromMap(post))),
        totalNews = map['totalNews'],
        pageNum = map['pageNumb'],
        pageSize = map['pageSize'];
}