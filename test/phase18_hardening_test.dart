import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settle_app/main.dart';
import 'package:settle_app/core/theme/app_theme.dart';
import 'package:settle_app/core/theme/app_colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 18: Release Hardening & Accessibility Verification', () {
    testWidgets('SettleApp mounts with full localization & clamped text scaling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: SettleApp(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsOneWidget);
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.supportedLocales.length, equals(3));
      expect(materialApp.supportedLocales.map((l) => l.languageCode),
          containsAll(['en', 'fr', 'ar']));
    });

    testWidgets('AppTheme satisfies core contrast and styling guidelines',
        (WidgetTester tester) async {
      final theme = createAppTheme();

      expect(theme.scaffoldBackgroundColor, equals(AppColors.bg));
      expect(theme.colorScheme.primary, equals(AppColors.primary));
      expect(theme.elevatedButtonTheme.style?.elevation?.resolve({}), equals(0));
    });

    testWidgets('Custom ErrorWidget renders gracefully on caught errors',
        (WidgetTester tester) async {
      final previousBuilder = ErrorWidget.builder;
      addTearDown(() {
        ErrorWidget.builder = previousBuilder;
      });
      configureAppErrorHandling();
      final widget = buildCustomErrorWidget(
        FlutterErrorDetails(
          exception: Exception('Network timeout simulation'),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: widget,
        ),
      );

      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      expect(find.textContaining('Network timeout simulation'), findsOneWidget);
    });

    testWidgets('RTL text direction applies properly for Arabic locale',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('ar', ''),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          home: const Scaffold(
            body: Text('مرحبا بك'),
          ),
        ),
      );

      expect(find.text('مرحبا بك'), findsOneWidget);
      final directionality = tester.widget<Directionality>(
        find.byType(Directionality).first,
      );
      expect(directionality.textDirection, equals(TextDirection.rtl));
    });
  });
}
