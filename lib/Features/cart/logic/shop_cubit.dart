import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../dish_details/data/food.dart';
import 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(const ShopState());

  Box get _box => Hive.box('quickprepBox');

  Future<void> loadSavedData() async {
    final rawCart = _box.get('cart', defaultValue: <dynamic>[]) as List;
    final rawSaved = _box.get('savedFoods', defaultValue: <dynamic>[]) as List;

    final cart = rawCart
        .map((e) => CartItem.fromMap(Map<dynamic, dynamic>.from(e as Map)))
        .toList();

    final saved = rawSaved
        .map((e) => Food.fromMap(Map<dynamic, dynamic>.from(e as Map)))
        .toList();

    emit(ShopState(cartItems: cart, savedFoods: saved));
  }

  Future<void> _persist() async {
    await _box.put('cart', state.cartItems.map((e) => e.toMap()).toList());
    await _box.put(
      'savedFoods',
      state.savedFoods.map((e) => e.toMap()).toList(),
    );
  }

  Future<void> addToCart(Food food) async {
    final items = [...state.cartItems];
    final index = items.indexWhere((e) => e.food.id == food.id);

    if (index == -1) {
      items.add(CartItem(food: food, quantity: 1));
    } else {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    }

    emit(ShopState(cartItems: items, savedFoods: state.savedFoods));
    await _persist();
  }

  Future<void> increaseQuantity(Food food) => addToCart(food);

  Future<void> decreaseQuantity(Food food) async {
    final items = [...state.cartItems];
    final index = items.indexWhere((e) => e.food.id == food.id);
    if (index == -1) return;

    if (items[index].quantity > 1) {
      items[index] = items[index].copyWith(quantity: items[index].quantity - 1);
    } else {
      items.removeAt(index);
    }

    emit(ShopState(cartItems: items, savedFoods: state.savedFoods));
    await _persist();
  }

  Future<void> removeFromCart(Food food) async {
    final items = state.cartItems.where((e) => e.food.id != food.id).toList();
    emit(ShopState(cartItems: items, savedFoods: state.savedFoods));
    await _persist();
  }

  Future<void> toggleSaved(Food food) async {
    final saved = [...state.savedFoods];
    final index = saved.indexWhere((e) => e.id == food.id);

    if (index == -1) {
      saved.add(food);
    } else {
      saved.removeAt(index);
    }

    emit(ShopState(cartItems: state.cartItems, savedFoods: saved));
    await _persist();
  }

  bool isSaved(Food food) => state.savedFoods.any((e) => e.id == food.id);

  Future<void> clearCart() async {
    emit(ShopState(cartItems: const [], savedFoods: state.savedFoods));
    await _persist();
  }
}
