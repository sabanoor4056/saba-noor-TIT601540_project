import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab8_fyp/main.dart';

void main() {
  testWidgets('Lie Sense AI app loads successfully',
      (WidgetTester tester) async {

    await tester.pumpWidget(const LieSenseAIApp());

    expect(find.byType(MaterialApp), findsOneWidget);

    expect(find.text('Lie Sense AI'), findsOneWidget);
  });
}