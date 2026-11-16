import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/Features/checkout/checkout_page.dart';
import 'package:tripora/core/widgets/primary_button.dart';

import '../../cart/logic/shop_cubit.dart';
import '../../cart/logic/shop_state.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String payment = 'Visa';
  String orderTime = 'As soon as possible';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) => Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isTablet ? 700 : size.width),
            child: ListView(
              padding: EdgeInsets.all(size.width * (isTablet ? 0.06 : 0.05)),
              children: [
                const Text(
                  'Order time',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: orderTime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: ['As soon as possible', 'Later today', 'Tomorrow']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => orderTime = value ?? orderTime),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Payment method (demo only)',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                ...['Visa', 'PayPal', 'Google Pay', 'Apple Pay'].map(
                  (method) => RadioListTile<String>(
                    value: method,
                    groupValue: payment,
                    title: Text(method),
                    onChanged: (value) =>
                        setState(() => payment = value ?? payment),
                  ),
                ),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '₹${state.total.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Make Payment',
                  onPressed: () async {
                    final cubit = context.read<ShopCubit>();
                    final repo = CheckoutRepository();
                    try {
                      final orderId = await repo.placeOrder(
                        items: cubit.state.cartItems,
                        address: 'Demo address',
                        deliveryTime: orderTime,
                        paymentMethod: payment,
                        subtotal: cubit.state.subtotal,
                        tax: 0,
                        deliveryFee: cubit.state.deliveryFee,
                      );
                      if (!context.mounted) return;
                      await cubit.clearCart();
                      if (!context.mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OrderConfirmationScreen(
                            orderId: orderId,
                            payment: payment,
                            orderTime: orderTime,
                            total: cubit.state.total,
                          ),
                        ),
                      );
                    } catch (e) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Oreder failed : $e')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
