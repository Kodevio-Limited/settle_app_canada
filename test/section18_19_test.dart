import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 14: Sections 18 & 19 Gap Tasks Tests', () {
    test('All 34 Gap Tasks exist and have non-empty data', () {
      final taskIds = [
        // Section 18
        'TaskAddressChange',
        'TaskBuyCar',
        'TaskCarSeats',
        'TaskChildCare',
        'TaskChildCareSubsidy',
        'TaskEarlyON',
        'TaskHousingHelp',
        'TaskMoveIn',
        'TaskPhotoCard',
        'TaskRegisterCar',
        'TaskRentalSearch',
        'TaskSchoolBus',
        'TaskSpecialEd',
        'TaskTeenCredits',
        'TaskTranslations',
        // Section 19
        'TaskBridging',
        'TaskBusiness',
        'TaskCLB',
        'TaskCRAScams',
        'TaskDentalPlan',
        'TaskGSTCredit',
        'TaskInsuranceHistory',
        'TaskJobScams',
        'TaskJobSearch',
        'TaskMentalHealth',
        'TaskOTB',
        'TaskPregnancy',
        'TaskPrescriptions',
        'TaskResume',
        'TaskSendMoney',
        'TaskWhereCare',
        'TaskWinterDriving',
        'TaskWorkBenefits',
        'TaskWorkRights',
      ];

      expect(taskIds.length, equals(34));

      for (final id in taskIds) {
        final task = getTaskById(id);
        expect(task, isNotNull, reason: 'Task $id should exist');
        expect(task!.title.isNotEmpty, isTrue);
        expect(task.steps.isNotEmpty || task.checklist.isNotEmpty, isTrue);
      }
    });

    testWidgets('TaskDetailScreen renders TaskPhotoCard accurately',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'TaskPhotoCard'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Get an Ontario Photo Card'), findsOneWidget);
    });

    testWidgets('TaskDetailScreen renders TaskDentalPlan accurately',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'TaskDentalPlan'),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text('Apply for the Canadian Dental Care Plan'), findsOneWidget);
    });

    testWidgets('TaskDetailScreen renders TaskWinterDriving accurately',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetailScreen(taskId: 'TaskWinterDriving'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Get ready for winter driving'), findsOneWidget);
    });
  });
}
