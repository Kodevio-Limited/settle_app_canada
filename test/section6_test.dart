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

  group('Section 6.1: FamilyScreen', () {
    testWidgets('renders all 5 family members, shared tasks, and note', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/family'));
      await tester.pumpAndSettle();

      expect(find.text('Family'), findsOneWidget);
      expect(find.text("5 people · everyone's steps in one place"), findsOneWidget);

      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);
      expect(find.text('Yasmin'), findsOneWidget);
      expect(find.text('Sami'), findsOneWidget);
      expect(find.text('Nour'), findsOneWidget);

      expect(find.text('Shared household tasks · 6'), findsOneWidget);
      expect(find.text('Ontario health cards'), findsOneWidget);
      expect(find.text('Sign a lease & know tenant rights'), findsOneWidget);
      expect(find.text('Set up utilities & internet'), findsOneWidget);
      expect(find.text('See all shared tasks'), findsOneWidget);

      expect(find.textContaining('Only you see this household'), findsOneWidget);
    });
  });

  group('Section 6.2: MemberAdultScreen', () {
    testWidgets('renders Omar profile, progress bar, tasks, and invite card', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/member-adult'));
      await tester.pumpAndSettle();

      expect(find.text('Omar'), findsOneWidget);
      expect(find.text('Partner · looking for work · drives'), findsOneWidget);
      expect(find.text('2 of 10 tasks done'), findsOneWidget);

      expect(find.text('Apply for your SIN'), findsOneWidget);
      expect(find.text('Exchange or start your licence'), findsOneWidget);
      expect(find.text('Connect with employment services'), findsOneWidget);
      expect(find.text('Get licensed as an engineer (P.Eng.)'), findsOneWidget);

      expect(find.text('Invite Omar to his own account'), findsOneWidget);
      expect(find.text('Send an invite link'), findsOneWidget);
      expect(find.text('Remove Omar from household'), findsOneWidget);
    });
  });

  group('Section 6.3: MemberChildScreen', () {
    testWidgets('renders Nour profile, tasks, nearby school and conversation guide', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/member-child'));
      await tester.pumpAndSettle();

      expect(find.text('Nour'), findsOneWidget);
      expect(find.text('12–14 · Secondary school · English support: yes'), findsOneWidget);

      expect(find.text('Register with your school board'), findsOneWidget);
      expect(find.text('Check school immunization records'), findsOneWidget);
      expect(find.text('English language support assessment'), findsOneWidget);
      expect(find.text('Ontario health card'), findsOneWidget);

      expect(find.text('Newcomer school registration near you'), findsOneWidget);
      expect(find.text('School board offices · 3.4 km'), findsOneWidget);
      expect(find.text('Talking with Nour about the move'), findsOneWidget);
      expect(find.text('Stored: nickname and age range only.'), findsOneWidget);
      expect(find.text('Remove Nour'), findsOneWidget);
    });
  });

  group('Section 6.4: RemoveMemberScreen', () {
    testWidgets('renders remove modal dialog with warning and buttons', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/remove-member?name=Nour'));
      await tester.pumpAndSettle();

      expect(find.text('Remove Nour from your household?'), findsOneWidget);
      expect(find.textContaining("Nour's tasks, ticks and reminders will be deleted"), findsOneWidget);
      expect(find.text('Remove Nour'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  group('Section 6.5: ChecklistScreen', () {
    testWidgets('renders privacy notice, category pills, and interactive checklist items', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/checklist'));
      await tester.pumpAndSettle();

      expect(find.text('What to bring'), findsOneWidget);
      expect(find.textContaining('Keep your originals safe with you'), findsOneWidget);

      expect(find.text('Everyone'), findsOneWidget);
      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('Omar'), findsOneWidget);
      expect(find.text('Kids'), findsOneWidget);

      expect(find.text('SIN · Service Canada'), findsOneWidget);
      expect(find.text('Status document — Layla'), findsOneWidget);
      expect(find.text('Health cards · ServiceOntario'), findsOneWidget);
      expect(find.text('School · Sami & Nour'), findsOneWidget);

      // Checkbox toggle test
      final checkbox = find.byType(Checkbox).first;
      await tester.tap(checkbox);
      await tester.pumpAndSettle();
    });
  });

  group('Section 6.6: RemindersScreen', () {
    testWidgets('renders upcoming tabs and categorized reminders list', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/reminders'));
      await tester.pumpAndSettle();

      expect(find.text('Reminders'), findsOneWidget);
      expect(find.text('Upcoming'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);

      expect(find.text('TODAY'), findsOneWidget);
      expect(find.text('Gather documents for SIN'), findsOneWidget);
      expect(find.text('TOMORROW'), findsOneWidget);
      expect(find.text('Visit Service Canada'), findsOneWidget);
      expect(find.text('THIS WEEK'), findsOneWidget);
      expect(find.text('Book school registration'), findsOneWidget);
      expect(find.text('Health cards at ServiceOntario'), findsOneWidget);
      expect(find.text('LATER'), findsOneWidget);
      expect(find.text('Your first Canadian tax return'), findsOneWidget);

      expect(find.textContaining('Quiet hours 9 pm – 8 am'), findsOneWidget);
    });
  });

  group('Section 6.7: CalendarScreen', () {
    testWidgets('renders calendar month, grid with dots, and day details', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/calendar'));
      await tester.pumpAndSettle();

      expect(find.text('Reminders'), findsOneWidget);
      expect(find.text('September 2026'), findsOneWidget);
      expect(find.text('Tuesday, September 29'), findsOneWidget);
      expect(find.text('Visit Service Canada · SIN'), findsOneWidget);
      expect(find.text('Layla, Omar · 10:00 am · in iPhone Calendar'), findsOneWidget);

      expect(find.text('Done'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Planned'), findsOneWidget);
    });
  });

  group('Section 6.8: NotificationSettingsScreen', () {
    testWidgets('renders notification preferences, quiet hours inputs and switches', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/notification-settings'));
      await tester.pumpAndSettle();

      expect(find.text('Reminders & alerts'), findsOneWidget);
      expect(find.text('REMIND ME ABOUT'), findsOneWidget);
      expect(find.text('Tasks I planned'), findsOneWidget);
      expect(find.text('Deadlines and time windows'), findsOneWidget);
      expect(find.text("When a step I'm working on changes"), findsOneWidget);
      expect(find.text('Weekly check-in'), findsOneWidget);

      expect(find.text('HOW'), findsOneWidget);
      expect(find.text('iPhone notifications'), findsOneWidget);
      expect(find.text('Weekly email summary'), findsOneWidget);
      expect(find.text('SMS or WhatsApp'), findsOneWidget);

      expect(find.text('QUIET HOURS'), findsOneWidget);
      expect(find.text('From'), findsOneWidget);
      expect(find.text('21:00'), findsOneWidget);
      expect(find.text('Until'), findsOneWidget);
      expect(find.text('08:00'), findsOneWidget);

      // Switch toggle test
      final switches = find.byType(Switch);
      expect(switches, findsWidgets);
      await tester.tap(switches.first);
      await tester.pumpAndSettle();
    });
  });

  group('Section 6.9: LifeEventScreen', () {
    testWidgets('renders 6 event categories and edit answers button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/life-event'));
      await tester.pumpAndSettle();

      expect(find.text('Something changed?'), findsOneWidget);
      expect(find.textContaining("Life moves fast in the first year"), findsOneWidget);

      expect(find.text('We moved home'), findsOneWidget);
      expect(find.text("Someone's status changed"), findsOneWidget);
      expect(find.text('A new baby is coming or here'), findsOneWidget);
      expect(find.text('Someone joined or arrived'), findsOneWidget);
      expect(find.text('New job, or lost a job'), findsOneWidget);
      expect(find.text('Moving to another province'), findsOneWidget);

      expect(find.text('Something else — edit my answers'), findsOneWidget);
    });
  });

  group('Section 6.10: PlanChangeScreen', () {
    testWidgets('renders diff summary, added/removed/unchanged sections and action buttons', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/plan-change'));
      await tester.pumpAndSettle();

      expect(find.text('YOUR PLAN CHANGED'), findsOneWidget);
      expect(find.text('You moved from Mississauga to Brampton'), findsOneWidget);
      expect(find.text("Here's what we updated, and why."), findsOneWidget);

      expect(find.text('+ 3 added'), findsOneWidget);
      expect(find.text('Update your address with the CRA'), findsOneWidget);
      expect(find.text('Update address on health cards & licence'), findsOneWidget);
      expect(find.text('Get a Brampton Library card'), findsOneWidget);

      expect(find.text('− 1 removed'), findsOneWidget);
      expect(find.text('Get a Mississauga Library card'), findsOneWidget);

      expect(find.text('Unchanged'), findsOneWidget);
      expect(find.text('Looks right'), findsOneWidget);
      expect(find.text("Something's wrong — edit my answers"), findsOneWidget);
    });
  });

  group('Section 6.11: JustTodayScreen', () {
    testWidgets('renders single task focus card and done button', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/just-today'));
      await tester.pumpAndSettle();

      expect(find.text('JUST TODAY'), findsOneWidget);
      expect(find.text("One thing today. That's enough."), findsOneWidget);
      expect(find.text('Put your SIN documents in one envelope'), findsOneWidget);
      expect(find.text("About 10 minutes. Tomorrow's visit will feel easier."), findsOneWidget);
      expect(find.text('Done for today'), findsOneWidget);
      expect(find.text('Show my full plan'), findsOneWidget);
      expect(find.text('Turn off "just today"'), findsOneWidget);
    });
  });

  group('Section 6.12: SearchScreen', () {
    testWidgets('renders search bar, categorized results for tasks, places and guides', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/search'));
      await tester.pumpAndSettle();

      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('YOUR TASKS'), findsOneWidget);
      expect(find.text('Apply for Ontario health cards'), findsOneWidget);
      expect(find.text('Find a family doctor'), findsOneWidget);

      expect(find.text('PLACES'), findsOneWidget);
      expect(find.text('ServiceOntario · [location]'), findsOneWidget);

      expect(find.text('HELP & GUIDES'), findsOneWidget);
      expect(find.text('Gaps in health coverage'), findsOneWidget);

      expect(find.textContaining("Searches run on Settle's servers in Canada"), findsOneWidget);
    });
  });

  group('Section 6.13: MemberStudentScreen', () {
    testWidgets('renders Yasmin university stream and invite card', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/member-student'));
      await tester.pumpAndSettle();

      expect(find.text('Yasmin'), findsOneWidget);
      expect(find.text('Adult child · 18–21 · planning university'), findsOneWidget);

      expect(find.text('Apply for her own SIN'), findsOneWidget);
      expect(find.text('Apply to university or college'), findsOneWidget);
      expect(find.text('Apply for OSAP'), findsOneWidget);
      expect(find.text('Her university & college stream'), findsOneWidget);

      expect(find.text('Yasmin is an adult'), findsOneWidget);
      expect(find.text('Send Yasmin an invite'), findsOneWidget);
      expect(find.text('Remove Yasmin'), findsOneWidget);
    });
  });
}
