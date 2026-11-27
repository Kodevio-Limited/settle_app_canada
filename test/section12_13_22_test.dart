import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:settle_app/core/router/s12_s13_s22_routes.dart';
import 'package:settle_app/features/partners/legal_help_screen.dart';
import 'package:settle_app/features/pathways/all_professions_screen.dart';
import 'package:settle_app/features/pathways/pathway_data.dart';
import 'package:settle_app/features/provinces/province_variant_data.dart';

Widget _wrapRouter(String initialLocation) {
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: s12S13S22Routes,
  );
  return ProviderScope(
    child: MaterialApp.router(routerConfig: router),
  );
}

void main() {
  testWidgets('S12: all 7 province variant routes render and navigate', (tester) async {
    for (final path in provinceVariants.keys) {
      await tester.pumpWidget(_wrapRouter(path));
      await tester.pumpAndSettle();
      expect(find.textContaining(provinceVariants[path]!.title), findsOneWidget);
    }

    // Verify 12.1 -> 12.2 navigation
    await tester.pumpWidget(_wrapRouter('/var-b-c-health'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('How to cover the wait'), 200);
    await tester.tap(find.text('How to cover the wait'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Cover the MSP wait'), findsOneWidget);
  });

  testWidgets('S13: legal help orders Official -> Free help -> Sponsored and navigates', (tester) async {
    await tester.pumpWidget(_wrapRouter('/legal-help'));
    await tester.pumpAndSettle();
    expect(find.byType(LegalHelpScreen), findsOneWidget);
    expect(find.text('Official'), findsOneWidget);
    expect(find.text('Free help'), findsNWidgets(2));
    await tester.scrollUntilVisible(find.text('Sponsored'), 200);
    expect(find.text('Sponsored'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('How we choose partners'), 200);
    await tester.tap(find.text('How we choose partners'));
    await tester.pumpAndSettle();
    expect(find.text('How we choose partners'), findsOneWidget);

    await tester.pumpWidget(_wrapRouter('/partner-detail'));
    await tester.pumpAndSettle();
    expect(find.text('Newcomer Welcome Partner'), findsOneWidget);
  });

  testWidgets('S22: all-professions index filters and all 33 pathways render', (tester) async {
    await tester.pumpWidget(_wrapRouter('/all-professions'));
    await tester.pumpAndSettle();
    expect(find.byType(AllProfessionsScreen), findsOneWidget);
    expect(find.text('Dental hygienist'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Architect');
    await tester.pumpAndSettle();
    expect(find.text('Architect'), findsWidgets);

    for (final occ in regulatedOccupations) {
      await tester.pumpWidget(_wrapRouter(occ.routePath));
      await tester.pumpAndSettle();
      expect(find.text(occ.title), findsOneWidget);
    }
  });
}
