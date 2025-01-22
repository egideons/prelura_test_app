class ProductModel {
  int id;
  String productName;
  String productImage;
  int numOfLikes;
  bool isLiked;
  String brandName;
  String description;
  double price;
  double discountPrice;
  bool isDiscounted;
  double discountPercentage;

  ProductModel({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.numOfLikes,
    required this.isLiked,
    required this.brandName,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.isDiscounted,
    required this.discountPercentage,
  });
}
