import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

bool _containsShellMatch(List<RouteMatchBase> matches) {
  for (final match in matches) {
    if (match is ShellRouteMatch) {
      return true;
    }
    if (match is ImperativeRouteMatch &&
        _containsShellMatch(match.matches.matches)) {
      return true;
    }
  }
  return false;
}

extension SafeGoRouterNavigation on BuildContext {
  /// Pushes [location] unless both the active stack and [location] use the
  /// persistent bottom-nav shell, in which case switches via `go` to avoid
  /// duplicating the shell page key (`!keyReservation.contains(key)`).
  void pushSafe(String location) {
    final router = GoRouter.of(this);
    final currentMatches = router.routerDelegate.currentConfiguration.matches;
    if (_containsShellMatch(currentMatches)) {
      final targetMatches =
          router.configuration.findMatch(Uri.parse(location)).matches;
      if (_containsShellMatch(targetMatches)) {
        final isShellOnTop = currentMatches.isNotEmpty &&
            currentMatches.last is ShellRouteMatch;
        final isStagePushWithinBranch =
            isShellOnTop && location.startsWith('/stages/');
        if (!isStagePushWithinBranch) {
          go(location);
          return;
        }
      }
    }
    push(location);
  }
}

