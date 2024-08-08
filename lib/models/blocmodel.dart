class Blog {
  final String title;
  final String imageUrl;
  bool isFavorite;
  Blog({
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] ?? false, 
    );
  }
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
