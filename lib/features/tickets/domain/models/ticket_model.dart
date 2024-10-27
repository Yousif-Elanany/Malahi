class TicketModel {
  final String id;
  final String eventName;
  final String date;
  final double price; // Ticket price
  final String category; // String category
  final String description; // Ticket description
  final String imageUrl; // Image URL
  final bool isFavorite; // Favorite flag
  final String address;
  final String city;
  final String orders;
  final Seller seller;

  TicketModel({
    required this.id,
    required this.eventName,
    required this.date,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    required this.orders,
    required this.city,
    required this.address,
    required this.seller,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id']?.toString() ?? '', // Ensure id is a String
      eventName: json['event_name'] ?? '',
      date: json['date'] ?? '',
      price: (json['price'] ?? 0).toDouble(), // Ensure price is a double
      category:
          json['category']?.toString() ?? '', // Ensure category is a String
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isFavorite: json['is_favorite'] == 1,

      orders: json['orders'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',

      seller: Seller.fromJson(json['seller'] ?? {}),
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
