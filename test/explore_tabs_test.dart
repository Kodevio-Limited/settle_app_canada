import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/data/explore_figma_data.dart';
import 'package:settle_app/features/explore/providers/explore_providers.dart';
import 'package:settle_app/features/explore/screens/explore_detail_templates.dart';
import 'package:settle_app/features/explore/screens/explore_list_screens.dart';

Widget _wrap(Widget child) => ProviderScope(child: MaterialApp(home: child));

void main() {
  testWidgets('ExploreDetailTemplateScreen renders 2x2 grid, Good to know, and Save', (tester) async {
    await tester.pumpWidget(
      _wrap(ExploreDetailTemplateScreen(data: kExploreDetailPages['fun-skate']!)),
    );
    expect(find.text('Fun skate at Celebration Square'), findsOneWidget);
    expect(find.text('Good to know'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(find.text('Add to calendar'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(find.text('Saved'), findsOneWidget);
  });

  testWidgets('ExploreListTemplateScreen renders 20.6 This weekend groups', (tester) async {
    await tester.pumpWidget(
      _wrap(ExploreListTemplateScreen(page: kExploreListPages['events']!)),
    );
    expect(find.text('This weekend'), findsNWidgets(2));
    expect(find.text('Fun skate at Celebration Square'), findsOneWidget);
    expect(find.text('Newcomer welcome coffee'), findsOneWidget);
  });

  testWidgets('ExploreCityScreen updates exploreCityProvider', (tester) async {
    final container = ProviderContainer();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: ExploreCityScreen()),
      ),
    );
    await tester.tap(find.text('Toronto, ON'));
    await tester.pump();
    expect(container.read(exploreCityProvider), 'Toronto');
  });
}
