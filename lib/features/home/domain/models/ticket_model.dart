/* class TicketModel {
  final String id;
  final String eventName;
  final String date;
  final double price; // New property for the ticket price
  final String description; // New property for the ticket description
  final String imageUrl; // New property for the image URL
  final bool isFavorite; // New property to indicate if the ticket is a favorite

  TicketModel({
    required this.id,
    required this.eventName,
    required this.date,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false, // Default value for favorite is false
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      eventName: json['event_name'],
      date: json['date'],
      price: json['price'].toDouble(), // Ensure price is a double
      description: json['description'],
      imageUrl: json['image_url'],
      isFavorite:
          json['is_favorite'] ?? false, // Default to false if not present
    );
  }
}
 */

class TicketModel {
  final String id;
  final String eventName;
  final String date;
  final double price; // Ticket price
  final String category; // String category
  final String description; // Ticket description
  final String imageUrl; // Image URL
  final bool isFavorite; // Favorite flag

  final Seller seller;
  final String address;
  final String city;
  final String orders;

  TicketModel({
    required this.id,
    required this.eventName,
    required this.date,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    required this.seller,
    required this.orders,
    required this.address,
    required this.city,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      eventName: json['event_name'],
      date: json['date'],
      price: json['price'].toDouble(), // Ensure price is a double
      category: json['category'].toString(), // Store category as a string
      description: json['description'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] == 0,
      seller: Seller.fromJson(json['seller']),
      orders: json['orders'],
      address: json['address'],
      city: json['city'],
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
