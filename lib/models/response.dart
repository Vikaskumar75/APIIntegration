import 'dart:convert';

import 'package:http/http.dart' as http;


class Album{
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
  if(response.statusCode == 200){
    return Album.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to load album');
  }
}