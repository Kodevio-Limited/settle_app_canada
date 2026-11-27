import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'partner_data.dart';

/// 13.1 Partner detail (sponsored).
class PartnerDetailScreen extends StatelessWidget {
  const PartnerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const partner = defaultSponsoredPartner;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'Partner detail'),
            const SizedBox(height: 16),
            FigmaSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.dark100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      partner.category,
                      style: AppTypography.caption1.copyWith(
                        color: AppColors.dark300,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    partner.name,
                    style: AppTypography.h3.copyWith(
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    partner.summary,
                    style: AppTypography.body2.copyWith(
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FigmaSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What they offer',
                    style: AppTypography.h5.copyWith(
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...partner.whatTheyOffer.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTypography.body2.copyWith(
                                color: AppColors.mainFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FigmaNoticeBanner(child: Text(partner.disclosure)),
            const SizedBox(height: 20),
            SettleButton(
              label: 'How we choose partners',
              onPressed: () => context.push('/how-partners'),
            ),
          ],
        ),
      ),
    );
  }
}
