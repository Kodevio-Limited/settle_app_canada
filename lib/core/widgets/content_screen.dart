import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'figma_onboarding_widgets.dart';
import 'settle_button.dart';

/// Data-driven screen template for content, guide, and detail routes.
class ContentScreen extends StatelessWidget {
  final String title;
  final String routePath;
  final List<String> lines;
  final String? primaryLabel;
  final String? primaryRoute;

  const ContentScreen({
    super.key,
    required this.title,
    required this.routePath,
    required this.lines,
    this.primaryLabel,
    this.primaryRoute,
  });

  @override
  Widget build(BuildContext context) {
    final visibleLines = lines.where((l) => l.trim().isNotEmpty).take(12).toList();
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(
              title: title,
              onBack: () => context.canPop() ? context.pop() : context.go('/home'),
            ),
            const SizedBox(height: 16),
            if (visibleLines.isEmpty)
              const FigmaNoticeBanner(
                child: Text('Guidance and checklist details for this step.'),
              )
            else
              FigmaSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < visibleLines.length; i++) ...[
                      Text(
                        visibleLines[i],
                        style: i == 0
                            ? AppTypography.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainFont,
                              )
                            : AppTypography.body1.copyWith(color: AppColors.dark300),
                      ),
                      if (i < visibleLines.length - 1) const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            if (primaryLabel != null && primaryRoute != null) ...[
              const SizedBox(height: 20),
              SettleButton(
                label: primaryLabel!,
                onPressed: () => context.push(primaryRoute!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
