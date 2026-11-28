import 'package:go_router/go_router.dart';
import '../data/explore_verbatim_data.dart';
import '../../features/explore/screens/explore_detail_templates.dart';
import '../../features/explore/screens/explore_list_screens.dart';

const Map<String, List<({String label, String route})>> _exploreLinks = {
  'free-passes': [
    (label: 'Canoo: free entry for your first year', route: '/explore/canoo'),
    (label: 'Ontario Parks day-use pass', route: '/explore/ontario-parks'),
    (label: 'Conservation areas pass', route: '/explore/conservation'),
    (label: 'PAMA family pass', route: '/explore/pama-pass'),
    (label: 'ROM family pass', route: '/explore/rom-pass'),
    (label: 'Swim and skate pass', route: '/explore/swim-skate'),
    (label: 'Get free library cards', route: '/task/library'),
  ],
  'places': [
    (label: 'Mississauga Celebration Square', route: '/explore/celebration-square'),
    (label: 'Rattray Marsh Conservation Area', route: '/explore/rattray-marsh'),
    (label: 'Port Credit Harbour', route: '/explore/port-credit'),
    (label: 'Kariya Park', route: '/explore/kariya'),
    (label: 'The Riverwood Conservancy', route: '/explore/riverwood'),
    (label: 'PAMA · Brampton', route: '/explore/pama'),
    (label: 'Niagara Falls', route: '/explore/niagara'),
  ],
  'events': [
    (label: 'Fun skate at Celebration Square', route: '/explore/fun-skate'),
    (label: 'Newcomer welcome coffee', route: '/explore/welcome-coffee'),
    (label: 'Family storytime in Arabic and English', route: '/explore/family-storytime'),
    (label: 'Winter walk at Rattray Marsh', route: '/explore/winter-walk'),
  ],
  'offers': [
    (label: '[Partner store] · winter coats', route: '/explore/partner-winter-coats'),
    (label: 'Newcomer banking package', route: '/explore/bank'),
    (label: 'Mobile & internet plan', route: '/explore/telecom'),
    (label: 'Home & furniture offer', route: '/explore/furniture'),
    (label: 'How we choose partners', route: '/how-partners'),
    (label: 'Ask for free help', route: '/help'),
  ],
  'your-first-winter': [
    (label: 'Try skating for free', route: '/explore/swim-skate'),
    (label: 'Tobogganing hills nearby', route: '/explore/places'),
    (label: 'Warm indoor days', route: '/explore/free-passes'),
    (label: 'Free winter clothing help', route: '/help'),
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
      final verbatim = kExploreVerbatimStrings[id] ?? const [];
      final title = verbatim.isNotEmpty
          ? verbatim.first
          : id
              .split('-')
              .map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}')
              .join(' ');
      final subtitle = verbatim.length > 1 ? verbatim[1] : '';
      final details = verbatim.length > 2 ? verbatim.sublist(2) : const <String>[];
      final kind = id.contains('offer') || id.contains('partner') || id == 'bank' || id == 'telecom' || id == 'furniture'
          ? ExploreKind.offer
          : id.contains('event') || id.contains('skate') || id.contains('storytime') || id.contains('coffee') || id.contains('walk')
              ? ExploreKind.event
              : id.contains('pass') || id.contains('canoo') || id.contains('park') || id.contains('conservation')
                  ? ExploreKind.pass
                  : ExploreKind.place;
      return ExploreDetailTemplateScreen(
        id: id,
        title: title,
        subtitle: subtitle,
        details: details,
        links: _exploreLinks[id] ?? const [],
        kind: kind,
        isSponsored: kind == ExploreKind.offer,
      );
    },
  ),
];
