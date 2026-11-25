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

  testWidgets('S05: 5.1 Nearby & 5.2 LocationDetail navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Nearby -> Location card -> LocationDetail
    await tester.pumpWidget(createTestApp('/nearby'));
    await tester.pumpAndSettle();
    expect(find.text('Details'), findsWidgets);
    await tester.tap(find.text('Details').first);
    await tester.pumpAndSettle();
    expect(find.text('Service Canada Centre · Mississauga'), findsOneWidget);

    // LocationDetail -> Apply for your SIN -> TaskSIN
    expect(find.text('Apply for your SIN'), findsOneWidget);
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Social Insurance Number'), findsWidgets);

    // LocationDetail -> Report a problem -> ReportOutdated
    await tester.pumpWidget(createTestApp('/location-detail'));
    await tester.pumpAndSettle();
    expect(find.text('Report a problem'), findsOneWidget);
    await tester.tap(find.text('Report a problem'));
    await tester.pumpAndSettle();
    expect(find.text('Report outdated info'), findsOneWidget);

    // LocationDetail -> BackButton -> Nearby
    await tester.pumpWidget(createTestApp('/location-detail'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Near you'), findsOneWidget);
  });

  testWidgets('S05: 5.3 DonePicker & 5.4 TaskDone navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // DonePicker -> Save -> TaskDone
    await tester.pumpWidget(createTestApp('/done-picker'));
    await tester.pumpAndSettle();
    expect(find.text('Save'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Back to my plan'), findsOneWidget);

    // TaskDone -> Back to my plan -> Home
    await tester.tap(find.text('Back to my plan'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);
  });

  testWidgets('S05: 5.6 Dismiss, 5.7 ReportOutdated, 5.8 ContentUpdated navigation',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Dismiss -> Update my plan -> Home
    await tester.pumpWidget(createTestApp('/dismiss'));
    await tester.pumpAndSettle();
    expect(find.text('Update my plan'), findsOneWidget);
    await tester.tap(find.text('Update my plan'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);

    // ContentUpdated -> Review the task -> TaskSIN
    await tester.pumpWidget(createTestApp('/content-updated'));
    await tester.pumpAndSettle();
    expect(find.text('Review the task'), findsOneWidget);
    await tester.tap(find.text('Review the task'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Social Insurance Number'), findsWidgets);

    // ContentUpdated -> Change update alerts -> NotificationSettings
    await tester.pumpWidget(createTestApp('/content-updated'));
    await tester.pumpAndSettle();
    expect(find.text('Change update alerts'), findsOneWidget);
    await tester.ensureVisible(find.text('Change update alerts'));
    await tester.tap(find.text('Change update alerts'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Reminders & alerts'), findsWidgets);

    // ContentUpdated -> BackButton -> Home
    await tester.pumpWidget(createTestApp('/content-updated'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);
  });
}
