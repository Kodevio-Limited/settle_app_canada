import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/core/theme/app_theme.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';

void main() {
  Widget buildApp({String initialLocation = '/task-sin'}) {
    final router = createRouter(initialLocation: initialLocation);
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: createAppTheme(),
      ),
    );
  }

  group('Section 4: Task Data Models', () {
    test('all 12 tasks are loaded with accurate data', () {
      expect(allTasksData.length, greaterThanOrEqualTo(12));
      for (final t in allTasksData) {
        expect(t.id.isNotEmpty, isTrue);
        expect(t.title.isNotEmpty, isTrue);
        expect(t.tag.isNotEmpty, isTrue);
        expect(t.steps.isNotEmpty, isTrue);
        expect(t.disclaimer, isNotNull);
      }

      final sinTask = getTaskById('TaskSIN');
      expect(sinTask, isNotNull);
      expect(sinTask!.title, equals('Apply for your Social Insurance Number (SIN)'));
      expect(sinTask.hasMap, isTrue);
      expect(sinTask.stats.length, equals(4));

      final statusTask = getTaskById('TaskStatus');
      expect(statusTask, isNotNull);
      expect(statusTask!.isCompleted, isTrue);
      expect(statusTask.completedText, equals('Done for everyone · Sep 20'));
    });
  });

  group('Section 4: TaskSIN (4.2)', () {
    testWidgets('renders all task template engine sections', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/task-sin'));
      await tester.pumpAndSettle();

      expect(find.text('PAPERWORK · STAGE 2 OF 10'), findsOneWidget);
      expect(find.text('Apply for your Social Insurance Number (SIN)'), findsOneWidget);
      expect(find.text('For '), findsOneWidget);
      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);
      expect(find.text('Yasmin'), findsOneWidget);

      expect(find.text("Why you're seeing this"), findsOneWidget);
      expect(find.text('You told us: permanent resident'), findsWidgets);
      expect(find.text('Arrived Sep 2026'), findsWidgets);
      expect(find.text('Something wrong? Update your answers'), findsOneWidget);

      expect(find.text('Cost'), findsOneWidget);
      expect(find.text('Free'), findsWidgets);
      expect(find.text('Where'), findsOneWidget);
      expect(find.text('Service Canada'), findsOneWidget);

      expect(find.text('Steps'), findsOneWidget);
      expect(find.text('What to bring'), findsOneWidget);
      expect(find.text('All checklists'), findsOneWidget);

      expect(find.text('Nearby Service Canada centres'), findsOneWidget);
      expect(find.text('Service Canada Centre · Mississauga'), findsOneWidget);
      expect(find.text('Official source · Canada.ca'), findsOneWidget);

      expect(find.text('Mark as done'), findsOneWidget);
      expect(find.text('Remind me later'), findsOneWidget);
      expect(find.text('Not for me'), findsOneWidget);
      expect(find.text('Ask a settlement worker'), findsOneWidget);
      expect(find.text('Report outdated info'), findsOneWidget);
    });
  });

  group('Section 4: TaskStatus (4.1 Completed State)', () {
    testWidgets('renders completed banner with Undo button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/task-status'));
      await tester.pumpAndSettle();

      expect(find.text('STATUS & ARRIVAL · STAGE 1 OF 10'), findsOneWidget);
      expect(find.text('Make sure your PR cards reach you'), findsOneWidget);
      expect(find.text('Done for everyone · Sep 20'), findsOneWidget);
      expect(find.text('Undo'), findsOneWidget);
      expect(find.text('For everyone in the household'), findsOneWidget);
    });
  });

  group('Section 4: OccupationSearchScreen (4.13)', () {
    testWidgets('renders search, Omar civil engineer card, categories and callout', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/occupation-search'));
      await tester.pumpAndSettle();

      expect(find.text('WORK & CREDENTIALS · ONTARIO'), findsOneWidget);
      expect(find.text('Does your job need a licence here?'), findsOneWidget);
      expect(find.text("Omar's profession"), findsOneWidget);
      expect(find.text('Civil engineer'), findsOneWidget);
      expect(find.text('Licence needed'), findsOneWidget);
      expect(find.text('See the full pathway →'), findsOneWidget);

      expect(find.text('HEALTH'), findsOneWidget);
      expect(find.text('Registered nurse'), findsOneWidget);
      expect(find.text('EDUCATION, CARE & SOCIAL WORK'), findsOneWidget);
      expect(find.text('Teacher (K–12)'), findsOneWidget);
      expect(find.text('LAW & FINANCE'), findsOneWidget);
      expect(find.text('Lawyer'), findsOneWidget);
      expect(find.text('SKILLED TRADES'), findsOneWidget);
      expect(find.text('Electrician (construction & maintenance)'), findsOneWidget);

      expect(find.text('See all 45 regulated jobs'), findsOneWidget);
    });
  });

  group('Section 4: OccupationPathwayScreen (4.14)', () {
    testWidgets('renders P.Eng. pathway timeline, certificates, ready checklist and help', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/occupation-pathway'));
      await tester.pumpAndSettle();

      expect(find.text('LICENSING PATHWAY · ONTARIO'), findsOneWidget);
      expect(find.text('Becoming a Professional Engineer (P.Eng.)'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);
      expect(find.text("Certificates you'll need"), findsOneWidget);
      expect(find.text('P.Eng. licence'), findsOneWidget);
      expect(find.text('Course-by-course degree assessment'), findsOneWidget);
      expect(find.text('Engineering Intern (EIT) status'), findsOneWidget);

      expect(find.text('Your pathway'), findsOneWidget);
      expect(find.text('Get your degree assessed by WES'), findsOneWidget);
      expect(find.text("Apply to PEO and pass the good-character check"), findsOneWidget);
      expect(find.text('Working while you get licensed'), findsOneWidget);
      expect(find.text('Have ready'), findsOneWidget);
      expect(find.text('Help near you'), findsOneWidget);
      expect(find.text('Official source · PEO'), findsOneWidget);
      expect(find.text('Step 1 done'), findsOneWidget);
    });
  });
}
