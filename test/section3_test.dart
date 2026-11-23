import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/core/theme/app_theme.dart';

void main() {
  Widget buildApp({String initialLocation = '/home'}) {
    final router = createRouter(initialLocation: initialLocation);
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: createAppTheme(),
      ),
    );
  }

  group('Section 3: Home Screen (3.1)', () {
    testWidgets('renders Day 12, greeting, next 3 actions, and stage card', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      await tester.pumpWidget(buildApp(initialLocation: '/home'));
      await tester.pumpAndSettle();

      expect(find.text('DAY 12 IN CANADA'), findsOneWidget);
      expect(find.textContaining('Good morning'), findsOneWidget);
      expect(find.text('Your next 3 actions'), findsOneWidget);
      expect(find.text('All tasks'), findsOneWidget);

      expect(find.text('Apply for your SIN'), findsOneWidget);
      expect(find.text('Apply for Ontario health cards'), findsOneWidget);
      expect(find.text('Register Sami & Nour for school'), findsOneWidget);

      expect(find.text('Stage 2 of 10'), findsOneWidget);
      expect(find.text('5 of 40 done'), findsOneWidget);
      expect(find.text('Paperwork'), findsWidgets);

      expect(find.text('Near you'), findsOneWidget);
      expect(find.text("How's this week?"), findsOneWidget);

      // Bottom nav exists
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Journey'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Help'), findsOneWidget);
      expect(find.text('Me'), findsOneWidget);
    });
  });

  group('Section 3: Journey Screen (3.2)', () {
    testWidgets('renders header, person pills, and 10 stages', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      await tester.pumpWidget(buildApp(initialLocation: '/journey'));
      await tester.pumpAndSettle();

      expect(find.text('Your journey'), findsOneWidget);
      expect(find.textContaining('Mississauga · 5 people'), findsOneWidget);

      // Person filters
      expect(find.text('Everyone'), findsOneWidget);
      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);

      // Stages in timeline
      expect(find.text('Status & arrival documents'), findsOneWidget);
      expect(find.text('Paperwork'), findsOneWidget);
      expect(find.text('Housing'), findsOneWidget);
      expect(find.text('School, college & university'), findsOneWidget);
      expect(find.text('Car & driving'), findsOneWidget);
      expect(find.text('Insurance'), findsOneWidget);
      expect(find.text('Health care'), findsOneWidget);
      expect(find.text('Money & benefits'), findsOneWidget);
      expect(find.text('Work & credentials'), findsOneWidget);
      expect(find.text('Community & belonging'), findsOneWidget);
    });
  });

  group('Section 3: Stage Detail Screens (3.3 - 3.12)', () {
    testWidgets('Stage 1 Status & arrival documents renders correctly', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      await tester.pumpWidget(buildApp(initialLocation: '/stage-status'));
      await tester.pumpAndSettle();

      expect(find.text('STAGE 1 OF 10 · DONE'), findsOneWidget);
      expect(find.text('Status & arrival documents'), findsWidgets);
      expect(find.text('Keep your landing documents safe'), findsOneWidget);
      expect(find.textContaining('Settle never gives advice on your own immigration case'), findsOneWidget);
      expect(find.text('Free settlement services near you'), findsOneWidget);
    });

    testWidgets('Stage 4 Schools and childcare has University toggle', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      await tester.pumpWidget(buildApp(initialLocation: '/stage-schools'));
      await tester.pumpAndSettle();

      expect(find.text('STAGE 4 OF 10'), findsOneWidget);
      expect(find.text('School · Sami, Nour'), findsOneWidget);
      expect(find.text('University · Yasmin'), findsOneWidget);

      // Tap to University stream
      await tester.tap(find.text('University · Yasmin'));
      await tester.pumpAndSettle();

      expect(find.text('STAGE 4 · UNIVERSITY STREAM'), findsOneWidget);
      expect(find.text('University & college'), findsOneWidget);
      expect(find.text('Apply to university or college'), findsOneWidget);
    });
  });

  group('Section 3: Bottom Navigation switching', () {
    testWidgets('navigates between Home and Journey via BottomNav', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1000));
      await tester.pumpWidget(buildApp(initialLocation: '/home'));
      await tester.pumpAndSettle();

      expect(find.text('DAY 12 IN CANADA'), findsOneWidget);

      // Tap Journey tab
      await tester.tap(find.text('Journey'));
      await tester.pumpAndSettle();

      expect(find.text('Your journey'), findsOneWidget);

      // Tap Home tab
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(find.text('DAY 12 IN CANADA'), findsOneWidget);
    });
  });
}
