import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product.dart';
import 'ui/splashPage.dart';

main() => runApp(
  MyApp(),
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<List<Product>>.value(
      value: [],
      child: MaterialApp(home: SplashPage()),
    );
  }

}