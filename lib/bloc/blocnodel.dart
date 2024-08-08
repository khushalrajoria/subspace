class Blog {
  final String title;
  final String imageUrl;
  bool isFavorite; // Add this field

  Blog({
    required this.title,
    required this.imageUrl,
    this.isFavorite = false, // Initialize isFavorite to false
  });

  // Factory constructor to create a Blog object from JSON data
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      imageUrl: json['image_url'],
      // The API might not include an isFavorite field, so we initialize it manually
    );
  }

  // Method to toggle the favorite status
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
