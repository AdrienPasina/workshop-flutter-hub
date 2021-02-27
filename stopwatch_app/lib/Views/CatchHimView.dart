import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:stopwatch_app/Album/RandomUserAlbum.dart';
import 'package:stopwatch_app/Controller/CatchHimController.dart';

class CatchHimView extends StatefulWidget {
  @override
  _CatchHimViewState createState() => _CatchHimViewState();
}

class _CatchHimViewState extends StateMVC<CatchHimView> {
  CatchThemAllController _controller;

  _CatchHimViewState() : super(CatchThemAllController()) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme
          .of(context)
          .textTheme
          .headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<RandomUserAlbum>(
        future: _controller.people,
        builder: (BuildContext context,
            AsyncSnapshot<RandomUserAlbum> snapshot) {
          List<Widget> children = _controller.selectSnapshot(snapshot);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
