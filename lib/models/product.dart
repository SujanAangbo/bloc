class Product {
  String image;
  String title;
  String description;
  double price;
  Map<String, dynamic> rating;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> jsonMap) {
    return Product(
      image: jsonMap['image'],
      title: jsonMap['title'],
      description: jsonMap['description'],
      price: jsonMap['price'],
      rating: jsonMap['rating'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$image $title $description $price $rating';
  }
}
