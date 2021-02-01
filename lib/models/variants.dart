class Variants {

  final int variantsId;
  final int variantsCount;

  Variants({this.variantsId, this.variantsCount});

  factory Variants.fromJSON(Map<String, dynamic> json) {
    return Variants(
      variantsId: json['id'],
      variantsCount: json['inventory_quantity'],
    );
  }

}