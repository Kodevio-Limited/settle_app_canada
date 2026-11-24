import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/tasks/models/pathway_data.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/regulated_pathway_detail_screen.dart';
import 'package:settle_app/features/tasks/all_professions_screen.dart';
import 'package:settle_app/features/plan/budget_planner_screen.dart';
import 'package:settle_app/features/family/join_household_screen.dart';
import 'package:settle_app/features/profile/privacy_policy_screen.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 12: Sections 14, 15 & 22 Tests', () {
    test('All 44 regulated pathways are populated in allRegulatedPathways', () {
      expect(allRegulatedPathways.length, equals(44));

      // Spot check Section 14 (first 11)
      expect(allRegulatedPathways.containsKey('PathwayCPA'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayDentist'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayECE'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayElectrician'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayLawyer'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayNurse'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayPharmacist'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayPhysician'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayPlumber'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwaySocialWorker'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayTeacher'), isTrue);

      // Spot check Section 22 (remaining 34)
      expect(allRegulatedPathways.containsKey('PathwayArchitect'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayAutoTech'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayCrane'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayVet'), isTrue);
    });

    test('TaskCarCosts is present in allTasksData', () {
      final task = getTaskById('TaskCarCosts');
      expect(task, isNotNull);
      expect(task!.title, equals('Plan car costs'));
      expect(task.steps.length, equals(4));
      expect(task.stats.length, equals(2));
      expect(task.checklist.length, equals(3));
    });

    testWidgets('BudgetPlannerScreen renders accurately and handles saving',
        (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: BudgetPlannerScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Your first-months budget'), findsOneWidget);
      expect(find.text('Each month'), findsOneWidget);
      expect(find.text('One-time setup costs'), findsOneWidget);
      expect(find.text('Save my numbers'), findsOneWidget);

      await tester.dragUntilVisible(
        find.text('Save my numbers'),
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save my numbers'));
      await tester.pumpAndSettle();
      expect(find.text('Budget saved to your phone'), findsOneWidget);
    });

    testWidgets('JoinHouseholdScreen renders invite and household info',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: JoinHouseholdScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text('Layla invited you to her Settle household'), findsOneWidget);
      expect(find.text('Layla & Omar'), findsOneWidget);
      expect(find.text('Join household'), findsOneWidget);
      expect(find.text('Decline'), findsOneWidget);
    });

    testWidgets('PrivacyPolicyScreen renders 3 commitments and policy text',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PrivacyPolicyScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Terms and Privacy Policy'), findsOneWidget);
      expect(find.text('Our 3 commitments to you'), findsOneWidget);
      expect(find.text('1. Your data is yours'), findsOneWidget);
      expect(find.text('2. Partners never see your answers'), findsOneWidget);
      expect(find.text('3. Instant and complete deletion'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });

    testWidgets('AllProfessionsScreen renders categories and list items',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AllProfessionsScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Jobs that need a licence'), findsOneWidget);
      expect(find.text('Health · 21'), findsOneWidget);
      expect(find.text('Education & social services · 3'), findsOneWidget);
      expect(find.text('Business, law & science · 11'), findsOneWidget);
      expect(find.text('Skilled trades · 10'), findsOneWidget);
      expect(find.text('Registered nurse'), findsOneWidget);
      expect(find.text('Electrician'), findsOneWidget);
    });

    testWidgets('RegulatedPathwayDetailScreen renders CPA pathway accurately',
        (tester) async {
      tester.view.physicalSize = const Size(800, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: RegulatedPathwayDetailScreen(pathwayId: 'PathwayCPA'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Accountant (CPA): your licensing pathway'),
          findsOneWidget);
      expect(find.text('Needs a licence in Ontario'), findsOneWidget);
      expect(find.text('Certificates you need'), findsOneWidget);
      expect(find.text('Your pathway'), findsOneWidget);
      expect(find.text('Free help'), findsOneWidget);
      expect(find.text('Mark as done'), findsOneWidget);

      await tester.scrollUntilVisible(find.text('Mark as done'), 100);
      await tester.tap(find.text('Mark as done'));
      await tester.pumpAndSettle();
      expect(find.text('Completed'), findsOneWidget);
    });

    testWidgets('TaskDetailScreen renders TaskCarCosts correctly',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'TaskCarCosts'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Plan car costs'), findsOneWidget);
      expect(find.text('What to check'), findsOneWidget);
      expect(find.text('Average car cost in Ontario including insurance'),
          findsOneWidget);
      expect(
          find.text('Compare transit costs (PRESTO monthly passes) with car costs.'),
          findsOneWidget);
    });
  });
}
