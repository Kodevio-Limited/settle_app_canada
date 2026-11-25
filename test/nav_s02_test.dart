import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/core/widgets/settle_button.dart';

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

  testWidgets('S02: 2.1 Stage navigation (Back, Skip, Continue)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Back -> /location-permission
    await tester.pumpWidget(createTestApp('/stage'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Find services near you'), findsOneWidget);

    // Skip -> /destination
    await tester.pumpWidget(createTestApp('/stage'));
    await tester.pumpAndSettle();
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text('Where are you settling?'), findsOneWidget);

    // Continue -> /destination
    await tester.pumpWidget(createTestApp('/stage'));
    await tester.pumpAndSettle();
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Where are you settling?'), findsOneWidget);
  });

  testWidgets('S02: 2.2 Destination navigation (Back, Skip, Continue)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Back -> /stage
    await tester.pumpWidget(createTestApp('/destination'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Where are you in your move?'), findsOneWidget);

    // Skip -> /status
    await tester.pumpWidget(createTestApp('/destination'));
    await tester.pumpAndSettle();
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text('Your status in Canada'), findsOneWidget);

    // Continue -> /status
    await tester.pumpWidget(createTestApp('/destination'));
    await tester.pumpAndSettle();
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Your status in Canada'), findsOneWidget);
  });

  testWidgets('S02: 2.3 Status navigation (Back, Skip, Trusted help, Continue)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Back -> /destination
    await tester.pumpWidget(createTestApp('/status'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Where are you settling?'), findsOneWidget);

    // Skip -> /household
    await tester.pumpWidget(createTestApp('/status'));
    await tester.pumpAndSettle();
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // Trusted help -> /help
    await tester.pumpWidget(createTestApp('/status'));
    await tester.pumpAndSettle();
    expect(find.text('Trusted help'), findsOneWidget);
    await tester.tap(find.text('Trusted help'));
    await tester.pumpAndSettle();
    expect(find.text('Help & Trusted Support (Phase 7)'), findsOneWidget);

    // Continue -> /household
    await tester.pumpWidget(createTestApp('/status'));
    await tester.pumpAndSettle();
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);
  });

  testWidgets('S02: 2.4 Household navigation (Back, Skip, + buttons, Continue)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Back -> /status
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Your status in Canada'), findsOneWidget);

    // Skip -> /priorities
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text('What matters most right now?'), findsOneWidget);

    // + Partner -> /add-adult
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('+ Partner'), findsOneWidget);
    await tester.tap(find.text('+ Partner'));
    await tester.pumpAndSettle();
    expect(find.text('Add an adult'), findsOneWidget);

    // + Child -> /add-child
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('+ Child'), findsOneWidget);
    await tester.tap(find.text('+ Child'));
    await tester.pumpAndSettle();
    expect(find.text('Add a child'), findsOneWidget);

    // + Parent or other -> /add-adult
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('+ Parent or other'), findsOneWidget);
    await tester.tap(find.text('+ Parent or other'));
    await tester.pumpAndSettle();
    expect(find.text('Add an adult'), findsOneWidget);

    // + Adult child -> /add-student
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('+ Adult child'), findsOneWidget);
    await tester.tap(find.text('+ Adult child'));
    await tester.pumpAndSettle();
    expect(find.text('Add an adult child'), findsOneWidget);

    // Continue -> /priorities
    await tester.pumpWidget(createTestApp('/household'));
    await tester.pumpAndSettle();
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('What matters most right now?'), findsOneWidget);
  });

  testWidgets('S02: 2.5 AddChild, 2.6 AddAdult, 2.9 AddStudent navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 2.5 AddChild -> Back
    await tester.pumpWidget(createTestApp('/add-child'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.5 AddChild -> Submit button
    await tester.pumpWidget(createTestApp('/add-child'));
    await tester.pumpAndSettle();
    expect(find.byType(SettleButton), findsOneWidget);
    await tester.tap(find.byType(SettleButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.6 AddAdult -> Back
    await tester.pumpWidget(createTestApp('/add-adult'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.6 AddAdult -> Submit button
    await tester.pumpWidget(createTestApp('/add-adult'));
    await tester.pumpAndSettle();
    expect(find.byType(SettleButton), findsOneWidget);
    await tester.tap(find.byType(SettleButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.9 AddStudent -> Back
    await tester.pumpWidget(createTestApp('/add-student'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.9 AddStudent -> Submit button
    await tester.pumpWidget(createTestApp('/add-student'));
    await tester.pumpAndSettle();
    expect(find.byType(SettleButton), findsOneWidget);
    await tester.tap(find.byType(SettleButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);
  });

  testWidgets('S02: 2.7 Priorities & 2.8 PlanReady navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 2.7 Priorities -> Back
    await tester.pumpWidget(createTestApp('/priorities'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text("Who's settling with you?"), findsOneWidget);

    // 2.7 Priorities -> Build my plan -> 2.8 PlanReady
    await tester.pumpWidget(createTestApp('/priorities'));
    await tester.pumpAndSettle();
    expect(find.text('Build my plan'), findsOneWidget);
    await tester.tap(find.text('Build my plan'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Your plan is ready'), findsOneWidget);

    // 2.8 PlanReady -> Go to my plan -> 3.1 Home
    await tester.pumpWidget(createTestApp('/plan-ready'));
    await tester.pumpAndSettle();
    expect(find.text('Go to my plan'), findsOneWidget);
    await tester.tap(find.text('Go to my plan'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);
  });
}
