import 'package:flutter/material.dart';
import 'package:settle_app/core/widgets/figma_onboarding_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  Widget createTestApp(String initialLocation) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: createRouter(initialLocation: initialLocation),
      ),
    );
  }

  testWidgets('Home -> TaskSIN -> Settings & Help never duplicate shell key',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 1. /home -> /task-sin -> Something wrong? Update your answers -> /settings
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Something wrong? Update your answers'));
    await tester.pumpAndSettle();
    expect(find.text('MY PLAN'), findsOneWidget);
    // Verify no duplicate bottom bar on SettingsScreen
    expect(find.text('Home'), findsOneWidget);

    // 2. /home -> /task-sin -> Ask a settlement worker -> /help
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Ask a settlement worker'));
    await tester.tap(find.text('Ask a settlement worker'));
    await tester.pumpAndSettle();
    expect(find.text('Trusted help'), findsOneWidget);
    // Verify no duplicate bottom bar on HelpScreen
    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('Home -> CheckIn -> Talk to settlement worker -> Help works safely',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text("How's this week?"));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Talk to a settlement worker'));
    await tester.tap(find.text('Talk to a settlement worker'));
    await tester.pumpAndSettle();
    expect(find.text('Trusted help'), findsOneWidget);
  });

  testWidgets('Settings -> Family -> Layla & Me tab navigate cleanly without /profile error',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/settings'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('My family'));
    await tester.pumpAndSettle();
    expect(find.text('Family'), findsOneWidget);

    await tester.tap(find.text('Layla'));
    await tester.pumpAndSettle();
    expect(find.text('MY PLAN'), findsOneWidget);

    await tester.tap(find.text('My family'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Me'));
    await tester.pumpAndSettle();
    expect(find.text('MY PLAN'), findsOneWidget);
  });

  testWidgets('Settings -> Deactivate -> NotificationSettings & HowGuidance -> Help',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/settings'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Pause or delete account'));
    await tester.tap(find.text('Pause or delete account'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Just want fewer reminders?'));
    await tester.pumpAndSettle();
    expect(find.text('Reminders & alerts'), findsOneWidget);

    await tester.pumpWidget(createTestApp('/settings'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('How our guidance works'));
    await tester.tap(find.text('How our guidance works'));
    await tester.pumpAndSettle();
    // Tap RichText/WidgetSpan 'Find qualified help'
    final finder = find.byWidgetPredicate(
      (w) => w is InkWell && w.child is Text && (w.child as Text).data == 'Find qualified help',
    );
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
    expect(find.text('Trusted help'), findsOneWidget);
  });

  testWidgets('GuestHome -> Stage -> Task -> Settings & Journey 4 <-> 4b Back work safely',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/guest-home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2 · Paperwork'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 2 OF 10 · IN PROGRESS'), findsOneWidget);
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Something wrong? Update your answers'));
    await tester.pumpAndSettle();
    expect(find.text('MY PLAN'), findsOneWidget);

    // Home -> TaskSIN -> DonePicker -> TaskDone -> Set up your CRA My Account -> Journey
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Mark as done'));
    await tester.tap(find.text('Mark as done'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save'));
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Set up your CRA My Account'));
    await tester.tap(find.text('Set up your CRA My Account'));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);

    // Reminders Upcoming <-> Calendar swaps via replacement so Back goes Home
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    final bellFinder = find.byWidgetPredicate(
      (w) => w is InkWell && w.borderRadius == BorderRadius.circular(22),
    );
    await tester.tap(bellFinder);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Calendar'));
    await tester.pumpAndSettle();
    expect(find.text('September 2026'), findsOneWidget);
    await tester.tap(find.text('Upcoming'));
    await tester.pumpAndSettle();
    expect(find.text('TODAY'), findsOneWidget);

    // Back from Upcoming returns directly to Home
    final backFinder = find.byType(FigmaCircleBackButton);
    await tester.tap(backFinder);
    await tester.pumpAndSettle();
    expect(find.text('Good morning, Layla'), findsOneWidget);

    // Journey -> Stage 4 -> Stage 4b -> Back -> Stage 4 -> Back -> Journey
    await tester.pumpWidget(createTestApp('/journey'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('School, college & university'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 4 OF 10'), findsOneWidget);
    await tester.tap(find.text('University · Yasmin'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 4 · UNIVERSITY STREAM'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 4 OF 10'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);
  });
}

