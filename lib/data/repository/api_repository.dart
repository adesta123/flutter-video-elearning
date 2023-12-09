// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import 'package:video_elearning/service/data_repository.dart';
import 'package:video_elearning/data/model/post.dart';

class ApiRepository {
  final DataService dataService;
  ApiRepository({
    required this.dataService,
  });

  Future<List<Post>> getPostsList() async {
    final response = await dataService.getPosts();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}