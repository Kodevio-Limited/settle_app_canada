import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';
import '../../../core/widgets/settle_button.dart';
import '../providers/explore_providers.dart';

/// 20.9 Saved & 21.13 ExploreSavedEmpty.
class ExploreSavedScreen extends ConsumerWidget {
  const ExploreSavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saved = ref.watch(exploreSavedProvider);
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(
              title: 'Saved',
              onBack: () => context.canPop() ? context.pop() : context.go('/explore'),
            ),
            const SizedBox(height: 16),
            if (saved.isEmpty) ...[
              const FigmaNoticeBanner(
                child: Text('No saved places, events, or offers yet.'),
              ),
              const SizedBox(height: 16),
              SettleButton(
                label: 'Explore places',
                onPressed: () => context.go('/explore'),
              ),
            ] else
              ...saved.map(
                (id) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: FigmaSurfaceCard(
                    onTap: () => context.push('/explore/$id'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(id, style: AppTypography.body1.copyWith(color: AppColors.mainFont)),
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
class ExploreCityScreen extends ConsumerWidget {
  const ExploreCityScreen({super.key});
  static const _cities = ['Mississauga', 'Brampton', 'Toronto', 'Oakville'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(exploreCityProvider);
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(
              title: 'Choose your city',
              onBack: () => context.canPop() ? context.pop() : context.go('/explore'),
            ),
            const SizedBox(height: 16),
            ..._cities.map(
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
                      Text(city, style: AppTypography.body1.copyWith(color: AppColors.mainFont)),
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
