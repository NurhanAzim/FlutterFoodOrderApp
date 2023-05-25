class CuisineModel {
  final String id;
  final String image;
  final String name;
  final String price;
  final String cuisineType;
  final String description;

  CuisineModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.cuisineType,
    required this.description,
  });

  factory CuisineModel.fromMap(Map<String, dynamic> map) {
    return CuisineModel(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      price: map['price'],
      cuisineType: map['cuisineType'],
      description: map['description'],
    );
  }

  static List<CuisineModel> fromLists(
    List<Map<String, dynamic>> items,
  ) {
    List<CuisineModel> cuisines = [];

    cuisines.addAll(items.map((map) => CuisineModel.fromMap(map)));

    return cuisines;
  }
}
