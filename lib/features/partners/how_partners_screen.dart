import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

/// 13.2 How we choose partners.
class HowPartnersScreen extends StatelessWidget {
  const HowPartnersScreen({super.key});

  static const _principles = [
    (
      '1. Official sources first',
      'Government of Canada, provincial ministries, and municipal services are always shown before any private option.',
    ),
    (
      '2. Free community help second',
      'Settlement agencies, legal aid clinics, and 2-1-1 community services come next—never buried below paid ads.',
    ),
    (
      '3. Sponsored partners clearly labelled',
      'Paid or referral partners are always marked "Sponsored" and vetted for newcomer-friendly terms.',
    ),
    (
      '4. Your privacy comes first',
      'Settle never sells your personal data or shares your immigration status with partners.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'How we choose partners'),
            const SizedBox(height: 16),
            Text(
              'Our editorial order is always Official, then Free help, then Sponsored.',
              style: AppTypography.body1.copyWith(color: AppColors.mainFont),
            ),
            const SizedBox(height: 16),
            ..._principles.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FigmaSurfaceCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.$1,
                        style: AppTypography.h5.copyWith(
                          color: AppColors.mainFont,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        p.$2,
                        style: AppTypography.body2.copyWith(
                          color: AppColors.dark300,
                        ),
                      ),
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
