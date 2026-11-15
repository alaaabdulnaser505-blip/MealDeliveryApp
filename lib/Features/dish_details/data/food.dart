class Food {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final List<String> ingredients;
  final String instructions;
  final int calories;

  const Food({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.ingredients,
    this.instructions = '',
    this.calories = 0,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'image': image,
    'ingredients': ingredients,
    'instructions': instructions,
    'calories': calories,
  };

  factory Food.fromMap(Map<dynamic, dynamic> map) => Food(
    id: map['id'] as String,
    name: map['name'] as String,
    description: map['description'] as String? ?? '',
    price: (map['price'] as num).toDouble(),
    image: map['image'] as String? ?? '',
    ingredients: List<String>.from(map['ingredients'] ?? const []),
    instructions: map['instructions'] as String? ?? '',
    calories: map['calories'] as int? ?? 0,
  );
}
