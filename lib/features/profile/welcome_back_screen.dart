import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PAUSED FOR 3 MONTHS',
                style: AppTypography.caption2.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome back, Layla',
                style: AppTypography.h4.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'أهلاً بعودتك',
                  textDirection: TextDirection.rtl,
                  style: AppTypography.body2.copyWith(
                    fontFamily: AppTypography.fontArabic,
                    fontSize: 18,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'A lot can change in three months. Before you jump back in:',
                style: AppTypography.body2.copyWith(
                  height: 1.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),
              FigmaSurfaceCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    _buildStatRow('Steps updated while you were away', '3'),
                    const Divider(color: AppColors.divider, height: 20),
                    _buildStatRow('Tasks still open', '33'),
                    const Divider(color: AppColors.divider, height: 20),
                    _buildStatRow('Reminders', 'Off', valColor: AppColors.dark200),
                  ],
                ),
              ),
              const Spacer(),
              SettleButton(
                label: 'Check my answers first',
                onPressed: () => context.push('/life-event'),
              ),
              const SizedBox(height: 10),
              FigmaSoftOutlineButton(
                label: 'Resume where I left off',
                onPressed: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, {Color? valColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTypography.body2.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        Text(
          value,
          style: AppTypography.body2Bold.copyWith(
            color: valColor ?? AppColors.primary,
          ),
        ),
      ],
    );
  }
}
