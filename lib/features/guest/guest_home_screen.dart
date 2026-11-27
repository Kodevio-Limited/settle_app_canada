import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/settle_logo.png',
                    width: 110,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) => Text(
                      'settle\nCANADA',
                      style: AppTypography.body2Bold.copyWith(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        height: 1.1,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/sign-in'),
                    child: Text(
                      'Sign in',
                      style: AppTypography.body2Bold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You're exploring",
                      style: AppTypography.body2Bold.copyWith(
                        fontSize: 17,
                        color: AppColors.white50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Read the general steps for Ontario. Create a free account to get a plan for your family, checklists and reminders.',
                      style: AppTypography.body2.copyWith(
                        height: 1.45,
                        color: AppColors.softTeal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => context.push('/sign-up'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white50,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Create my plan',
                          style: AppTypography.body2Bold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Settling in Ontario, step by step',
                style: AppTypography.h5.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              FigmaSurfaceCard(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    _buildStageItem(context, '1 · Status & arrival documents', '/stage-status', showBorder: true),
                    _buildStageItem(context, '2 · Paperwork', '/stage-paperwork', showBorder: true),
                    _buildStageItem(context, '3 · Housing', '/stage-housing', showBorder: true),
                    _buildStageItem(context, '4 · Schools & childcare', '/stage-schools', showBorder: true),
                    _buildStageItem(context, '5 · Car & driving', '/stage-car', showBorder: true),
                    _buildStageItem(context, '6 · Insurance', '/stage-insurance', showBorder: true),
                    _buildStageItem(context, '+ 4 more stages', '/journey', showBorder: false, isBold: true),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FigmaSurfaceCard(
                onTap: () => context.push('/crisis'),
                padding: const EdgeInsets.all(14),
                child: Text(
                  'Need help now? Crisis & support lines',
                  style: AppTypography.body2Bold.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageItem(
    BuildContext context,
    String label,
    String route, {
    required bool showBorder,
    bool isBold = false,
  }) {
    return InkWell(
      onTap: () => context.pushSafe(route),
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: AppColors.divider))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: (isBold ? AppTypography.body2Bold : AppTypography.body2).copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: AppColors.dark200,
            ),
          ],
        ),
      ),
    );
  }
}
