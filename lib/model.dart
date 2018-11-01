import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  final String name, description, ownerAvatar, ownerLogin;
  final int forksCount, stargazersCount;

  Repository(this.name, this.description, this.ownerAvatar, this. ownerLogin, this.forksCount, this.stargazersCount);

  Repository.fromJson(Map json)
    :  name = json['name'],
      description = json['description'],
      ownerAvatar = json['owner']['avatar_url'],
      ownerLogin = json['owner']['login'],
      forksCount = json['forks_count'],
      stargazersCount = json['stargazers_count'];
}

class API {
  final http.Client _client = http.Client();

  static const String _url = 
  'https://api.github.com/search/repositories?q=language:Java&sort=stars';

  Future<List<Repository>> get() async {
    List<Repository> list = [];

    await _client
      .get(Uri.parse(_url))
      .then((res) => res.body)
      .then(json.decode)
      .then((json) => json["items"])
      .then((repositories) =>
          repositories.forEach((repository) => list.add(Repository.fromJson(repository))));

    return list;
  }
}