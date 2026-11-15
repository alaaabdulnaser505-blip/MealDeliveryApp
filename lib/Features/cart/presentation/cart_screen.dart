import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/widgets/primary_button.dart';

import '../../checkout/presentation/checkout_screen.dart';
import '../logic/shop_cubit.dart';
import '../logic/shop_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty)
            return const Center(child: Text('Your cart is empty'));
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 850 : size.width,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(
                        size.width * (isTablet ? 0.04 : 0.05),
                      ),
                      itemCount: state.cartItems.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = state.cartItems[index];
                        return Row(
                          children: [
                            Container(
                              width: isTablet ? 90 : 68,
                              height: isTablet ? 90 : 68,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5E5E5),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.fastfood,
                                color: Color(0xFFB5262B),
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.food.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '₹${item.food.price.toStringAsFixed(0)}',
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => context
                                            .read<ShopCubit>()
                                            .decreaseQuantity(item.food),
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                      ),
                                      Text('${item.quantity}'),
                                      IconButton(
                                        onPressed: () => context
                                            .read<ShopCubit>()
                                            .increaseQuantity(item.food),
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () => context
                                      .read<ShopCubit>()
                                      .removeFromCart(item.food),
                                  icon: const Icon(Icons.close),
                                ),
                                Text(
                                  '₹${item.total.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      size.width * (isTablet ? 0.04 : 0.05),
                    ),
                    child: Column(
                      children: [
                        _summaryRow('Subtotal', state.subtotal),
                        _summaryRow('Delivery fee', state.deliveryFee),
                        const Divider(height: 24),
                        _summaryRow('Total', state.total, bold: true),
                        const SizedBox(height: 16),
                        PrimaryButton(
                          text: 'Checkout',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CheckoutScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _summaryRow(String title, double value, {bool bold = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              '₹${value.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}
