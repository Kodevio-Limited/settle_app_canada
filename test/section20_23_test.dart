import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/features/explore/models/explore_data.dart';
import 'package:settle_app/features/explore/explore_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Phase 15: Sections 20 & 23 Explore Tests', () {
    test('All 28 Explore screen models exist in allExploreScreens', () {
      expect(allExploreScreens.length, equals(28));

      // Section 20
      expect(allExploreScreens.containsKey('Explore'), isTrue);
      expect(allExploreScreens.containsKey('ExploreFreePasses'), isTrue);
      expect(allExploreScreens.containsKey('ExploreCanoo'), isTrue);
      expect(allExploreScreens.containsKey('ExplorePlaces'), isTrue);
      expect(allExploreScreens.containsKey('ExplorePlace'), isTrue);
      expect(allExploreScreens.containsKey('ExploreEvents'), isTrue);
      expect(allExploreScreens.containsKey('ExploreOffers'), isTrue);
      expect(allExploreScreens.containsKey('OfferDetail'), isTrue);
      expect(allExploreScreens.containsKey('ExploreSaved'), isTrue);
      expect(allExploreScreens.containsKey('ExploreFilters'), isTrue);
      expect(allExploreScreens.containsKey('ExploreWinter'), isTrue);
      expect(allExploreScreens.containsKey('ExploreCity'), isTrue);

      // Section 23
      expect(allExploreScreens.containsKey('PlaceRattray'), isTrue);
      expect(allExploreScreens.containsKey('PlacePortCredit'), isTrue);
      expect(allExploreScreens.containsKey('PlaceKariya'), isTrue);
      expect(allExploreScreens.containsKey('PlaceRiverwood'), isTrue);
      expect(allExploreScreens.containsKey('PlacePAMA'), isTrue);
      expect(allExploreScreens.containsKey('PlaceNiagara'), isTrue);
      expect(allExploreScreens.containsKey('EventSkate'), isTrue);
      expect(allExploreScreens.containsKey('EventWelcome'), isTrue);
      expect(allExploreScreens.containsKey('EventWinterWalk'), isTrue);
      expect(allExploreScreens.containsKey('PassOntarioParks'), isTrue);
      expect(allExploreScreens.containsKey('PassConservation'), isTrue);
      expect(allExploreScreens.containsKey('PassPAMA'), isTrue);
      expect(allExploreScreens.containsKey('PassSwimSkate'), isTrue);
      expect(allExploreScreens.containsKey('OfferBank'), isTrue);
      expect(allExploreScreens.containsKey('OfferPhone'), isTrue);
      expect(allExploreScreens.containsKey('OfferFurniture'), isTrue);
    });

    testWidgets('ExploreScreen renders root Explore tab with chips',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ExploreScreen(screenId: 'Explore'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Things to do and save on'), findsOneWidget);
      expect(find.text('For you'), findsOneWidget);
      expect(find.text('Places'), findsWidgets);
      expect(find.text('Events'), findsWidgets);
      expect(find.text('Offers'), findsWidgets);
    });

    testWidgets('ExploreScreen renders Canoo detail screen', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ExploreScreen(screenId: 'ExploreCanoo'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Canoo: free entry for your first year'), findsOneWidget);
      expect(find.text('FREE FOR NEWCOMERS'), findsOneWidget);
    });

    testWidgets('ExploreScreen renders PlaceNiagara detail screen',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ExploreScreen(screenId: 'PlaceNiagara'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Niagara Falls'), findsOneWidget);
      expect(find.text('PLACE'), findsOneWidget);
    });

    testWidgets('ExploreScreen renders EventSkate detail screen',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ExploreScreen(screenId: 'EventSkate'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Fun skate at Celebration Square'), findsOneWidget);
    });
  });
}
