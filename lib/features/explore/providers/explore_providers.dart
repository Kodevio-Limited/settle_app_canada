import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Selected city for Explore lists (20.12).
final exploreCityProvider = StateProvider<String>((ref) => 'Mississauga');

/// Active filter chips for Explore lists (20.10).
class ExploreFilterNotifier extends StateNotifier<Set<String>> {
  ExploreFilterNotifier() : super({'For you'});

  void toggle(String chip) {
    if (chip == 'For you') {
      state = {'For you'};
      return;
    }
    final next = Set<String>.from(state)..remove('For you');
    if (next.contains(chip)) {
      next.remove(chip);
      if (next.isEmpty) next.add('For you');
    } else {
      next.add(chip);
    }
    state = next;
  }

  void reset() => state = {'For you'};
}

final exploreFilterProvider =
    StateNotifierProvider<ExploreFilterNotifier, Set<String>>(
  (ref) => ExploreFilterNotifier(),
);

/// Saved Explore item IDs (20.9).
class ExploreSavedNotifier extends StateNotifier<Set<String>> {
  ExploreSavedNotifier() : super(const {});

  bool isSaved(String id) => state.contains(id);

  bool toggle(String id) {
    final next = Set<String>.from(state);
    final added = next.add(id);
    if (!added) next.remove(id);
    state = next;
    return added;
  }
}

final exploreSavedProvider =
    StateNotifierProvider<ExploreSavedNotifier, Set<String>>(
  (ref) => ExploreSavedNotifier(),
);
