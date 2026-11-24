import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/errors/section21_data.dart';
import 'package:settle_app/features/errors/section21_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 16: Section 21 Tests', () {
    test('All 16 Section 21 screen models exist', () {
      expect(allSection21Screens.length, equals(16));

      expect(allSection21Screens.containsKey('LeaveQuickly'), isTrue);
      expect(allSection21Screens.containsKey('LanguageRestart'), isTrue);
      expect(allSection21Screens.containsKey('SignInError'), isTrue);
      expect(allSection21Screens.containsKey('DeleteError'), isTrue);
      expect(allSection21Screens.containsKey('ExportError'), isTrue);
      expect(allSection21Screens.containsKey('SearchEmpty'), isTrue);
      expect(allSection21Screens.containsKey('StageComplete'), isTrue);
      expect(allSection21Screens.containsKey('FamilySingle'), isTrue);
      expect(allSection21Screens.containsKey('ExploreSavedEmpty'), isTrue);
      expect(allSection21Screens.containsKey('AndroidLocation'), isTrue);
      expect(allSection21Screens.containsKey('HomeAR'), isTrue);
      expect(allSection21Screens.containsKey('TaskPrestoAR'), isTrue);
      expect(allSection21Screens.containsKey('WebDeleteAccount'), isTrue);
      expect(allSection21Screens.containsKey('TaskMore'), isTrue);
      expect(allSection21Screens.containsKey('ExploreEvent'), isTrue);
      expect(allSection21Screens.containsKey('ExplorePass'), isTrue);
    });

    testWidgets('Section21Screen renders LeaveQuickly neutral screen',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Section21Screen(screenId: 'LeaveQuickly'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Mississauga, ON'), findsOneWidget);
      expect(find.text('21°C · Sunny'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
    });

    testWidgets('Section21Screen renders Arabic RTL HomeAR screen',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Section21Screen(screenId: 'HomeAR'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('صباح الخير، ليلى'), findsOneWidget);
      expect(find.text('رجوع'), findsOneWidget);
    });

    testWidgets('Section21Screen renders AndroidLocation permission pre-prompt',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Section21Screen(screenId: 'AndroidLocation'),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text("Allow Settle to access this device's location?"),
          findsOneWidget);
    });

    testWidgets('Section21Screen renders DeleteError screen', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Section21Screen(screenId: 'DeleteError'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Your account wasn't deleted yet"), findsOneWidget);
    });
  });
}
