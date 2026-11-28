import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';
import '../../../core/widgets/settle_button.dart';
import '../providers/explore_providers.dart';

enum ExploreKind { place, event, pass, offer }

/// Data-driven detail template for Place (20.5, 23.1-23.6), Event (21.2, 23.7-23.9),
/// Pass (20.3, 21.3, 23.10-23.13), and Offer (20.8, 23.14-23.16).
class ExploreDetailTemplateScreen extends ConsumerWidget {
  final String id;
  final String title;
  final String subtitle;
  final ExploreKind kind;
  final String? promoCode;
  final bool isSponsored;

  const ExploreDetailTemplateScreen({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.kind,
    this.promoCode,
    this.isSponsored = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(exploreSavedProvider).contains(id);
    final city = ref.watch(exploreCityProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(
              title: title,
              onBack: () => context.canPop() ? context.pop() : context.go('/explore'),
              trailing: FigmaCircleActionButton(
                icon: const Icon(Icons.bookmark_border_rounded),
                onPressed: () => context.push('/explore-saved'),
              ),
            ),
            const SizedBox(height: 16),
            if (isSponsored)
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: FigmaNoticeBanner(
                  child: Text('Sponsored · Partner offer for newcomers'),
                ),
              ),
            FigmaSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: AppTypography.body1.copyWith(color: AppColors.mainFont),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Showing details for $city',
                    style: AppTypography.caption1.copyWith(color: AppColors.dark200),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (promoCode != null) ...[
              FigmaSoftOutlineButton(
                label: 'Copy code: $promoCode',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: promoCode!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied $promoCode')),
                  );
                },
              ),
              const SizedBox(height: 12),
            ],
            if (kind == ExploreKind.event) ...[
              SettleButton(
                label: 'Add to calendar',
                onPressed: () => context.push('/calendar'),
              ),
              const SizedBox(height: 12),
            ],
            SettleButton(
              label: isSaved ? 'Saved' : 'Save',
              onPressed: () {
                final added = ref.read(exploreSavedProvider.notifier).toggle(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(added ? 'Saved · View saved' : 'Removed from saved'),
                    action: added
                        ? SnackBarAction(
                            label: 'View saved',
                            onPressed: () => context.push('/explore-saved'),
                          )
                        : null,
                  ),
                );
              },
            ),
            if (kind == ExploreKind.offer) ...[
              const SizedBox(height: 12),
              FigmaSoftOutlineButton(
                label: 'Report this offer',
                onPressed: () => context.push('/report-outdated'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
