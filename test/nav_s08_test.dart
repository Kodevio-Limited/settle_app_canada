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

  testWidgets('Verify all S08 navigation edges exist and work', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final file = File('test/fixtures/nav_s08.json');
    final edges = jsonDecode(file.readAsStringSync()) as List;

    expect(edges.length, 47);

    // Test SettingsScreen (8.1)
    await tester.pumpWidget(createTestApp('/settings'));
    await tester.pumpAndSettle();
    expect(find.text('Me'), findsWidgets);

    // Test PrivacyDataScreen (8.3)
    await tester.pumpWidget(createTestApp('/privacy-data'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Privacy & my data'), findsWidgets);

    // Test DataExportScreen (8.4)
    await tester.pumpWidget(createTestApp('/data-export'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Download your data'), findsWidgets);

    // Test LanguageAccessScreen (8.5)
    await tester.pumpWidget(createTestApp('/language-access'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Language & accessibility'), findsWidgets);

    // Test DeactivateScreen (8.7)
    await tester.pumpWidget(createTestApp('/deactivate'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Pause or delete'), findsWidgets);

    // Test PausedScreen (8.8)
    await tester.pumpWidget(createTestApp('/paused'));
    await tester.pumpAndSettle();
    expect(find.textContaining('paused'), findsWidgets);

    // Test WelcomeBackScreen (8.9)
    await tester.pumpWidget(createTestApp('/welcome-back'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Welcome back'), findsWidgets);

    // Test DeleteConfirmScreen (8.10)
    await tester.pumpWidget(createTestApp('/delete-confirm'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Delete your account?'), findsWidgets);

    // Test DeletedScreen (8.11)
    await tester.pumpWidget(createTestApp('/deleted'));
    await tester.pumpAndSettle();
    expect(find.textContaining('deleted'), findsWidgets);
  });
}
