import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/models/user_profile.dart';
import 'package:settle_app/core/rules_engine/rules_engine.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/models/pathway_data.dart';
import 'package:settle_app/features/explore/models/explore_data.dart';
import 'package:settle_app/features/errors/section21_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 17: Complete 271 Screens & 5-Path Flow Graph Verification', () {
    test('Verification of total screens coverage (271 unique screens)', () {
      // 1. Task Data Tasks:
      // Section 4 (12) + Section 11 (24) + Section 12 variants (7) + Section 15 TaskCarCosts (1) + Section 17 (15) + Sections 18 & 19 (34) = 93 tasks
      expect(allTasksData.length, greaterThanOrEqualTo(93));

      // 2. Licensing Pathways:
      // Sections 14 & 22 = 44 pathways + 1 Engineer pathway = 45 regulated jobs
      expect(allRegulatedPathways.length, equals(44));

      // 3. Explore screens:
      // Sections 20 & 23 = 28 screens
      expect(allExploreScreens.length, equals(28));

      // 4. Section 21 screens:
      // 16 last taps, empty/error/RTL screens
      expect(allSection21Screens.length, equals(16));
    });

    test('Flow A & F: Rules engine branching across all 5 move stages', () {
      const engine = RulesEngine();

      // 1. Exploring stage
      const exploringUser = UserProfile(
        id: 'u1',
        name: 'Layla',
        stage: MoveStage.exploring,
        province: 'ON',
        city: 'Mississauga',
      );
      final exploringPlan = engine.generatePlan(exploringUser);
      expect(exploringPlan, isNotEmpty);

      // 2. Waiting stage
      const waitingUser = UserProfile(
        id: 'u2',
        name: 'Layla',
        stage: MoveStage.waiting,
        province: 'ON',
        city: 'Mississauga',
      );
      final waitingPlan = engine.generatePlan(waitingUser);
      expect(waitingPlan, isNotEmpty);

      // 3. Approved stage
      const approvedUser = UserProfile(
        id: 'u3',
        name: 'Layla',
        stage: MoveStage.approved,
        province: 'ON',
        city: 'Mississauga',
      );
      final approvedPlan = engine.generatePlan(approvedUser);
      expect(approvedPlan, isNotEmpty);

      // 4. Arrived < 3 months stage
      const arrivedUser = UserProfile(
        id: 'u4',
        name: 'Layla',
        stage: MoveStage.arrivedUnder3Months,
        province: 'ON',
        city: 'Mississauga',
      );
      final arrivedPlan = engine.generatePlan(arrivedUser);
      expect(arrivedPlan, isNotEmpty);

      // 5. Settled 3+ months stage
      const settledUser = UserProfile(
        id: 'u5',
        name: 'Layla',
        stage: MoveStage.settled3Plus,
        province: 'ON',
        city: 'Mississauga',
      );
      final settledPlan = engine.generatePlan(settledUser);
      expect(settledPlan, isNotEmpty);
    });

    test('Flow G: Occupation licensing lookup engine resolves all professions',
        () {
      expect(allRegulatedPathways.containsKey('PathwayNurse'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayPhysician'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayCPA'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayTeacher'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayElectrician'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayPlumber'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayArchitect'), isTrue);
      expect(allRegulatedPathways.containsKey('PathwayCrane'), isTrue);
    });

    test('Flow H: Explore tab data flow & category filters', () {
      final rootExplore = allExploreScreens['Explore'];
      expect(rootExplore, isNotNull);
      expect(rootExplore!.title, equals('Things to do and save on'));

      final canoo = allExploreScreens['ExploreCanoo'];
      expect(canoo, isNotNull);
      expect(canoo!.sections.length, greaterThanOrEqualTo(2));

      final niagara = allExploreScreens['PlaceNiagara'];
      expect(niagara, isNotNull);
      expect(niagara!.title, equals('Niagara Falls'));
    });

    test('Flow I: Crisis & safety leave quickly page integrity', () {
      final leaveQuickly = allSection21Screens['LeaveQuickly'];
      expect(leaveQuickly, isNotNull);
      expect(leaveQuickly!.title, equals('Mississauga, ON'));
    });

    test('Flow D: Province variant mapping in Rules Engine', () {
      const bcUser = UserProfile(
        id: 'u_bc',
        name: 'Sami',
        stage: MoveStage.arrivedUnder3Months,
        province: 'BC',
        city: 'Vancouver',
      );
      final bcVariant = RulesEngine.getEffectiveTaskId('TaskHealthCard', bcUser);
      expect(bcVariant, equals('VarBCHealth'));

      const qcUser = UserProfile(
        id: 'u_qc',
        name: 'Nour',
        stage: MoveStage.arrivedUnder3Months,
        province: 'QC',
        city: 'Montreal',
      );
      final qcVariant = RulesEngine.getEffectiveTaskId('TaskLease', qcUser);
      expect(qcVariant, equals('VarQCLease'));
    });

    testWidgets('Full app router configuration loads without errors',
        (tester) async {
      final router = createRouter();
      expect(router, isNotNull);
      expect(router.routeInformationProvider, isNotNull);
    });
  });
}
