import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final String loadingText;
  final EdgeInsets padding;
  LoadingComponent({this.loadingText, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.only(top: 40, bottom: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(loadingText ?? "Aguarde ..."),
            ],
          ),
        ));
  }
}
