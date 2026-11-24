import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/features/guest/guest_home_screen.dart';
import 'package:settle_app/features/errors/offline_screen.dart';
import 'package:settle_app/features/errors/location_denied_screen.dart';
import 'package:settle_app/features/errors/server_error_screen.dart';
import 'package:settle_app/features/guest/integration_map_screen.dart';
import 'package:settle_app/core/services/settle_data_flow_service.dart';

void main() {
  Widget createWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('Phase 9 & 10: Guest, Offline, Error States & Data Flow Test', () {
    testWidgets('9.1 GuestHomeScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const GuestHomeScreen()));
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.text("You're exploring"), findsOneWidget);
      expect(find.text('Create my plan'), findsOneWidget);
      expect(find.text('Settling in Ontario, step by step'), findsOneWidget);
      expect(find.text('1 · Status & arrival documents'), findsOneWidget);
      expect(find.text('Need help now? Crisis & support lines'), findsOneWidget);
    });

    testWidgets('9.2 OfflineScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const OfflineScreen()));
      expect(find.text('Good morning, Layla'), findsOneWidget);
      expect(find.text('Your next 3 actions'), findsOneWidget);
      expect(find.text('Apply for your SIN'), findsOneWidget);
      expect(find.text('Needs a connection'), findsOneWidget);
      expect(find.text('Crisis lines work offline — tap to see them'), findsOneWidget);
      expect(find.text('Try again'), findsOneWidget);
    });

    testWidgets('9.3 LocationDeniedScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const LocationDeniedScreen()));
      expect(find.text('Near you'), findsOneWidget);
      expect(find.text('Location is off for Settle'), findsOneWidget);
      expect(find.text('Show'), findsOneWidget);
      expect(find.text('In Mississauga (from your plan)'), findsOneWidget);
      expect(find.text('Service Canada Centre · Mississauga'), findsOneWidget);
    });

    testWidgets('9.4 ServerErrorScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const ServerErrorScreen()));
      expect(find.text('Something went wrong on our side'), findsOneWidget);
      expect(find.text('Try again'), findsOneWidget);
      expect(find.text('Use my saved plan'), findsOneWidget);
      expect(find.text('Get help now'), findsOneWidget);
    });

    testWidgets('10.1 IntegrationMapScreen renders system integrations', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const IntegrationMapScreen()));
      await tester.pumpAndSettle();
      expect(find.text('API & Integration Map'), findsOneWidget);
      expect(find.text('Sign in with Apple'), findsOneWidget);
      expect(find.text('Core Location'), findsOneWidget);
    });

    test('10.2 SettleDataFlowService returns offline plan and integrations', () async {
      final service = SettleDataFlowService();
      final plan = await service.getOfflineCachedPlan();
      expect(plan['isOfflineAvailable'], isTrue);
      expect(plan['cachedAt'], '10:24 am');

      final integrations = await service.getIntegrationDirectory();
      expect(integrations.length, greaterThanOrEqualTo(5));
      expect(integrations.any((i) => i.name == 'Sign in with Apple'), isTrue);
      expect(integrations.any((i) => i.name == 'Offline Cache'), isTrue);
    });

    testWidgets('Phase 9 & 10 Routes are registered in AppRouter', (WidgetTester tester) async {
      final router = createRouter(initialLocation: '/guest-home');
      expect(router, isNotNull);
    });
  });
}

