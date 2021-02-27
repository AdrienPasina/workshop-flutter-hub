import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:stopwatch_app/Album/RandomUserAlbum.dart';

class RandomUserApi {
  Future<RandomUserAlbum> randomUserOne() async {
    final response = await http.get("https://randomuser.me/api/");

    if (response.statusCode == 200) {
      return RandomUserAlbum.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future randomUserParamNumber(int nb) {
    return http
        .get("https://randomuser.me/api/?results=" + nb.toString())
        .then((http.Response response) {
          /// impleter ici une fonction qui permettra de trnasformer la list des utilisateur en list d'album
      return null;
    }).catchError((onError) {
      return onError;
    });
  }
}
