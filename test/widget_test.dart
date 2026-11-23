import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  testWidgets('Section 1: First launch to SignUp and Consent flow test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final router = createRouter();
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.textContaining('Settle in Canada'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text('Create your account'), findsOneWidget);
  });

  testWidgets('Section 1: Consent Screen toggles are interactive', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final router = createRouter(initialLocation: '/consent');
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.textContaining('Your privacy, in plain'), findsOneWidget);
    expect(find.text('NEEDED TO MAKE YOUR PLAN'), findsOneWidget);
    expect(find.text('Your email, to sign in'), findsOneWidget);
    expect(find.text('Agree and continue'), findsOneWidget);

    // Tap Agree and continue -> navigates to NotifPermission
    await tester.tap(find.text('Agree and continue'));
    await tester.pumpAndSettle();

    expect(find.text('Never miss an important step'), findsOneWidget);
    expect(find.text('Tomorrow · Service Canada'), findsOneWidget);
  });

  testWidgets('Section 2: Onboarding full 5-step flow test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final router = createRouter(initialLocation: '/stage');
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    ));
    await tester.pumpAndSettle();

    // Step 1: Stage
    expect(find.text('Where are you in your move?'), findsOneWidget);
    expect(find.text('Still exploring Canada'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Step 2: Destination
    expect(find.text('Where are you settling?'), findsOneWidget);
    expect(find.text('Province or territory'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Step 3: Status
    expect(find.text('Your status in Canada'), findsOneWidget);
    expect(find.text('Permanent resident'), findsOneWidget);
    expect(find.textContaining('Not sure? Check your own documents'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Step 4: Household
    expect(find.text("Who's settling with you?"), findsOneWidget);
    expect(find.text('+ Child'), findsOneWidget);
    expect(find.textContaining('We only ask a nickname and an age range'), findsOneWidget);
    expect(find.text('Edit'), findsWidgets);

    // Tap + Child -> AddChildScreen
    await tester.tap(find.text('+ Child'));
    await tester.pumpAndSettle();

    expect(find.text('Add a child'), findsOneWidget);
    expect(find.text('Nickname'), findsOneWidget);
    expect(find.text('Age range'), findsOneWidget);
    expect(find.text('Needs'), findsOneWidget);
    expect(find.text('Are school records ready?'), findsOneWidget);
    expect(find.text('Might English support help?'), findsOneWidget);

    await tester.tap(find.text('Add Nour'));
    await tester.pumpAndSettle();

    // Back to Household
    expect(find.text("Who's settling with you?"), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Step 5: Priorities
    expect(find.text('What matters most right now?'), findsOneWidget);
    await tester.ensureVisible(find.text('Build my plan'));
    await tester.tap(find.text('Build my plan'));
    await tester.pumpAndSettle();

    // Plan Ready
    expect(find.text('Your plan is ready, Layla'), findsOneWidget);
    expect(find.text('Start with these three'), findsOneWidget);
    expect(find.text('Go to my plan'), findsOneWidget);

    // Tap Go to my plan -> navigates to Home
    await tester.tap(find.text('Go to my plan'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('Section 2: AddStudent (Screen 2.9) test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final router = createRouter(initialLocation: '/add-student');
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Add an adult child'), findsOneWidget);
    expect(find.text('Name or nickname'), findsOneWidget);
    expect(find.text('Age range'), findsOneWidget);
    expect(find.text('Studying in Canada?'), findsOneWidget);
    expect(find.text('Where are they with applying?'), findsOneWidget);
    expect(find.text('Same status as me'), findsOneWidget);
    expect(find.text('Add Yasmin'), findsOneWidget);
  });
}
