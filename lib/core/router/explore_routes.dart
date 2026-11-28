import 'package:go_router/go_router.dart';
import '../../features/explore/screens/explore_detail_templates.dart';
import '../../features/explore/screens/explore_list_screens.dart';

const Map<String, List<String>> _exploreDetails = {
  'canoo': [
    'Canoo gives new permanent residents and citizens free admission for 1 year.',
    'Includes Parks Canada places and 1,400+ museums, science centres, and galleries.',
    'Download the Canoo app and sign up with your PR card or citizenship certificate.',
  ],
  'fun-skate': [
    'When: Saturday · Free admission · 2.1 km away',
    'Where: Mississauga Celebration Square, 300 City Centre Dr.',
    'Bring your own skates or rent on-site. Warm indoor washrooms available.',
  ],
  'family-storytime': [
    'When: Sunday · Central Library · Free',
    'Bilingual Arabic and English songs, stories, and crafts for ages 0–6.',
    'No library card required to attend.',
  ],
  'rattray-marsh': [
    'Where: Lakeshore Rd W, Mississauga · Lakeside trail · 6.8 km',
    'Free boardwalk trails, birdwatching, and stroller-friendly paths.',
    'Washrooms and parking available at Jack Darling Memorial Park.',
  ],
  'your-first-winter': [
    'Skating, sledding, and warm indoor days for your first Canadian winter.',
    'Dress in layers: waterproof boots, insulated coat, hat, and mittens.',
    'Free community centres and library branches offer warm indoor spaces.',
  ],
  'free-passes': [
    'Royal Ontario Museum, Ontario Parks, Conservation Areas, and PAMA.',
    'Borrow a free family pass with your local public library card.',
    'Passes cover up to 2 adults and 4 children for a full day.',
  ],
  'partner-winter-coats': [
    'Sponsored · Partner offer for newcomer families.',
    'Show your newcomer welcome email or promo code at checkout.',
    'See "How we choose partners" for our independent review policy.',
  ],
};

final List<RouteBase> exploreFeatureRoutes = [
  GoRoute(
    path: '/explore-saved',
    name: 'exploreSaved',
    builder: (context, state) => const ExploreSavedScreen(),
  ),
  GoRoute(
    path: '/explore-city',
    name: 'exploreCity',
    builder: (context, state) => const ExploreCityScreen(),
  ),
  GoRoute(
    path: '/explore/:id',
    name: 'exploreItemDetail',
    builder: (context, state) {
      final id = state.pathParameters['id'] ?? 'detail';
      final title = id
          .split('-')
          .map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}')
          .join(' ');
      final kind = id.contains('offer') || id.contains('partner')
          ? ExploreKind.offer
          : id.contains('event') || id.contains('skate') || id.contains('storytime')
              ? ExploreKind.event
              : id.contains('pass') || id.contains('canoo') || id.contains('park')
                  ? ExploreKind.pass
                  : ExploreKind.place;
      return ExploreDetailTemplateScreen(
        id: id,
        title: title,
        subtitle: _exploreDetails[id]?.first ?? 'Free or low-cost newcomer activity and local guide.',
        details: _exploreDetails[id]?.skip(1).toList() ?? const [],
        kind: kind,
        isSponsored: kind == ExploreKind.offer,
      );
    },
  ),
];
