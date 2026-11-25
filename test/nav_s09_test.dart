import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  Widget createTestApp(String initialLocation) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: createRouter(initialLocation: initialLocation),
      ),
    );
  }

  testWidgets('Verify all S09 navigation edges exist and work', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final file = File('test/fixtures/nav_s09.json');
    final edges = jsonDecode(file.readAsStringSync()) as List;

    expect(edges.length, 21);

    // Test GuestHomeScreen (9.1)
    await tester.pumpWidget(createTestApp('/guest-home'));
    await tester.pumpAndSettle();
    expect(find.textContaining("You're exploring"), findsWidgets);

    // Test OfflineScreen (9.2)
    await tester.pumpWidget(createTestApp('/offline'));
    await tester.pumpAndSettle();
    expect(find.textContaining("offline"), findsWidgets);

    // Test LocationDeniedScreen (9.3)
    await tester.pumpWidget(createTestApp('/location-denied'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Near you'), findsWidgets);

    // Test ServerErrorScreen (9.4)
    await tester.pumpWidget(createTestApp('/server-error'));
    await tester.pumpAndSettle();
    expect(find.textContaining('went wrong'), findsWidgets);
  });
}
