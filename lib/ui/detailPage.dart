import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget{
  
  final String _title;
  final List<Product> _curProducts;

  DetailPage(this._title, this._curProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black
        ),
        itemCount: _curProducts.length,
        itemBuilder: (BuildContext context, index) {
          final product = _curProducts[index];
          return Align(alignment: Alignment.topCenter,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: CachedNetworkImageProvider(
                          product.productImgData.imgSrc
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        '${product.productTitle} : ${product.productInventoryQuantity[0].variantsCount}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

}