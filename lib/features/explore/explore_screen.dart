import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'providers/explore_providers.dart';

/// 20.1 Explore tab root screen.
class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  static const _chips = [
    'For you',
    'Free',
    'Family',
    'Offers',
    'Indoor',
    'This weekend',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(exploreCityProvider);
    final activeFilters = ref.watch(exploreFilterProvider);
    final savedCount = ref.watch(exploreSavedProvider).length;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          children: [
            GestureDetector(
              onTap: () => context.push('/explore-city'),
              child: Text(
                'EXPLORE · ${city.toUpperCase()} ▾',
                style: AppTypography.caption1.copyWith(
                  color: AppColors.red,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Things to do and save on',
              style: AppTypography.h1.copyWith(
                color: AppColors.mainFont,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Free places, family days out and newcomer offers near you. Based on your city, not your exact location.',
              style: AppTypography.body2.copyWith(color: AppColors.dark300),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _chips.map((chip) {
                  final selected = activeFilters.contains(chip);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(chip),
                      selected: selected,
                      onSelected: (_) =>
                          ref.read(exploreFilterProvider.notifier).toggle(chip),
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
            const SizedBox(height: 16),
            InkWell(
              onTap: () => context.push('/explore/canoo'),
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: kFigmaHeroGradient,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FREE FOR NEWCOMERS',
                      style: AppTypography.caption1.copyWith(
                        color: const Color(0xFFD5E6E5),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Free entry for your first year',
                      style: AppTypography.h2.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Canoo gives new permanent residents free admission to Parks Canada places and 1,400+ museums and attractions.',
                      style: AppTypography.body2.copyWith(
                        color: const Color(0xFFD5E6E5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'This weekend',
              onSeeAll: () => context.push('/explore/events'),
            ),
            const SizedBox(height: 10),
            _ExploreItemCard(
              icon: Icons.ice_skating_rounded,
              iconBg: const Color(0xFF3E639C),
              title: 'Fun skate at Celebration Square',
              subtitle: 'Sat · free · 2.1 km',
              tags: const ['Free', 'Winter', 'Kids'],
              onTap: () => context.push('/explore/fun-skate'),
            ),
            const SizedBox(height: 10),
            _ExploreItemCard(
              icon: Icons.event_rounded,
              iconBg: const Color(0xFF6B4C8C),
              title: 'Family storytime in Arabic and English',
              subtitle: 'Sun · Central Library · free',
              tags: const ['Free', 'Kids', 'Indoor'],
              onTap: () => context.push('/explore/family-storytime'),
            ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Places to visit',
              onSeeAll: () => context.push('/explore/places'),
            ),
            const SizedBox(height: 10),
            _ExploreItemCard(
              icon: Icons.park_rounded,
              iconBg: AppColors.secondary,
              title: 'Rattray Marsh Conservation Area',
              subtitle: 'Lakeside trail · 6.8 km',
              tags: const ['Free', 'Kids'],
              onTap: () => context.push('/explore/rattray-marsh'),
            ),
            const SizedBox(height: 10),
            FigmaSurfaceCard(
              onTap: () => context.push('/explore/your-first-winter'),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your first winter',
                          style: AppTypography.body1.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Skating, sledding and warm indoor days',
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
            const SizedBox(height: 10),
            _ExploreItemCard(
              icon: Icons.account_balance_rounded,
              iconBg: AppColors.red,
              title: 'Royal Ontario Museum',
              subtitle: 'Toronto · free with a library pass',
              tags: const ['Library pass', 'Indoor'],
              onTap: () => context.push('/explore/free-passes'),
            ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Newcomer offers',
              onSeeAll: () => context.push('/explore/offers'),
            ),
            const SizedBox(height: 10),
            _ExploreItemCard(
              icon: Icons.local_offer_rounded,
              iconBg: AppColors.dark200,
              title: '[Partner store] · winter coats',
              subtitle: '[Offer] for newcomer families · ends [date]',
              badge: 'Sponsored',
              onTap: () => context.push('/explore/partner-winter-coats'),
            ),
            const SizedBox(height: 12),
            FigmaSurfaceCard(
              onTap: () => context.push('/explore-saved'),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saved',
                          style: AppTypography.body1.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          savedCount == 0
                              ? '3 places · 1 offer'
                              : '$savedCount saved',
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
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const _SectionHeader({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTypography.h3.copyWith(color: AppColors.mainFont)),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'See all',
            style: AppTypography.body2.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class _ExploreItemCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final List<String> tags;
  final String? badge;
  final VoidCallback onTap;

  const _ExploreItemCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    this.tags = const [],
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FigmaSurfaceCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTypography.body1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainFont,
                        ),
                      ),
                    ),
                    if (badge != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.dark50,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          badge!,
                          style: AppTypography.caption1.copyWith(
                            color: AppColors.dark300,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.caption1.copyWith(color: AppColors.dark300),
                ),
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: tags
                        .map(
                          (t) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.dark50,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              t,
                              style: AppTypography.caption1.copyWith(
                                color: AppColors.mainFont,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right_rounded, color: AppColors.dark200),
        ],
      ),
    );
  }
}
