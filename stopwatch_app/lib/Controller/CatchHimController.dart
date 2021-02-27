import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:stopwatch_app/Album/RandomUserAlbum.dart';
import 'package:stopwatch_app/Model/CatchHimModel.dart';

class CatchThemAllController extends ControllerMVC {
  CatchHimModel _data;

  /// initlisation d'un model grace au package mvc_pattern
  CatchThemAllController([StateMVC state]) : super(state) {
    _data = CatchHimModel();
  }

  /// permet de recuperer les data et les assignes dans le model
  fetchData() => _data.fetchData();

  /// permet de recupere un attribut du model
  Future<RandomUserAlbum> get people => _data.people;

  /// List Widget permettant de display l'erreur que peut rencontre la reception de data
  /// Ce ne sont que des Widget de gestion d'erreur vous pouvez les ameliorer / modifier
  List<Widget> snapshotError(AsyncSnapshot<RandomUserAlbum> snapshot) {
    return <Widget>[
      Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      )
    ];
  }

  /// List Widget permettant de display l'affichage lorsque les data on bien etait recuperer
  List<Widget> snapshotData(AsyncSnapshot<RandomUserAlbum> snapshot) {
    return <Widget>[
      Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 60,
      ),
      /// Il faudra changer l'affichage pour permettre d'afficher les data recuperer via l'album
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text("Faire un affichage des data"),
      )
    ];
  }

  /// List Widget faisant l'affichage de l'attende de reception des data
  /// Ce ne sont que des Widget de gestion d'erreur vous pouvez les ameliorer / modifier
  List<Widget> snapshotWaiting(AsyncSnapshot<RandomUserAlbum> snapshot) {
    return <Widget>[
      SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text('Awaiting result...'),
      )
    ];
  }

  /// Le controller permet de faire la selection de la views sur la quel la reponse sera afficher
  /// mettre en place le system de selection des snapshot
  List<Widget> selectSnapshot(AsyncSnapshot<RandomUserAlbum> snapshot) {
    if (snapshot.hasData)
      return snapshotData(snapshot);
    else if (snapshot.hasError)
      return snapshotError(snapshot);
    return snapshotWaiting(snapshot);
  }
}
