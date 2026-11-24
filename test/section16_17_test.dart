import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';
import 'package:settle_app/features/onboarding/stage_plan_ready_screen.dart';
import 'package:settle_app/features/home/stage_home_screen.dart';
import 'package:settle_app/features/journey/journey_approved_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 13: Sections 16 & 17 Tests', () {
    test('All 15 Section 17 tasks exist in allTasksData', () {
      final taskIds = [
        'ExpOptions',
        'ExpRepresentative',
        'ExpCities',
        'WaitTrack',
        'WaitDocs',
        'WaitSavings',
        'WaitWellbeing',
        'PreServices',
        'PreTravelDocs',
        'PreGoods',
        'PreKidsRecords',
        'PreMedications',
        'PreTempHousing',
        'PreArrivalDay',
        'PreFirst72',
      ];

      for (final id in taskIds) {
        final task = getTaskById(id);
        expect(task, isNotNull, reason: 'Task $id should exist');
        expect(task!.title.isNotEmpty, isTrue);
      }
    });

    testWidgets('StagePlanReadyScreen renders exploring variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: StagePlanReadyScreen(variant: StageVariant.exploring),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Your plan is ready, Layla'), findsOneWidget);
      expect(find.text('official pathways'), findsOneWidget);
      expect(find.text('Learn the official ways to immigrate'), findsOneWidget);
    });

    testWidgets('StagePlanReadyScreen renders approved variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: StagePlanReadyScreen(variant: StageVariant.approved),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Your plan is ready, Layla'), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('before you move'), findsOneWidget);
      expect(find.text('Sign up for free pre-arrival services'), findsOneWidget);
    });

    testWidgets('StageHomeScreen renders home approved variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: StageHomeScreen(variant: StageHomeVariant.approved),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('APPROVED · GETTING READY'), findsOneWidget);
      expect(find.text('Good evening, Layla'), findsOneWidget);
      expect(find.text('42 days'), findsOneWidget);
      expect(find.text('Your next 3 actions'), findsOneWidget);
      expect(find.text('Arrival day walkthrough'), findsOneWidget);
    });

    testWidgets('StageHomeScreen renders home settled variant', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: StageHomeScreen(variant: StageHomeVariant.settled),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('MONTH 5 IN CANADA'), findsOneWidget);
      expect(find.text('Settling in'), findsOneWidget);
      expect(find.text('File your first tax return'), findsOneWidget);
    });

    testWidgets('JourneyApprovedScreen renders stage 0 banner and task groups',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: JourneyApprovedScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Before you move'), findsOneWidget);
      expect(find.text('Getting ready to fly'), findsOneWidget);
      expect(find.text('High priority · First weeks'), findsOneWidget);
      expect(find.text('Sign up for free pre-arrival services'), findsOneWidget);
      expect(find.text('Paperwork & preparations'), findsOneWidget);
      expect(find.text('Arrival countdown'), findsOneWidget);
    });

    testWidgets('TaskDetailScreen renders PreArrivalDay task accurately',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'PreArrivalDay'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Know what happens at the airport'), findsOneWidget);
      expect(find.text('Steps'), findsOneWidget);
    });

    testWidgets('TaskDetailScreen renders WaitDocs task accurately',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'WaitDocs'),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text("Gather your family's documents"), findsOneWidget);
    });
  });
}
