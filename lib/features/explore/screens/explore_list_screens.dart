import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/data/explore_figma_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';
import '../../../core/widgets/settle_button.dart';
import '../providers/explore_providers.dart';

/// 20.9 Saved & 21.13 ExploreSavedEmpty.
class ExploreSavedScreen extends ConsumerStatefulWidget {
  const ExploreSavedScreen({super.key});

  @override
  ConsumerState<ExploreSavedScreen> createState() => _ExploreSavedScreenState();
}

class _ExploreSavedScreenState extends ConsumerState<ExploreSavedScreen> {
  String _tab = 'All';
  static const _tabs = ['All', 'Places', 'Events', 'Offers'];

  @override
  Widget build(BuildContext context) {
    final saved = ref.watch(exploreSavedProvider);
    final items = saved
        .map((id) => kExploreDetailPages[id])
        .whereType<ExploreDetailPageData>()
        .where((item) {
      if (_tab == 'All') return true;
      if (_tab == 'Places') return item.eyebrow.startsWith('PLACE');
      if (_tab == 'Events') return item.eyebrow.startsWith('EVENT');
      if (_tab == 'Offers') return item.isSponsored;
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            Row(
              children: [
                FigmaCircleBackButton(
                  onPressed: () =>
                      context.canPop() ? context.pop() : context.go('/explore'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'EXPLORE',
              style: AppTypography.caption1.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Saved',
              style: AppTypography.h1.copyWith(
                color: AppColors.mainFont,
                fontSize: 28,
              ),
            ),
            if (saved.isNotEmpty) ...[
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _tabs.map((tab) {
                    final selected = _tab == tab;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(tab),
                        selected: selected,
                        onSelected: (_) => setState(() => _tab = tab),
                        selectedColor: AppColors.primary,
                        backgroundColor: Colors.white,
                        labelStyle: AppTypography.caption1.copyWith(
                          color: selected ? Colors.white : AppColors.mainFont,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: const StadiumBorder(),
                        side: BorderSide(
                          color: selected ? AppColors.primary : AppColors.divider,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (items.isEmpty) ...[
              FigmaSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nothing saved yet',
                      style: AppTypography.h3.copyWith(color: AppColors.mainFont),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tap the bookmark on a place, event or offer to keep it here.',
                      style: AppTypography.body2.copyWith(color: AppColors.dark300),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SettleButton(
                label: 'Explore places',
                onPressed: () => context.push('/explore/places'),
              ),
            ] else
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: FigmaSurfaceCard(
                    onTap: () => context.push('/explore/${item.id}'),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: item.bannerStart,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(item.bannerIcon, color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: AppTypography.body1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainFont,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.eyebrow,
                                style: AppTypography.caption1.copyWith(
                                  color: AppColors.dark300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right_rounded, color: AppColors.dark200),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 20.12 City selector (Mississauga, Brampton, Toronto, Oakville).
class ExploreCityScreen extends ConsumerStatefulWidget {
  const ExploreCityScreen({super.key});

  @override
  ConsumerState<ExploreCityScreen> createState() => _ExploreCityScreenState();
}

class _ExploreCityScreenState extends ConsumerState<ExploreCityScreen> {
  final _searchController = TextEditingController();
  static const _cities = ['Mississauga', 'Brampton', 'Toronto', 'Oakville'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = ref.watch(exploreCityProvider);
    final query = _searchController.text.trim().toLowerCase();
    final filtered = _cities
        .where((c) => query.isEmpty || c.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            Row(
              children: [
                FigmaCircleBackButton(
                  onPressed: () {
                    final router = GoRouter.maybeOf(context);
                    if (router != null) {
                      router.canPop() ? router.pop() : router.go('/explore');
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'EXPLORE',
              style: AppTypography.caption1.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Where should we look?',
              style: AppTypography.h1.copyWith(
                color: AppColors.mainFont,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Explore shows places and events in the city you pick. No GPS required.',
              style: AppTypography.body2.copyWith(color: AppColors.dark300),
            ),
            const SizedBox(height: 14),
            FigmaSearchBar(
              controller: _searchController,
              hintText: 'Search a city',
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            Text(
              'NEARBY CITIES',
              style: AppTypography.caption1.copyWith(
                color: AppColors.dark200,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 8),
            ...filtered.map(
              (city) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FigmaSurfaceCard(
                  onTap: () {
                    ref.read(exploreCityProvider.notifier).state = city;
                    final router = GoRouter.maybeOf(context);
                    if (router != null) {
                      router.canPop() ? router.pop() : router.go('/explore');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$city, ON',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.mainFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (city == current)
                        const Icon(Icons.check_circle_rounded, color: AppColors.secondary),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FigmaSoftOutlineButton(
              label: 'Turn on approximate location',
              onPressed: () => context.push('/location-permission'),
            ),
          ],
        ),
      ),
    );
  }
}
