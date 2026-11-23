import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/core/theme/app_theme.dart';

void main() {
  Widget buildApp({required String initialLocation}) {
    final router = createRouter(initialLocation: initialLocation);
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: createAppTheme(),
      ),
    );
  }

  group('Section 5.1: NearbyScreen', () {
    testWidgets('renders map, service tabs, and location cards', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/nearby'));
      await tester.pumpAndSettle();

      expect(find.text('Near you'), findsOneWidget);
      expect(find.text('For: Apply for your SIN'), findsOneWidget);
      expect(find.text('Service Canada'), findsWidgets);
      expect(find.text('ServiceOntario'), findsOneWidget);
      expect(find.text('DriveTest'), findsOneWidget);
      expect(find.text('Settlement'), findsOneWidget);

      expect(find.text('Apple Maps'), findsOneWidget);
      expect(find.text('Service Canada Centre · Mississauga'), findsOneWidget);
      expect(find.text('Service Canada Centre · Brampton'), findsOneWidget);
      expect(find.text('Directions'), findsWidgets);
      expect(find.text('Call'), findsWidgets);
      expect(find.text('Details'), findsWidgets);
    });
  });

  group('Section 5.2: LocationDetailScreen', () {
    testWidgets('renders hero map, details, and task link', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/location-detail'));
      await tester.pumpAndSettle();

      expect(find.text('Federal office'), findsOneWidget);
      expect(find.text('Service Canada Centre · Mississauga'), findsOneWidget);
      expect(find.text('Directions'), findsOneWidget);
      expect(find.text('Call'), findsOneWidget);
      expect(find.text('Official page'), findsOneWidget);

      expect(find.text('Address'), findsOneWidget);
      expect(find.text('Hours'), findsOneWidget);
      expect(find.text('Access'), findsOneWidget);
      expect(find.text('Services'), findsOneWidget);

      expect(find.text('Your tasks here'), findsOneWidget);
      expect(find.text('Apply for your SIN'), findsOneWidget);
      expect(find.text('Report a problem'), findsOneWidget);
    });
  });

  group('Section 5.3: DonePickerScreen', () {
    testWidgets('renders people checklist, when dropdown and save button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/done-picker'));
      await tester.pumpAndSettle();

      expect(find.text('Who has done this?'), findsOneWidget);
      expect(find.text('Apply for your SIN'), findsOneWidget);
      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);
      expect(find.text('Yasmin'), findsOneWidget);
      expect(find.text('When'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
    });
  });

  group('Section 5.4: TaskDoneScreen', () {
    testWidgets('renders done confirmation, unlocked tasks and progress message', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/task-done'));
      await tester.pumpAndSettle();

      expect(find.text('SIN marked as done for Layla'), findsOneWidget);
      expect(find.textContaining('Still open for'), findsOneWidget);
      expect(find.textContaining('Omar'), findsWidgets);
      expect(find.text('Mark for Omar'), findsOneWidget);

      expect(find.text('Now unlocked'), findsOneWidget);
      expect(find.text('Apply for the Canada Child Benefit'), findsOneWidget);
      expect(find.text('Set up your CRA My Account'), findsOneWidget);

      expect(find.text("12 days in and 6 of 40 steps done. That's real progress."), findsOneWidget);
      expect(find.text('Back to my plan'), findsOneWidget);
      expect(find.text('Undo'), findsOneWidget);
    });
  });

  group('Section 5.5: SnoozeScreen', () {
    testWidgets('renders reminder options, calendar toggle and submit button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/snooze'));
      await tester.pumpAndSettle();

      expect(find.text('Remind me…'), findsOneWidget);
      expect(find.text('Tomorrow morning'), findsOneWidget);
      expect(find.text('This weekend'), findsOneWidget);
      expect(find.text('Next week'), findsOneWidget);
      expect(find.text('Pick a date and time'), findsOneWidget);
      expect(find.text('Also add to my iPhone Calendar'), findsOneWidget);
      expect(find.text('Set reminder'), findsOneWidget);
    });
  });

  group('Section 5.6: DismissScreen', () {
    testWidgets('renders not for you reasons and update button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/dismiss'));
      await tester.pumpAndSettle();

      expect(find.text('Not for you?'), findsOneWidget);
      expect(find.text('Tell us why, so the rest of your plan stays right.'), findsOneWidget);
      expect(find.text('We did this before arriving'), findsOneWidget);
      expect(find.text("It doesn't apply to us"), findsOneWidget);
      expect(find.text('Someone is already helping us with it'), findsOneWidget);
      expect(find.text('Just hide it for now'), findsOneWidget);
      expect(find.text('Update my plan'), findsOneWidget);
    });
  });

  group('Section 5.7: ReportOutdatedScreen', () {
    testWidgets('renders report reasons, note textarea and send button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/report-outdated'));
      await tester.pumpAndSettle();

      expect(find.text('Report outdated info'), findsOneWidget);
      expect(find.text('What looks wrong?'), findsOneWidget);
      expect(find.text('A link is broken'), findsOneWidget);
      expect(find.text('Steps or documents have changed'), findsOneWidget);
      expect(find.text("An office's hours or address is wrong"), findsOneWidget);
      expect(find.text('Something else'), findsOneWidget);
      expect(find.text('Send report'), findsOneWidget);
    });
  });

  group('Section 5.8: ContentUpdatedScreen', () {
    testWidgets('renders update alert, diff card and review action', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/content-updated'));
      await tester.pumpAndSettle();

      expect(find.text('UPDATE · VERIFIED [DATE]'), findsOneWidget);
      expect(find.text("A step you're working on changed"), findsOneWidget);
      expect(find.text('What changed'), findsOneWidget);
      expect(find.text('Before'), findsOneWidget);
      expect(find.text('Now'), findsOneWidget);
      expect(find.text('What this means for you'), findsOneWidget);
      expect(find.text('Review the task'), findsOneWidget);
      expect(find.text('Change update alerts'), findsOneWidget);
    });
  });
}
