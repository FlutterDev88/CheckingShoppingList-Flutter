class ImageData {

  final int imgId;
  final String imgSrc;

  ImageData({this.imgId, this.imgSrc});

  factory ImageData.fromJSON(Map<String, dynamic> json) {
    return ImageData(
      imgId: json['id'],
      imgSrc: json['src'],
    );
  }

}