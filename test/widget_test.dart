
import 'package:flutter_test/flutter_test.dart';
import 'package:tripora/main.dart';

void main() {
  testWidgets('Meal Delivery app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MealDeliveryApp());

    expect(find.text('Hello Sandrica!'), findsOneWidget);
  });
}
