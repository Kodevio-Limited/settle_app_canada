import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'province_variant_data.dart';

/// Data-driven screen for province-specific variant guidance (S12).
class ProvinceVariantScreen extends StatelessWidget {
  final String routePath;

  const ProvinceVariantScreen({super.key, required this.routePath});

  @override
  Widget build(BuildContext context) {
    final data = provinceVariants[routePath];
    if (data == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'Province guide'),
                const SizedBox(height: 24),
                FigmaNoticeBanner(child: Text('No province guide found for $routePath.'),
                  isWarmAlert: true,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(
              onBack: () => context.canPop() ? context.pop() : context.go("/home"),
              title: '${data.provinceCode} · ${data.title}',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  data.provinceName,
                  style: AppTypography.caption1.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              data.subtitle,
              style: AppTypography.body1.copyWith(
                color: AppColors.mainFont,
              ),
            ),
            const SizedBox(height: 16),
            FigmaNoticeBanner(child: Text(data.noticeText),
              isWarmAlert: data.isWarmAlert,
            ),
            const SizedBox(height: 16),
            ...data.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FigmaSurfaceCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.heading,
                        style: AppTypography.h5.copyWith(
                          color: AppColors.mainFont,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.detail,
                        style: AppTypography.body2.copyWith(
                          color: AppColors.dark300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (data.primaryCtaLabel != null && data.primaryCtaRoute != null) ...[
              const SizedBox(height: 8),
              SettleButton(
                label: data.primaryCtaLabel!,
                onPressed: () => context.push(data.primaryCtaRoute!),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              data.officialSource,
              style: AppTypography.caption1.copyWith(color: AppColors.dark200),
            ),
          ],
        ),
      ),
    );
  }
}
