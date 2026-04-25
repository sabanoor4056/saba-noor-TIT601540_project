import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab10_fyp/main.dart';

void main() {
  testWidgets('Lie Sense AI app loads successfully', (WidgetTester tester) async {

    // Build app correctly
    await tester.pumpWidget(const MaterialApp(
      home: LieSenseApp(),
    ));

    // Wait for UI
    await tester.pumpAndSettle();

    // Check main UI text
    expect(find.textContaining('Lie Sense'), findsWidgets);
  });
}