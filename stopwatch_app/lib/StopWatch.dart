import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchWidget extends StatefulWidget {
  @override
  _StopWatchWidgetState createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  bool start = true;
  bool stop = true;
  bool reset = true;
  String displayTimer = "00:00:00";
  Stopwatch stopWatchObj = Stopwatch();
  final Duration duration = const Duration(seconds: 1);

  /// Cette fonction permet l'update toute les seconds de l'affichage
  void startTimer() {
    Timer(duration, keepRunningStopWatch);
  }

  /// Cette fonction applique le changement de text
  void keepRunningStopWatch() {
      if (stopWatchObj.isRunning) {
        startTimer();
      }
      setState(() { /// vous verez un setState permet de faire des modifications en temps réel
        displayTimer = stopWatchObj.elapsed.inHours.toString().padLeft(2, "0") + ":";
        displayTimer += (stopWatchObj.elapsed.inMinutes % 60).toString().padLeft(2, "0") + ":";
        displayTimer += (stopWatchObj.elapsed.inSeconds % 60).toString().padLeft(2, "0");
      });
  }

  ///   La fonction StartStopWatch permettra de mettre les variable stop et start
  ///   sur pause et de lancer la stopWatch
  void startStopWatch() {
  }

  /// La fonction stopStopWatch permettra de mettre les variables stop sur active et reset sur pause
  /// et ainsi d'arret la stopwatch
  void stopStopWatch() {
  }

  /// La fonction resetStopWatch permettra de mettre les variables reset et start en active
  /// et ainsi redemare la stop watch
  void resetStopWatch() {
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                displayTimer,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //Faite la creation du Raised Button Reset au couleur teal
                      RaisedButton(
                      ),

                      //Faite la creation du Raised Button Reset au couleur teal
                      RaisedButton(
                      ),

                    ],
                  ),
                  //Faite la creation du Raised Button Start au couleur verte
                  RaisedButton(
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}










/// Et si vous pensiez avoir fini ? et non, lorsqu'on develloppe quelque chose le duplicata de code
/// est vraiment rebarbatif, alors grace a cet classe, elle vous permettra de faire des buttons de
/// maniere generique pour ce cas la

class MyButton extends StatelessWidget {
  final title; /// Nom du button
  final VoidCallback onPressed; /// La fonction que sera appelle sur le click
  final Color color; /// La couleur du boutton

  MyButton({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 15.0,
      ),
      child: Text(title,
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
        ),
      ),
    );
  }
}
