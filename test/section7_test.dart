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

  group('Section 7.1: HelpScreen', () {
    testWidgets('renders trusted help directory, crisis banner, and legal links', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/help'));
      await tester.pumpAndSettle();

      expect(find.text('Trusted help'), findsOneWidget);
      expect(find.text('In danger? Call 911'), findsOneWidget);
      expect(find.text('Crisis and support lines, 24/7'), findsOneWidget);

      expect(find.text('Free newcomer services near you'), findsOneWidget);
      expect(find.text('Newcomer Centre of Peel'), findsOneWidget);
      expect(find.text('Peel Multicultural Council'), findsOneWidget);
      expect(find.text('211 Ontario'), findsOneWidget);

      expect(find.text('Questions about your own case'), findsOneWidget);
      expect(find.textContaining('Licensed immigration consultants'), findsOneWidget);
      expect(find.textContaining('Lawyers & paralegals'), findsOneWidget);
      expect(find.textContaining('Community legal clinics'), findsOneWidget);
    });
  });

  group('Section 7.2: CrisisScreen', () {
    testWidgets('renders emergency lines, leave quickly button, and hotlines', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/crisis'));
      await tester.pumpAndSettle();

      expect(find.text('Get help now'), findsOneWidget);
      expect(find.text('Leave quickly'), findsOneWidget);

      expect(find.text('911'), findsOneWidget);
      expect(find.text('Emergency'), findsOneWidget);

      expect(find.text('988'), findsOneWidget);
      expect(find.text('Suicide Crisis Helpline'), findsOneWidget);

      expect(find.text('211'), findsOneWidget);
      expect(find.text('211 Ontario'), findsOneWidget);

      expect(find.text('Kids Help Phone'), findsOneWidget);
      expect(find.textContaining('1-800-668-6868'), findsOneWidget);

      expect(find.text("Assaulted Women's Helpline"), findsOneWidget);
      expect(find.textContaining('1-866-863-0511'), findsOneWidget);

      expect(find.textContaining('"Leave quickly" closes this screen'), findsOneWidget);
    });
  });

  group('Section 7.3: CheckInScreen', () {
    testWidgets('renders check-in question, rating scale, thank-you banner, and actions', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/check-in'));
      await tester.pumpAndSettle();

      expect(find.text('How manageable does settling feel this week?'), findsOneWidget);

      expect(find.text('Very hard'), findsOneWidget);
      expect(find.text('Hard'), findsOneWidget);
      expect(find.text('Okay'), findsOneWidget);
      expect(find.text('Good'), findsOneWidget);
      expect(find.text('Great'), findsOneWidget);

      expect(find.text('Thank you for telling us'), findsOneWidget);
      expect(find.textContaining('Feeling stretched in the first months is very common'), findsOneWidget);

      expect(find.text('Switch to "just today"'), findsOneWidget);
      expect(find.text('Talk to a settlement worker'), findsOneWidget);
      expect(find.text('Find newcomer groups near you'), findsOneWidget);
      expect(find.text('Need to talk to someone now?'), findsOneWidget);

      // Select another rating
      await tester.tap(find.text('Okay'));
      await tester.pumpAndSettle();
    });
  });

  group('Section 7.4: CommunityGroupsScreen', () {
    testWidgets('renders filter chips, disclaimer, and community group cards', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/community-groups'));
      await tester.pumpAndSettle();

      expect(find.text('Groups near you'), findsOneWidget);

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Parents'), findsOneWidget);
      expect(find.text('Language'), findsWidgets);
      expect(find.text('Women'), findsOneWidget);
      expect(find.text('Youth'), findsWidgets);
      expect(find.text('Faith & culture'), findsOneWidget);

      expect(find.textContaining("Shared by community organizations and 211"), findsOneWidget);

      expect(find.text('English conversation circle'), findsOneWidget);
      expect(find.text("Newcomer women's circle"), findsOneWidget);
      expect(find.text('Newcomer youth program (13–18)'), findsOneWidget);
      expect(find.text('Details & directions'), findsWidgets);
    });
  });

  group('Section 7.5: HowGuidanceScreen', () {
    testWidgets('renders 4 guidance pillars, professional disclaimer, and support link', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/how-guidance'));
      await tester.pumpAndSettle();

      expect(find.text("How Settle's guidance works"), findsOneWidget);

      expect(find.text('From official sources'), findsOneWidget);
      expect(find.text('Personalized by clear rules'), findsOneWidget);
      expect(find.text('What Settle is not'), findsOneWidget);
      expect(find.text('When to get a professional'), findsOneWidget);
      expect(find.text('Find qualified help'), findsOneWidget);

      expect(find.text('Settle is made by Experiaco in Mississauga, Ontario.'), findsOneWidget);
      expect(find.text('Contact support · [support email]'), findsOneWidget);
    });
  });

  group('Section 7.6: ConversationGuideScreen', () {
    testWidgets('renders language toggle, prompts, and worried support guidance', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 1200));
      await tester.pumpWidget(buildApp(initialLocation: '/conversation-guide'));
      await tester.pumpAndSettle();

      expect(find.text('English'), findsOneWidget);
      expect(find.text('العربية'), findsOneWidget);

      expect(find.text('FOR PARENTS OF TEENS · 5 MIN READ'), findsOneWidget);
      expect(find.text('Talking with your teen about the move'), findsOneWidget);

      expect(find.text('Try asking, in the car or over food'), findsOneWidget);
      expect(find.textContaining("What's one thing you miss"), findsOneWidget);
      expect(find.textContaining('Who at school do you sit with at lunch?'), findsOneWidget);
      expect(find.textContaining('What\'s something here that surprised you?'), findsOneWidget);

      expect(find.text("If you're worried"), findsOneWidget);
      expect(find.text('See support lines'), findsOneWidget);

      // Language switcher tap
      await tester.tap(find.text('العربية'));
      await tester.pumpAndSettle();
    });
  });
}
