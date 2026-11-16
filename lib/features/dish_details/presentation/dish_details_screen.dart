import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/widgets/primary_button.dart';

import '../../cart/logic/shop_cubit.dart';
import '../../cart/logic/shop_state.dart';
import '../../cart/presentation/cart_screen.dart';
import '../../saved/presentation/saved_screen.dart';
import '../data/food.dart';


class DishDetailsScreen extends StatelessWidget {
  final Food food;
  const DishDetailsScreen({super.key,required this.food});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;
    final horizontal = size.width * (isTablet ? 0.08 : 0.05);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickPrep'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SavedScreen()),
            ),
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            ),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isTablet ? 850 : size.width),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 20),
            children: [
              Container(
                height: size.height * (isTablet ? 0.30 : 0.25),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5E5E5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.restaurant,
                  size: 100,
                  color: Color(0xFFB5262B),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                   Expanded(
                    child: Text(
                      food.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  BlocBuilder<ShopCubit, ShopState>(
                    builder: (context, state) {
                      final saved = state.savedFoods.any(
                        (e) => e.id == food.id,
                      );
                      return IconButton(
                        onPressed: () =>
                            context.read<ShopCubit>().toggleSaved(food),
                        icon: Icon(
                          saved ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(food.description),
              const SizedBox(height: 12),
              Text(
                '₹${food.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 32),
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...food.ingredients.map(
                (e) => ListTile(
                  leading: const Icon(
                    Icons.check_circle,
                    color: Color(0xFFB5262B),
                  ),
                  title: Text(e),
                ),
              ),
              const Divider(height: 24),
              const Text(
                'Instructions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(food.instructions),
              const SizedBox(height: 14),
              Text(
                'Nutrition • ${food.calories} kcal',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'Add Ingredients to Cart',
                onPressed: () async {
                  await context.read<ShopCubit>().addToCart(food);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
