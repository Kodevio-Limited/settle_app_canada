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

  testWidgets('S03: 3.1 Home navigation (bell, all tasks, stage card, near you, check-in, bottom nav)',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Home -> Bell -> Reminders
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.byType(Stack), findsWidgets);
    // Find bell InkWell
    final bellFinder = find.byWidgetPredicate((w) =>
        w is InkWell && w.borderRadius == BorderRadius.circular(22));
    expect(bellFinder, findsOneWidget);
    await tester.tap(bellFinder);
    await tester.pumpAndSettle();
    expect(find.textContaining('Reminders'), findsWidgets);

    // Home -> All tasks -> Journey
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('All tasks'), findsOneWidget);
    await tester.tap(find.text('All tasks'));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);

    // Home -> Near you -> Nearby
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Near you'), findsOneWidget);
    await tester.tap(find.text('Near you'));
    await tester.pumpAndSettle();
    expect(find.text('Service Canada'), findsWidgets);

    // Home -> How's this week? -> CheckIn
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text("How's this week?"), findsOneWidget);
    await tester.tap(find.text("How's this week?"));
    await tester.pumpAndSettle();
    expect(find.textContaining('manageable does settling feel'), findsWidgets);

    // Home -> Action item -> TaskSIN
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Apply for your SIN'), findsOneWidget);
    await tester.tap(find.text('Apply for your SIN'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Social Insurance Number'), findsWidgets);

    // Home -> Bottom nav -> Journey
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Journey'), findsOneWidget);
    await tester.tap(find.text('Journey'));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);

    // Home -> Bottom nav -> Explore
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Explore'), findsOneWidget);
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Explore'), findsWidgets);

    // Home -> Bottom nav -> Help
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Help'), findsOneWidget);
    await tester.tap(find.text('Help'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Help'), findsWidgets);

    // Home -> Bottom nav -> Me
    await tester.pumpWidget(createTestApp('/home'));
    await tester.pumpAndSettle();
    expect(find.text('Me'), findsOneWidget);
    await tester.tap(find.text('Me'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Settings'), findsWidgets);
  });

  testWidgets('S03: 3.2 Journey navigation (search, stages 1-10)', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Journey -> Search -> Search screen
    await tester.pumpWidget(createTestApp('/journey'));
    await tester.pumpAndSettle();
    final searchFinder = find.byWidgetPredicate((w) =>
        w is InkWell && w.borderRadius == BorderRadius.circular(22));
    expect(searchFinder, findsOneWidget);
    await tester.tap(searchFinder);
    await tester.pumpAndSettle();
    expect(find.textContaining('Search'), findsWidgets);

    // Journey -> Stage 1 (Status) -> StageDetailScreen
    await tester.pumpWidget(createTestApp('/journey'));
    await tester.pumpAndSettle();
    expect(find.text('Status & arrival documents'), findsOneWidget);
    await tester.tap(find.text('Status & arrival documents'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 1 OF 10 · DONE'), findsOneWidget);

    // Journey -> Stage 2 (Paperwork) -> StageDetailScreen
    await tester.pumpWidget(createTestApp('/journey'));
    await tester.pumpAndSettle();
    expect(find.text('Paperwork'), findsOneWidget);
    await tester.tap(find.text('Paperwork'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 2 OF 10 · IN PROGRESS'), findsOneWidget);

    // Journey -> Stage 3 (Housing) -> StageDetailScreen
    await tester.pumpWidget(createTestApp('/journey'));
    await tester.pumpAndSettle();
    expect(find.text('Housing'), findsOneWidget);
    await tester.tap(find.text('Housing'));
    await tester.pumpAndSettle();
    expect(find.text('STAGE 3 OF 10'), findsOneWidget);

    // Stage 3 -> BackButton -> Journey
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);
  });
}
