import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripora/features/cart/logic/shop_state.dart';
import 'package:tripora/core/sevices/user_firestore_service.dart';

class CheckoutRepository {
  final FirebaseFirestore firestore;
  final UserFirestoreService service;

  CheckoutRepository({
    FirebaseFirestore? firestore,
    UserFirestoreService? service,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       service = service ?? UserFirestoreService();

  Future<String> placeOrder({
    required List<CartItem> items,
    required String address,
    required String deliveryTime,
    required String paymentMethod,
    required double subtotal,
    required double tax,
    required double deliveryFee,
  }) async {
    if (items.isEmpty) throw Exception('Your cart is empty');

    final orderRef = service.orderCollection.doc();
    final batch = firestore.batch();
    final total = subtotal + tax + deliveryFee;

    batch.set(orderRef, {
      'items': items
          .map(
            (item) => {
              'dishId': item.food.id,
              'name': item.food.name,
              'image': item.food.image,
              'price': item.food.price,
              'quantity': item.quantity,
            },
          )
          .toList(),
      'address': address,
      'deliveryTime': deliveryTime,
      'paymentMethod': paymentMethod,
      'subtotal': subtotal,
      'tax': tax,
      'deliveryFee': deliveryFee,
      'total': total,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });

    await batch.commit();
    return orderRef.id;
  }
}
