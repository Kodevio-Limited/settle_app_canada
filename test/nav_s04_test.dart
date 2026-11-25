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

  testWidgets('S04: 4.2 TaskSIN navigation actions and links', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // TaskSIN -> Back -> Journey
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Your journey'), findsOneWidget);

    // TaskSIN -> Something wrong? Update your answers -> Settings
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Something wrong? Update your answers'), findsOneWidget);
    await tester.tap(find.text('Something wrong? Update your answers'));
    await tester.pumpAndSettle();
    expect(find.text('Me'), findsWidgets);

    // TaskSIN -> All checklists -> Checklist
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('All checklists'), findsOneWidget);
    await tester.ensureVisible(find.text('All checklists'));
    await tester.tap(find.text('All checklists'));
    await tester.pumpAndSettle();
    expect(find.textContaining('What to bring'), findsWidgets);

    // TaskSIN -> See all on the map -> Nearby
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('See all on the map'), findsOneWidget);
    await tester.ensureVisible(find.text('See all on the map'));
    await tester.tap(find.text('See all on the map'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Near you'), findsWidgets);

    // TaskSIN -> Mark as done -> DonePicker
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Mark as done'), findsOneWidget);
    await tester.ensureVisible(find.text('Mark as done'));
    await tester.tap(find.text('Mark as done'));
    await tester.pumpAndSettle();
    expect(find.text('Who has done this?'), findsOneWidget);

    // TaskSIN -> Remind me later -> Snooze
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Remind me later'), findsOneWidget);
    await tester.ensureVisible(find.text('Remind me later'));
    await tester.tap(find.text('Remind me later'));
    await tester.pumpAndSettle();
    expect(find.text('Remind me…'), findsOneWidget);

    // TaskSIN -> Not for me -> Dismiss
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Not for me'), findsOneWidget);
    await tester.ensureVisible(find.text('Not for me'));
    await tester.tap(find.text('Not for me'));
    await tester.pumpAndSettle();
    expect(find.text('Not for you?'), findsOneWidget);

    // TaskSIN -> Ask a settlement worker -> Help
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Ask a settlement worker'), findsOneWidget);
    await tester.ensureVisible(find.text('Ask a settlement worker'));
    await tester.tap(find.text('Ask a settlement worker'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Help'), findsWidgets);

    // TaskSIN -> Report outdated info -> ReportOutdated
    await tester.pumpWidget(createTestApp('/task-sin'));
    await tester.pumpAndSettle();
    expect(find.text('Report outdated info'), findsOneWidget);
    await tester.ensureVisible(find.text('Report outdated info'));
    await tester.tap(find.text('Report outdated info'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Report'), findsWidgets);
  });

  testWidgets('S04: 4.13 OccupationSearch & 4.14 OccupationPathway navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // OccupationSearch -> Back -> StageWork
    await tester.pumpWidget(createTestApp('/occupation-search'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.textContaining('Work & credentials'), findsWidgets);

    // OccupationSearch -> Civil engineer item -> OccupationPathway
    await tester.pumpWidget(createTestApp('/occupation-search'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Civil engineer'), findsWidgets);
    await tester.tap(find.textContaining('Civil engineer').first);
    await tester.pumpAndSettle();
    expect(find.textContaining('P.Eng.'), findsWidgets);

    // OccupationPathway -> Back -> OccupationSearch
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Does your job need a licence here?'), findsOneWidget);
  });
}
