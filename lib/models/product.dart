import '../models/variants.dart';
import '../models/imagedata.dart';

import 'imagedata.dart';

class Product {

  final int productId;
  final String productTitle;
  final String productType;
  final List<Variants> productInventoryQuantity;
  final ImageData productImgData;

  Product({this.productId, this.productTitle, this.productType, this.productInventoryQuantity, this.productImgData}); 
   
  factory Product.fromJSON(Map<String, dynamic> json) {
    var variantsJson = json['variants'] as List;
    return Product(
      productId: json['id'] as int,
      productTitle: json['title'] as String,
      productType: json['product_type'] as String,
      productInventoryQuantity: variantsJson.map((tagJson) => Variants.fromJSON(tagJson)).toList(),
      productImgData: ImageData.fromJSON(json['image']),
    );
  }

}