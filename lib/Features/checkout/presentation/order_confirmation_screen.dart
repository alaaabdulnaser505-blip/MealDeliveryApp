import 'package:flutter/material.dart';
import 'package:tripora/core/widgets/primary_button.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String orderId;
  final String payment;
  final String orderTime;
  final double total;

  const OrderConfirmationScreen({
    super.key,
    required this.orderId,
    required this.payment,
    required this.orderTime,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * (isTablet ? 0.12 : 0.07)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isTablet ? 600 : size.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundColor: Color(0xFFE7F5EC),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your Order is Confirmed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 30 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Your demo order has been placed successfully.'),
                const SizedBox(height: 24),
                Text('Order ID: $orderId'),
                Text('Payment method: $payment'),
                Text('Order time: $orderTime'),
                Text('Total: ₹${total.toStringAsFixed(0)}'),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Back to Home',
                  onPressed: ()=> Navigator.popUntil(context, (Route)=>Route.isFirst)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
