import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utils/global.dart';
import 'detailPage.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List<Product> _allProducts = Provider.of<List<Product>>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tags List',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black
        ),
        itemCount: tagNameList.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              List<Product> curProducts = List<Product>();

              for(int i = 0; i < _allProducts.length; i++) {
                if(_allProducts[i].productType == tagNameList[index]) {
                  curProducts.add(_allProducts[i]);
                }
              }

              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailPage('${tagNameList[index]}', curProducts)
              ));
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  '${tagNameList[index]}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

}