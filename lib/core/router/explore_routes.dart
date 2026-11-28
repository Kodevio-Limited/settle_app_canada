import 'package:go_router/go_router.dart';
import '../data/explore_figma_data.dart';
import '../../features/explore/explore_screen.dart';
import '../../features/explore/screens/explore_detail_templates.dart';
import '../../features/explore/screens/explore_list_screens.dart';

final List<RouteBase> exploreBranchRoutes = [
  GoRoute(
    path: '/explore',
    name: 'explore',
    builder: (context, state) => const ExploreScreen(),
  ),
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
      final id = state.pathParameters['id'] ?? 'events';
      final listPage = kExploreListPages[id];
      if (listPage != null) {
        return ExploreListTemplateScreen(page: listPage);
      }
      final detailPage = kExploreDetailPages[id] ?? kExploreDetailPages['fun-skate']!;
      return ExploreDetailTemplateScreen(data: detailPage);
    },
  ),
];
