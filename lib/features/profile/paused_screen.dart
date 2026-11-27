import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class PausedScreen extends StatelessWidget {
  const PausedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: AppColors.softTeal,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 5,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 5,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your account is paused',
                style: AppTypography.h4.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Reminders are off and your plan is hidden. Everything is saved — sign in anytime to pick up where you left off.',
                style: AppTypography.body2.copyWith(
                  height: 1.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 16),
              FigmaNoticeBanner(
                child: Text(
                  "[How long paused accounts are kept, and when we'll check in before deleting — wording from privacy counsel.]",
                  style: AppTypography.caption1.copyWith(
                    height: 1.45,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              SettleButton(
                label: 'Done',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/delete-confirm'),
                  child: Text(
                    'Delete my account instead',
                    style: AppTypography.body2Bold.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
