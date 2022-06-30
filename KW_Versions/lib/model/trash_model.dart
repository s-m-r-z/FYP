class Trash {
  final String? imageURL;
  final String? price;
  final String? material;
  final String? noOfArticles;
  final String? avgWeight;
  final String? contactNo;

  const Trash(
      {this.imageURL,
      this.price,
      this.material,
      this.noOfArticles,
      this.avgWeight,
      this.contactNo});

  factory Trash.fromJson(Map<String, dynamic> map) {
    return Trash(
        imageURL: map['imageURL'],
        price: map['price'],
        material: map['material'],
        noOfArticles: map['noOfArticles'],
        avgWeight: map['avgWeight'],
        contactNo: map['contactNo']);
  }
}
