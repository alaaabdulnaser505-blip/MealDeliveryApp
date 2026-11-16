import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/logic/shop_cubit.dart';
import '../../cart/logic/shop_state.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Dishes')),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state.savedFoods.isEmpty)
            return const Center(child: Text('No saved dishes yet'));
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 850 : size.width,
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(size.width * (isTablet ? 0.04 : 0.05)),
                itemCount: state.savedFoods.length,
                itemBuilder: (context, index) {
                  final food = state.savedFoods[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(isTablet ? 18 : 10),
                      leading: CircleAvatar(
                        radius: isTablet ? 32 : 25,
                        child: const Icon(Icons.restaurant),
                      ),
                      title: Text(food.name),
                      subtitle: Text('₹${food.price.toStringAsFixed(0)}'),
                      trailing: IconButton(
                        onPressed: () =>
                            context.read<ShopCubit>().toggleSaved(food),
                        icon: const Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
