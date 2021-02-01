import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'homePage.dart';
import '../models/product.dart';
import '../utils/global.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  List<Product> _products = [];
  bool _progressBarActive = true;

  @override
  void initState() {
    super.initState();

    _fetchPosts().then((value) {
      print('Loading Success');
      
      Provider.of<List<Product>>(context, listen: false).addAll(_products);

      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
      ));
    }, onError: (error) {
      print('Loading Fail');
    });
  }
  
  Future<void> _fetchPosts() async {
    final response = await http.get(base_url);

    var productsJson = jsonDecode(response.body)['products'] as List;
    _products = productsJson.map((tagJson) => Product.fromJSON(tagJson)).toList();

    if(_products.length > 0) {
      tagNameList.add(_products[0].productType);
      
      for(int i = 0; i < _products.length; i++) {
        String type = _products[i].productType;
        
        bool bExistType = false;
        for(int j = 0; j < tagNameList.length; j++) {
          if(type == tagNameList[j]) {
            bExistType = true;
            break;
          }
        }

        if(!bExistType) {
          tagNameList.add(type);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.white
        ),
        child: new Center(
          child: _progressBarActive == true?const CircularProgressIndicator():new Container(),
        ),
      ),
    );
  }

}