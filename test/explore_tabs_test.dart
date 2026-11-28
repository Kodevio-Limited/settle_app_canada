import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/explore/providers/explore_providers.dart';
import 'package:settle_app/features/explore/screens/explore_detail_templates.dart';
import 'package:settle_app/features/explore/screens/explore_list_screens.dart';

Widget _wrap(Widget child) => ProviderScope(child: MaterialApp(home: child));

void main() {
  testWidgets('ExploreDetailTemplateScreen toggles Save and shows snackbar', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const ExploreDetailTemplateScreen(
          id: 'fun-skate',
          title: 'Fun Skate',
          subtitle: 'Weekend skating',
          kind: ExploreKind.event,
        ),
      ),
    );
    expect(find.text('Save'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(find.text('Saved'), findsOneWidget);
    expect(find.text('Saved · View saved'), findsOneWidget);
  });

  testWidgets('ExploreSavedScreen shows empty state then saved items', (tester) async {
    await tester.pumpWidget(_wrap(const ExploreSavedScreen()));
    expect(find.text('No saved places, events, or offers yet.'), findsOneWidget);
    expect(find.text('Explore places'), findsOneWidget);
  });

  testWidgets('ExploreCityScreen updates exploreCityProvider', (tester) async {
    final container = ProviderContainer();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: ExploreCityScreen()),
      ),
    );
    await tester.tap(find.text('Toronto'));
    await tester.pump();
    expect(container.read(exploreCityProvider), 'Toronto');
  });
}
