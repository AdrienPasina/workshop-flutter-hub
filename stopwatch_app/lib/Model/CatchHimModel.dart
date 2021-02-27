import 'package:stopwatch_app/Album/RandomUserAlbum.dart';
import 'package:stopwatch_app/Model/RandomUserApiModel.dart';

class CatchHimModel {
  RandomUserApi _apiModel = RandomUserApi();
  Future<RandomUserAlbum> _people;

  /// permettra de recuperer tout les données a l'init de du widget lors du call
  Future<RandomUserAlbum> fetchData() {
    /// nous voulez uniquement avoir les données d'un utilisateur en faisant appelle au model de l'api
  }

  /// permet de renvoye l'attribu _people
  Future<RandomUserAlbum> get people => _people;
}
