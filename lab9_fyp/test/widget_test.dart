import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab9_fyp/main.dart';

void main() {
  testWidgets('Lie Sense AI app loads correctly',
      (WidgetTester tester) async {

    await tester.pumpWidget(LieSenseAIApp());

    // Wait for UI to settle
    await tester.pumpAndSettle();

    // Check AppBar exists (more reliable than text search)
    expect(find.byType(AppBar), findsOneWidget);

    // Check tabs exist
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Detect'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}