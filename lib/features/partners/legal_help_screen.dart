import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'partner_data.dart';

/// 13.3 Legal help (free + licensed), ordered Official -> Free help -> Sponsored.
class LegalHelpScreen extends StatelessWidget {
  const LegalHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'Legal help'),
            const SizedBox(height: 12),
            FigmaNoticeBanner(
              child: Text(
                'General information only, not legal advice. Official and free community resources are listed first.',
              ),
            ),
            const SizedBox(height: 16),
            ...legalHelpResources.map(
              (res) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FigmaSurfaceCard(
                  onTap: res.routePath != null
                      ? () => context.push(res.routePath!)
                      : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TierBadge(tier: res.tier),
                      const SizedBox(height: 8),
                      Text(
                        res.name,
                        style: AppTypography.h5.copyWith(
                          color: AppColors.mainFont,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        res.description,
                        style: AppTypography.body2.copyWith(
                          color: AppColors.dark300,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        res.contactLabel,
                        style: AppTypography.caption1.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            FigmaSoftOutlineButton(
              label: 'How we choose partners',
              onPressed: () => context.push('/how-partners'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TierBadge extends StatelessWidget {
  final ResourceTier tier;

  const _TierBadge({required this.tier});

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (tier) {
      ResourceTier.official => (
          AppColors.primary.withValues(alpha: 0.12),
          AppColors.primary,
        ),
      ResourceTier.freeHelp => (
          AppColors.secondary.withValues(alpha: 0.12),
          AppColors.secondary,
        ),
      ResourceTier.sponsored => (AppColors.dark100, AppColors.dark300),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        tier.label,
        style: AppTypography.caption1.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
