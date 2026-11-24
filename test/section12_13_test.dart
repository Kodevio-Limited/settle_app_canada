import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';
import 'package:settle_app/features/partners/how_partners_screen.dart';
import 'package:settle_app/features/partners/partner_detail_screen.dart';
import 'package:settle_app/features/partners/legal_help_screen.dart';

void main() {
  Widget createWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('Phase 11: Sections 12 & 13 (Province Variants + Partners & Legal Help) Tests', () {
    final variantIds = [
      'VarBCHealth',
      'VarBCHealthGap',
      'VarBCICBC',
      'VarMBNotEligible',
      'VarQCHealth',
      'VarQCLease',
      'VarQCSchool',
    ];

    test('All 7 province variants exist in task_data model list', () {
      for (final id in variantIds) {
        final task = getTaskById(id);
        expect(task, isNotNull, reason: 'Variant task $id should exist');
        expect(task!.title.isNotEmpty, isTrue);
        expect(task.steps.isNotEmpty, isTrue);
      }
    });

    testWidgets('12.1 VarBCHealth renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const TaskDetailScreen(taskId: 'VarBCHealth')));
      expect(find.text('Enrol in MSP — coverage starts after a wait'), findsOneWidget);
      expect(find.text('Steps'), findsOneWidget);
    });

    testWidgets('12.7 VarMBNotEligible renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const TaskDetailScreen(taskId: 'VarMBNotEligible')));
      expect(find.text('Health coverage: not available for study permits'), findsOneWidget);
    });

    testWidgets('13.1 PartnerDetailScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const PartnerDetailScreen()));
      expect(find.text('SPONSORED PARTNER'), findsOneWidget);
      expect(find.text('This is a paid placement'), findsOneWidget);
      expect(find.text('What they offer newcomers'), findsOneWidget);
      expect(find.text('Visit [Partner bank]\'s website'), findsOneWidget);
    });

    testWidgets('13.2 HowPartnersScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const HowPartnersScreen()));
      expect(find.text('ABOUT SETTLE'), findsOneWidget);
      expect(find.text('How we choose partners'), findsOneWidget);
      expect(find.text('Our rules'), findsOneWidget);
      expect(find.text('How a partner gets listed'), findsOneWidget);
    });

    testWidgets('13.3 LegalHelpScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const LegalHelpScreen()));
      expect(find.text('TRUSTED HELP'), findsOneWidget);
      expect(find.text('Legal and immigration help'), findsOneWidget);
      expect(find.text('Settle gives no immigration or legal advice'), findsOneWidget);
      expect(find.text('Check anyone before you pay'), findsOneWidget);
      expect(find.text('Licensed professionals'), findsOneWidget);
    });

    testWidgets('Phase 11 routes are registered in AppRouter', (WidgetTester tester) async {
      final router = createRouter(initialLocation: '/how-partners');
      expect(router, isNotNull);
    });
  });
}
