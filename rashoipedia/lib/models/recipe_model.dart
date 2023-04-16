class Recipe {
  final int id;
  final String name;
  final int time;
  final String rating;
  final int serving;
  final String photoUrl;
  final String shortDes;

  Recipe({
    required this.id,
    required this.name,
    required this.time,
    required this.rating,
    required this.serving,
    required this.photoUrl,
    required this.shortDes,
  });

  factory Recipe.fromMap(Map<String, dynamic> data) {
    return Recipe(
      id: data['id'],
      name: data['name'],
      time: data['time'],
      rating: data['rating'].toString(),
      serving: data['serving'],
      photoUrl: data['photoUrl'],
      shortDes: data['short_des'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'rating': rating,
      'serving': serving,
      'photoUrl': photoUrl,
      'shortDes': shortDes,
    };
  }
}
