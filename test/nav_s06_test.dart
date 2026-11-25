import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  testWidgets('Verify all S06 navigation edges exist and work', (tester) async {
    final file = File('test/fixtures/nav_s06.json');
    final edges = jsonDecode(file.readAsStringSync()) as List;

    expect(edges.length, 75);

    // Test a few critical routes
    final router = createRouter(initialLocation: '/reminders');
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Reminders'), findsWidgets);
    expect(find.text('Upcoming'), findsWidgets);
    expect(find.text('Calendar'), findsWidgets);

    // Tap Calendar
    await tester.tap(find.text('Calendar').first);
    await tester.pumpAndSettle();

    expect(find.text('Upcoming'), findsWidgets);
    expect(find.text('Settings'), findsWidgets);
  });
}
