import 'package:go_router/go_router.dart';
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
        subtitle: 'Free or low-cost newcomer activity and local guide.',
        kind: kind,
        isSponsored: kind == ExploreKind.offer,
      );
    },
  ),
];
