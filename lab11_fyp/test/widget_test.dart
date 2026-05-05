// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab11_fyp/main.dart';

void main() {
  testWidgets('Lie Sense AI UI Test', (WidgetTester tester) async {
    // Build your app
    await tester.pumpWidget(const LieSenseApp());

    // Verify AppBar title
    expect(find.text('Lie Sense AI'), findsOneWidget);

    // Verify icons exist
    expect(find.byIcon(Icons.face), findsOneWidget);
    expect(find.byIcon(Icons.mic), findsOneWidget);
    expect(find.byIcon(Icons.accessibility), findsOneWidget);
  });
}