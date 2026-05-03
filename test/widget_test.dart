import 'package:flutter_test/flutter_test.dart';
import 'package:uz_bank_app/main.dart';

void main() {
  testWidgets('Banking app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const UzBankApp());

    expect(find.byType(UzBankApp), findsOneWidget);
  });
}