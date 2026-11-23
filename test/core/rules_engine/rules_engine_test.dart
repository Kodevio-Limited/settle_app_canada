import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/models/user_profile.dart';
import 'package:settle_app/core/rules_engine/rules_engine.dart';

void main() {
  group('RulesEngine Plan Generation Tests', () {
    const engine = RulesEngine();

    test('New arrival without tax return has CRA and Dental locked', () {
      const profile = UserProfile(
        id: 'user_1',
        name: 'Layla',
        stage: MoveStage.arrivedUnder3Months,
        province: 'ON',
        city: 'Toronto',
        hasFiledTaxReturn: false,
      );

      final plan = engine.generatePlan(profile);

      final craTask = plan.firstWhere((t) => t.id == 'task_cra');
      expect(craTask.state, TaskState.locked);
      expect(craTask.lockedReason, contains('first Canadian tax return'));

      final dentalTask = plan.firstWhere((t) => t.id == 'task_dental_plan');
      expect(dentalTask.state, TaskState.locked);

      final sinTask = plan.firstWhere((t) => t.id == 'task_sin');
      expect(sinTask.state, TaskState.open);
    });

    test('User with filed tax return has CRA and Dental unlocked', () {
      const profile = UserProfile(
        id: 'user_2',
        name: 'Layla',
        stage: MoveStage.settled3Plus,
        province: 'ON',
        city: 'Toronto',
        hasFiledTaxReturn: true,
      );

      final plan = engine.generatePlan(profile);

      final craTask = plan.firstWhere((t) => t.id == 'task_cra');
      expect(craTask.state, TaskState.open);
      expect(craTask.lockedReason, isNull);

      final dentalTask = plan.firstWhere((t) => t.id == 'task_dental_plan');
      expect(dentalTask.state, TaskState.open);
    });

    test('Household with children generates school tasks', () {
      const profile = UserProfile(
        id: 'user_3',
        name: 'Omar',
        stage: MoveStage.arrivedUnder3Months,
        province: 'ON',
        city: 'Mississauga',
        members: [
          HouseholdMember(id: 'm1', name: 'Yasmin', relationship: 'child', age: 7),
        ],
        hasRegisteredSchool: false,
      );

      final plan = engine.generatePlan(profile);

      final schoolTask = plan.firstWhere((t) => t.id == 'task_school_reg');
      expect(schoolTask.state, TaskState.open);

      final eslTask = plan.firstWhere((t) => t.id == 'task_esl_support');
      expect(eslTask.state, TaskState.locked);
    });
  });
}

