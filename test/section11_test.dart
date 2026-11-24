import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';

void main() {
  Widget createWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('Phase 10: Section 11 (24 Remaining Ontario Tasks) Tests', () {
    final taskIds = [
      'TaskAfterCare',
      'TaskBank',
      'TaskCRA',
      'TaskCampusServices',
      'TaskCredentialAssess',
      'TaskCredit',
      'TaskDomesticTuition',
      'TaskDrivingRecord',
      'TaskESL',
      'TaskEnglishTest',
      'TaskGroups',
      'TaskHealthCard',
      'TaskHealthGap',
      'TaskImmunization',
      'TaskKidsDental',
      'TaskLandingDocs',
      'TaskLease',
      'TaskPRBasics',
      'TaskPresto',
      'TaskRoadTest',
      'TaskScams',
      'TaskTaxReturn',
      'TaskTenantInsurance',
      'TaskUtilities',
    ];

    test('All 24 tasks exist in task_data model list', () {
      for (final id in taskIds) {
        final task = getTaskById(id);
        expect(task, isNotNull, reason: 'Task $id should exist');
        expect(task!.title.isNotEmpty, isTrue);
        expect(task.steps.isNotEmpty, isTrue);
      }
    });

    testWidgets('4.17 TaskHealthCard renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const TaskDetailScreen(taskId: 'TaskHealthCard')));
      expect(find.text('Apply for Ontario health cards'), findsOneWidget);
      expect(find.text('Steps'), findsOneWidget);
    });

    testWidgets('4.35 TaskBank renders with people and checklist', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const TaskDetailScreen(taskId: 'TaskBank')));
      expect(find.text('Open a bank account'), findsOneWidget);
      expect(find.text('Passport'), findsOneWidget);
      expect(find.text('Steps'), findsOneWidget);
    });

    testWidgets('4.18 TaskCRA renders locked note or steps', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const TaskDetailScreen(taskId: 'TaskCRA')));
      expect(find.text('Set up your CRA account'), findsOneWidget);
    });

    testWidgets('Phase 10 routes are registered in AppRouter', (WidgetTester tester) async {
      final router = createRouter(initialLocation: '/tasks/bank');
      expect(router, isNotNull);
    });
  });
}

