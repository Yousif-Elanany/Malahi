/* class PackModel {
  final String id;
  final String name;
  final String description;
  final String city;
  final String date;
  final String orders;
  final String imageUrl;
  final bool isFavorite;
  final double price;
  final Seller seller;

  PackModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
    required this.city,
    required this.date,
    required this.orders,
    required this.price,
    required this.seller,
  });

  factory PackModel.fromJson(Map<String, dynamic> json) {
    return PackModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      date: json['date'],
      orders: json['orders'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] == 1,
      price: (json['price'] as num).toDouble(),
      seller: Seller.fromJson(json['seller']),
    );
  }
}

class Seller {
  final String name;
  final String address;
  final List<String> offers;
  final List<String> branches;
  final List<String> workingHours;

  Seller({
    required this.name,
    required this.address,
    required this.offers,
    required this.branches,
    required this.workingHours,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      name: json['name'] ?? '',
      offers: List<String>.from(json['offers'] ?? []),
      address: json['address'] ?? '',
      branches: List<String>.from(json['branches'] ?? []),
      workingHours: List<String>.from(json['working_hours'] ?? []),
    );
  }
}
 */