import 'package:go_router/go_router.dart';
import '../data/explore_verbatim_data.dart';
import '../../features/explore/screens/explore_detail_templates.dart';
import '../../features/explore/screens/explore_list_screens.dart';

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
        kind: kind,
        isSponsored: kind == ExploreKind.offer,
      );
    },
  ),
];
