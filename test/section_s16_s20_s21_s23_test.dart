import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/errors/location_denied_screen.dart';
import 'package:settle_app/features/errors/offline_screen.dart';
import 'package:settle_app/features/errors/server_error_screen.dart';
import 'package:settle_app/features/help/help_screen.dart';
import 'package:settle_app/features/home/home_screen.dart';
import 'package:settle_app/features/search/search_screen.dart';
import 'package:settle_app/features/stages/stage_detail_screen.dart';

void main() {
  testWidgets('S16 StageDetailScreen renders', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: StageDetailScreen(stageId: 'paperwork')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(StageDetailScreen), findsOneWidget);
  });

  testWidgets('S20 HomeScreen (Explore) renders', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('S21 Edge states & Arabic RTL render', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: ServerErrorScreen()),
    );
    expect(find.text('Something went wrong on our side'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
    expect(find.text('Use my saved plan'), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(home: OfflineScreen()),
    );
    expect(find.text('Your next 3 actions'), findsOneWidget);
    expect(find.text('Needs a connection'), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: LocationDeniedScreen(),
        ),
      ),
    );
    expect(find.text('Location is off for Settle'), findsOneWidget);
    expect(find.text('Show'), findsOneWidget);
  });

  testWidgets('S23 HelpScreen and SearchScreen render', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: HelpScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(HelpScreen), findsOneWidget);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: SearchScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SearchScreen), findsOneWidget);
  });
}
