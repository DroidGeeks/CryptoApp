import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/dependency_injection.dart';
import 'package:flutter_crypto/home_page.dart';

void main() async {
  Injector.configure(Flavour.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}
