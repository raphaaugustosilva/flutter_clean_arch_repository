import 'package:flutter/material.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/home/home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Clean Arch", style: TextStyle(color: Colors.white)), centerTitle: true, backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.blue,
              child: Text("Lista de Orders com Stream", style: TextStyle(color: Colors.white)),
              onPressed: () => presenter.gotoOrderPageWithStream(),
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text("Lista de Orders com Mobx", style: TextStyle(color: Colors.white)),
              onPressed: () => presenter.gotoOrderPageWithMobx(),
            ),
          ],
        ),
      ),
    );
  }
}
