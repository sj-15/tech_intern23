class Recipe {
  final int id;
  final String name;
  final int time;
  final String rating;
  final String photoUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.time,
    required this.rating,
    required this.photoUrl,
  });

  factory Recipe.fromMap(Map<String, dynamic> data) {
    return Recipe(
      id: data['id'],
      name: data['name'],
      time: data['time'],
      rating: data['rating'].toString(),
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'rating': rating,
      'photoUrl': photoUrl,
    };
  }
}
