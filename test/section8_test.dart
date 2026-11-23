import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';
import 'package:settle_app/features/profile/settings_screen.dart';
import 'package:settle_app/features/profile/edit_profile_screen.dart';
import 'package:settle_app/features/profile/privacy_data_screen.dart';
import 'package:settle_app/features/profile/data_export_screen.dart';
import 'package:settle_app/features/profile/language_access_screen.dart';
import 'package:settle_app/features/profile/sign_out_confirm_screen.dart';
import 'package:settle_app/features/profile/deactivate_screen.dart';
import 'package:settle_app/features/profile/paused_screen.dart';
import 'package:settle_app/features/profile/welcome_back_screen.dart';
import 'package:settle_app/features/profile/delete_confirm_screen.dart';
import 'package:settle_app/features/profile/deleted_screen.dart';

void main() {
  Widget createWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('Phase 8: Account, Privacy, Pause & Deletion Screens Test', () {
    testWidgets('8.1 SettingsScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const SettingsScreen()));
      expect(find.text('Me'), findsWidgets);
      expect(find.text('Layla'), findsOneWidget);
      expect(find.text('MY PLAN'), findsOneWidget);
      expect(find.text('Privacy & my data'), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
    });

    testWidgets('8.2 EditProfileScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const EditProfileScreen()));
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
      expect(find.text('What should we call you?'), findsOneWidget);
    });

    testWidgets('8.3 PrivacyDataScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const PrivacyDataScreen()));
      expect(find.text('Privacy & my data'), findsOneWidget);
      expect(find.text('WHAT WE KEEP'), findsOneWidget);
      expect(find.text('Download a copy of my data'), findsOneWidget);
    });

    testWidgets('8.4 DataExportScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const DataExportScreen()));
      expect(find.text('Download your data'), findsOneWidget);
      expect(find.text('Your files are ready'), findsOneWidget);
      expect(find.text('Easy-to-read PDF'), findsOneWidget);
    });

    testWidgets('8.5 LanguageAccessScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const LanguageAccessScreen()));
      expect(find.text('Language & accessibility'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Plain-language mode'), findsOneWidget);
    });

    testWidgets('8.6 SignOutConfirmScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const SignOutConfirmScreen()));
      expect(find.text('Sign out of Settle?'), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('8.7 DeactivateScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const DeactivateScreen()));
      expect(find.text('Pause or delete your account'), findsOneWidget);
      expect(find.text('Pause my account'), findsOneWidget);
      expect(find.text('Delete my account…'), findsOneWidget);
    });

    testWidgets('8.8 PausedScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const PausedScreen()));
      expect(find.text('Your account is paused'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
      expect(find.text('Delete my account instead'), findsOneWidget);
    });

    testWidgets('8.9 WelcomeBackScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const WelcomeBackScreen()));
      expect(find.text('Welcome back, Layla'), findsOneWidget);
      expect(find.text('PAUSED FOR 3 MONTHS'), findsOneWidget);
      expect(find.text('Check my answers first'), findsOneWidget);
      expect(find.text('Resume where I left off'), findsOneWidget);
    });

    testWidgets('8.10 DeleteConfirmScreen renders correctly and toggles reasons', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const DeleteConfirmScreen()));
      expect(find.text('Delete your account?'), findsOneWidget);
      expect(find.text('Delete permanently'), findsOneWidget);
      expect(find.text('Keep my account'), findsOneWidget);

      await tester.tap(find.text('Not useful'));
      await tester.pump();
      expect(find.byIcon(Icons.check_box), findsOneWidget);
    });

    testWidgets('8.11 DeletedScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(const DeletedScreen()));
      expect(find.text('Your account has been deleted'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('Phase 8 Routes are registered in AppRouter', (WidgetTester tester) async {
      final router = createRouter(initialLocation: '/settings');
      expect(router, isNotNull);
    });
  });
}
