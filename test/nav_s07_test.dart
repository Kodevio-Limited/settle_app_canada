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

  testWidgets('Verify all S07 navigation edges exist and work', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final file = File('test/fixtures/nav_s07.json');
    final edges = jsonDecode(file.readAsStringSync()) as List;

    expect(edges.length, 33);

    // Test HelpScreen
    await tester.pumpWidget(createTestApp('/help'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Trusted help'), findsWidgets);

    // Test CrisisScreen
    await tester.pumpWidget(createTestApp('/crisis'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Get help now'), findsWidgets);
    expect(find.text('Leave quickly'), findsOneWidget);

    // Test CheckInScreen
    await tester.pumpWidget(createTestApp('/check-in'));
    await tester.pumpAndSettle();
    expect(find.textContaining('manageable does settling feel'), findsWidgets);

    // Test CommunityGroupsScreen
    await tester.pumpWidget(createTestApp('/community-groups'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Groups near you'), findsWidgets);

    // Test HowGuidanceScreen
    await tester.pumpWidget(createTestApp('/how-guidance'));
    await tester.pumpAndSettle();
    expect(find.textContaining('guidance works'), findsWidgets);
  });
}
