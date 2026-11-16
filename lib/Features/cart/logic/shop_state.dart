import '../../dish_details/data/food.dart';

class CartItem {
  final Food food;
  final int quantity;

  const CartItem({required this.food, required this.quantity});

  double get total => food.price * quantity;

  CartItem copyWith({int? quantity}) =>
      CartItem(food: food, quantity: quantity ?? this.quantity);

  Map<String, dynamic> toMap() => {
    'food': food.toMap(),
    'quantity': quantity,
  };

  factory CartItem.fromMap(Map<dynamic, dynamic> map) => CartItem(
    food: Food.fromMap(Map<dynamic, dynamic>.from(map['food'] as Map)),
    quantity: map['quantity'] as int,
  );
}

class ShopState {
  final List<CartItem> cartItems;
  final List<Food> savedFoods;

  const ShopState({
    this.cartItems = const [],
    this.savedFoods = const [],
  });

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.total);

  // QuickPrep demo has no delivery service or delivery charge.
  double get deliveryFee => 0;

  double get total => subtotal + deliveryFee;

  int get itemCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);
}
