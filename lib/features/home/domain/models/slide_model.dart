class SlideModel {
  final String id;
  final String title;
  final String imageUrl;

  SlideModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}
